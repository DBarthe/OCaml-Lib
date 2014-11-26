(**
  List extension.

  @author barthelemy delemotte
*)

let zip xs ys =
  let rec aux accu = function
  | [], _ | _, [] -> List.rev accu
  | x::xs, y::ys -> aux ((x,y)::accu) (xs,ys) in
  aux [] (xs, ys)

let take n xs =
  let rec aux accu = function
  | [], _ | _, 0 -> List.rev accu
  | x::xs, n -> aux (x::accu) (xs, n-1) in
  aux [] (xs, n)

let take_while f xs =
  let rec aux accu = function
  | x::xs when f x -> aux (x::accu) xs
  | _ -> List.rev accu in
  aux [] xs

let rec drop n = function
| x::xs when n > 0 -> drop (n-1) xs
| xs -> xs

let rec drop_while f = function
| x::xs when f x -> drop_while f xs
| xs -> xs

let init length f = 
  let rec aux accu i =
    if i = length then List.rev accu else
    aux (f i ::accu) (i+1) in
  aux [] 0

let flatten_opti l = 
  let rec aux accu = function
  | [] -> List.rev accu
  | xs::xss -> aux (List.rev_append xs accu) xss
  in aux [] l 
