fof(deflessthan,axiom, (! [A,B,C,D] : (? [X] : ((lt(A,B,C,D)) => ((betS(C,X,D) & cong(C,X,A,B))))))).
fof(deflessthan2,axiom, (! [A,B,C,D,X] : ((betS(C,X,D) & cong(C,X,A,B)) => ((lt(A,B,C,D)))))).
fof(lemma_congruencesymmetric,axiom, (! [A,B,C,D] : ((cong(B,C,A,D)) => ((cong(A,D,B,C)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_extension,axiom, (! [A,B,P,Q] : (? [X] : ((neq(A,B) & neq(P,Q)) => ((betS(A,B,X) & cong(B,X,P,Q))))))).
fof(lemma_3_6b,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(A,C,D)) => ((betS(A,B,D)))))).
fof(cn_congruencereflexive,axiom, (! [A,B] : ((cong(A,B,A,B))))).
fof(lemma_3_6a,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(A,C,D)) => ((betS(B,C,D)))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(cn_equalityreverse,axiom, (! [A,B] : ((cong(A,B,B,A))))).
fof(lemma_lessthancongruence,axiom, (! [A,B,C,D,E,F] : ((lt(A,B,C,D) & cong(C,D,E,F)) => ((lt(A,B,E,F)))))).
fof(lemma_lessthancongruence2,axiom, (! [A,B,C,D,E,F] : ((lt(A,B,C,D) & cong(A,B,E,F)) => ((lt(E,F,C,D)))))).
fof(lemma_congruencetransitive,axiom, (! [A,B,C,D,E,F] : ((cong(A,B,C,D) & cong(C,D,E,F)) => ((cong(A,B,E,F)))))).
fof(lemma_ray4_1,axiom, (! [A,B,E] : ((betS(A,E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_2,axiom, (! [A,B,E] : ((eq(E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_3,axiom, (! [A,B,E] : ((betS(A,B,E) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_layoffunique,axiom, (! [A,B,C,D] : ((out(A,B,C) & out(A,B,D) & cong(A,C,A,D)) => ((eq(C,D)))))).
fof(axiom_betweennessidentity,axiom, (! [A,B] : ((nbetS(A,B,A))))).
fof(lemma_congruenceflip,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) => ((cong(B,A,D,C) & cong(B,A,C,D) & cong(A,B,D,C)))))).
fof(lemma_trichotomy2,axiom, (! [A,B,C,D] : ((lt(A,B,C,D)) => ((nlt(C,D,A,B)))))).
fof(lemma_outerconnectivity,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(A,B,D) & nbetS(B,C,D) & nbetS(B,D,C)) => ((eq(C,D)))))).
fof(lemma_3_7a,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(B,C,D)) => ((betS(A,C,D)))))).
fof(cn_sumofparts,axiom, (! [A,B,C,E,F,G] : ((cong(A,B,E,F) & cong(B,C,F,G) & betS(A,B,C) & betS(E,F,G)) => ((cong(A,C,E,G)))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(lt_excluded_middle,axiom, (! [A,B,C,D] : ((lt(A,B,C,D)) | (nlt(A,B,C,D))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(cong_excluded_middle,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) | (ncong(A,B,C,D))))).
fof(out_excluded_middle,axiom, (! [A,B,C] : ((out(A,B,C)) | (nout(A,B,C))))).
fof(lemma_lessthanadditive,conjecture,(  ! [A,B,C,D,E,F] : ((lt(A,B,C,D) & betS(A,B,E) & betS(C,D,F) & cong(B,E,D,F)) => (lt(A,E,C,F))))).