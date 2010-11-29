%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the sendsms application.

-module(sendsms_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for sendsms.
start(_Type, _StartArgs) ->
    sendsms_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for sendsms.
stop(_State) ->
    ok.
