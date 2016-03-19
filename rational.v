Inductive sign : Type :=
  | pos : sign
  | neg : sign.

Record rational : Type :=
  { direction   : sign
  ; numerator   : nat
  ; denominator : nat (* The /predecesor/ of the denominator, to avoid division by zero *)
  }.

Definition reduce_rational (x:rational) : rational :=
  match x with
  | {| direction   := s
     ; numerator   := n
     ; denominator := d
     |} => let    gcf := Nat.gcd n d
           in let n'  := Nat.div n gcf
           in let d'  := Nat.pred (Nat.div (S d) gcf)
           in {| direction   := s
               ; numerator   := n'
               ; denominator := d'
               |}
  end.

(* Equality via simplification of factors *)
Definition eq_rational (x y : rational) : Prop :=
  match x,y with
  | {| numerator   := 0
     ; denominator := 0
     |}
  , {| numerator   := 0
     ; denominator := 0
     |} => True (* if both numbers are 0/1 *)
  | _,_ => match reduce_rational x, reduce_rational y with
           | {| direction   := s1
              ; numerator   := n1
              ; denominator := d1
              |}
           , {| direction   := s2
              ; numerator   := n2
              ; denominator := d2
              |} => n1 = n2 /\ d1 = d2 /\ s1 = s2
           end
  end.