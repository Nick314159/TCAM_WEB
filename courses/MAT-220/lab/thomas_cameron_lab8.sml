(* SML: Lab 8, Thomas R. Cameron, 12/4/2017 *)

(* Null type constructor and four null value constructors *)
datatype suit = Spades | Hearts | Diamonds | Clubs

val outranks : suit*suit -> bool =
    fn  (Spades,Spades) => false
    |   (Spades,_) => true
    |   (Hearts,Spades) => false
    |   (Hearts,Hearts) => false
    |   (Hearts,_) => true
    |   (Diamonds,Clubs) => true
    |   (Diamonds,_) => false
    |   (Clubs,_) => false

(* Parametrized datatype *)
datatype 'a option = NONE | SOME of 'a

val rec exp : int option*int -> int =
    fn  (NONE,n) => exp(SOME 2, n)
    |   (SOME b,0) => 1
    |   (SOME b,n) =>
        if n mod 2 = 0 then
            exp(SOME (b*b),n div 2)
        else
            b*exp(SOME b,n-1)

val divide : int*int -> int option =
    fn  (x,0) => NONE
    |   (x,y) => SOME (x div y)

(* Recurssive natural numbers *)
datatype nat = Zero | Succ of nat

val rec double : nat -> nat =
    fn  Zero => Zero
    |   Succ n => Succ (Succ (double n))

(* Binary tree *)
datatype 'a tree = 
    Empty |
    Node of 'a tree*'a*'a tree

val rht = Node(Empty,5,Node(Node(Empty,4,Empty),9,Empty))
val lft = Node(Node(Empty,2,Empty),7,Node(Node(Empty,5,Empty),6,Node(Empty,11,Empty)))
val tree = Node(lft,2,rht)

val rec height : 'a tree -> int =
    fn  Empty => 0
    |   Node(Empty,_,Empty) => 0
    |   Node(lft,_,rht) => 1+Int.max(height lft,height rht)

val rec size : 'a tree -> int =
    fn  Empty => 0
    |   Node(lft,_,rht) => 1+size lft + size rht   

(* Traversals *)
val rec preOrder : 'a tree*'a list -> 'a list =
    fn  (Empty,l) => l
    |   (Node(lft,n,rht),l) => n::preOrder(lft,preOrder(rht,l))

val rec inOrder : 'a tree*'a list -> 'a list =
    fn  (Empty,l) => l
    |   (Node(lft,n,rht),l) => inOrder(lft,n::inOrder(rht,l))

val rec postOrder : 'a tree*'a list -> 'a list =
    fn  (Empty,l) => l
    |   (Node(lft,n,rht),l) => postOrder(lft,l)@postOrder(rht,l)@[n]

(* Second binary tree *)
val rht2 = Node(Empty,4,Node(Node(Empty,3,Empty),11,Empty))
val lft2 = Node(Node(Empty,9,Empty),5,Node(Node(Empty,1,Empty),7,Node(Node(Empty,2,Empty),12,Empty)))
val tree2 = Node(lft2,8,rht2)


(* Binary Search Tree *)
local
    val rec divide : int*int list -> int list*int list =
        fn  (_,nil) => (nil,nil)
        |   (x,h::t) => 
            let
                val (low,high) = divide(x,t)
            in 
                if x<h then
                    (low,h::high)
                else
                    (h::low,high)
            end
in
    val rec mkBST : int list -> int tree =
        fn  nil => Empty
        |   (h::t) => 
            let
                val (x,y) = divide(h,t)
            in
                Node(mkBST x,h,mkBST y)
            end
end

val rec search : int tree*int -> bool =
    fn  (Empty,t) => false
    |   (Node(lft,n,rht),t) => 
        if t<n then search(lft,t)
        else if n<t then search(rht,t)
        else true
