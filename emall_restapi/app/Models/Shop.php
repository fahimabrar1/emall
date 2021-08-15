<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Shop
 * 
 * @property string $shop_id
 * @property string $shop_name
 * @property string $category_id_fk
 * @property boolean $logo
 * 
 * @property Category $category
 * @property OrderAttribute $order_attribute
 * @property Collection|Product[] $products
 * @property Collection|ShopParent[] $shop_parents
 *
 * @package App\Models
 */
class Shop extends Model
{
	protected $table = 'shop';
	protected $primaryKey = 'shop_id';
	public $incrementing = false;
	public $timestamps = false;



	protected $fillable = [
		'shop_name',
		'category_id_fk',
		'shop_id',
		'logo'
	];

	public function category()
	{
		return $this->belongsTo(Category::class, 'category_id_fk');
	}

	public function order_attribute()
	{
		return $this->hasOne(OrderAttribute::class, 'shop_id_fk');
	}

	public function products()
	{
		return $this->hasMany(Product::class, 'shop_id_fk');
	}

	public function shop_parents()
	{
		return $this->hasMany(ShopParent::class, 'shop_id_fk');
	}
}
