<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
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
use Illuminate\Support\Facades\Hash;


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

Route::get('/products', function(){
    return Product::all();
});
Route::get('/categories', function(){
    return Category::all();
});
Route::get('/childcategories', function(){
    return ChildCategory::all();
});
Route::get('/productattributes', function(){
    return ProductAttribute::all();
});
Route::get('/shops', function(){
    return Shop::all();
});

Route::get('/users', function(){
    return User::all();
});

Route::get('/orders', function(){
    return Order::all();
});
Route::get('/orderattributes', function(){
    return OrderAttribute::all();
});
Route::get('/colors', function(){
    return Color::all();
});

Route::get('/carts', function(){
    return Cart::all();
});

Route::get('/sizes', function(){
    return Size::all();
});
Route::get('/shopparents', function(){
    return ShopParent::all();
});
Route::get('/subcategories', function(){
    return SubCategory::all();
});

// ALL POST METHODS
Route::post('/categories', function(){

    request()->validate([
        'name' => 'required'
    ]);

   

    if(Category::count() == 0){
        
        $id = "cat"."1";

        return Category::create([
            'category_id' => $id,
            'name' => request('name'),
    
    
        ]);

    }else{
        $cats = Category::all();
        $cat_ids = [];
        $index = 0;
        foreach($cats as $x){
            $strs = $x->category_id;
            $cat_ids[$index] = (int)str_replace('cat', '', $strs);
            $index += 1;
        }

        $c_id = max($cat_ids) + 1;
        $id = "cat".$c_id;

        return Category::create([
            'category_id' => $id,
            'name' => request('name'),
    
    
        ]);
    

    }
    

   

});

Route::post('/subcategories', function(){

    request()->validate([
        
        'category_id_fk' => 'required',
        'name' => 'required'
    ]);

    if(SubCategory::count() == 0){
        
        $id = "sub"."1";

        return SubCategory::create([
            'category_id_fk' => request('category_id_fk'),
            'name' => request('name'),
            'sub_cat_id' => $id
    
    
        ]);

    }else{
        $subs = SubCategory::all();
        $sub_ids = [];
        $index = 0;
        foreach($subs as $x){
            $strs = $x->sub_cat_id;
            $sub_ids[$index] = (int)str_replace('sub', '', $strs);
            $index += 1;
        }

        $c_id = max($sub_ids) + 1;
        $id = "sub".$c_id;

        return SubCategory::create([
            'category_id_fk' => request('category_id_fk'),
            'name' => request('name'),
            'sub_cat_id' => $id
    
    
        ]);

    }


});

Route::post('/childcategories', function(){

    request()->validate([
        
        'sub_cat_id_fk' => 'required',
        'name' => 'required'
    ]);

    //$count = Model::latest()->first()->;
    //$id = "childcat".($count + 1);

    if(ChildCategory::count() == 0){
        
        $id = "child"."1";

        return ChildCategory::create([
            'sub_cat_id_fk' => request('sub_cat_id_fk'),
            'name' => request('name'),
            'child_cat_id' => $id
    
    
        ]);

    }else{
        
        $childs = ChildCategory::all();
        $child_ids = [];
        $index = 0;
        foreach($childs as $x){
            $strs = $x->child_cat_id;
            $child_ids[$index] = (int)str_replace('child', '', $strs);
            $index += 1;
        }

        $c_id = max($child_ids) + 1;

        $id = "child".$c_id;

        return ChildCategory::create([
            'sub_cat_id_fk' => request('sub_cat_id_fk'),
            'name' => request('name'),
            'child_cat_id' => $id
    
    
        ]);

    }


});


Route::post('/shops', function(){

    request()->validate([
        
        'category_id_fk' => 'required',
        'shop_name' => 'required',
        'logo' => 'required'
    ]);

    //$count = Model::latest()->first()->;
    //$id = "childcat".($count + 1);

    if(Shop::count() == 0){
        
        $id = "shop"."1";
        $file = request('logo');
        //return $file;
        $img = file_get_contents($file);
        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/logos/".$id."_img.".$extension), $img);

        $url = "/logos/".$id."_img.".$extension;
        //return $url;
    
       // return $contents;
        return Shop::create([
            'category_id_fk' => request('category_id_fk'),
            'shop_name' => request('shop_name'),
            'shop_id' => $id,
            'logo' => $url
    
    
        ]);

    }else{
        $shops = Shop::all();
        $shops_ids = [];
        $index = 0;
        foreach($shops as $x){
            $strs = $x->shop_id;
            $shop_ids[$index] = (int)str_replace('shop', '', $strs);
            $index += 1;
        }

        $c_id = max($shop_ids) + 1;

       
        

        //return $c_id;
       
        $id = "shop".$c_id;
        $file = request('logo');
        //return $file;
        $img = file_get_contents($file);
        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/logos/".$id."_img.".$extension), $img);

        $url = "/logos/".$id."_img.".$extension;
        //return $url;
    
       // return $contents;
        return Shop::create([
            'category_id_fk' => request('category_id_fk'),
            'shop_name' => request('shop_name'),
            'shop_id' => $id,
            'logo' => $url
    
    
        ]);

    }


});

Route::post('/shopparents', function(){

    request()->validate([
        
        'shop_id_fk' => 'required',
        'email' => 'required',
        'NID' => 'required',
        'dob' => 'required',
        'first_name' => 'required',
        'last_name' => 'required',
		'number' => 'required',
		'password' => 'required',
		'type' => 'required',
        'address' => 'required'
        
    ]);

    //$count = Model::latest()->first()->;
    //$id = "childcat".($count + 1);

    if(ShopParent::count() == 0){
        
        
        
        $date = strtotime(request('dob'));
        $date = date('d/m/Y', $date); 
       // return $contents;
        return ShopParent::create([
            'shop_id_fk' => request('shop_id_fk'),
            'email' => request('email'),
            'dob' => $date,
            'NID' => request('NID'),
            'first_name' => request('first_name'),
            'last_name' => request('last_name'),
            'number' => request('number'),
            'password' => Hash::make(request('password')),
            'type' => request('type'),
            'address' => request('address')
    
        ]);

    }else{
       
        //return $file;

        $date = strtotime(request('dob'));
        $date = date('d/m/Y', $date); 
        return ShopParent::create([
            'shop_id_fk' => request('shop_id_fk'),
            'email' => request('email'),
            'dob' => $date,
            'NID' => request('NID'),
            'first_name' => request('first_name'),
            'last_name' => request('last_name'),
            'number' => request('number'),
            'password' => Hash::make(request('password')),
            'type' => request('type'),
            'address' => request('address')

    
    
        ]);
    }


});

Route::post('/products', function(){

    request()->validate([
        
        'shop_id_fk' => 'required',
        'name' => 'required',
        'description' => 'required',
        'price' => 'required',
        'product_category' => 'required',
        'image1' => 'required',
		'image2' => 'required',
		'image3' => 'required',
		'discount' => 'required',
        
    ]);

    //$count = Model::latest()->first()->;
    //$id = "childcat".($count + 1);

    if(Product::count() == 0){


        $id = 1;
        $id = "prod".$id;
        
        
        $file = request('image1');
        $file2 = request('image2');
        $file3 = request('image3');
        //return $file;
        $img = file_get_contents($file);
        $img2 = file_get_contents($file2);
        $img3 = file_get_contents($file3);

        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        $extension2 =  pathinfo(
            parse_url($file2, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        $extension3 =  pathinfo(
            parse_url($file3, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/images/".$id."_img.".$extension), $img);
        file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);
        file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);

        $url = "/images/".$id."_img.".$extension;
        $url2 = "/images/".$id."_img2.".$extension2;
        $url3 = "/images/".$id."_img3.".$extension3;
       
       // return $contents;
        return Product::create([
            "product_id" => $id,
            "shop_id_fk" => request("shop_id_fk"),
            "name" => request("name"),
            "description" => request("description"),
            "price" => request("price"),
            "product_category" => request("product_category"),
            "image1" => $url,
            "image2" => $url2,
            "image3" => $url3,
            "discount" => request("discount")
    
        ]);

    }else{
       
        //return $file;
        $prods = Product::all();
        $prod_ids = [];
        $index = 0;
        foreach($prods as $x){
            $strs = $x->product_id;
            $prod_ids[$index] = (int)str_replace('prod', '', $strs);
            $index += 1;
        }

        $c_id = max($prod_ids) + 1;

        $id = "prod".$c_id;


        $file = request('image1');
        $file2 = request('image2');
        $file3 = request('image3');
        //return $file;
        $img = file_get_contents($file);
        $img2 = file_get_contents($file2);
        $img3 = file_get_contents($file3);

        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        $extension2 =  pathinfo(
            parse_url($file2, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        $extension3 =  pathinfo(
            parse_url($file3, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/images/".$id."_img.".$extension), $img);
        file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);
        file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);

        $url = "/images/".$id."_img.".$extension;
        $url2 = "/images/".$id."_img2.".$extension2;
        $url3 = "/images/".$id."_img3.".$extension3;
       
       // return $contents;
        return Product::create([
            "product_id" => $id,
            "shop_id_fk" => request("shop_id_fk"),
            "name" => request("name"),
            "description" => request("description"),
            "price" => request("price"),
            "product_category" => request("product_category"),
            "image1" => $url,
            "image2" => $url2,
            "image3" => $url3,
            "discount" => request("discount")
    
        ]);

    }


});



Route::get('/images/{product_id}/{imageno}', function($pid, $no){

    $url =  DB::table('product')->where('product_id', $pid)->pluck('image'.$no);

    //return str_replace('\\', '/', public_path());
    $image = file_get_contents(public_path().$url[0]);

    return $image;

    
});

Route::get('/shops/select/{start}/{end}', function($start, $end){

   
        
        $shops = Shop::all();
        $shops_all = [];
        $index = 0;
        foreach($shops as $x){
            $strs = $x->shop_id;
            $ID = (int)str_replace('shop', '', $strs);
            if($ID >= $start and $ID <= $end){
                array_push($shops_all, $x);
            }
            $index += 1;
        }

        return $shops_all;


        //return str_replace('\\', '/', public_path());
        //return $shops;
   

    

    
});



