(**
  Optional type

  @author Barthelemy Delemotte
*)

type 'a t = Some of 'a | None

let is_some o =
  match o with
  | Some _ -> true
  | _ -> false

let is_none o =
  not (is_some o)

let expect o msg =
  match o with
  | Some x -> x
  | _ -> failwith msg

let unwrap o =
  expect o "Option.unwrap"

let unwrap_or o def =
  match o with
  | Some x -> x
  | _ -> def

let unwrap_or_else o f =
  match o with
  | Some x -> x
  | _ -> f ()

let map o f =
  match o with
  | Some x -> Some(f x)
  | _ -> None

let map_or o def f =
  match o with
  | Some x -> f x
  | _ -> def

let map_or_else o def_f map_f =
  match o with
  | Some x -> map_f x
  | _ -> def_f ()
