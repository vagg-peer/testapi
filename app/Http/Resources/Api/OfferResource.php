<?php

namespace App\Http\Resources\Api;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Shop;

class OfferResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $shop = Shop::find($this->shop_id);
        return [
            'name' => $this->name,
            'description' => $this->description,
            'shop' => $shop->name,
        ];
    }
}
