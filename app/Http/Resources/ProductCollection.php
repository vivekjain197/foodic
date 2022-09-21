<?php
	
	namespace App\Http\Resources;
	
	use Illuminate\Http\Resources\Json\ResourceCollection;
	
	use App\ProductStock;
	
	class ProductCollection extends ResourceCollection
	{
		/**
			collection of Products to API Response
		**/
		public function toArray($request)
		{
			return [
            'data' => $this->collection->map(function($data) {
                return [
				'id' => $data->id,
				'name' => $data->name,
				'base_price' => (double)$data->purchase_price,
				'unit' => $data->unit,	//quantity
				'Ingredients' => $this->getVarients(ProductStock::where('product_id', $data->id)->get()),
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
		public function getVarients($stock){
			$varients = [];
			foreach($stock as $data){
               $varients[] = [
					'id' => $data->id,
					'name' => $data->variant,
					'price' => $data->price,
					'quantity' => $data->quantity,
				];
			}
			return $varients;
		}
	}
