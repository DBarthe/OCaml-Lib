(**
  Basic functions that ocaml should aready have (I think).

  @author Barthelemy Delemotte
*)

(** [range ?step start stop] returns a list containing an arithmetic
    progression of integer between [start] and [stop] with an increment
    of size [step]. *)
val range : ?step:int -> int -> int -> int list

(** [rev_range ?step start stop] is like range but is descendant *)
val rev_range : ?step:int -> int -> int -> int list

(** [a -- b] is equivalent to range with [~step:1] *)
val ( -- ) : int -> int -> int list

(** [f -| g] returns the composition f (g x) *)
val ( -| ) : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

(** [f -| x] returns [f x]. It's the infix fashion for application. *)
val ( ^$ ) : ('a -> 'b) -> 'a -> 'b