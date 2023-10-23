<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SendMailController;
use App\Models\Offer;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('send/email', function(){
  
	$send_mail = 'vagg.karanikolos@gmail.com';
    $offer = Offer::find(1);
  
    dispatch(new App\Jobs\SendQueueEmail($send_mail, $offer));
  
    dd('send mail successfully !!');
});