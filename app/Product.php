<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class Product extends Model {

    protected $fillable = [
        'name', 'category_id','unit_price',
        'purchase_price', 'unit', 'thumbnail_img', 'created_by', 'updated_by'
    ];

   /*  public function category() {
        return $this->belongsTo(Category::class);
    } */

    public function stocks() {
        return $this->hasMany(ProductStock::class);
    }
    
}
