<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ChildCategory
 * 
 * @property string $child_cat_id
 * @property string $name
 * @property string $sub_cat_id_fk
 * 
 * @property SubCategory $sub_category
 * @property ProductAttribute $product_attribute
 *
 * @package App\Models
 */
class ChildCategory extends Model
{
	protected $table = 'child_category';
	protected $primaryKey = 'child_cat_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $fillable = [
		'child_cat_id',
		'name',
		'sub_cat_id_fk'
	];

	public function sub_category()
	{
		return $this->belongsTo(SubCategory::class, 'sub_cat_id_fk');
	}

	public function product_attribute()
	{
		return $this->hasOne(ProductAttribute::class, 'child_cat_id_fk');
	}
}
