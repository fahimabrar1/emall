<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ShopParent
 * 
 * @property string $email
 * @property Carbon $dob
 * @property string $address
 * @property int $NID
 * @property string $first_name
 * @property string $last_name
 * @property int $number
 * @property string $password
 * @property string $type
 * @property string $shop_id_fk
 * 
 * @property Shop $shop
 *
 * @package App\Models
 */
class ShopParent extends Model
{
	protected $table = 'shop_parent';
	protected $primaryKey = 'email';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'NID' => 'int',
		'number' => 'int'
	];

	protected $dates = [
		'dob'
	];

	/*
	protected $hidden = [
		'password'
	];
*/
	protected $fillable = [
		'dob',
		'address',
		'NID',
		'first_name',
		'last_name',
		
		'number',
		'password',
		'type',
		'shop_id_fk',
		'email'
	];

	public function shop()
	{
		return $this->belongsTo(Shop::class, 'shop_id_fk');
	}
}
