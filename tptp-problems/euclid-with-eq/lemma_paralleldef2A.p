fof(deftarski_parallel,axiom, (! [A,B,C,D] : ((tP(A,B,C,D)) => ((neq(A,B) & neq(C,D) & nmeet(A,B,C,D) & oS(C,D,A,B)))))).
fof(deftarski_parallel2,axiom, (! [A,B,C,D] : ((neq(A,B) & neq(C,D) & nmeet(A,B,C,D) & oS(C,D,A,B)) => ((tP(A,B,C,D)))))).
fof(defsameside,axiom, (! [P,Q,A,B] : (? [X,U,V] : ((oS(P,Q,A,B)) => ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q))))))).
fof(defsameside2,axiom, (! [P,Q,A,B,X,U,V] : ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q)) => ((oS(P,Q,A,B)))))).
fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_collinear4,axiom, (! [A,B,C,D] : ((col(A,B,C) & col(A,B,D) & neq(A,B)) => ((col(B,C,D)))))).
fof(defmeet,axiom, (! [A,B,C,D] : (? [X] : ((meet(A,B,C,D)) => ((neq(A,B) & neq(C,D) & col(A,B,X) & col(C,D,X))))))).
fof(defmeet2,axiom, (! [A,B,C,D,X] : ((neq(A,B) & neq(C,D) & col(A,B,X) & col(C,D,X)) => ((meet(A,B,C,D)))))).
fof(postulate_Pasch_inner,axiom, (! [A,B,C,P,Q] : (? [X] : ((betS(A,P,C) & betS(B,Q,C) & ncol(A,C,B)) => ((betS(A,X,Q) & betS(B,X,P))))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(defparallel,axiom, (! [A,B,C,D] : (? [U,V,Su,Sv,X] : ((par(A,B,C,D)) => ((neq(A,B) & neq(C,D) & col(A,B,U) & col(A,B,V) & neq(U,V) & col(C,D,Su) & col(C,D,Sv) & neq(Su,Sv) & nmeet(A,B,C,D) & betS(U,X,Sv) & betS(Su,X,V))))))).
fof(defparallel2,axiom, (! [A,B,C,D,U,V,Su,Sv,X] : ((neq(A,B) & neq(C,D) & col(A,B,U) & col(A,B,V) & neq(U,V) & col(C,D,Su) & col(C,D,Sv) & neq(Su,Sv) & nmeet(A,B,C,D) & betS(U,X,Sv) & betS(Su,X,V)) => ((par(A,B,C,D)))))).
fof(eqSymmetric,axiom, (! [A,B] : ((eq(A,B)) => ((eq(B,A)))))).
fof(neqSymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(eqReflexive,axiom, (! [A] : ((eq(A,A))))).
fof(tP_neg_elim,axiom, (! [A,B,C,D] : ((tP(A,B,C,D) & ntP(A,B,C,D)) => (($false))))).
fof(eq_neg_elim,axiom, (! [A,B] : ((eq(A,B) & neq(A,B)) => (($false))))).
fof(meet_neg_elim,axiom, (! [A,B,C,D] : ((meet(A,B,C,D) & nmeet(A,B,C,D)) => (($false))))).
fof(oS_neg_elim,axiom, (! [A,B,C,D] : ((oS(A,B,C,D) & noS(A,B,C,D)) => (($false))))).
fof(col_neg_elim,axiom, (! [A,B,C] : ((col(A,B,C) & ncol(A,B,C)) => (($false))))).
fof(betS_neg_elim,axiom, (! [A,B,C] : ((betS(A,B,C) & nbetS(A,B,C)) => (($false))))).
fof(par_neg_elim,axiom, (! [A,B,C,D] : ((par(A,B,C,D) & npar(A,B,C,D)) => (($false))))).
fof(tP_excluded_middle,axiom, (! [A,B,C,D] : ((tP(A,B,C,D)) | (ntP(A,B,C,D))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(meet_excluded_middle,axiom, (! [A,B,C,D] : ((meet(A,B,C,D)) | (nmeet(A,B,C,D))))).
fof(oS_excluded_middle,axiom, (! [A,B,C,D] : ((oS(A,B,C,D)) | (noS(A,B,C,D))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(par_excluded_middle,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) | (npar(A,B,C,D))))).
fof(tP_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & tP(A,B,C,D)) => ((tP(X,B,C,D)))))).
fof(tP_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & tP(A,B,C,D)) => ((tP(A,X,C,D)))))).
fof(tP_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & tP(A,B,C,D)) => ((tP(A,B,X,D)))))).
fof(tP_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & tP(A,B,C,D)) => ((tP(A,B,C,X)))))).
fof(ntP_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & ntP(A,B,C,D)) => ((ntP(X,B,C,D)))))).
fof(ntP_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & ntP(A,B,C,D)) => ((ntP(A,X,C,D)))))).
fof(ntP_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & ntP(A,B,C,D)) => ((ntP(A,B,X,D)))))).
fof(ntP_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & ntP(A,B,C,D)) => ((ntP(A,B,C,X)))))).
fof(eq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & eq(A,B)) => ((eq(X,B)))))).
fof(eq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & eq(A,B)) => ((eq(A,X)))))).
fof(neq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & neq(A,B)) => ((neq(X,B)))))).
fof(neq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & neq(A,B)) => ((neq(A,X)))))).
fof(meet_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & meet(A,B,C,D)) => ((meet(X,B,C,D)))))).
fof(meet_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & meet(A,B,C,D)) => ((meet(A,X,C,D)))))).
fof(meet_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & meet(A,B,C,D)) => ((meet(A,B,X,D)))))).
fof(meet_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & meet(A,B,C,D)) => ((meet(A,B,C,X)))))).
fof(nmeet_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & nmeet(A,B,C,D)) => ((nmeet(X,B,C,D)))))).
fof(nmeet_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & nmeet(A,B,C,D)) => ((nmeet(A,X,C,D)))))).
fof(nmeet_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & nmeet(A,B,C,D)) => ((nmeet(A,B,X,D)))))).
fof(nmeet_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & nmeet(A,B,C,D)) => ((nmeet(A,B,C,X)))))).
fof(oS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & oS(A,B,C,D)) => ((oS(X,B,C,D)))))).
fof(oS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & oS(A,B,C,D)) => ((oS(A,X,C,D)))))).
fof(oS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & oS(A,B,C,D)) => ((oS(A,B,X,D)))))).
fof(oS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & oS(A,B,C,D)) => ((oS(A,B,C,X)))))).
fof(noS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & noS(A,B,C,D)) => ((noS(X,B,C,D)))))).
fof(noS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & noS(A,B,C,D)) => ((noS(A,X,C,D)))))).
fof(noS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & noS(A,B,C,D)) => ((noS(A,B,X,D)))))).
fof(noS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & noS(A,B,C,D)) => ((noS(A,B,C,X)))))).
fof(col_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & col(A,B,C)) => ((col(X,B,C)))))).
fof(col_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & col(A,B,C)) => ((col(A,X,C)))))).
fof(col_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & col(A,B,C)) => ((col(A,B,X)))))).
fof(ncol_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & ncol(A,B,C)) => ((ncol(X,B,C)))))).
fof(ncol_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & ncol(A,B,C)) => ((ncol(A,X,C)))))).
fof(ncol_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & ncol(A,B,C)) => ((ncol(A,B,X)))))).
fof(betS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & betS(A,B,C)) => ((betS(X,B,C)))))).
fof(betS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & betS(A,B,C)) => ((betS(A,X,C)))))).
fof(betS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & betS(A,B,C)) => ((betS(A,B,X)))))).
fof(nbetS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nbetS(A,B,C)) => ((nbetS(X,B,C)))))).
fof(nbetS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nbetS(A,B,C)) => ((nbetS(A,X,C)))))).
fof(nbetS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nbetS(A,B,C)) => ((nbetS(A,B,X)))))).
fof(par_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & par(A,B,C,D)) => ((par(X,B,C,D)))))).
fof(par_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & par(A,B,C,D)) => ((par(A,X,C,D)))))).
fof(par_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & par(A,B,C,D)) => ((par(A,B,X,D)))))).
fof(par_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & par(A,B,C,D)) => ((par(A,B,C,X)))))).
fof(npar_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & npar(A,B,C,D)) => ((npar(X,B,C,D)))))).
fof(npar_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & npar(A,B,C,D)) => ((npar(A,X,C,D)))))).
fof(npar_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & npar(A,B,C,D)) => ((npar(A,B,X,D)))))).
fof(npar_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & npar(A,B,C,D)) => ((npar(A,B,C,X)))))).
fof(lemma_paralleldef2A,conjecture,(  ! [A,B,C,D] : ((tP(A,B,C,D)) => (par(A,B,C,D))))).