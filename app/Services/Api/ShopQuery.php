<?php

namespace App\Services\Api;

use Illuminate\Http\Request;
use App\Models\ShopCategory;

class ShopQuery{

    protected $allowedParams = [
        'shopOwner' => ['eq'],
        'shopCategory' => ['eq'],
        'city' => ['eq'],
    ];

    protected $columnMap = [
        'shopOwner' => 'user_id',
        'shopCategory' => 'shopcategory_id',
        // 'city' => 'city',
    ];

    protected $operatorMap = [
        'eq' => '=',
    ];

    public function transform(Request $request){
        $eloQuery = [];

        foreach ($this->allowedParams as $param => $operators){
            
            $query = $request->query($param);
          
            if (!isset($query)){
                continue;
            }
         
            $column = $this->columnMap[$param] ?? $param;

            foreach ($operators as $operator){
                if (isset($query[$operator])){
                    if ($column == 'shopcategory_id'){
                        $category= ShopCategory::where('name', $query[$operator])->first();
                        $category= !empty($category) ? $category->id : NULL;
                        $query[$operator] = $category;
                    }
                    $eloQuery[] = [$column, $this->operatorMap[$operator], $query[$operator]];
                }
            }
           
        }

        
       
        
        return $eloQuery;
    }

}