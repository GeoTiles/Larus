fof(conga_preserves_lta,axiom,![A,B,C,D,E,F,A1,B1,C1,D1,E1,F1]:((cong_angle(A,B,C,A1,B1,C1)&cong_angle(D,E,F,D1,E1,F1)&lt_angle(A,B,C,D,E,F))=>(lt_angle(A1,B1,C1,D1,E1,F1)))).
fof(not_and_lta,axiom,![A,B,C,D,E,F]:((nlt_angle(A,B,C,D,E,F)|nlt_angle(D,E,F,A,B,C))))).
fof(th_11_33,axiom,(![A1,B1,C1,A2,B2,C2,A3,B3,C3]:((le_angle(A1,B1,C1,A2,B2,C2)&le_angle(A2,B2,C2,A3,B3,C3))=>le_angle(A1,B1,C1,A3,B3,C3)))).
fof(th_11_6,axiom,(![A,B,C]:((A!=B&C!=B)=>cong_angle(A,B,C,A,B,C)))).
fof(goal, conjecture,![A,B,C,A1,B1,C1,A2,B2,C2]:((lt_angle(A,B,C,A1,B1,C1)&lt_angle(A1,B1,C1,A2,B2,C2))=>(lt_angle(A,B,C,A2,B2,C2)))).