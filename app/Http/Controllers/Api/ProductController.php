<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use App\ProductStock;

use  App\Http\Resources\ProductCollection;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        return new ProductCollection(Product::latest()->paginate(10));
    }

   
	public function store(Request $request)
	
	{
		
		
		$product = new Product;
		
		$product->name = $request->name;
		
		//$product->created_by = $request->created_by;
		$product->created_by = 1; //seller id for now
		$product->updated_by = 1; //seller id for now
		
		//$product->category_id = $request->category_id;
		
		
		
		$product->user_id = $request->user_id;
		
		$product->shipping_cost = $request->shipping_cost;
		
		$product->photos = $request->photos;//File input
		
		$product->thumbnail_img = $request->thumbnail_img;	//File input
		
		$product->unit = $request->unit;	//quantity
		
		$product->min_qty = $request->min_qty;
		
		
		$product->description = $request->description;
		
		$product->unit_price = $request->unit_price;
		
		$product->purchase_price = $request->purchase_price;
		
		$product->discount = $request->discount;
		
		$product->discount_type = $request->discount_type;
		
		
		$product->meta_title = $request->meta_title;
		
		$product->meta_description = $request->meta_description;
		
		if($product->meta_title == null) {
			
			$product->meta_title = $product->name;
			
		}
		
		if($product->meta_description == null) {
			
			$product->meta_description = strip_tags($product->description);
			
		}
		
		
		$product->cash_on_delivery = 0;
		
		if ($request->cash_on_delivery) {
			
			$product->cash_on_delivery = 1;
			
		}
		
		$product->save();
		
		
		return [
            'success' => true,
            'status' => 200
        ];
		
			
	}
	public function stock_store(Request $request){
	
		ProductStock::create([
			'product_id' => $request->product_id,
			'user_id' => $request->user_id,
			'variant' => $request->name,
			'price' => $request->price,
			'quantity' => $request->quantity,
			'added_unit' => $request->quantity,
			'reminder' => 1,	//true to send reminder mail
			]);
			
		
		return [
            'success' => true,
            'status' => 200
        ];
	
	}
	
    public function home()
    {
        return new ProductCollection(Product::inRandomOrder()->take(50)->get());
    }
}
