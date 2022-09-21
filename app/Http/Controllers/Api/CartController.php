<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\CartCollection;
use App\Models\Cart;
use App\Models\Color;
use App\Models\FlashDeal;
use App\Models\FlashDealProduct;
use App\Models\Product;
use App\Models\ProductStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function index($id)
    {
        return new CartCollection(Cart::where('user_id', $id)->latest()->get());
    }

    public function add(Request $request)
    {
        $product = Product::findOrFail($request->id);
		
		if($product){
		
			$price = $product->purchase_price * $request->quantity;
			
			if(isset($request->varient)){
			
				$pStock = ProductStock::findOrFail($request->varient);
				
				$varientPrice = $pStock->price * $request->quantity;
				
				$price = $price + $varientPrice;
				
				//$pStock->quantity = $pStock->quantity - ($request->varient_qty * $request->quantity);
				
				//$pStock->save();
			}
			
			$cart = Cart::create([
            'user_id' => $request->user_id,
            'price' => $price,
            'quantity' => $request->quantity,
            'product_id' => $product->id,
            'shipping_cost' => $product->shipping_cost,	
            'varient_id' => $request->varient, 	// stock record id Ex: cheese record id 2
            'variation' => $request->varient_qty  //10g default Ex : chees 10 g.
			]);
			
		}
		
        return response()->json([
            'message' => 'Product added to cart successfully'
        ]);
    }

    public function destroy($id)
    {
        Cart::destroy($id);
        return response()->json(['message' => 'Product is successfully removed from your cart'], 200);
    }
}
