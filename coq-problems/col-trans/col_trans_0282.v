From Test Require Import tactic.

Section FOFProblem.

Variable Universe : Set.
Variable UniverseElement : Universe.

Variable wd_ : Universe -> Universe -> Prop.
Variable col_ : Universe -> Universe -> Universe -> Prop.


Variable col_swap1_1 : (forall A B C : Universe, (col_ A B C -> col_ B A C)).
Variable col_swap2_2 : (forall A B C : Universe, (col_ A B C -> col_ B C A)).
Variable col_triv_3 : (forall A B : Universe, col_ A B B).
Variable wd_swap_4 : (forall A B : Universe, (wd_ A B -> wd_ B A)).
Variable col_trans_5 : (forall P Q A B C : Universe, ((wd_ P Q /\ (col_ P Q A /\ (col_ P Q B /\ col_ P Q C))) -> col_ A B C)).

Theorem pipo_6 : (forall A B C T P0 X Y : Universe, ((wd_ A B /\ (wd_ C B /\ (wd_ T B /\ (wd_ A C /\ (wd_ P0 B /\ (wd_ P0 A /\ (wd_ Y B /\ (wd_ X B /\ (wd_ X Y /\ (wd_ T X /\ (wd_ T Y /\ (wd_ A Y /\ (col_ X T Y /\ (col_ B C T /\ (col_ B C X /\ (col_ B C Y /\ col_ B A X)))))))))))))))) -> col_ A B C)).
Proof.
  time tac.
Qed.

End FOFProblem.
