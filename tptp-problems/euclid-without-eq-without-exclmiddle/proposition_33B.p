fof(defcross,axiom, (! [A,B,C,D] : (? [X] : ((cR(A,B,C,D)) => ((betS(A,X,B) & betS(C,X,D))))))).
fof(defcross2,axiom, (! [A,B,C,D,X] : ((betS(A,X,B) & betS(C,X,D)) => ((cR(A,B,C,D)))))).
fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_parallelNC,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) => ((ncol(A,B,C) & ncol(A,C,D) & ncol(B,C,D) & ncol(A,B,D)))))).
fof(lemma_NCorder,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((ncol(B,A,C) & ncol(B,C,A) & ncol(C,A,B) & ncol(A,C,B) & ncol(C,B,A)))))).
fof(defoppositeside,axiom, (! [P,A,B,Q] : (? [X] : ((tS(P,A,B,Q)) => ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P))))))).
fof(defoppositeside2,axiom, (! [P,A,B,Q,X] : ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P)) => ((tS(P,A,B,Q)))))).
fof(lemma_samenotopposite,axiom, (! [A,B,C,D] : ((oS(A,B,C,D)) => ((ntS(A,C,D,B)))))).
fof(lemma_crisscross,axiom, (! [A,B,C,D] : ((par(A,C,B,D) & ncR(A,B,C,D)) => ((cR(A,D,B,C)))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(proposition_33,axiom, (! [A,B,C,D,M] : ((par(A,B,C,D) & cong(A,B,C,D) & betS(A,M,D) & betS(B,M,C)) => ((par(A,C,B,D) & cong(A,C,B,D)))))).
fof(proposition_33B,conjecture,(  ! [A,B,C,D] : ((par(A,B,C,D) & cong(A,B,C,D) & oS(A,C,B,D)) => (par(A,C,B,D) & cong(A,C,B,D))))).