<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\ShopCategory as Category;

class ShopResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = $this::user()->get()->first();
        $category = Category::find($this->shopcategory_id);
        return [
            'id' => $this->id,
            'name' => $this->name,
            'shopOwner' => [
                'id' => $user->id, 
                'name' => $user->name
            ],
            'shopCategory' => $category->name,
            'description' => $this->description,
            'openHours' => $this->open_hours,
            'city' => $this->city,
            'address' => $this->address,
        ];
    }
}
