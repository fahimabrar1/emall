<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Cart
 * 
 * @property string $cart_id
 * @property int $total
 * @property string $user_email_fk
 * 
 * @property User $user
 * @property OrderAttribute $order_attribute
 *
 * @package App\Models
 */
class Cart extends Model
{
	protected $table = 'cart';
	protected $primaryKey = 'cart_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'total' => 'int'
	];

	protected $fillable = [
		'total',
		'user_email_fk'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'user_email_fk');
	}

	public function order_attribute()
	{
		return $this->hasOne(OrderAttribute::class, 'cart_id_fk');
	}
}
