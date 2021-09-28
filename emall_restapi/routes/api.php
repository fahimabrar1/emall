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

Use \Carbon\Carbon;
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
        $extension = $file->getClientOriginalExtension();
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
        $extension = $file->getClientOriginalExtension();
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

Route::post('/products', function(Request $request){

    request()->validate([
        
        'shop_id_fk' => 'required',
        'name' => 'required',
        'description' => 'required',
        'price' => 'required',
        'product_category' => 'required',
        'image1' => 'required',
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

        //return $file." ".$file2." ".$file3;

      
       

        $img = "";
        $img2 = "";
        $img3 = "";
        $extension = "";
        $extension2 = "";
        $extension3 = "";

        if($file2 != "" and $file3 == ""){
            
            $img2 = file_get_contents($file2);
            $extension2 =  pathinfo(
                parse_url($file2, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension2 = $file2->getClientOriginalExtension();

            file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);

        }else if($file2 != "" and $file3 != ""){
            $img2 = file_get_contents($file2);
            $img3 = file_get_contents($file3);
            $extension2 =  pathinfo(
                parse_url($file2, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension2 = $file2->getClientOriginalExtension();

            $extension3 =  pathinfo(
                parse_url($file3, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
            
            $extension3 = $file3->getClientOriginalExtension();
            file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);

            file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);
        }else if($file3 != "" and $file2 == ""){
            $img3 = file_get_contents($file3);

            $extension3 =  pathinfo(
                parse_url($file3, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension3 = $file3->getClientOriginalExtension();
            file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);

        }
        //return $file;
        $img = file_get_contents($file);
        
       

        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 

        $extension = $file->getClientOriginalExtension();
        
       
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/images/".$id."_img.".$extension), $img);
        
        

        $url = "/images/".$id."_img.".$extension;
        $url2 = "";
        $url3 = "";
        

        if($file2 != "" and $file3 != ""){

        $url2 = "/images/".$id."_img2.".$extension2;
        $url3 = "/images/".$id."_img3.".$extension3;


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

        }else if($file2 != "" and $file3 == ""){

            $url2 = "/images/".$id."_img2.".$extension2;
            
    
    
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => $url2,
                "image3" => "",
                "discount" => request("discount")
        
            ]);

        }else if($file3 != "" and $file2 == ""){

            
            $url3 = "/images/".$id."_img3.".$extension3;
    
    
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => "",
                "image3" => $url3,
                "discount" => request("discount")
        
            ]);

        }else{
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => "",
                "image3" => "",
                "discount" => request("discount")
        
            ]);
        }


       
       // return $contents;
      

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

        //return $file." ".$file2." ".$file3;

      
       

        $img = "";
        $img2 = "";
        $img3 = "";
        $extension = "";
        $extension2 = "";
        $extension3 = "";

        if($file2 != "" and $file3 == ""){
            
            $img2 = file_get_contents($file2);
            $extension2 =  pathinfo(
                parse_url($file2, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension2 = $file2->getClientOriginalExtension();

            file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);

        }else if($file2 != "" and $file3 != ""){
            $img2 = file_get_contents($file2);
            $img3 = file_get_contents($file3);
            $extension2 =  pathinfo(
                parse_url($file2, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension2 = $file2->getClientOriginalExtension();

            $extension3 =  pathinfo(
                parse_url($file3, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
            
            $extension3 = $file3->getClientOriginalExtension();
            file_put_contents(public_path("/images/".$id."_img2.".$extension2), $img2);

            file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);
        }else if($file3 != "" and $file2 == ""){
            $img3 = file_get_contents($file3);

            $extension3 =  pathinfo(
                parse_url($file3, PHP_URL_PATH), 
                PATHINFO_EXTENSION
            ); 
    
            $extension3 = $file3->getClientOriginalExtension();
            file_put_contents(public_path("/images/".$id."_img3.".$extension3), $img3);

        }
        //return $file;
        $img = file_get_contents($file);
        
       

        $extension =  pathinfo(
            parse_url($file, PHP_URL_PATH), 
            PATHINFO_EXTENSION
        ); 

        $extension = $file->getClientOriginalExtension();
        
       
        //return $extension;
        
        //return $file;

        file_put_contents(public_path("/images/".$id."_img.".$extension), $img);
        
        

        $url = "/images/".$id."_img.".$extension;
        $url2 = "";
        $url3 = "";
        

        if($file2 != "" and $file3 != ""){

        $url2 = "/images/".$id."_img2.".$extension2;
        $url3 = "/images/".$id."_img3.".$extension3;


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

        }else if($file2 != "" and $file3 == ""){

            $url2 = "/images/".$id."_img2.".$extension2;
            
    
    
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => $url2,
                "image3" => "",
                "discount" => request("discount")
        
            ]);

        }else if($file3 != "" and $file2 == ""){

            
            $url3 = "/images/".$id."_img3.".$extension3;
    
    
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => "",
                "image3" => $url3,
                "discount" => request("discount")
        
            ]);

        }else{
            return Product::create([
                "product_id" => $id,
                "shop_id_fk" => request("shop_id_fk"),
                "name" => request("name"),
                "description" => request("description"),
                "price" => request("price"),
                "product_category" => request("product_category"),
                "image1" => $url,
                "image2" => "",
                "image3" => "",
                "discount" => request("discount")
        
            ]);
        }


       
       // return $contents;
    }

});



Route::get('/images/{product_id}/{imageno}', function($pid, $no){

    $url =  DB::table('product')->where('product_id', $pid)->pluck('image'.$no);

    //return str_replace('\\', '/', public_path());
    $image = file_get_contents(public_path().$url[0]);

    return $image;

    
});



Route::get('/logos/{shop_id}', function($shop_id){

    $url =  DB::table('shop')->where('shop_id', $shop_id)->pluck('logo');

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


Route::get('/products/select/{start}/{end}', function($start, $end){

   
        
    $prods = Product::all();
    $prods_all = [];
    $index = 0;
    foreach($prods as $x){
        $strs = $x->product_id;
        $ID = (int)str_replace('prod', '', $strs);
        if($ID >= $start and $ID <= $end){
            array_push($prods_all, $x);
        }
        $index += 1;
    }

    return $prods_all;


    //return str_replace('\\', '/', public_path());
    //return $shops;





});

Route::get('/products/random/{end}', function($end){

   
        return Product::all()->random($end);
});




Route::post('/register', function(){
    request()->validate([
        
        'email' => 'required',
        'name' => 'required',
        'dob' => 'required',
        'address' => 'required',
        'phone' => 'required',
        'password' => 'required',
	
        
    ]);

    //$count = Model::latest()->first()->;
    //$id = "childcat".($count + 1);

    if(User::count() == 0){
        
        
        
        $date = strtotime(request('dob'));
        $date = date('d/m/Y', $date); 
       // return $contents;
        return User::create([
            'email' => request('email'),
            'name' => request('name'),
            'dob' => $date,
            'address' => request('address'),
            'phone' => request('phone'),
            'password' => Hash::make(request('password'))
    
        ]);

    }else{
       
        //return $file;

        $date = strtotime(request('dob'));
        $date = date('d/m/Y', $date); 
        return User::create([
            'email' => request('email'),
            'name' => request('name'),
            'dob' => $date,
            'address' => request('address'),
            'phone' => request('phone'),
            'password' => Hash::make(request('password'))
    
        ]);
    }
});


Route::post('/post_orders', function(Request $request){

    $list = $request->all();

    


    foreach($list as $order){
        //echo $order['product_id'];
        $product_id = $order['product_id'];
        
        $shop_id = $order['shop_id'];
        $total = $order['total'];
        $order_address = $order['order_address'];
        $state = $order['state'];
        $user_email = $order['user_email'];
        $date = Carbon::now();
        $cart_id = "cart1";
        $order_id = "order1";
        
        if((Cart::count() == 0)){
            $id = 1;
            $cart_id = "cart".$id;

        }else{
            $carts = Cart::all();
        $cart_ids = [];
        $index = 0;
        foreach($carts as $x){
            $strs = $x->cart_id;
            $cart_ids[$index] = (int)str_replace('cart', '', $strs);
            $index += 1;
        }

        $c_id = max($cart_ids) + 1;

        $cart_id = "cart".$c_id;
        }
        
        $product_id = $order['product_id'];
        $cart = Cart::create([
            'cart_id' => $cart_id,
            'total' => $total,
            'user_email_fk' => $user_email,
            'product_id_fk' => $product_id,
    
        ]);

        //echo $product_id;


        if((Order::count() == 0)){
            $id = 1;
            $order_id = "order".$id;

        }else{
            $orders = Order::all();
        $order_ids = [];
        $index = 0;
        foreach($orders as $x){
            $strs = $x->order_id;
            $order_ids[$index] = (int)str_replace('order', '', $strs);
            $index += 1;
        }

        $c_id = max($order_ids) + 1;

        $order_id = "order".$c_id;
        }

        $order = Order::create([
            'order_id' => $order_id,
            'date' => $date,
            'order_address' => $order_address,
            'state' => $state,
            'user_email_fk' => $user_email
    
        ]);

        $order_a = OrderAttribute::create([
            'date' => $date,
            'product_id_fk' => $product_id,
            'shop_id_fk' => $shop_id,
            'cart_id_fk' => $cart_id,
            'order_id_fk' => $order->order_id
    
        ]);


        return response()->json([
            "status" => "success"
        ]);


        

        






    


    }




});

Route::post('/login', function(Request $request){
if($request->isMethod('post')){
    $users = User::all();

    request()->validate([
        'email' => 'required',
        'password' => 'required'
    ]);

    $email = request('email');
    $pass = request('password'); 
    

    

    foreach($users as $u){
        //echo $u->password;
        if($u->email == $email and Hash::check($pass, $u->password)){
            return "Match";
        }
    }

  return "Not Match";

}else{
    echo "NOT POST METHOD";
}
   


});

Route::get('/shops/products/{name}', function($name){

   
        
    $prods = Product::all();
    $shops = Shop::all();

    $shop_id = "";
    foreach($shops as $s){
        if($s->shop_name == $name){
            $shop_id = $s->shop_id;
        }
    }
    if($shop_id == ""){
        return "Invalid shop name";
    }
    $prods_all = [];
    $index = 0;
    foreach($prods as $p){

        
            if($p->shop_id_fk == $shop_id){
                array_push($prods_all, $p);
            }
        
        $index += 1;
    }

    return $prods_all;


    //return str_replace('\\', '/', public_path());
    //return $shops;





});


Route::get('/products/recent/{end}', function($end){

   
        
    $prods = DB::table('product')->orderBy('date_added', 'desc')->take($end)->get();

    return $prods;



});

Route::get('/shops/get/{name}', function($name){

   
        
    
    $shops = Shop::all();

    $shop_id = "";
    foreach($shops as $s){
        if($s->shop_name == $name){
            $shop_id = $s->shop_id;
        }
    }
    if($shop_id == ""){
        return "Invalid shop name";
    }
    
    $index = 0;
    foreach($shops as $s){

        
            if($s->shop_id == $shop_id){
                return $s;
            }
        
        $index += 1;
    }

 


    //return str_replace('\\', '/', public_path());
    //return $shops;





});



Route::post('/colors', function(){

    request()->validate([
        'value' => 'required'
    ]);

   

    if(Color::count() == 0){
        
        $id = "color"."1";

        return Color::create([
            'color_id' => $id,
            'value' => request('value'),
    
    
        ]);

    }else{
        $colors = Color::all();
        $color_ids = [];
        $index = 0;
        foreach($colors as $x){
            $strs = $x->color_id;
            $color_ids[$index] = (int)str_replace('color', '', $strs);
            $index += 1;
        }

        $c_id = max($color_ids) + 1;
        $id = "color".$c_id;

        return Color::create([
            'color_id' => $id,
            'value' => request('value'),
    
    
        ]);
    

    }
    

   

});

Route::post('/sizes', function(){

    request()->validate([
        'value' => 'required'
    ]);

   

    if(Size::count() == 0){
        
        $id = "size"."1";

        return Size::create([
            'size_id' => $id,
            'value' => request('value'),
    
    
        ]);

    }else{
        $sizes = Size::all();
        $size_ids = [];
        $index = 0;
        foreach($sizes as $x){
            $strs = $x->size_id;
            $size_ids[$index] = (int)str_replace('size', '', $strs);
            $index += 1;
        }

        $c_id = max($size_ids) + 1;
        $id = "size".$c_id;

        return Size::create([
            'size_id' => $id,
            'value' => request('value'),
    
    
        ]);
    

    }
    

   

});

Route::post('/productattributes', function(){
    request()->validate([
        'product_id_fk' => 'required',
        'color_id_fk' => 'required',

        'size_id_fk' => 'required',
        'child_cat_id_fk' => 'required',
        'quantity' => 'required'

    ]);

    return ProductAttribute::create([
        "product_id_fk" => request("product_id_fk"),
        "color_id_fk" => request("color_id_fk"),
        "size_id_fk" => request("size_id_fk"),
        "child_cat_id_fk" => request("child_cat_id_fk"),
        "quantity" => request("quantity")


    ]);





});

Route::get('/getattributes/{prod_id}', function($prod_id){


    $attributes = ProductAttribute::all();
    $color_ids = [];
    $size_ids = [];
    $child_ids = [];

    $products = Product::all();
    $product_info = "";

    foreach($products as $p){
        if($p->product_id == $prod_id){
            $product_info = $p;

        }
    }

    foreach($attributes as $a){

        if($a->product_id_fk == $prod_id){
            array_push($color_ids, $a->color_id_fk);
            array_push($size_ids, $a->size_id_fk);
            array_push($child_ids, $a->child_cat_id_fk);


        }

    }

   // return $color_ids;

    $colors_l = [];
    $sizes_l = [];
    $childs_l = [];
    

    $colors = Color::all();
    $sizes = Size::all();
    $childs = ChildCategory::all();

    $index = 0;
    foreach($colors as $c){
        if($c->color_id == $color_ids[$index]){
            array_push($colors_l, $c);
            //echo $index.",".$c;
            if($index < count($color_ids) - 1){
                $index += 1;
            }
            
           

            
        }
        

    }

  //  return $colors_l;
    $index = 0;
    foreach($sizes as $s){
        if($s->size_id == $size_ids[$index]){
            array_push($sizes_l, $s);
            if($index < count($size_ids) - 1){
                $index += 1;
            }
           
        }

        

    }

    $index = 0;
    foreach($childs as $c){
        if($c->child_cat_id == $child_ids[$index]){
            array_push($childs_l, $c);
            if($index < count($child_ids) - 1){
                $index += 1;
            }
            
        }
        
    }


    return response()->json([
        "product" => $product_info,
        "colors" => $colors_l,
        "sizes" => $sizes_l,
        "childs" => $childs_l

    ]);

    
    
    

});

