<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//public routes

Route::post('/login',[App\Http\Controllers\Api\AuthController::class, 'login']);
Route::post('/register',[App\Http\Controllers\Api\AuthController::class, 'register']);


Route::get('/shops',[App\Http\Controllers\Api\ShopController::class, 'index']);
Route::get('/shops/{shop}',[App\Http\Controllers\Api\ShopController::class, 'show']);

//protected routes
Route::Group(['middleware' => ['auth:sanctum']], function(){
    Route::post('/shops',[App\Http\Controllers\Api\ShopController::class, 'store']);
    Route::put('/shops/{shop}',[App\Http\Controllers\Api\ShopController::class, 'update']);
    Route::patch('/shops/{shop}',[App\Http\Controllers\Api\ShopController::class, 'update']);
    Route::post('/logout',[App\Http\Controllers\Api\AuthController::class, 'logout']);
    Route::post('/offers',[App\Http\Controllers\Api\OfferController::class, 'store']);
    Route::delete('/shops/{shop}',[App\Http\Controllers\Api\ShopController::class, 'destroy']);
});




