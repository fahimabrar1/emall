<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class SubCategory
 * 
 * @property string $sub_cat_id
 * @property string $category_id_fk
 * @property int $name
 * 
 * @property Category $category
 * @property Collection|ChildCategory[] $child_categories
 *
 * @package App\Models
 */
class SubCategory extends Model
{
	protected $table = 'sub_category';
	protected $primaryKey = 'sub_cat_id';
	public $incrementing = false;
	public $timestamps = false;
/*
	protected $casts = [
		'name' => 'int'
	];
*/
	protected $fillable = [
		'sub_cat_id',
		'category_id_fk',
		'name'
	];

	public function category()
	{
		return $this->belongsTo(Category::class, 'category_id_fk');
	}

	public function child_categories()
	{
		return $this->hasMany(ChildCategory::class, 'sub_cat_id_fk');
	}
}
