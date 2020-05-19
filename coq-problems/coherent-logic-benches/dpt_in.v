From Test Require Import tactic.

Section FOFProblem.

Variable Universe : Set.
Variable UniverseElement : Universe.

Variable rt_ : Universe -> Universe -> Prop.
Variable r_ : Universe -> Universe -> Prop.
Variable goal_ : Prop.
Variable dom_ : Universe -> Prop.

Variable c_ : Universe.
Variable b_ : Universe.
Variable a_ : Universe.

Variable initial_model_1 : (dom_ a_ /\ (dom_ b_ /\ (dom_ c_ /\ (rt_ a_ b_ /\ rt_ a_ c_)))).
Variable goal_ax_2 : (forall X : Universe, ((dom_ X /\ (rt_ b_ X /\ rt_ c_ X)) -> goal_)).
Variable r_in_rt_3 : (forall X Y : Universe, (r_ X Y -> rt_ X Y)).
Variable trans_rt_4 : (forall X Y Z : Universe, ((rt_ X Y /\ rt_ Y Z) -> rt_ X Z)).
Variable r_or_rr_5 : (forall X Y : Universe, (rt_ X Y -> (exists U : Universe, (r_ X Y \/ (dom_ U /\ (rt_ X U /\ rt_ U Y)))))).
Variable cdp_6 : (forall X Y Z : Universe, ((rt_ X Y /\ r_ X Z) -> (exists U : Universe, (dom_ U /\ (r_ Y U /\ rt_ Z U))))).
Variable ih_cdp1_7 : (forall X Y : Universe, ((rt_ a_ X /\ (rt_ X b_ /\ rt_ a_ Y)) -> (exists U : Universe, (dom_ U /\ (rt_ X U /\ rt_ Y U))))).
Variable ih_cdp2_8 : (forall X Y : Universe, ((rt_ a_ X /\ (rt_ X b_ /\ rt_ X Y)) -> (exists U : Universe, (dom_ U /\ (rt_ b_ U /\ rt_ Y U))))).

Theorem dpt_9 : goal_.
Proof.
  time tac.
Qed.

End FOFProblem.
