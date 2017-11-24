(* SML Lab 7, Thomas R. Cameron, Novemeber 17, 2017 *)

(* Problem 1.
    Append:
    Let n denote the length of the first list and T(n) denote
    the running time. Then T(0)=a0 and T(n)=T(n-1)+c. Therefore,
    T(n)=c*n+a0, and in big O notation: T(n)=O(n). 
    Rev1:
    Let n denote the length of the list and T(n) denote
    the running time. Then T(0)=a0 and T(n)=T(n-1)+c(n-1). Therefore,
    T(c)=cn(n-1)+a0, and in big O notation: T(n)=O(n^2).    *)

(* Problem 2.
    Helper
    Let n denote the length of the first list and T(n) denote
    the running time. Then T(0)=a0 and T(n)=T(n-1)+c. Therefore,
    T(n)=c*n+a0, and in big O notation: T(n)=O(n). It follows that
    rev2 is O(n) times faster than rev1.    *)

(* Problem 3. *)
(* Merge Sort Functions *)
val rec merge : ('a*'a->bool)*'a list*'a list -> 'a list =
    fn  (less,nil,m) => m
    |   (less,l,nil) => l 
    |   (less,l as x::xs,m as y::ys) =>
        if less(x,y) then x::merge(less,xs,m) else y::merge(less,l,ys)

val split : 'a list -> 'a list*'a list =
    fn l =>
        let
            val n = (List.length(l)) div 2
        in
            (List.take(l,n),List.drop(l,n))
        end

val rec merge_sort : ('a*'a->bool)*'a list -> 'a list =
    fn  (less,nil) => nil
    |   (less,h::nil) => [h]
    |   (less,l) =>
        let
            val (a,b) = split l
        in
            merge(less,merge_sort(less,a),merge_sort(less,b))
        end
(* Lists of different types *)
val l1 = [1,3,2,5,4,7,6]
val l1 = merge_sort(fn (x,y) => x<y,l1)
val l2 = [1.0,3.0,5.0,4.0,2.0,8.0,7.0,6.0]
val l2 = merge_sort(fn (x,y) => x<y,l2)
val l3 = [#"c",#"a",#"b",#"e",#"d",#"f",#"i",#"g",#"h"]
val l3 = merge_sort(fn (x,y) => x<y,l3)
val l4 = ["to","be","or","not","to","be","that","is","the","question"]
val l4 = merge_sort(fn (x,y) => x<y,l4)

(* Problem 4. *)
(* Binary Search Function *)
local
    val rec helper : int*int*('a*'a->bool)*('a*'a->bool)*'a*'a list -> int =
    fn  (s,e,less,great,t,nil) => ~1  
    |   (s,e,less,great,t,l) =>
        let
            val m = (s+e) div 2
            val n = (List.length(l)-1) div 2
            val v = List.nth(l,n)
        in
            if less(t,v) then helper(s,m-1,less,great,t,List.take(l,n))
            else if great(t,v) then helper(m+1,e,less,great,t,List.drop(l,n+1))
            else m
        end
in
    val binary_search : ('a*'a->bool)*('a*'a->bool)*'a*'a list -> int =
    fn (less,great,t,l) => helper(0,List.length(l)-1,less,great,t,l)
end
(* Search through lists of different types *)
val s1 = binary_search(fn (x,y) => x<y,fn (x,y) => x>y,5,l1)
val s2 = binary_search(fn (x,y) => x<y,fn (x,y) => x>y,6.0,l2)
val s3 = binary_search(fn (x,y) => x<y,fn (x,y) => x>y,#"t",l3)
val s4 = binary_search(fn (x,y) => x<y,fn (x,y) => x>y,"to",l4)
