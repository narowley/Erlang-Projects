-module(fibseq). %Set mod
-export([start/1, fibcheck/2, fibseq/2]). %Functions to export
-import(lists,[reverse/1, last/1]). %Funcitons to import

fibseq(List3, Count) when Count /= 0 -> %Creates the fibonacci sequence. Checks to see that the repeat count is above 0
    RevList = lists:reverse(List3), %Reverses list so items to be added are at the front of the list
    LastTerm = lists:nth(1, RevList), %Last term is now in front
    SecLastTerm = lists:nth(2, RevList), %Second to last term is now second in list
    NewTerm = LastTerm + SecLastTerm, %Adds last two terms to add to sequence
    NewList = lists:append(List3, [NewTerm]), %Adds new term to sequence
    fibseq(NewList, Count - 1); %Repeats sequence
fibseq(List3, Count) when Count == 0 -> %Prints last term in list. Checks to see that the repeat count is 0
    io:fwrite("~w~n",[last(List3)]). %Because the sequence has been repeated to have the chosen term as the last item in list, printing the last term will have it be the nth term.

fibcheck(List2, Term2) -> %Checks if creating Fibonacci sequence is nescessary
    if
        Term2 == 1 -> %Checks if asking for first term
            io:fwrite("0\n"); %Prints first term
        Term2 == 2 -> %Checks to see if asking for second term
            io:fwrite("1\n"); %Prints second term
        true -> %Anything beyond second term requires the sequence to be built
            fibseq(List2, Term2 - 2) %Repeats 2 less than the term requested to find the nth term.
    end. %Ends if then statement


start(Term) -> %Main funciton
    List = [0,1], %Creats foundation list
    fibcheck(List, Term). %Runs to check if Fibonacci sequence needs to be ran