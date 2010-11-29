%%-*- mode: erlang -*-
{application, sendsms,
 [
  {description, "sendsms"},
  {vsn, "1"},
  {modules, [
             sendsms,
             sendsms_app,
             sendsms_sup,
             sendsms_resource
            ]},
  {registered, []},
  {applications, [
                  kernel,
                  stdlib,
                  crypto,
                  mochiweb,
                  webmachine
                 ]},
  {mod, { sendsms_app, []}},
  {env, []}
 ]}.
