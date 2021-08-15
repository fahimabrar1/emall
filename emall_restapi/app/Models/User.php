<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property string $email
 * @property string $name
 * @property Carbon $dob
 * @property string $address
 * @property int $phone
 * @property string $password
 * 
 * @property Collection|Cart[] $carts
 * @property Collection|Order[] $orders
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'user';
	protected $primaryKey = 'email';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'phone' => 'int'
	];

	protected $dates = [
		'dob'
	];

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'name',
		'dob',
		'address',
		'phone',
		'password'
	];

	public function carts()
	{
		return $this->hasMany(Cart::class, 'user_email_fk');
	}

	public function orders()
	{
		return $this->hasMany(Order::class, 'user_email_fk');
	}
}
