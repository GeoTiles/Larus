fof(defrightangle,axiom, (! [A,B,C] : (? [X] : ((per(A,B,C)) => ((betS(A,B,X) & cong(A,B,X,B) & cong(A,C,X,C) & neq(B,C))))))).
fof(defrightangle2,axiom, (! [A,B,C,X] : ((betS(A,B,X) & cong(A,B,X,B) & cong(A,C,X,C) & neq(B,C)) => ((per(A,B,C)))))).
fof(lemma_congruenceflip,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) => ((cong(B,A,D,C) & cong(B,A,C,D) & cong(A,B,D,C)))))).
fof(defmidpoint,axiom, (! [A,B,C] : ((midpoint(A,B,C)) => ((betS(A,B,C) & cong(A,B,B,C)))))).
fof(defmidpoint2,axiom, (! [A,B,C] : ((betS(A,B,C) & cong(A,B,B,C)) => ((midpoint(A,B,C)))))).
fof(lemma_midpointunique,axiom, (! [A,B,C,D] : ((midpoint(A,B,C) & midpoint(A,D,C)) => ((eq(B,D)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_congruencesymmetric,axiom, (! [A,B,C,D] : ((cong(B,C,A,D)) => ((cong(A,D,B,C)))))).
fof(axiom_nocollapse,axiom, (! [A,B,C,D] : ((neq(A,B) & cong(A,B,C,D)) => ((neq(C,D)))))).
fof(cn_equalitytransitive,axiom, (! [A,B,C] : ((eq(A,C) & eq(B,C)) => ((eq(A,B)))))).
fof(lemma_partnotequalwhole,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((ncong(A,B,A,C)))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(lemma_doublereverse,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) => ((cong(D,C,B,A) & cong(B,A,D,C)))))).
fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_collinear4,axiom, (! [A,B,C,D] : ((col(A,B,C) & col(A,B,D) & neq(A,B)) => ((col(B,C,D)))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(per_excluded_middle,axiom, (! [A,B,C] : ((per(A,B,C)) | (nper(A,B,C))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(cong_excluded_middle,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) | (ncong(A,B,C,D))))).
fof(midpoint_excluded_middle,axiom, (! [A,B,C] : ((midpoint(A,B,C)) | (nmidpoint(A,B,C))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(lemma_rightangleNC,conjecture,(  ! [A,B,C] : ((per(A,B,C)) => (ncol(A,B,C))))).