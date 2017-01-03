% @Author: hq
% @Date:   2016-12-30 15:13:24
% @Last Modified by:   hq
% @Last Modified time: 2017-01-03 10:10:15

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

% 获得进程的Pid
getPid(I,L,M) ->
	