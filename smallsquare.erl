-module(smallsquare). %Set's module name
-export([smallsquare/2, start/2]). %Sets functions to export
-import(lists,[min/1]). %Imports functions to use

smallsquare(List, Count) when Count /= 0 -> %Creates the function to square the smallest term. Only works when count is above 0
    Small = lists:min(List), %Find min in list
    SmallSQ = Small * Small, %Squares smallest term
    List1 = lists:delete(Small, List), %Removes smallest term
    List2 = lists:append([SmallSQ], List1), %Adds smallest term squared to list
    smallsquare(List2, Count - 1); %Repeats funciton with one less count
smallsquare(List, Count) when Count == 0 -> %Creates the function to square the smallest term. Only works when count is 0
    io:fwrite("~p~n",[lists:sum(List)]). %Sums all terms in list and prints
    
start(N,M) -> %Main function
    List = lists:seq(2, N), %Creates list that starts with two
    smallsquare(List, M). %Calls smallsquare function