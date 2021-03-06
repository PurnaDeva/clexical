-module(scribe).
-include("../include/clexical.hrl").

-callback init(Opts::any()) -> any().

-callback curb(Key :: binary(), P :: #predicate{}) -> ok|error.
-callback recall(Key :: binary()) -> #predicate{}|undefined.