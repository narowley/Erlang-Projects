-module(facdiv). %Import Exports
-export([start/1, facdiv/2, factorial/1]).

factorial(0) -> 
    1; %Creates factorial case when factorial is 0.
factorial(N) when N > 0 -> %Creates factorial by calling factorial function for previous number.
	N * factorial(N-1).

facdiv(N, Count) -> %Finds the smallest factorial that is divisable by N.
    Fact = factorial(Count), %Creates factorial
    Test = Fact rem N, %Finds remainder of the division of our factorial and divisor
    if
        Test == 0 -> %If no remainder, N is a divisor and the factorial is printed
            io:fwrite("~w~n",[Count]);
        true -> %If N is not a divisor, the function is repeated
            facdiv(N, Count + 1)
    end.

start(Div) -> %Main funciton to call facdiv.
    facdiv(Div, 1).