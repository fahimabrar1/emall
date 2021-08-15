<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class OrderAttribute
 * 
 * @property Carbon $date
 * @property string $product_id_fk
 * @property string $shop_id_fk
 * @property string $cart_id_fk
 * @property string $order_id_fk
 * 
 * @property Cart $cart
 * @property Order $order
 * @property Product $product
 * @property Shop $shop
 *
 * @package App\Models
 */
class OrderAttribute extends Model
{
	protected $table = 'order_attribute';
	public $incrementing = false;
	public $timestamps = false;

	protected $dates = [
		'date'
	];

	protected $fillable = [
		'date',
		'product_id_fk',
		'shop_id_fk',
		'cart_id_fk',
		'order_id_fk'
	];

	public function cart()
	{
		return $this->belongsTo(Cart::class, 'cart_id_fk');
	}

	public function order()
	{
		return $this->belongsTo(Order::class, 'order_id_fk');
	}

	public function product()
	{
		return $this->belongsTo(Product::class, 'product_id_fk');
	}

	public function shop()
	{
		return $this->belongsTo(Shop::class, 'shop_id_fk');
	}
}
