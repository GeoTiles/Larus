fof(defsameside,axiom, (! [P,Q,A,B] : (? [X,U,V] : ((oS(P,Q,A,B)) => ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q))))))).
fof(defsameside2,axiom, (! [P,Q,A,B,X,U,V] : ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q)) => ((oS(P,Q,A,B)))))).
fof(defoppositeside,axiom, (! [P,A,B,Q] : (? [X] : ((tS(P,A,B,Q)) => ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P))))))).
fof(defoppositeside2,axiom, (! [P,A,B,Q,X] : ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P)) => ((tS(P,A,B,Q)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_rayimpliescollinear,axiom, (! [A,B,C] : ((out(A,B,C)) => ((col(A,B,C)))))).
fof(lemma_ray1,axiom, (! [A,B,P] : ((out(A,B,P)) => ((betS(A,P,B)) | (eq(B,P)) | (betS(A,B,P)))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(lemma_3_6a,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(A,C,D)) => ((betS(B,C,D)))))).
fof(lemma_3_7a,axiom, (! [A,B,C,D] : ((betS(A,B,C) & betS(B,C,D)) => ((betS(A,C,D)))))).
fof(lemma_collinear4,axiom, (! [A,B,C,D] : ((col(A,B,C) & col(A,B,D) & neq(A,B)) => ((col(B,C,D)))))).
fof(lemma_raystrict,axiom, (! [A,B,C] : ((out(A,B,C)) => ((neq(A,C)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_9_5b,axiom, (! [A,B,C,P,Q,R] : ((tS(P,A,B,C) & betS(R,Q,P) & ncol(C,P,R) & col(A,B,R)) => ((tS(Q,A,B,C)))))).
fof(lemma_9_5a,axiom, (! [A,B,C,P,Q,R] : ((tS(P,A,B,C) & betS(R,P,Q) & ncol(R,Q,C) & col(A,B,R)) => ((tS(Q,A,B,C)))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(oS_excluded_middle,axiom, (! [A,B,C,D] : ((oS(A,B,C,D)) | (noS(A,B,C,D))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(tS_excluded_middle,axiom, (! [A,B,C,D] : ((tS(A,B,C,D)) | (ntS(A,B,C,D))))).
fof(out_excluded_middle,axiom, (! [A,B,C] : ((out(A,B,C)) | (nout(A,B,C))))).
fof(lemma_sameside2,conjecture,(  ! [A,B,C,E,F,G] : ((oS(E,F,A,C) & col(A,B,C) & out(B,F,G)) => (oS(E,G,A,C))))).