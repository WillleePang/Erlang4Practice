% @Author: hq
% @Date:   2016-12-28 14:49:02
% @Last Modified by:   hq
% @Last Modified time: 2016-12-28 14:51:21

-module(user_default).
-compile(export_all).

hello() ->
	"Hello Joe how are you?".

away(Time) ->
	io:format("Joe is away and will be back in ~w minutes~n",[Time]).