fof(not_out_bet,axiom,![A,B,C]:((col(A,B,C)&nout(B,A,C))=>(bet(A,B,C)))).
fof(not_bet_and_out,axiom,![A,B,C]:((nbet(A,B,C)|nout(B,A,C)))).
fof(l11_22_bet,axiom,![A,B,C,P,A1,B1,C1,P1]:((bet(A,B,C)&two_sides(A1,C1,P1,B1)&cong_angle(A,B,P,A1,B1,P1)&cong_angle(P,B,C,P1,B1,C1))=>(bet(A1,B1,C1)))).
fof(segment_construction_3,axiom,![A,B,X,Y]:((A!=B&X!=Y)=>(?[C]:((out(A,B,C)&cong(A,C,X,Y)))))).
fof(l11_22_aux,axiom,![A,B,C,C1]:((cong_angle(A,B,C,A,B,C1))=>(out(B,C,C1)|two_sides(C,C1,A,B)))).
fof(invert_two_sides,axiom,![A,B,P,Q]:((two_sides(P,Q,A,B))=>(two_sides(P,Q,B,A)))).
fof(not_bet_out,axiom,![A,B,C]:((A!=B&C!=B&col(A,B,C)&nbet(A,B,C))=>(out(B,A,C)))).
fof(th_11_21_2_2,axiom,(![A,B,C,A1,B1,C1]:((bet(A,B,C)&distinct(A,B,C)&bet(A1,B1,C1)&distinct(A1,B1,C1))=>cong_angle(A,B,C,A1,B1,C1)))).
fof(conga_comm,axiom,![A,B,C,D,E,F]:((cong_angle(A,B,C,D,E,F))=>(cong_angle(C,B,A,F,E,D)))).
fof(th_11_13,axiom,(![A,B,C,D,E,F,A1,D1]:((cong_angle(A,B,C,D,E,F)&bet(A,B,A1)&A1!=B&bet(D,E,D1)&D1!=E)=>cong_angle(A1,B,C,D1,E,F)))).
fof(th_11_10,axiom,(![A,B,C,D,E,F,A1,C1,D1,F1]:((cong_angle(A,B,C,D,E,F)&out(B,A1,A)&out(B,C1,C)&out(E,D1,D)&out(E,F1,F))=>cong_angle(A1,B,C1,D1,E,F1)))).
fof(th_11_8,axiom,(![A1,B1,C1,A2,B2,C2,A3,B3,C3]:((cong_angle(A1,B1,C1,A2,B2,C2)&cong_angle(A2,B2,C2,A3,B3,C3))=>cong_angle(A1,B1,C1,A3,B3,C3)))).
fof(cong3_conga,axiom,![A,B,C,A1,B1,C1]:((A!=B&C!=B&cong3(A,B,C,A1,B1,C1))=>(cong_angle(A,B,C,A1,B1,C1)))).
fof(th_11_7,axiom,(![A,B,C,D,E,F]:((cong_angle(A,B,C,D,E,F))=>cong_angle(D,E,F,A,B,C)))).
fof(th_11_4_1,axiom,(![A,B,C,D,E,F,A1,C1,D1,F1]:((cong_angle(A,B,C,D,E,F)&A!=B&C!=B&D!=E&F!=E&out(B,A1,A)&out(B,C1,C)&out(E,D1,D)&out(E,F1,F)&cong(B,A1,E,D1)&cong(B,C1,E,F1))=>cong(A1,C1,D1,F1)))).
fof(th_9_9,axiom,(![P,Q,A,B]:(two_sides(A,B,P,Q)=>none_side(A,B,P,Q)))).
fof(th_9_5,axiom,(![P,Q,A,B,C,R]:((P!=Q&two_sides(A,C,P,Q)&point_on_line(R,P,Q)&out(R,A,B))=>two_sides(B,C,P,Q)))).
fof(col2,axiom,![A,B,X,Y]:((A!=B&col(A,B,X)&col(A,B,Y))=>(col(A,X,Y)))).
fof(th_9_2,axiom,(![P,Q,A,B]:((two_sides(A,B,P,Q))=>two_sides(B,A,P,Q)))).
fof(th_6_6,axiom,(![A,B,P]:(out(P,A,B)=>out(P,B,A)))).
fof(th_6_5,axiom,(![A,P]:(A!=P=>out(P,A,A)))).
fof(out_col,axiom,![A,B,C]:((out(A,B,C))=>(col(A,B,C)))).
fof(th_4_12,axiom,(![A,B]:col(A,A,B))).
fof(th_4_11,axiom,(![A,B,C]:(col(A,B,C)=>(col(B,C,A)&col(C,A,B)&col(C,B,A)&col(B,A,C)&col(A,C,B))))).
fof(th_3_2,axiom,(![A,B,C]:(bet(A,B,C)=>bet(C,B,A)))).
fof(th_2_11,axiom,(![A,B,C,A1,B1,C1]:((bet(A,B,C)&bet(A1,B1,C1)&cong(A,B,A1,B1)&cong(B,C,B1,C1))=>cong(A,C,A1,C1)))).
fof(cong_commutativity,axiom,![A,B,C,D]:((cong(A,B,C,D))=>(cong(B,A,D,C)))).
fof(th_2_2,axiom,(![A,B,C,D]:(cong(A,B,C,D)=>cong(C,D,A,B)))).
fof(goal, conjecture,(![A,B,C,P,A1,B1,C1,P1]:((two_sides(A,C,B,P)&two_sides(A1,C1,B1,P1)&cong_angle(A,B,P,A1,B1,P1)&cong_angle(P,B,C,P1,B1,C1))=>cong_angle(A,B,C,A1,B1,C1)))).