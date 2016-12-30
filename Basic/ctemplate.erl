% @Author: hq
% @Date:   2016-12-30 11:19:02
% @Last Modified by:   hq
% @Last Modified time: 2016-12-30 11:41:38

-module(ctemplate).
-compile(export_all).

% 创建进程，loop函数
start() ->
    spawn(fun() -> loop([]) end).

% 封装发送请求，并且接受请求
rpc(Pid, Request) ->
	Pid!{self(),Request},
	receive
		{Pid,Response} ->
			Response
	end.

% 循环获取请求，并且打印数据
loop(X) ->
	receive
		Any ->
			io:format("Received:~p~n",[Any]),
			loop(X)
	end.