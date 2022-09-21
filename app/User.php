<?php

namespace App;

use App\Models\User as baseUser;

class User extends baseUser{
	
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    public function carts()
    {
        return $this->hasMany(Cart::class);
    }
	
    public function orders()
    {
    return $this->hasMany(Order::class);
    }
	
    public function products()
    {
    return $this->hasMany(Product::class);
    }
}
