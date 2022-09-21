<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
	
    Route::get('products/search', 'App\Http\Controllers\Api\ProductController@search');
    Route::get('products/home', 'App\Http\Controllers\Api\ProductController@home');
   // Route::apiResource('products', 'App\Http\Controllers\Api\ProductController')->except(['store', 'update', 'destroy']);
    Route::post('products/add', 'App\Http\Controllers\Api\ProductController@store');
    Route::post('products/stock/add', 'App\Http\Controllers\Api\ProductController@stock_store');
	
	Route::post('users/login', 'App\Http\Controllers\Api\LoginController@user_login');
	Route::get('cart/{id}', 'App\Http\Controllers\Api\CartController@index');
	Route::post('cart/add', 'App\Http\Controllers\Api\CartController@add');
	Route::post('checkout/place-order', 'App\Http\Controllers\Api\OrderController@store');
	
	
	
