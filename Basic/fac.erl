% @Author: hq
% @Date:   2016-12-28 14:01:53
% @Last Modified by:   hq
% @Last Modified time: 2016-12-28 14:05:02

-module(fac).
-export([fac/1]).

fac(0) ->
	1;
fac(N) ->
	N * fac(N-1).