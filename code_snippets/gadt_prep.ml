type _ expr =
    F   : float -> float expr
  | B   : bool -> bool expr
  | Add : float expr * float expr -> float expr;;
Add(F 0.5, B true) (* correctly doesn't type check *)
