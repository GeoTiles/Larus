fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_ray,axiom, (! [A,B,P] : ((out(A,B,P) & neq(P,B) & nbetS(A,P,B)) => ((betS(A,B,P)))))).
fof(lemma_ray1,conjecture,(  ! [A,B,P] : ((out(A,B,P)) => ((betS(A,P,B) | eq(B,P) | betS(A,B,P)))))).