(**
  Functional implementation of a binomial heap

  @author Barthelemy Delemotte
*)

(**
  The type of a binomial min-heap.
*)
type 'a t

(**
  [create compare_fun elt] returns a new heap of one element [elt].
  The [compare_fun] function is used for the internal order of the heap.
*)
val create : ('a -> 'a -> int) -> 'a -> 'a t

(**
  [empty compare_fun] returns a new empty heap.
*)
val empty : ('a -> 'a -> int) -> 'a t

(**
  This function returns true if the heap is empty.
*)
val is_empty : 'a t -> bool

(**
  [merge h1 h2] returns a new heap obtained by merging two heap [h1] and [h2].
*)
val merge : 'a t -> 'a t -> 'a t

(**
  [insert elt h] inserts an element [elt] in the heap [h], and returns the new heap.
*)
val insert : 'a -> 'a t -> 'a t

(**
  [find_min h] returns the minimum element of the heap [h].  
*)
val find_min : 'a t -> 'a

(**
  [delete_min h] returns a heap in which the minimum element has been deleted.
*)
val delete_min : 'a t -> 'a t 