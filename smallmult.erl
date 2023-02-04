-module(smallmult). %Import Exports
-export([test/3, start/1]).

test(Divisor, Number, End) when Divisor /= End -> %Creates function that will find the smallest number that is divisable by all numbers from one to End.
    if
        Number rem Divisor == 0 -> %Checks if number is evenly divisable. If it is, the function repeats for next divisor
            test(Divisor + 1, Number, End);
        true ->  %If number isn't divisable by divisor, divisor is reset to 1 and next number is tested
            test(1, Number + 1, End)
    end;
test(Divisor, Number, End) when Divisor == End -> %If divisor is equal to End, the number that is divisable by all numbers in sequence is printed 
    io:fwrite("~w~n",[Number]).

start(Div) -> %Main funciton
    test(1,1,Div).