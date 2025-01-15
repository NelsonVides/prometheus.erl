%%%-------------------------------------------------------------------
%% @doc prometheus public API
%% @hidden
%%%-------------------------------------------------------------------

-module(prometheus).

-behaviour(application).

-export([start/2, stop/1]).
-export([start/0, stop/0]).
-define(APP, ?MODULE).

-spec start(application:start_type(), term()) -> supervisor:startlink_ret().
start(_StartType, _StartArgs) ->
    prometheus_sup:start_link().

-spec stop(term()) -> ok.
stop(_State) ->
    ok.

-spec start() -> ok | {error, term()}.
start() ->
    application:start(?APP).

-spec stop() -> ok | {error, term()}.
stop() ->
    application:stop(?APP).
