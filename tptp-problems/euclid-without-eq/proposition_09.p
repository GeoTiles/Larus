fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_layoff,axiom, (! [A,B,C,D] : (? [X] : ((neq(A,B) & neq(C,D)) => ((out(A,B,X) & cong(A,X,C,D))))))).
fof(lemma_rayimpliescollinear,axiom, (! [A,B,C] : ((out(A,B,C)) => ((col(A,B,C)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_raystrict,axiom, (! [A,B,C] : ((out(A,B,C)) => ((neq(A,C)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_collinear4,axiom, (! [A,B,C,D] : ((col(A,B,C) & col(A,B,D) & neq(A,B)) => ((col(B,C,D)))))).
fof(proposition_10,axiom, (! [A,B] : (? [X] : ((neq(A,B)) => ((betS(A,X,B) & cong(X,A,X,B))))))).
fof(cn_congruencereflexive,axiom, (! [A,B] : ((cong(A,B,A,B))))).
fof(lemma_congruencesymmetric,axiom, (! [A,B,C,D] : ((cong(B,C,A,D)) => ((cong(A,D,B,C)))))).
fof(lemma_doublereverse,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) => ((cong(D,C,B,A) & cong(B,A,D,C)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_ray4_1,axiom, (! [A,B,E] : ((betS(A,E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_2,axiom, (! [A,B,E] : ((eq(E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_3,axiom, (! [A,B,E] : ((betS(A,B,E) & neq(A,B)) => ((out(A,B,E)))))).
fof(defequalangles,axiom, (! [A,B,C,Ca,Cb,Cc] : (? [U,V,Su,Sv] : ((congA(A,B,C,Ca,Cb,Cc)) => ((out(B,A,U) & out(B,C,V) & out(Cb,Ca,Su) & out(Cb,Cc,Sv) & cong(B,U,Cb,Su) & cong(B,V,Cb,Sv) & cong(U,V,Su,Sv) & ncol(A,B,C))))))).
fof(defequalangles2,axiom, (! [A,B,C,Ca,Cb,Cc,U,V,Su,Sv] : ((out(B,A,U) & out(B,C,V) & out(Cb,Ca,Su) & out(Cb,Cc,Sv) & cong(B,U,Cb,Su) & cong(B,V,Cb,Sv) & cong(U,V,Su,Sv) & ncol(A,B,C)) => ((congA(A,B,C,Ca,Cb,Cc)))))).
fof(lemma_equalanglessymmetric,axiom, (! [A,B,C,Xa,Xb,Xc] : ((congA(A,B,C,Xa,Xb,Xc)) => ((congA(Xa,Xb,Xc,A,B,C)))))).
fof(lemma_ABCequalsCBA,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((congA(A,B,C,C,B,A)))))).
fof(lemma_equalanglestransitive,axiom, (! [A,B,C,D,E,F,P,Q,R] : ((congA(A,B,C,D,E,F) & congA(D,E,F,P,Q,R)) => ((congA(A,B,C,P,Q,R)))))).
fof(definterior,axiom, (! [A,B,C,P] : (? [X,Y] : ((inAngle(A,B,C,P)) => ((out(B,A,X) & out(B,C,Y) & betS(X,P,Y))))))).
fof(definterior2,axiom, (! [A,B,C,P,X,Y] : ((out(B,A,X) & out(B,C,Y) & betS(X,P,Y)) => ((inAngle(A,B,C,P)))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(out_excluded_middle,axiom, (! [A,B,C] : ((out(A,B,C)) | (nout(A,B,C))))).
fof(cong_excluded_middle,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) | (ncong(A,B,C,D))))).
fof(congA_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F)) | (ncongA(A,B,C,D,E,F))))).
fof(inAngle_excluded_middle,axiom, (! [A,B,C,D] : ((inAngle(A,B,C,D)) | (ninAngle(A,B,C,D))))).
fof(proposition_09,conjecture,(  ! [A,B,C] : ((ncol(B,A,C)) => ? [X] : (congA(B,A,X,X,A,C) & inAngle(B,A,C,X))))).