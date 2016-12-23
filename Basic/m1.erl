% @Author: hq
% @Date:   2016-12-23 17:51:31
% @Last Modified by:   hq
% @Last Modified time: 2016-12-23 17:55:39

-module(m1).
-export([start/0]).

-ifdef(debug).
-define(TRACE(X), io:format("TRACE ~p:~p ~p~n",[?MODULE,?LINE,X])).
-else.
-define(TRACE(X),void).
-endif.

start() -> loop(5).

loop(0) -> 
	void;
loop(N) ->
	?TRACE(N),
	loop(N-1).