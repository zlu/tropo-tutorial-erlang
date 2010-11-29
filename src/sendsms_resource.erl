%% @author zhao lu <zlu@me.com>

-module(sendsms_resource).
-export([init/1,
	 allowed_methods/2,
         content_types_provided/2,
         to_json/2]).

-include_lib("webmachine/include/webmachine.hrl").

init(_) -> {ok, undefined}.

allowed_methods(RD, Ctx) ->
    {['GET', 'HEAD', 'POST'], RD, Ctx}.

content_types_provided(RD, Ctx) ->
    {[{"application/json", to_json}], RD, Ctx}.

to_json(RD, Ctx) ->
    send(RD, Ctx).

json_body(QS) -> mochijson:encode({struct, QS}).

send(RD, Ctx) ->
    JsonData = wrq:req_qs(RD),
    To = proplists:get_value("to", JsonData),
    Msg = proplists:get_value("msg", JsonData),
    Url = "http://api.tropo.com/1.0/sessions?action=create&to=" ++ To ++ "&msg=" ++ Msg ++ "&token=1aba4b151514ae4caaf8340879b3e456893a5f5f7d13be43d5df9546c147090c4773a68016b0dae4da7d66bc",
    inets:start(),
    httpc:request(get, {Url, []},[],[]),
    {json_body(wrq:req_qs(RD)), RD, Ctx}.
