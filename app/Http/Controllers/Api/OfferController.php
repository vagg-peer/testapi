<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\StoreOfferRequest;
use App\Http\Requests\Api\UpdateOfferRequest;
use App\Models\Offer;
use App\Http\Controllers\Controller;
use App\Traits\ApiResponses;
use App\Models\Shop;
use App\Http\Resources\Api\OfferResource;
use App\Jobs\SendQueueEmail;


class OfferController extends Controller
{
    use ApiResponses;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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
    public function store(StoreOfferRequest $request)
    {
        try
        {
            $shop = Shop::find($request->shop);

            // dd($request->shop);
            
            if(empty($shop)){
                return $this->error('An error occured', 'The shop that you offer does not exists', 401 );
            }
            $user =  auth('sanctum')->user();
            $request->merge([
                'user_id' => $user->id,
                'shop_id' => $shop->id,
            ]);
            // dd($request);
            $offer = Offer::create($request->all());

            // $send_mail = 'vagg.karanikolos@gmail.com';
            // $offer = Offer::find(1);
  
            dispatch(new SendQueueEmail($offer));
            return $this->success([
                'offer' => new OfferResource($offer),
            ],
            'Offer Created');
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Offer $offer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Offer $offer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateOfferRequest $request, Offer $offer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Offer $offer)
    {
        //
    }
}
