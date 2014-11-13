(**
  A functionnal priorityQueue implemented with a binomial heap.
  @author Barthelemy Delemotte
*)

(** The priority queue type. *)
type 'a t

(** [create compare_fun] returns a new empty priority queue.
    The function [compare_fun] is used to determine how to sort elements in
    the queue. ([compare_fun] [a] [b] < 0 means [a] have priority on [b]). *)
val create : ('a -> 'a -> int) -> 'a t

(** [is_empty q] returns true if [q] is empty. *)
val is_empty : 'a t -> bool

(** [length q] returns the number of elements in [q]. *)
val length : 'a t -> int

(** [top q] returns the minimum element contained in [q] according to the
    comparison function [compare_fun] (given during construction).
    @raise Failure when [q] is empty. *)
val top : 'a t -> 'a

(** [push q elt] adds the element [elt] to [q]. *)
val push : 'a t -> 'a -> 'a t

(** [pop q] removes the minimum element of [q].
    @raise Failure when [q] is empty. *)
val pop : 'a t -> 'a t

(** [from_list compare_fun l] creates a new priority queue with elements of [l]. *)
val from_list : ('a -> 'a -> int) -> 'a list -> 'a t

(** [to_list q] returns a sorted list composed by elements of [q]. *)
val to_list : 'a t -> 'a list 

(** [merge q1 q2] creates a new priority queue by merging [q1] and [q2].
    The function [compare_fun] of q1 q2 should be the same. But this could not
    be verified. If they are not, the result is unspecified. *)
val merge : 'a t -> 'a t -> 'a t
