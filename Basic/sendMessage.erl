% @Author: hq
% @Date:   2016-12-30 15:13:24
% @Last Modified by:   hq
% @Last Modified time: 2017-01-03 15:34:49

-module(sendMessage).
-export([start/2]).

% N 个进程， M 次
start(N,M) ->
    sendstart(M,createProcesses(N)).

% 创建 N 个进程
createProcesses(N) ->
	L = for(1,N,fun() -> spawn(fun() -> loop() end) end),
	L.

% 发送消息
sendstart(M, L) ->
	Pid = getPid(1,L,M),
	Pid!{1,L,M,"hello world"}.

% 进程执行的函数
loop ->
	receive 
		{I,L,M,Message} ->
			io:format("Pid:~p Recv Message:~p~n", [(I rem lists_size(L))+1,Message]),
			case getPid(I+1,L,M) of
				none -> io:format("have send...~n");
                Pid  -> Pid ! {I+1, L, M, Message},
                loop()
            end
    end.

% 获得进程的Pid
getPid(I,L,M) ->
	io:format("...........I:~p~n", [I]),
    case lists_size(L) of
        Size when I =< Size ->
            lists:nth(I, L);
        % 注意余数为 0
        Size when I > Size, I rem Size =:= 0 ->
            lists:nth(Size, L);
        Size when I > Size, I =< M ->
            lists:nth((I rem Size), L);
        Size when I > M ->
            none
    end.

for(Max, Max, F) -> [F()];
for(I, Max, F)   -> [F() | for(I+1, Max, F)].


% 计算lists大小函数
lists_size(L) ->
   lists_size(L, 0).
lists_size([_|T], Size) ->
    lists_size(T, Size+1);
lists_size([], Size) ->
    Size.