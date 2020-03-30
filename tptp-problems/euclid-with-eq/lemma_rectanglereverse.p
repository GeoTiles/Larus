fof(defrectangle,axiom, (! [A,B,C,D] : ((rE(A,B,C,D)) => ((per(D,A,B) & per(A,B,C) & per(B,C,D) & per(C,D,A) & cR(A,C,B,D)))))).
fof(defrectangle2,axiom, (! [A,B,C,D] : ((per(D,A,B) & per(A,B,C) & per(B,C,D) & per(C,D,A) & cR(A,C,B,D)) => ((rE(A,B,C,D)))))).
fof(lemma_8_2,axiom, (! [A,B,C] : ((per(A,B,C)) => ((per(C,B,A)))))).
fof(defcross,axiom, (! [A,B,C,D] : (? [X] : ((cR(A,B,C,D)) => ((betS(A,X,B) & betS(C,X,D))))))).
fof(defcross2,axiom, (! [A,B,C,D,X] : ((betS(A,X,B) & betS(C,X,D)) => ((cR(A,B,C,D)))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(eqSymmetric,axiom, (! [A,B] : ((eq(A,B)) => ((eq(B,A)))))).
fof(neqSymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(eqReflexive,axiom, (! [A] : ((eq(A,A))))).
fof(rE_neg_elim,axiom, (! [A,B,C,D] : ((rE(A,B,C,D) & nrE(A,B,C,D)) => (($false))))).
fof(per_neg_elim,axiom, (! [A,B,C] : ((per(A,B,C) & nper(A,B,C)) => (($false))))).
fof(cR_neg_elim,axiom, (! [A,B,C,D] : ((cR(A,B,C,D) & ncR(A,B,C,D)) => (($false))))).
fof(betS_neg_elim,axiom, (! [A,B,C] : ((betS(A,B,C) & nbetS(A,B,C)) => (($false))))).
fof(eq_neg_elim,axiom, (! [A,B] : ((eq(A,B) & neq(A,B)) => (($false))))).
fof(rE_excluded_middle,axiom, (! [A,B,C,D] : ((rE(A,B,C,D)) | (nrE(A,B,C,D))))).
fof(per_excluded_middle,axiom, (! [A,B,C] : ((per(A,B,C)) | (nper(A,B,C))))).
fof(cR_excluded_middle,axiom, (! [A,B,C,D] : ((cR(A,B,C,D)) | (ncR(A,B,C,D))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(rE_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & rE(A,B,C,D)) => ((rE(X,B,C,D)))))).
fof(rE_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & rE(A,B,C,D)) => ((rE(A,X,C,D)))))).
fof(rE_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & rE(A,B,C,D)) => ((rE(A,B,X,D)))))).
fof(rE_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & rE(A,B,C,D)) => ((rE(A,B,C,X)))))).
fof(nrE_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & nrE(A,B,C,D)) => ((nrE(X,B,C,D)))))).
fof(nrE_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & nrE(A,B,C,D)) => ((nrE(A,X,C,D)))))).
fof(nrE_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & nrE(A,B,C,D)) => ((nrE(A,B,X,D)))))).
fof(nrE_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & nrE(A,B,C,D)) => ((nrE(A,B,C,X)))))).
fof(per_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & per(A,B,C)) => ((per(X,B,C)))))).
fof(per_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & per(A,B,C)) => ((per(A,X,C)))))).
fof(per_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & per(A,B,C)) => ((per(A,B,X)))))).
fof(nper_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nper(A,B,C)) => ((nper(X,B,C)))))).
fof(nper_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nper(A,B,C)) => ((nper(A,X,C)))))).
fof(nper_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nper(A,B,C)) => ((nper(A,B,X)))))).
fof(cR_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & cR(A,B,C,D)) => ((cR(X,B,C,D)))))).
fof(cR_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & cR(A,B,C,D)) => ((cR(A,X,C,D)))))).
fof(cR_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & cR(A,B,C,D)) => ((cR(A,B,X,D)))))).
fof(cR_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & cR(A,B,C,D)) => ((cR(A,B,C,X)))))).
fof(ncR_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & ncR(A,B,C,D)) => ((ncR(X,B,C,D)))))).
fof(ncR_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & ncR(A,B,C,D)) => ((ncR(A,X,C,D)))))).
fof(ncR_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & ncR(A,B,C,D)) => ((ncR(A,B,X,D)))))).
fof(ncR_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & ncR(A,B,C,D)) => ((ncR(A,B,C,X)))))).
fof(betS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & betS(A,B,C)) => ((betS(X,B,C)))))).
fof(betS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & betS(A,B,C)) => ((betS(A,X,C)))))).
fof(betS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & betS(A,B,C)) => ((betS(A,B,X)))))).
fof(nbetS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nbetS(A,B,C)) => ((nbetS(X,B,C)))))).
fof(nbetS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nbetS(A,B,C)) => ((nbetS(A,X,C)))))).
fof(nbetS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nbetS(A,B,C)) => ((nbetS(A,B,X)))))).
fof(eq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & eq(A,B)) => ((eq(X,B)))))).
fof(eq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & eq(A,B)) => ((eq(A,X)))))).
fof(neq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & neq(A,B)) => ((neq(X,B)))))).
fof(neq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & neq(A,B)) => ((neq(A,X)))))).
fof(lemma_rectanglereverse,conjecture,(  ! [A,B,C,D] : ((rE(A,B,C,D)) => (rE(D,C,B,A))))).