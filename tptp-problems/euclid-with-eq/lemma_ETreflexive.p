fof(lemma_TCreflexive,axiom, (! [A,B,C] : ((triangle(A,B,C)) => ((cong_3(A,B,C,A,B,C)))))).
fof(axiom_congruentequal,axiom, (! [A,B,C,Ca,Cb,Cc] : ((cong_3(A,B,C,Ca,Cb,Cc)) => ((eT(A,B,C,Ca,Cb,Cc)))))).
fof(eqSymmetric,axiom, (! [A,B] : ((eq(A,B)) => ((eq(B,A)))))).
fof(neqSymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(eqReflexive,axiom, (! [A] : ((eq(A,A))))).
fof(triangle_neg_elim,axiom, (! [A,B,C] : ((triangle(A,B,C) & ntriangle(A,B,C)) => (($false))))).
fof(eT_neg_elim,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F) & neT(A,B,C,D,E,F)) => (($false))))).
fof(eq_neg_elim,axiom, (! [A,B] : ((eq(A,B) & neq(A,B)) => (($false))))).
fof(triangle_excluded_middle,axiom, (! [A,B,C] : ((triangle(A,B,C)) | (ntriangle(A,B,C))))).
fof(eT_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F)) | (neT(A,B,C,D,E,F))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(triangle_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & triangle(A,B,C)) => ((triangle(X,B,C)))))).
fof(triangle_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & triangle(A,B,C)) => ((triangle(A,X,C)))))).
fof(triangle_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & triangle(A,B,C)) => ((triangle(A,B,X)))))).
fof(ntriangle_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & ntriangle(A,B,C)) => ((ntriangle(X,B,C)))))).
fof(ntriangle_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & ntriangle(A,B,C)) => ((ntriangle(A,X,C)))))).
fof(ntriangle_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & ntriangle(A,B,C)) => ((ntriangle(A,B,X)))))).
fof(eT_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & eT(A,B,C,D,E,F)) => ((eT(X,B,C,D,E,F)))))).
fof(eT_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & eT(A,B,C,D,E,F)) => ((eT(A,X,C,D,E,F)))))).
fof(eT_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & eT(A,B,C,D,E,F)) => ((eT(A,B,X,D,E,F)))))).
fof(eT_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & eT(A,B,C,D,E,F)) => ((eT(A,B,C,X,E,F)))))).
fof(eT_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & eT(A,B,C,D,E,F)) => ((eT(A,B,C,D,X,F)))))).
fof(eT_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & eT(A,B,C,D,E,F)) => ((eT(A,B,C,D,E,X)))))).
fof(neT_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & neT(A,B,C,D,E,F)) => ((neT(X,B,C,D,E,F)))))).
fof(neT_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & neT(A,B,C,D,E,F)) => ((neT(A,X,C,D,E,F)))))).
fof(neT_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & neT(A,B,C,D,E,F)) => ((neT(A,B,X,D,E,F)))))).
fof(neT_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & neT(A,B,C,D,E,F)) => ((neT(A,B,C,X,E,F)))))).
fof(neT_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & neT(A,B,C,D,E,F)) => ((neT(A,B,C,D,X,F)))))).
fof(neT_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & neT(A,B,C,D,E,F)) => ((neT(A,B,C,D,E,X)))))).
fof(eq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & eq(A,B)) => ((eq(X,B)))))).
fof(eq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & eq(A,B)) => ((eq(A,X)))))).
fof(neq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & neq(A,B)) => ((neq(X,B)))))).
fof(neq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & neq(A,B)) => ((neq(A,X)))))).
fof(lemma_ETreflexive,conjecture,(  ! [A,B,C] : ((triangle(A,B,C)) => (eT(A,B,C,A,B,C))))).