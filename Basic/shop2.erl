-module(shop2).
-export([total/1]).

total(L)->sum(map(fun({What,N})->shop:cost(What)*N end,L)).
