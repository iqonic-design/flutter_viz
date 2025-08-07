<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Feedback;
use App\Template;
use App\Category;
use App\Screen;
Use App\Http\Resources\UserResource;
Use App\Http\Resources\FeedbackResource;

class DashboardController extends Controller
{
    public function dashboardDetail(Request $request)
    {
        $feedback_list = Feedback::orderBy('id','desc')->with('user')->paginate(5);
        $feedback_list = FeedbackResource::collection($feedback_list);
        $feedback_count = Feedback::orderBy('id','desc')->count();

        $template_count = Template::where('status',1)->count();


        $user_list = User::orderBy('id','desc')->paginate(5);
        $user_list = UserResource::collection($user_list);
        $user_count = User::where('user_type','!=','admin')->count();

        $category_count = Category::count();
        $screen_count = Screen::count();

        $sunday = strtotime("sunday -1 week");
	    $sunday = date('w', $sunday) === date('w') ? $sunday+7*86400 : $sunday;
        $saturday = strtotime(date("Y-m-d",$sunday)." +6 days");

        $week_start = date("Y-m-d 00:00:00",$sunday);
        $week_end = date("Y-m-d 23:59:59",$saturday);

        $user_week_report = User::selectRaw('DATE_FORMAT(created_at , "%w") as days , DATE_FORMAT(created_at , "%Y-%m-%d") as date' )
                        ->whereBetween('created_at', [$week_start, $week_end])
                        // ->groupBy(\DB::raw("DATE_FORMAT(created_at, '%d-%m-%Y')"))
                        ->get()->toArray();
        $data = [];
        
        $user_collection = collect($user_week_report);
        for($i = 0; $i < 7 ; $i++){
            $total = $user_collection->filter(function ($value, $key) use($week_start,$i){
                return $value['date'] == date('Y-m-d',strtotime($week_start. ' + ' . $i . 'day'));
            })->count();
            
            $data[] = [
                "day" => date("l", strtotime($week_start . ' + ' . $i . 'day')),
                "total" => $total,
                'date' => date('Y-m-d',strtotime($week_start. ' + ' . $i . 'day')),    
            ];
        }

        return response()->json(
            [
                'user_count' => $user_count,
                'user_week_report' => $data,
                'category_count' => $category_count,
                'screen_count' => $screen_count,
                'user_list' => $user_list,
                'feedback_list' => $feedback_list,
                'feedback_count' => $feedback_count,
                'template_count' => $template_count,    
                'status' => true,
                'message' => 'dashboard detail'
            ]
        );
    }
}