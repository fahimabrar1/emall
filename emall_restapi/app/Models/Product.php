<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Product
 * 
 * @property string $product_id
 * @property string $name
 * @property string $description
 * @property int $price
 * @property string $product_category
 * @property boolean $image1
 * @property boolean $image2
 * @property boolean $image3
 * @property int $discount
 * @property string $shop_id_fk
 * 
 * @property Shop $shop
 * @property OrderAttribute $order_attribute
 * @property ProductAttribute $product_attribute
 *
 * @package App\Models
 */
class Product extends Model
{
	protected $table = 'product';
	protected $primaryKey = 'product_id';
	public $incrementing = false;
	public $timestamps = false;

	

	protected $fillable = [
		'product_id',
		'name',
		'description',
		'price',
		'product_category',
		'image1',
		'image2',
		'image3',
		'discount',
		'shop_id_fk'
	];

	public function shop()
	{
		return $this->belongsTo(Shop::class, 'shop_id_fk');
	}

	public function order_attribute()
	{
		return $this->hasOne(OrderAttribute::class, 'product_id_fk');
	}

	public function product_attribute()
	{
		return $this->hasOne(ProductAttribute::class, 'product_id_fk');
	}
}
