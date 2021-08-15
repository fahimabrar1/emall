<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Order
 * 
 * @property string $order_id
 * @property Carbon $date
 * @property string $order_address
 * @property string $state
 * @property string $user_email_fk
 * 
 * @property User $user
 * @property OrderAttribute $order_attribute
 *
 * @package App\Models
 */
class Order extends Model
{
	protected $table = 'order';
	protected $primaryKey = 'order_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $dates = [
		'date'
	];

	protected $fillable = [
		'date',
		'order_address',
		'state',
		'user_email_fk'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'user_email_fk');
	}

	public function order_attribute()
	{
		return $this->hasOne(OrderAttribute::class, 'order_id_fk');
	}
}
