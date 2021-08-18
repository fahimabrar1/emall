<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Color
 * 
 * @property string $color_id
 * @property string $value
 * 
 * @property ProductAttribute $product_attribute
 *
 * @package App\Models
 */
class Color extends Model
{
	protected $table = 'color';
	protected $primaryKey = 'color_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $fillable = [
		'color_id',
		'value'
	];

	public function product_attribute()
	{
		return $this->hasOne(ProductAttribute::class, 'color_id_fk');
	}
}
