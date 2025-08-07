<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Country;
use App\City;
use App\State;
class CommanController extends Controller
{
    public function getCountryList(Request $request)
    {
        $list = Country::get();

        return response()->json( $list );
    }

    public function getStateList(Request $request)
    {
        $list = State::where('country_id',$request->country_id)->get();

        return response()->json( $list );
    }

    public function getCityList(Request $request)
    {
        $list = City::where('state_id',$request->state_id)->get();

        return response()->json( $list );
    }
}
