<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

use Illuminate\Http\Request;

Route::get('/', 'WelcomeController@index');

Route::get('home', 'HomeController@index');

Route::controllers([
	'auth'		=> 'Auth\AuthController',
	'password' 	=> 'Auth\PasswordController',
]);

//Profile information about the user
Route::get("me", array('before'=>'oauth', function(Request $request){
	$user = \App\User::find(Authorizer::getResourceOwnerId());
	return Response::json(['name' => $user->name]);

}));

Route::post('oauth/access_token', function() {
    return Response::json(Authorizer::issueAccessToken());
});
