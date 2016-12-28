% @Author: hq
% @Date:   2016-12-28 14:04:31
% @Last Modified by:   hq
% @Last Modified time: 2016-12-28 14:08:53

-module(fac1).
-export([main/1]).

main([A]) ->
    I = list_to_integer(atom_to_list(A)),
    F = fac(I),
    io:format("factorial ~w = ~w~n",[I,F]),
    init:stop().

fac(0) -> 1;
fac(N) -> N*fac(N-1).