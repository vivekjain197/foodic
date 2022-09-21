<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

	/**
		Base model of product table- can be implemented in App\Product model
	**/
	
class Product extends Model
{
   
    public function stocks()
    {
        return $this->hasMany(ProductStock::class);
    }

}
