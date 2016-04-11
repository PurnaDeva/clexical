-module(xml_parser_test).

-compile([export_all]).

-include("../include/clexical_test.hrl").

setup_test_() ->
    exmpp:start(),
    ?start_lager(),
    {setup,
        spawn,
        fun init_per_suite/0,
        fun end_per_suite/1,
        [        
        ]
    }.

init_per_suite() ->
    random:seed(erlang:now()),    
    ok.

end_per_suite(_Config) ->
    meck:unload(),
    ok.

basic_parse_test_() ->
    Bin = <<"<offer id='1' subject='bestbuy' good='case'><onPurchase><celebrate/></onPurchase></offer>">>,
    [P] = xml_parser:predicates_from_binary(Bin),
    ?_assert(P /= undefined),
    K = xml_parser:excerpt_from_predicate(P),
    ?_assert(P /= undefined).
