<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notification;
use Auth;

class NotificationController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
    }
    public function get()
    {
    	//return Notification::all();
    	return [
            'notificacion'=> Auth::user()->notifications->take(10),
            'noleida' => Auth::user()->unreadNotifications->count()

        ];
    	// $fechaActual=date('Y-m-d');
    	// foreach ($unreadNotifications as $notification) {
    	// 	if ($fechaActual != $notification->created_at->toDateString()) {
    	// 		$notification->markAsRead();
    	// 	}

    		
    	// }
    	// return Auth::user()->unreadNotifications;
    }
    public function MarcarLeida()
    {
        $unreadNotifications= Auth::user()->unreadNotifications;
        foreach ($unreadNotifications as $notification) {
             $notification->markAsRead();
        }
    }
}
