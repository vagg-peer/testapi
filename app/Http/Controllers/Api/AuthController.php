<?php

namespace App\Http\Controllers\Api;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\StoreUserRequest;
use App\Http\Requests\Api\LoginUserRequest;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Traits\ApiResponses;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Api\UserResource;


class AuthController extends Controller
{
    use ApiResponses;
    public function login(LoginUserRequest $request)
    {
        try
        {
            if(!Auth::attempt($request->only('email','password'))){
                return $this->error('', 'Credentials do not match', 401 );
            }

            $user = User::where('email', $request->email)->first();

            return $this->success([
                'user' => new UserResource($user),
                'token' => $user->createToken('ApiToken')->plainTextToken,
            ]);
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }

    public function register(StoreUserRequest $request)
    {
        try
        {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'role' => 'owner',
            ]);
            return $this->success([
                'user' => new UserResource($user),
                'token' => $user->createToken('ApiToken')->plainTextToken
            ]);
        }
        catch (\Exception $e) 
        {
            return $this->error('', 'Internal Server Error', 500 );
        }
    }
}
