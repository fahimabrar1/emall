<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductAttribute
 * 
 * @property string $product_id_fk
 * @property string $color_id_fk
 * @property string $size_id_fk
 * @property string $child_cat_id_fk
 * @property int $quantity
 * 
 * @property Color $color
 * @property Size $size
 * @property Product $product
 * @property ChildCategory $child_category
 *
 * @package App\Models
 */
class ProductAttribute extends Model
{
	protected $table = 'product_attribute';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'quantity' => 'int'
	];

	protected $fillable = [
		'product_id_fk',
		'color_id_fk',
		'size_id_fk',
		'child_cat_id_fk',
		'quantity'
	];

	public function color()
	{
		return $this->belongsTo(Color::class, 'color_id_fk');
	}

	public function size()
	{
		return $this->belongsTo(Size::class, 'size_id_fk');
	}

	public function product()
	{
		return $this->belongsTo(Product::class, 'product_id_fk');
	}

	public function child_category()
	{
		return $this->belongsTo(ChildCategory::class, 'child_cat_id_fk');
	}
}
