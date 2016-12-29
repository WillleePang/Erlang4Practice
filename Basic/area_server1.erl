% @Author: hq
% @Date:   2016-12-29 10:52:47
% @Last Modified by:   hq
% @Last Modified time: 2016-12-29 12:53:15

-module(area_server1).
-export([loop/0, rpc/2]).

rpc(Pid, Request) ->
    Pid!{self(), Request},
    receive
        Response -> Response
    end.

loop() ->
    receive
    	{From, {rectangle, Width, Ht}} ->
            From!Width*Ht,
    		loop();
    	{From, {circle, R}} ->
    		From!3.14159*R*R,
            loop();
    	{From, Other} ->
            From!{error,Other},
    		loop()
    end.