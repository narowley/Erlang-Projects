-module(roman). %Import Exports
-import(string,[concat/2]).
-export([romantranslate/1]).

mreturn(String, M) when M /= 0 -> %Loops for every 1000 in the number. Loops until M == 0
    mreturn(string:concat(String, "M"), M-1); %Adds an additional M for each M.
mreturn(String, M) when M == 0 ->
    String. %Returns string created when M reaches 0.


creturn(C) -> %Returns appropriate value based off hundereds place
    if
        C == 0 ->
            "";
        C == 1 ->
            "C";
        C == 2 ->
            "CC";
        C == 3 ->
            "CCC";
        C == 4 ->
            "CD";
        C == 5 ->
            "D";
        C == 6 ->
            "DC";
        C == 7 ->
            "DCC";
        C == 8 ->
            "DCCC";
        C == 9 ->
            "CM"
    end.

xreturn(X) -> %Returns appropriate value based off tens place
    if
        X == 0 ->
            "";
        X == 1 ->
            "X";
        X == 2 ->
            "XX";
        X == 3 ->
            "XXX";
        X == 4 ->
            "XL";
        X == 5 ->
            "L";
        X == 6 ->
            "LX";
        X == 7 ->
            "LXX";
        X == 8 ->
            "LXXX";
        X == 9 ->
            "XC"
    end.

ireturn(I) -> %Returns appropriate value based off ones place
    if
        I == 0 ->
            "";
        I == 1 ->
            "I";
        I == 2 ->
            "II";
        I == 3 ->
            "III";
        I == 4 ->
            "IV";
        I == 5 ->
            "V";
        I == 6 ->
            "VI";
        I == 7 ->
            "VII";
        I == 8 ->
            "VIII";
        I == 9 ->
            "IX"
    end.

romantranslate(Number) -> %Main translator. Returns roman numeral version of number presented
    MCount = Number div 1000, %Finds out how many thousands there are in the number
    MRemainder = Number rem 1000, %Returns all numbers after thousands place
    CCount = MRemainder div 100, %Finds out number of hundereds in number
    CRemainder = MRemainder rem 100, %Returns numbers after hundereds place
    XCount = CRemainder div 10, %Returns number of tens in number
    XRemainder = CRemainder rem 10, %Returns remainder ones
    MString = mreturn("", MCount), %Converts number of thousands to M's in roman numeral
    CString = creturn(CCount), %Returns appropriate value based off number of hundereds
    XString = xreturn(XCount), %Returns appropriate value based off number of tens
    IString = ireturn(XRemainder), %Returns appropriate value based off number of ones
    CompleteString = string:concat(string:concat(string:concat(MString,CString),XString),IString), %Returns combined string of all elements of numerals.
    io:fwrite("~p~n",[CompleteString]). %Prints roman numeral