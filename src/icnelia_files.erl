%
% ICNELIA : Helper for compile, clean and create run scripts for 
%           an erlang OTP application
%
% Copyright (C) 2012, Jorge Garrido <jorge.garrido@morelosoft.com>
%
% All rights reserved.
%
-module(icnelia_files).

-export([get_file_config/0, get_files/1, get_app_name/0,
	 get_run_script/0]).

-include("../include/icnelia.hrl").

% get config from icnelia.config file
get_file_config() ->
    case file:consult(?config_file) of
	% use a default configuration
	{error, enoent}    ->
	    [];
	% error to process file
	{error, FileError} ->
	    io:format("~s : ~s ~n", [?config_file, FileError]),
	    halt(2);
	% use the configuration given in icnelia.config
	{ok, Config}       ->
	    Config
    end.

% get files by wildcard
get_files(Wildcard) ->
    lists:filter(fun(X) -> filelib:is_file(X) end, filelib:wildcard(Wildcard)).

% get application name 
get_app_name() ->
    [ File ] = ?MODULE:get_files(?src_app_src),
    {ok, [{application, App, _}]} = file:consult(File),
    atom_to_list(App).

% get run script process to write on it
get_run_script() ->
    file:open(?run, [write]).
