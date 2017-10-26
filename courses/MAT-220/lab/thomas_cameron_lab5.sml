(* Thomas R. Cameron, Lab 5, 10/20/2017*)

(* Problem 1: Fibonacci 1 
    Let T(n) denote the cost of the size n problem, then
    T(n)=T(n-1)+T(n-2). We know that the solution to this
    recurssive equation is of the form:
    T(n)=c_{1}r_{1}^{n}+c_{2}r_{2}^{n}, where r_{1},r_{2}=(1+-sqrt{5})/2.
    It follows that the cost of this method is O(r_{1}^{n}). Therefore,
    the cost of this method grows exponentially with the size n. *)
val rec fib1 : int->int =
    fn  0 => 1
    |   1 => 1
    |   n:int => fib1(n-1)+fib1(n-2)

(* Problem 2: Fibonacci 2
    In this method, all the cost is tied up in the helper function,
    which is storing both the nth and (n-1)st Fibonacci number. Therefore,
    rather than a 2-term recurrence relation, we have a 1-term recurrence relation
    that is being implemented using tail-recurssion.
 
    Let T(n) denote the cost of the size n problem, then
    T(n)=T(n-1)+c, where c is the cost of addition. Therefore,
    T(n)=c0 + cn, where c0 is the cost of the base case. It follows that
    the cost of this method is O(n). Therefore,  this method is far 
    more efficient than fib2. *)
local
    val rec helper : int->int*int =
    fn  0 => (1,0)
    |   1 => (1,1)
    |   n:int =>
        let
            val (a:int,b:int) = helper(n-1)
        in
            (a+b,a)
        end
in
    val fib2 : int->int =
    fn n:int =>
        let
            val (a:int,_) = helper(n)
        in
            a
        end
end

(* Problem 3: Horner's Method 
    The cost of this method is tied up in the helper function,
    which is a 1-term tail recurrence relation. Let T(n) denote the cost
    of the size n problem. Then
    T(n)=T(n-1)+a+m, where a and m are the cost of addition and multiplication,
    respectively. Therefore,
    T(n)=c0 + na + nm, where c0 is the cost of the base case. It follows that
    the cost of this method is O(n), and there are exactly n additions and n
    multiplications performed. *)

local
    val rec helper : real list*real*real*int->real =
        fn  (x:real list,t:real,r:real,0) => r
        |   (x:real list,t:real,r:real,n:int) => helper(x,t,r*t+List.nth(x,n-1),n-1)
in
    val horner : real list*real->real =
        fn (x:real list,t:real) =>
        let
            val n:int = List.length(x)
        in
            helper(x,t,List.nth(x,n-1),n-1)
        end
end

val x:real list = [1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0]
val test = horner(x,1.0)
val test = horner(x,~1.0)
