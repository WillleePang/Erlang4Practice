% @Author: hq
% @Date:   2016-12-22 19:53:13
% @Last Modified by:   hq
% @Last Modified time: 2016-12-22 19:55:09

-module(attr).
-vsn(1234).
-author({pang,weili}).
-purpose("example of attributes").
-export([fac/0]).

fac(1) -> 1;
fac(N) -> N * fac(N-1).