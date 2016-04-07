-type kind() :: adverb | verb.

-record(predicate, {id :: binary(), subject :: binary(), action :: {kind(), binary()}, adjectives :: dict(), content :: [#predicate{}]}).
-record(state, {lastid=0, parser, runner, hanger, last_predicate}).

-define(LOGO, "Clexical Evaluator~n").
