%
% ICNELIA : Helper for compile, clean and create run scripts for 
%           an erlang OTP application
%
% Copyright (C) 2012-2013, Jorge Garrido <zgbjgg@gmail.com> All rights reserved.
%
% This Source Code Form is subject to the terms of the Mozilla Public
% License, v. 2.0. If a copy of the MPL was not distributed with this
% file, You can obtain one at http://mozilla.org/MPL/2.0/.
%

% include dir
-define(include_dir, "include/").

% source dir
-define(source_dir, "src/").

% ebin (compiled) dir
-define(ebin_dir, "ebin/").

% wildcard for .erl on source dir
-define(src_erl, "src/*.erl").

% wildcard for .beam on ebin dir
-define(ebin_beam, "ebin/*.beam").

% wildcard for .app on ebin dir
-define(src_app_ebin, "ebin/*.app").

% wildcard for .app.src on src dir
-define(src_app_src, "src/*.app.src").

% message when compiling
-define(msg_c, "compiling ~s ~n").

% message when cleaning
-define(msg_d, "cleaning ~s ~n").

% config file (must be called 'icnelia.config').
-define(config_file, "icnelia.config").

% name for runner script
-define(run, case os:type() of {unix, _} -> "run"; {win32, _} -> "run.bat" end).

% u+x
-define(u_x, "u+x").

% runner option
-define(runner(Paths, App), case os:type() of 
			        {unix, _} -> 
				    "erl -pa ebin/ " ++ Paths ++ " -eval 'application:start(" ++ App ++ ").'";
				{win32, _} ->
				    "erl -pa ebin/ " ++ Paths ++ " -eval \"application:start(" ++ App ++ ").\""
			     end).

% runner d option
-define(runner_d(Paths, App, Pipes, Logs), "run_erl -daemon " ++ Pipes ++ " " ++ Logs ++ " \"exec erl -pa ebin/ " ++ Paths ++ " -eval 'application:start(" ++ App ++ ").'\"").
