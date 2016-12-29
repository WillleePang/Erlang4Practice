% @Author: hq
% @Date:   2016-12-29 15:31:03
% @Last Modified by:   hq
% @Last Modified time: 2016-12-29 15:33:58

-module(stimer).
-export([start/2, cancel/1]).

start(Time, Fun) ->
	spawn(fun() -> timer(Time,Fun) end).

cancel(Pid) -> Pid!cancel.

timer(Time,Fun) ->
	receive
		cancel ->
			void
	after Time ->
		Fun()
	end.