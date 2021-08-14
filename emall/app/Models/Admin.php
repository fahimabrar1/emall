<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Admin
 * 
 * @property string $email
 * @property string $first_name
 * @property string $last_name
 * @property Carbon $dob
 * @property string $address
 * @property int $phone
 * @property string $password
 *
 * @package App\Models
 */
class Admin extends Model
{
	protected $table = 'admin';
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
		'first_name',
		'last_name',
		'dob',
		'address',
		'phone',
		'password'
	];
}
