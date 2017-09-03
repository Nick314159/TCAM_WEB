(*Thomas R. Cameron, Lab 1, 8/27/2017*)

(*Problem 1, Function Greeting*)
fun greeting (x:string):string = "Hello "^x^"\n";

print (greeting "Thomas R. Cameron");

(*Problem 2, Function NAND*)
fun nand (x:bool,y:bool):bool = not(x andalso y);

(*Problem 3, Function Min*)
fun min (x:int,y:int,z:int):int =
	if (x<=y andalso x<=z) then x else (if y<=z then y else z);

(*Problem 4, Function Express*)
fun express (x:bool,y:bool):bool =
	(not(x) orelse y)orelse(not(x) orelse not(y));

express(true,true);
express(true,false);
express(false,true);
express(false,false);

print "The expression in Problem 13 of the Chapter 1 Self Test is a tautology, since the result is true for every possible combination of boolean variables x and y.\n";
