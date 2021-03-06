From Test Require Import tactic.

Section FOFProblem.

Variable Universe : Set.
Variable UniverseElement : Universe.

Variable t_IMP_008_ : Universe -> Prop.
Variable t_EXISTS_004_ : Prop.
Variable t_AND_006_ : Universe -> Prop.
Variable tNOTD1_ : Universe -> Prop.
Variable tNEG_PSI0_ : Prop.
Variable tGOAL0_ : Prop.
Variable tD1_ : Universe -> Prop.
Variable goal_ : Prop.
Variable f_AND_009_ : Universe -> Prop.
Variable fNOTD1_ : Universe -> Prop.
Variable fNEG_PSI0_ : Prop.
Variable fGOAL0_ : Prop.
Variable fD1_ : Universe -> Prop.
Variable dom_ : Universe -> Prop.

Variable a_ : Universe.

Variable initial_model_1 : (dom_ a_ /\ fGOAL0_).
Variable bot01_2 : ((tNEG_PSI0_ /\ fNEG_PSI0_) -> goal_).
Variable bot02_3 : ((tGOAL0_ /\ fGOAL0_) -> goal_).
Variable bot03_4 : (forall V1 : Universe, ((tNOTD1_ V1 /\ fNOTD1_ V1) -> goal_)).
Variable bot04_5 : (forall V1 : Universe, ((tD1_ V1 /\ fD1_ V1) -> goal_)).
Variable ax005_6 : (forall A : Universe, (dom_ A -> t_AND_006_ A)).
Variable ax006_7 : (forall A : Universe, (t_AND_006_ A -> (tD1_ A /\ tNEG_PSI0_))).
Variable ax007_8 : (forall A : Universe, (dom_ A -> t_IMP_008_ A)).
Variable ax008_9 : (forall A : Universe, (t_IMP_008_ A -> (f_AND_009_ A \/ tGOAL0_))).
Variable ax009_10 : (forall A : Universe, (f_AND_009_ A -> (fD1_ A \/ fNOTD1_ A))).
Variable ax003_11 : (True -> (fNEG_PSI0_ \/ t_EXISTS_004_)).
Variable ax004_12 : (t_EXISTS_004_ -> (exists A : Universe, (dom_ A /\ tNOTD1_ A))).

Theorem d_andrew_13 : goal_.
Proof.
  time tac.
Qed.

End FOFProblem.
