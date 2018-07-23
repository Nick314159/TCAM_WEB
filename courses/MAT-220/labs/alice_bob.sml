(* Alice and Bob, Thomas R. Cameron, 10/20/2017 *)

local
    (* Coin Toss: head=1, tail=0 *)
    val toss : int list*int*Random.rand->int list =
    fn  (x:int list,0,s:Random.rand) => [Random.randInt s mod 2,Random.randInt s mod 2]
    |   (x:int list,n:int,s:Random.rand) => List.concat[List.drop(x,1),[Random.randInt s mod 2]]
    (* Check for Alice: (head,tail) *)
    val checkA : int list->bool =
    fn  (x:int list) => if (x=[1,0]) then true else false
    (* Check for Bob: (head,head) *)
    val checkB : int list->bool =
    fn  (x:int list) => if (x=[1,1]) then true else false
    (* Alice's coin tosses *)
    val rec helperA : int list*int*Random.rand*bool->int =
    fn  (x:int list,m:int,s:Random.rand,true) => m
    |   (x:int list,m:int,s:Random.rand,false) => 
        let
            val x:int list = toss(x,m,s)
            val b:bool = checkA(x)
        in
            helperA(x,m+1,s,b)
        end
    (* Bob's coin tosses *)
    val rec helperB : int list*int*Random.rand*bool->int =
    fn  (x:int list,m:int,s:Random.rand,true) => m
    |   (x:int list,m:int,s:Random.rand,false) => 
        let
            val x:int list = toss(x,m,s)
            val b:bool = checkB(x)
        in
            helperB(x,m+1,s,b)
        end
in
    (* One trial of Alice and Bob flipping coins *)
    val trial : Random.rand->int*int =
    fn s:Random.rand =>
        let
            (* initialize toss *)
            val x:int list = toss([],0,s)
            val y:int list = toss([],0,s)
        in
            (helperA(x,2,s,checkA(x)),helperB(y,2,s,checkB(y)))
        end
end

(* Test a number of trials *)
local
    (* Sum of two trials *)
    val sum : (int*int)*(int*int)->int*int = 
        fn ((x1:int,x2:int),(y1:int,y2:int)) => (x1+y1,x2+y2)
    (* Recurssively run it trials *)
    val rec helper : int*(int*int)*Random.rand->int*int =
        fn (0,(m:int,n:int),s:Random.rand) => (m,n)
        |   (it:int,(m:int,n:int),s:Random.rand) => helper(it-1,sum((m,n),trial(s)),s)
in
    val test : int->int*int =
        fn (it:int) =>
            let
                (* seed random generator state based on current time *)
                val s = Random.rand(IntInf.toInt(Time.toNanoseconds(Time.now()) mod Int.toLarge(valOf(Int.maxInt))),0)
                (* run trials based on that seed s and iteration number it *)
                val (m:int,n:int) = helper(it,(0,0),s)
            in
                (* return m/it and n/it *)
                (m div it, n div it)
            end
end
