<?php

use App\Http\Controllers\DeleteController;
use App\Http\Controllers\EditController;
use App\Http\Controllers\MedicineController;
use App\Http\Controllers\SearchController;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post("/add", [MedicineController::class, "store"]);
Route::get("/delete", [DeleteController::class, "delete"]);
Route::get('/search', [SearchController::class, 'search']);
Route::post('/edit', [EditController::class, 'edit']);
Route::post('//auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);
// Route::post('/auth/register','App\Http\Controllers\AuthController@register');
// Route::post('/auth/login ','App\Http\Controllers\AuthController@login');
//  Route::get('logout', 'App\Http\Controllers\AuthController@logout')->name('logout');