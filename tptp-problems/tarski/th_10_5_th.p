fof(th_10_4,axiom,(![P,P1,A,B]:(is_image(P1,P,A,B)=>is_image(P,P1,A,B)))).
fof(l10_2_unicity,axiom,![A,B,P,P1,P2]:((is_image(P1,P,A,B)&is_image(P2,P,A,B))=>(P1=P2))).
fof(is_image_is_image_spec_a,axiom,![P,P1,A,B]:((A!=B)=>(is_image(P1,P,A,B)=>(is_image_spec(P1,P,A,B))))).
fof(is_image_is_image_spec_b,axiom,![P,P1,A,B]:((A!=B)=>(is_image_spec(P1,P,A,B)=>(is_image(P1,P,A,B))))).
fof(th_7_4_2,axiom,(![P,A,P1,P2]:((is_midpoint(A,P,P1)&is_midpoint(A,P,P2))=>P1=P2))).
fof(th_7_2,axiom,(![A,M,B]:(is_midpoint(M,A,B)=>is_midpoint(M,B,A)))).
fof(goal, conjecture,(![A,B,P,P1,P2]:((A!=B&is_image(P1,P,A,B)&is_image(P2,P1,A,B))=>(P=P2)))).