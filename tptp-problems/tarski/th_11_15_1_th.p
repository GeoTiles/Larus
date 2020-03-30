fof(not_out_bet,axiom,![A,B,C]:((col(A,B,C)&nout(B,A,C))=>(bet(A,B,C)))).
fof(ex_per_cong,axiom,![A,B,C,D,X,Y]:((A!=B&X!=Y&col(A,B,C)&ncol(A,B,D))=>(?[P]:((per(P,C,A)&cong(P,C,X,Y)&one_side(P,D,A,B)))))).
fof(segment_construction_3,axiom,![A,B,X,Y]:((A!=B&X!=Y)=>(?[C]:((out(A,B,C)&cong(A,C,X,Y)))))).
fof(invert_one_side,axiom,![A,B,P,Q]:((one_side(P,Q,A,B))=>(one_side(P,Q,B,A)))).
fof(col_one_side,axiom,![A,B,C,P,Q]:((col(A,B,C)&A!=C&one_side(P,Q,A,B))=>(one_side(P,Q,A,C)))).
fof(th_11_16,axiom,(![A,B,C,A1,B1,C1]:((per(A,B,C)&A!=B&C!=B&per(A1,B1,C1)&A1!=B1&C1!=B1)=>cong_angle(A,B,C,A1,B1,C1)))).
fof(th_11_13,axiom,(![A,B,C,D,E,F,A1,D1]:((cong_angle(A,B,C,D,E,F)&bet(A,B,A1)&A1!=B&bet(D,E,D1)&D1!=E)=>cong_angle(A1,B,C,D1,E,F)))).
fof(th_11_10,axiom,(![A,B,C,D,E,F,A1,C1,D1,F1]:((cong_angle(A,B,C,D,E,F)&out(B,A1,A)&out(B,C1,C)&out(E,D1,D)&out(E,F1,F))=>cong_angle(A1,B,C1,D1,E,F1)))).
fof(cong3_conga,axiom,![A,B,C,A1,B1,C1]:((A!=B&C!=B&cong3(A,B,C,A1,B1,C1))=>(cong_angle(A,B,C,A1,B1,C1)))).
fof(th_10_12,axiom,(![A,B,C,A1,B1,C1]:((per(A,B,C)&per(A1,B1,C1)&cong(A,B,A1,B1)&cong(B,C,B1,C1))=>cong(A,C,A1,C1)))).
fof(col2,axiom,![A,B,X,Y]:((A!=B&col(A,B,X)&col(A,B,Y))=>(col(A,X,Y)))).
fof(perp_col,axiom,![A,B,C,D,E]:((A!=E&perp(A,B,C,D)&col(A,B,E))=>(perp(A,E,C,D)))).
fof(perp_perp_in,axiom,![A,B,C]:((perp(A,B,C,A))=>(perp_in(A,A,B,C,A)))).
fof(th_8_18_1,axiom,(![A,B,C]:(ncol(A,B,C)=>(?[X]:(col(A,B,X)&perp(A,B,C,X)))))).
fof(perp_in_comm,axiom,![A,B,C,D,X]:((perp_in(X,A,B,C,D))=>(perp_in(X,B,A,D,C)))).
fof(perp_in_sym,axiom,![A,B,C,D,X]:((perp_in(X,A,B,C,D))=>(perp_in(X,C,D,A,B)))).
fof(perp_right_comm,axiom,![A,B,C,D]:((perp(A,B,C,D))=>(perp(A,B,D,C)))).
fof(perp_left_comm,axiom,![A,B,C,D]:((perp(A,B,C,D))=>(perp(B,A,C,D)))).
fof(perp_sym,axiom,![A,B,C,D]:((perp(A,B,C,D))=>(perp(C,D,A,B)))).
fof(perp_in_per,axiom,![A,B,C]:((perp_in(B,A,B,B,C))=>(per(A,B,C)))).
fof(perp_distinct,axiom,![A,B,C,D]:((perp(A,B,C,D))=>((A!=B)&(C!=D)))).
fof(th_8_8,axiom,(![A,B]:((per(A,B,A))=>A=B))).
fof(th_8_2,axiom,(![A,B,C]:(per(A,B,C)=>per(C,B,A)))).
fof(col_transitivity_1,axiom,![P,Q,A,B]:((P!=Q&col(P,Q,A)&col(P,Q,B))=>(col(P,A,B)))).
fof(th_6_6,axiom,(![A,B,P]:(out(P,A,B)=>out(P,B,A)))).
fof(th_6_5,axiom,(![A,P]:(A!=P=>out(P,A,A)))).
fof(out_col,axiom,![A,B,C]:((out(A,B,C))=>(col(A,B,C)))).
fof(col_trivial_2,axiom,![A,B]:((col(A,B,B)))).
fof(th_4_12,axiom,(![A,B]:col(A,A,B))).
fof(th_4_11,axiom,(![A,B,C]:(col(A,B,C)=>(col(B,C,A)&col(C,A,B)&col(C,B,A)&col(B,A,C)&col(A,C,B))))).
fof(th_3_2,axiom,(![A,B,C]:(bet(A,B,C)=>bet(C,B,A)))).
fof(cong_commutativity,axiom,![A,B,C,D]:((cong(A,B,C,D))=>(cong(B,A,D,C)))).
fof(th_2_2,axiom,(![A,B,C,D]:(cong(A,B,C,D)=>cong(C,D,A,B)))).
fof(goal, conjecture,(![A,B,C,D,E,P]:((ncol(A,B,C)&ncol(D,E,P))=>(?[F]:(cong_angle(A,B,C,D,E,F)&one_side(F,P,E,D)))))).