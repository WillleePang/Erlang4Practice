% @Author: hq
% @Date:   2016-12-29 16:03:23
% @Last Modified by:   hq
% @Last Modified time: 2016-12-29 16:07:58

-module(clock).
-export([start/2,stop/0]).

start(Time,Fun) ->
    register(clock, spawn(fun() -> tick(Time,Fun) end)).

stop() -> clock!stop.
	
tick(Time,Fun) ->
	receive
		stop ->
			void
	after Time ->
		Fun(),
		tick(Time,Fun)
	end.