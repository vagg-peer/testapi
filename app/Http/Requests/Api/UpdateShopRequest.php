<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class UpdateShopRequest extends FormRequest
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
        $method= $this->method;

        if ($method == 'PUT'){
            return [
                'name' => ['required'],
                'shopCategory' => ['required'],
                'description' => ['required'],
                'openHours' => ['required'],
                'city' => ['required'],
                'address' => ['nullable'],
            ];
            
        }else{
            return [
                'name' => ['sometimes', 'required'],
                'shopCategory' => ['sometimes', 'required'],
                'description' => ['sometimes', 'required'],
                'openHours' => ['sometimes', 'required'],
                'city' => ['sometimes', 'required'],
                'address' => ['sometimes', 'nullable'],
            ];
        }
    }

    protected function prepareForValidation()
    {
        if ($this->shopOwner){
            $this->merge([
                'user_id' => $this->shopOwner,
            ]);
        }
        if ($this->shopCategory){
            $this->merge([
                'shopcategory_id' => $this->shopCategory,
            ]);
        }  
        if ($this->openHours){
            $this->merge([
                'open_hours' => $this->openHours,
            ]);
        }  
    }
}