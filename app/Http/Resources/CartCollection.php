<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\ProductStock;

class CartCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id' => $data->id,
                    'product' => [
                        'name' => $data->product->name,
                        'image' => $data->product->thumbnail_img
                    ],
					'level' => $data->varient_id ? $this->getVarients(ProductStock::findOrFail($data->varient_id), $data) :'',
                    'price' => (double) $data->price,
                    'tax' => (double) $data->tax,
                    'shipping_cost' => (double) $data->shipping_cost,
                    'quantity' => (integer) $data->quantity,
                    'date' => $data->created_at->diffForHumans()
                ];
            })
        ];
    }

    public function with($request)
    {
        return [
            'success' => true,
            'status' => 200
        ];
    }
	public function getVarients($stock, $data){
			$varients = [];
			if($stock != null){
               $varients[] = [
					'id' => $stock->id,
					'name' => $stock->variant,
					'quantity' => $data->variation, //Quantity of variation from cart table
				];
			}
			
			return $varients;
	}
}
