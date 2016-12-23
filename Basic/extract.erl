-module(extract).
-export([attribute/2]).

attribute(File, Key) ->
	case beam_lib:chunks(File,[attribute]) of
		{ok, {_Module,[{attribute,L}]}} ->
			case lookup(Key,L) of
				{ok,Val} ->
					Val;
				error ->
					exit(badAttribute)
			end;
		_ ->
			exit(badFile)
	end.

lookup(Key,[{Key,Val}|_]) -> {ok, Val};
lookup(Key,[_|T]) -> lookup(Kye,T);
lookup(_,[]) -> error.