(**
  A functionnal priorityQueue implemented with a binomial heap.
  @author Barthelemy Delemotte
*)

open Option

type 'a t = {
  bh: 'a BinomialHeap.t ;
  compare: 'a -> 'a -> int ;
  length: int ;
  min: 'a Option.t ; (* the mininum is cached
    for O(1) access time to the top *)
}

let min compare_fun x1 x2 =
  if compare_fun x1 x2 <= 0 then x1 else x2

let create compare_fun = 
  let bh = BinomialHeap.empty compare_fun in
  { bh = bh; compare = compare_fun; length = 0; min = None }

let is_empty pq =
  pq.length = 0

let length pq =
  pq.length

let top pq =
  if is_empty pq then
    failwith "PriorityQueue.top"
  else
    match pq.min with
    | Some elt -> elt
    | None -> BinomialHeap.find_min pq.bh

let push pq elt =
  let bh = BinomialHeap.insert elt pq.bh
  and length = pq.length + 1
  and min = match pq.min with
  | Some elt' -> Some (min pq.compare elt elt')
  | None -> Some elt in
  { bh = bh; compare = pq.compare; length = length; min = min }

let pop pq =
  if is_empty pq then
    failwith "PriorityQueue.pop"
  else
    let bh = BinomialHeap.delete_min pq.bh
    and length = pq.length - 1 in
    let min = if length = 0 then None else Some (BinomialHeap.find_min bh) in
    { bh = bh; compare = pq.compare; length = length; min = min }

let from_list compare_fun l =
  let rec loop bh = function
  | [] -> bh
  | x::xs -> loop (BinomialHeap.insert x bh) xs in
  let bh = loop (BinomialHeap.empty compare_fun) l
  and length =  List.length l in
  let min = if length = 0 then None else Some (BinomialHeap.find_min bh) in
  { bh = bh; compare = compare_fun; length = length; min = min }

let to_list pq =
  let rec loop accu pq =
    if is_empty pq then List.rev accu else
      loop (top pq :: accu) (pop pq) in
    loop [] pq

let merge pq1 pq2 =
  let bh = BinomialHeap.merge pq1.bh pq2.bh
  and length = length pq1 + length pq2
  and min = match pq1.min, pq2.min with
  | Some x1, Some x2 -> Some (min pq1.compare x1 x2)
  | ((Some _) as min), None | None, ((Some _) as min) -> min
  | None, None -> None in
  { bh = bh; compare = pq1.compare; length = length; min = min}

