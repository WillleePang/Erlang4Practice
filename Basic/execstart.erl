% @Author: hq
% @Date:   2016-12-30 13:30:08
% @Last Modified by:   hq
% @Last Modified time: 2016-12-30 13:33:36

-module(execstart).
-export([create/2]).

start(AnAtom, Fun) ->
    case whereis(AnAtom) of
    	undefined -> register(AnAtom, spawn(Fun)),
    		io:format("this is process name:~p~n",[AnAtom]);
    	Pid -> io:format("this AnAtom have registered~n")
    end.

create(AnAtom, Fun) ->
	start(AnAtom, Fun),
	start(AnAtom, Fun).