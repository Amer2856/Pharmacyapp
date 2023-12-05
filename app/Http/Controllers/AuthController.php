<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Session;
use Auth;
use Sentinel;
use Cartalyst\Sentinel\Checkpoints\ThrottlingException;
use Cartalyst\Sentinel\Checkpoints\NotActivatedException;

class AuthController extends Controller
{
    //
    public function register(Request $request){

        //validate
        $rules = [
            'name' =>'required|string',
            'phone' => 'required|string|unique:users',
            'password' => 'required|string|min:6'

        ];
        $validator = validator::make($request->all(), $rules);
        if($validator->fails()){
            return response()->json($validator->errors(), 400);
        }
        //create new user in users table
        $user = User::create([
            'name' =>$request['name'],
            'phone' =>$request['phone'],
            'password' =>Hash::make($request['password'])
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['user'=> $user, 'token'=>$token];
        return response()->json($response, 200);
    }

    public function login(Request $request){
        //validate inputs
        $rules = [
            'phone' => 'required',
            'password' => 'required|string'
        ];
        $request->validate($rules);
        //find user phone in users table
        $user = User::where('phone' , $request->phone)->first();
        //if user phone found and password is correct
        if($user && Hash::check($request->password, $user->password)){
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            $response=['user'=>$user, 'token'=>$token];
            return response()->json($response,200);
        }
        $response = ['message' => 'Incorrect email or password'];
        return response()->json($response, 400);


    }
    // public function logout(Request $request){
    //     Session::flush();
    //     Auth::logout();
    //     return redirect('login')->with(Auth::logout());
    //     //return "sacasc";
    // }
    public function logout(Request $request) {
        if ($request->user()) { 
            $request->user()->tokens()->delete();
        }
    
        return response()->json(['message' => 'logout is done'], 200);
    }
    
     
}