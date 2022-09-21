<?php

namespace App;

use App\Models\ProductStock as Stock;

class ProductStock extends Stock
{
     protected $fillable = [
        'user_id', 'variant', 'product_id', 'quantity', 'added_unit', 'reminder', 'user_id', 'price'
    ];
   
}
