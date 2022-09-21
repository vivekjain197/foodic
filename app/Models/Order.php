<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;


	/**
		Base model of orders table- can be implemented in App\Order model
	**/


class Order extends Model
{
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    }
}
