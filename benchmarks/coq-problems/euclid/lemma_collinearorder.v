From Test Require Import tactic.

Section FOFProblem.

Variable Universe : Set.
Variable UniverseElement : Universe.

Variable col_ : Universe -> Universe -> Universe -> Prop.


Variable lemma_collinear2_1 : (forall A B C : Universe, (col_ A B C -> col_ B C A)).
Variable lemma_collinear1_2 : (forall A B C : Universe, (col_ A B C -> col_ B A C)).

Theorem lemma_collinearorder_3 : (forall A B C : Universe, (col_ A B C -> (col_ B A C /\ (col_ B C A /\ (col_ C A B /\ (col_ A C B /\ col_ C B A)))))).
Proof.
  time tac.
Qed.

End FOFProblem.
