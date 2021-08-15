<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Category
 * 
 * @property string $category_id
 * @property string $name
 * 
 * @property Collection|Shop[] $shops
 * @property Collection|SubCategory[] $sub_categories
 *
 * @package App\Models
 */
class Category extends Model
{
	protected $table = 'category';
	protected $primaryKey = 'category_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $fillable = [
		'name',
		'category_id'
	];

	public function shops()
	{
		return $this->hasMany(Shop::class, 'category_id_fk');
	}

	public function sub_categories()
	{
		return $this->hasMany(SubCategory::class, 'category_id_fk');
	}
}
