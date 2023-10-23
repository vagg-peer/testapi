<?php

namespace App\Http\Requests\Api;

use App\Models\ShopCategory;
use Illuminate\Foundation\Http\FormRequest;

class StoreShopRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string'],
            'shopCategory' => ['required', 'string'],
            'description' => ['required', 'string'],
            'openHours' => ['required', 'string'],
            'city' => ['required', 'string'],
            'address' => ['nullable', 'string'],
        ];
    }

    protected function prepareForValidation()
    {
        $category= ShopCategory::where('name', $this->shopCategory)->first();
        $category= !empty($category) ? $category->id : NULL;
        $this->merge([
            'shopcategory_id' => $category,
            'open_hours' => $this->openHours,
        ]);
    }
}
