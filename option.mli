(**
  Optional type

  @author Barthelemy Delemotte
*)

type 'a t = Some of 'a | None

val is_some : 'a t -> bool 

val is_none : 'a t -> bool

val expect : 'a t -> string -> 'a 

val unwrap : 'a t -> 'a

val unwrap_or : 'a t -> 'a -> 'a

val unwrap_or_else : 'a t -> (unit -> 'a) -> 'a

val map : 'a t -> ('a -> 'b) -> 'b t

val map_or : 'a t -> 'b -> ('a -> 'b) -> 'b 

val map_or_else : 'a t -> (unit -> 'b) -> ('a -> 'b) -> 'b
