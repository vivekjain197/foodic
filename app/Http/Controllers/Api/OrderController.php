<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\ProductStock;
use App\Models\OrderDetail;
use App\User;
use DB;
use Mail;

class OrderController extends Controller
{
	/*
		|--------------------------------------------------------------------------
		| Order Controller
		|--------------------------------------------------------------------------
		|
		| 
		|
	*/
	
	public function processOrder(Request $request)
	{
		$user_id = [];
		$cartItems = Cart::where('user_id', $request->user_id)->get();
		$user = User::findOrFail($request->user_id);
		
		// create an order
		$order = Order::create([
		'user_id' => $request->user_id,
		'shipping_address' => $user->address,	//default address from user table
		'payment_type' => $request->payment_type,
		'payment_status' => $request->payment_status,
		'grand_total' => $request->grand_total,
		'date' => strtotime('now')
		]);
		
		foreach($cartItems as $cartItem){
			
			$product = Product::findOrFail($cartItem->product_id);
			
			$product->unit = $product->unit - $cartItem->quantity;	//Product quantity decreased on each order
			$product->save();
			
			$productStock = ProductStock::findOrFail($cartItem->varient_id);
			
			$productStock->quantity = $productStock->quantity -  ($cartItem->variation * $cartItem->quantity);  //Ingredients decreased for each order
			
			
			if($productStock->quantity <= ($productStock->added_unit /2) && $productStock->reminder==1){ 	//Make reminder 1 when stock updated - by merchant side(It can activated automatically when Ingredients updated).	
				$user_id[] = $this->stockReminder($productStock->id);	//return user id of whome received email
				
				$productStock->reminder=0;
			}
			$productStock->save();
			// create an order Details
			OrderDetail::create([
			'order_id' => $order->id,
			'seller_id' => $product->user_id,
			'product_id' => $product->id,
			'variation' => $cartItem->variation,
			'price' => $cartItem->price,
			'tax' => $cartItem->tax * $cartItem->quantity,
			'shipping_cost' => $product->shipping_cost,
			'quantity' => $cartItem->quantity,
			'payment_status' => $request->payment_status
			]);
		}
		
		
		$user->carts()->delete();
		
		return response()->json([
		'Mail TO' => $user_id,
		'success' => true,
		'message' => 'Your order has been placed successfully'
		]);
	}
	
	public function store(Request $request)
	{
		return $this->processOrder($request);
	}
	/**
		Reminder emailto seller 
	**/
	public function stockReminder($id){
	
		$producStock = ProductStock::findOrFail($id);
		$user = User::findOrFail($producStock->user_id);
		return $user->id;
		$data= [];
		 Mail::send(['text'=>'mail'], $data, function($message) {
         $message->to('vivekjain.dev@gmail.com', 'Reminder')->subject
            ('Reminder');
         $message->from('vivekjain.dev@gmail.com',' Foodics');
		});
		
		
	}
}
