(* SML: Tree Class Notes, 12/1/2017, Thomas R. Cameron *)


(*  Mutually recursive datatype for tree and forest *)
datatype 'a tree =
    Empty |
    Node of 'a*'a forest
and 'a forest =
    None |
    Tree of 'a tree*'a forest

(* Mutually recursive function for size of tree and forest  *)
val rec size_tree : 'a tree -> int =
    fn  Empty => 0
    |   Node (_, f) => 1+size_forest f
and size_forest : 'a forest -> int =
    fn  None => 0
    |   Tree (t,f') => size_tree t + size_forest f'

(*  Create Trees    *)
val x = Node (1,None)
val y = Node (2,Tree (x,None))
val z = Node (3,Tree (y,None))

(*  Create Forests  *)
val f = Tree (x,None)
val g = Tree (x,Tree (y,None))
val h = Tree (x,Tree (y,Tree (z,None)))
