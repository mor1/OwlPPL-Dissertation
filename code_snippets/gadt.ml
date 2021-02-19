type _ dist =
  | Return : 'a -> 'a dist
  | Bind : 'a dist * ('a -> 'b dist) -> 'b dist
  | Primitive : 'a primitive -> 'a dist
  | Independent : 'a dist * 'b dist -> ('a * 'b) dist
  | Conditional : ('a -> float) * 'a dist -> 'a dist
let return x = Return x
let bind d f = Bind (d, f) (* provides ( let* )  *)
let product d1 d2 = Independent (d1, d2) (* provides ( and* ) *)
