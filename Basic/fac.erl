% @Author: hq
% @Date:   2016-12-28 14:01:53
% @Last Modified by:   hq
% @Last Modified time: 2016-12-28 14:03:10

-module(fac).
-export([fac/0]).

fac(0) ->
	1;
fac(N) ->
	N * fac(N-1).