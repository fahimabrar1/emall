<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\Cart;
use App\Models\Category;
use App\Models\ChildCategory;
use App\Models\Color;
use App\Models\Order;
use App\Models\OrderAttribute;
use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\Shop;
use App\Models\ShopParent;
use App\Models\Size;
use App\Models\SubCategory;
use App\Models\User;
use Illuminate\Support\Facades\DB;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('/shop/imagetest', function(){

    $log = DB::table('shop')->where("shop_id", "shop1")->first()->logo;

    echo '<img src="data:image/jpeg;base64,'.base64_encode( $log ).'"/>';
    

});
