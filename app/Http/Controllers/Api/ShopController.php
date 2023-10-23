<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\StoreShopRequest;
use App\Http\Requests\Api\UpdateShopRequest;
use App\Models\Shop;
use App\Http\Controllers\Controller;
use App\Http\Resources\Api\ShopResource;
use App\Http\Resources\Api\ShopCollection;
use Illuminate\Http\Request;
use App\Services\Api\ShopQuery;
use App\Traits\ApiResponses;
use App\Models\ShopCategory;
use App\Http\Resources\Api\ShopCategoryCollection;

class ShopController extends Controller
{
    use ApiResponses;
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        try
        {   
            $filter = new ShopQuery();
            $queryItems = $filter->transform($request);

            if (count($queryItems) == 0){
                return $this->success(['shops' => new ShopCollection(Shop::all())]);
            }else{
                return $this->success(['shops' => new ShopCollection(Shop::where($queryItems)->get())]);
            }
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreShopRequest $request)
    {
        try
        {
            if (empty($request->shopcategory_id)){
                $categories = new ShopCategoryCollection(ShopCategory::all());
                return $this->error($categories, 'Shop category does not exists. Available shop categories are listed below', 401 );
            }
            $user = auth('sanctum')->user();
    
            $request->merge(['user_id' => $user->id]);

            $shop = Shop::create($request->all());
            return $this->success([
                'shop' => new ShopResource($shop),
            ],
            'Shop Created');
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Shop $shop)
    {
        return new ShopResource($shop);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Shop $shop)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateShopRequest $request, Shop $shop)
    {
        try
        {
            $user = auth('sanctum')->user();
            
            $is_owner = Shop::where([
                ['id', $shop->id],
                ['user_id', $user->id],
            ])->exists();
            
            if (!$is_owner){
                return $this->error('', 'The shop you are trying to edit it is not your property', 401 );
            }

            if (empty($request->shopcategory_id)){
                $categories = new ShopCategoryCollection(ShopCategory::all());
                return $this->error($categories, 'Shop category does not exists. Available shop categories are listed below', 401 );
            }
            
            $shop->update($request->all());

            return $this->success([
                'shop' => new ShopResource($shop),
            ],
            'Shop Updated');
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }   
        

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Shop $shop)
    {
        try
        {
            $user = auth('sanctum')->user();
            
            $is_owner = Shop::where([
                ['id', $shop->id],
                ['user_id', $user->id],
            ])->exists();
            
            if (!$is_owner){
                return $this->error('', 'The shop you are trying to edit it is not your property', 401 );
            }

            $shop->delete();
            return $this->success('','Shop Deleted');
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }
}
