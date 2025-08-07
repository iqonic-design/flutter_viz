<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login','API\UserController@login');
Route::post('forgot-password','API\UserController@forgot');
Route::post('register','API\UserController@register');
Route::post('google-register','API\UserController@googleRegister');
/* Route::post('screen-list','API\UserController@screenList');
Route::post('screen-save','API\UserController@screenSave');
Route::post('screen-delete','API\UserController@screenDelete'); */

Route::get('category-list','API\CategoryController@categoryList');

Route::post('country-list', 'API\CommanController@getCountryList');
Route::post('state-list', 'API\CommanController@getStateList');
Route::post('city-list', 'API\CommanController@getCityList');

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('update-profile','API\UserController@updateProfile');
    Route::post('update-profile-image','API\UserController@updateProfileImage');
    Route::post('change-password','API\UserController@changePassword');
    Route::get('template-list','API\TemplateController@templateList');
    Route::get('category-template-list','API\CategoryController@categoryTemplateList');
    
    Route::post('category-save','API\CategoryController@store');
    Route::post('category-delete','API\CategoryController@Delete');
    
    Route::post('template-save','API\TemplateController@store');
    Route::post('template-delete','API\TemplateController@Delete');

    Route::get('feedback-list','API\FeedbackController@feedbackList');
    Route::post('feedback-save','API\FeedbackController@store');

    Route::get('video-list','API\VideoController@videoList');
    Route::post('video-save','API\VideoController@store');
    Route::post('video-delete','API\VideoController@Delete');

    Route::get('screen-list','API\ScreenController@screenList');
    Route::post('screen-save','API\ScreenController@store');
    Route::post('screen-delete','API\ScreenController@Delete');

    Route::get('project-list','API\ProjectController@projectList');
    Route::post('project-save','API\ProjectController@store');
    Route::post('project-delete','API\ProjectController@Delete');
    Route::post('update-project-time','API\ProjectController@projectLastTime');


    Route::get('project-template-list','API\ProjectTemplateController@projectTemplateList');
    Route::post('project-template-save','API\ProjectTemplateController@store');
    Route::post('project-template-delete','API\ProjectTemplateController@Delete');

    Route::post('project-template-save-as-project','API\ProjectTemplateController@saveProjectTemplateAsProject');

    Route::get('project-template-screen-list','API\ProjectTemplateScreenController@projectTemplateScreenList');
    Route::post('project-template-screen-save','API\ProjectTemplateScreenController@store');
    Route::post('project-template-screen-delete','API\ProjectTemplateScreenController@Delete');

    Route::get('user-list','API\UserController@userList');

    Route::get('component-list','API\ComponentController@componentList');
    Route::get('category-component-list','API\ComponentController@categoryComponentList');
    Route::post('component-save','API\ComponentController@store');
    Route::post('component-delete','API\ComponentController@delete');

    Route::get('dashboard-detail','API\DashboardController@dashboardDetail');
    Route::post('project-clone', 'API\ProjectController@projectClone');
    Route::post('save-user-file', 'API\UserController@saveUserFiles');

    Route::get('usermedia-list','API\UserMediaController@usermediaList');
    Route::post('usermedia-save','API\UserMediaController@store');
    Route::post('usermedia-delete','API\UserMediaController@Delete');

    Route::post('download-user-project', 'API\UserController@downloadUserProject');


});