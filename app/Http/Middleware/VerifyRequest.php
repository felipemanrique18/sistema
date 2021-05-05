<?php

namespace App\Http\Middleware;

use Closure;

class VerifyRequest
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if($request->ajax()){
            return $next($request);
        }
        // return redirect('/');
    }
}
