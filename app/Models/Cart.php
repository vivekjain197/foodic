<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

	/**
		Base model of Cart table- can be implemented in App\Cart model
	**/


class Cart extends Model
{
	 /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
        'user_id', 'product_id', 'varient_id', 'variation', 'price', 'tax', 'shipping_cost', 'quantity'
    ];
	
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
