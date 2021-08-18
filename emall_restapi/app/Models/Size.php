<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Size
 * 
 * @property string $size_id
 * @property string $value
 * 
 * @property ProductAttribute $product_attribute
 *
 * @package App\Models
 */
class Size extends Model
{
	protected $table = 'size';
	protected $primaryKey = 'size_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $fillable = [
		'size_id',
		'value'
	];

	public function product_attribute()
	{
		return $this->hasOne(ProductAttribute::class, 'size_id_fk');
	}
}
