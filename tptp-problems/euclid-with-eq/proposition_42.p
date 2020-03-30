fof(defmidpoint,axiom, (! [A,B,C] : ((midpoint(A,B,C)) => ((betS(A,B,C) & cong(A,B,B,C)))))).
fof(defmidpoint2,axiom, (! [A,B,C] : ((betS(A,B,C) & cong(A,B,B,C)) => ((midpoint(A,B,C)))))).
fof(lemma_congruenceflip,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) => ((cong(B,A,D,C) & cong(B,A,C,D) & cong(A,B,D,C)))))).
fof(deftriangle,axiom, (! [A,B,C] : ((triangle(A,B,C)) => ((ncol(A,B,C)))))).
fof(deftriangle2,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((triangle(A,B,C)))))).
fof(defcollinear,axiom, (! [A,B,C] : ((col(A,B,C)) => ((eq(A,B)) | (eq(A,C)) | (eq(B,C)) | (betS(B,A,C)) | (betS(A,B,C)) | (betS(A,C,B)))))).
fof(defcollinear2a,axiom, (! [A,B,C] : ((eq(A,B)) => ((col(A,B,C)))))).
fof(defcollinear2b,axiom, (! [A,B,C] : ((eq(A,C)) => ((col(A,B,C)))))).
fof(defcollinear2c,axiom, (! [A,B,C] : ((eq(B,C)) => ((col(A,B,C)))))).
fof(defcollinear2d,axiom, (! [A,B,C] : ((betS(B,A,C)) => ((col(A,B,C)))))).
fof(defcollinear2e,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((col(A,B,C)))))).
fof(defcollinear2f,axiom, (! [A,B,C] : ((betS(A,C,B)) => ((col(A,B,C)))))).
fof(lemma_NCorder,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((ncol(B,A,C) & ncol(B,C,A) & ncol(C,A,B) & ncol(A,C,B) & ncol(C,B,A)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_betweennotequal,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((neq(B,C) & neq(A,B) & neq(A,C)))))).
fof(lemma_NChelper,axiom, (! [A,B,C,P,Q] : ((ncol(A,B,C) & col(A,B,P) & col(A,B,Q) & neq(P,Q)) => ((ncol(P,Q,C)))))).
fof(proposition_23C,axiom, (! [A,B,C,D,E,P] : (? [X,Y] : ((neq(A,B) & ncol(D,C,E) & ncol(A,B,P)) => ((out(A,B,Y) & congA(X,A,Y,D,C,E) & oS(X,P,A,B))))))).
fof(proposition_31,axiom, (! [A,B,C,D] : (? [X,Y,Z] : ((betS(B,D,C) & ncol(B,C,A)) => ((betS(X,A,Y) & congA(Y,A,D,A,D,B) & congA(Y,A,D,B,D,A) & congA(D,A,Y,B,D,A) & congA(X,A,D,A,D,C) & congA(X,A,D,C,D,A) & congA(D,A,X,C,D,A) & par(X,Y,B,C) & cong(X,A,D,C) & cong(A,Y,B,D) & cong(A,Z,Z,D) & cong(X,Z,Z,C) & cong(B,Z,Z,Y) & betS(X,Z,C) & betS(B,Z,Y) & betS(A,Z,D))))))).
fof(lemma_equalanglessymmetric,axiom, (! [A,B,C,Xa,Xb,Xc] : ((congA(A,B,C,Xa,Xb,Xc)) => ((congA(Xa,Xb,Xc,A,B,C)))))).
fof(lemma_equalanglesNC,axiom, (! [A,B,C,Xa,Xb,Xc] : ((congA(A,B,C,Xa,Xb,Xc)) => ((ncol(Xa,Xb,Xc)))))).
fof(lemma_samesidesymmetric,axiom, (! [A,B,P,Q] : ((oS(P,Q,A,B)) => ((oS(Q,P,A,B) & oS(P,Q,B,A) & oS(Q,P,B,A)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_NCdistinct,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((neq(A,B) & neq(B,C) & neq(A,C) & neq(B,A) & neq(C,B) & neq(C,A)))))).
fof(lemma_ray4_1,axiom, (! [A,B,E] : ((betS(A,E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_2,axiom, (! [A,B,E] : ((eq(E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_3,axiom, (! [A,B,E] : ((betS(A,B,E) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_crossbar2,axiom, (! [A,G,H,P,S,T] : (? [X] : ((ltA(H,G,A,H,G,P) & oS(A,P,G,H) & out(G,H,S) & out(G,P,T)) => ((betS(T,X,S) & out(G,A,X))))))).
fof(axiom_betweennesssymmetry,axiom, (! [A,B,C] : ((betS(A,B,C)) => ((betS(C,B,A)))))).
fof(lemma_congruencesymmetric,axiom, (! [A,B,C,D] : ((cong(B,C,A,D)) => ((cong(A,D,B,C)))))).
fof(postulate_Euclid5,axiom, (! [Ca,P,Q,R,S,T] : (? [X] : ((betS(R,T,S) & betS(P,T,Q) & betS(R,Ca,Q) & cong(P,T,Q,T) & cong(T,R,T,S) & ncol(P,Q,S)) => ((betS(P,Ca,X) & betS(S,Q,X))))))).
fof(lemma_rayimpliescollinear,axiom, (! [A,B,C] : ((out(A,B,C)) => ((col(A,B,C)))))).
fof(lemma_collinear4,axiom, (! [A,B,C,D] : ((col(A,B,C) & col(A,B,D) & neq(A,B)) => ((col(B,C,D)))))).
fof(lemma_ray2,axiom, (! [A,B,C] : ((out(A,B,C)) => ((neq(A,B)))))).
fof(defmeet,axiom, (! [A,B,C,D] : (? [X] : ((meet(A,B,C,D)) => ((neq(A,B) & neq(C,D) & col(A,B,X) & col(C,D,X))))))).
fof(defmeet2,axiom, (! [A,B,C,D,X] : ((neq(A,B) & neq(C,D) & col(A,B,X) & col(C,D,X)) => ((meet(A,B,C,D)))))).
fof(lemma_samesidecollinear,axiom, (! [A,B,C,P,Q] : ((oS(P,Q,A,B) & col(A,B,C) & neq(A,C)) => ((oS(P,Q,A,C)))))).
fof(defsameside,axiom, (! [P,Q,A,B] : (? [X,U,V] : ((oS(P,Q,A,B)) => ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q))))))).
fof(defsameside2,axiom, (! [P,Q,A,B,X,U,V] : ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q)) => ((oS(P,Q,A,B)))))).
fof(defsupplement,axiom, (! [A,B,C,D,F] : ((supp(A,B,C,D,F)) => ((out(B,C,D) & betS(A,B,F)))))).
fof(defsupplement2,axiom, (! [A,B,C,D,F] : ((out(B,C,D) & betS(A,B,F)) => ((supp(A,B,C,D,F)))))).
fof(lemma_supplementinequality,axiom, (! [A,B,C,D,F,Xa,Xb,Xc,Xd,Xf] : ((supp(A,B,C,D,F) & supp(Xa,Xb,Xc,Xd,Xf) & ltA(Xa,Xb,Xc,A,B,C)) => ((ltA(D,B,F,Xd,Xb,Xf)))))).
fof(lemma_ABCequalsCBA,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((congA(A,B,C,C,B,A)))))).
fof(lemma_angleorderrespectscongruence2,axiom, (! [A,B,C,D,E,F,Xa,Xb,Xc] : ((ltA(A,B,C,D,E,F) & congA(Xa,Xb,Xc,A,B,C)) => ((ltA(Xa,Xb,Xc,D,E,F)))))).
fof(lemma_angleorderrespectscongruence,axiom, (! [A,B,C,D,E,F,P,Q,R] : ((ltA(A,B,C,D,E,F) & congA(P,Q,R,D,E,F)) => ((ltA(A,B,C,P,Q,R)))))).
fof(lemma_angletrichotomy2,axiom, (! [A,B,C,D,E,F] : ((ncol(A,B,C) & ncol(D,E,F) & ncongA(A,B,C,D,E,F) & nltA(D,E,F,A,B,C)) => ((ltA(A,B,C,D,E,F)))))).
fof(defequalangles,axiom, (! [A,B,C,Ca,Cb,Cc] : (? [U,V,Su,Sv] : ((congA(A,B,C,Ca,Cb,Cc)) => ((out(B,A,U) & out(B,C,V) & out(Cb,Ca,Su) & out(Cb,Cc,Sv) & cong(B,U,Cb,Su) & cong(B,V,Cb,Sv) & cong(U,V,Su,Sv) & ncol(A,B,C))))))).
fof(defequalangles2,axiom, (! [A,B,C,Ca,Cb,Cc,U,V,Su,Sv] : ((out(B,A,U) & out(B,C,V) & out(Cb,Ca,Su) & out(Cb,Cc,Sv) & cong(B,U,Cb,Su) & cong(B,V,Cb,Sv) & cong(U,V,Su,Sv) & ncol(A,B,C)) => ((congA(A,B,C,Ca,Cb,Cc)))))).
fof(lemma_layoffunique,axiom, (! [A,B,C,D] : ((out(A,B,C) & out(A,B,D) & cong(A,C,A,D)) => ((eq(C,D)))))).
fof(lemma_raystrict,axiom, (! [A,B,C] : ((out(A,B,C)) => ((neq(A,C)))))).
fof(lemma_sameside2,axiom, (! [A,B,C,E,F,G] : ((oS(E,F,A,C) & col(A,B,C) & out(B,F,G)) => ((oS(E,G,A,C)))))).
fof(proposition_07,axiom, (! [A,B,C,D] : ((neq(A,B) & cong(C,A,D,A) & cong(C,B,D,B) & oS(C,D,A,B)) => ((eq(C,D)))))).
fof(lemma_collinearparallel,axiom, (! [A,B,C,Xc,Xd] : ((par(A,B,Xc,Xd) & col(Xc,Xd,C) & neq(C,Xd)) => ((par(A,B,C,Xd)))))).
fof(lemma_parallelsymmetric,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) => ((par(C,D,A,B)))))).
fof(lemma_triangletoparallelogram,axiom, (! [A,C,D,E,F] : (? [X] : ((par(D,C,E,F) & col(E,F,A)) => ((pG(A,X,C,D) & col(E,F,X))))))).
fof(lemma_PGflip,axiom, (! [A,B,C,D] : ((pG(A,B,C,D)) => ((pG(B,A,D,C)))))).
fof(lemma_PGrotate,axiom, (! [A,B,C,D] : ((pG(A,B,C,D)) => ((pG(B,C,D,A)))))).
fof(defparallelogram,axiom, (! [A,B,C,D] : ((pG(A,B,C,D)) => ((par(A,B,C,D) & par(A,D,B,C)))))).
fof(defparallelogram2,axiom, (! [A,B,C,D] : ((par(A,B,C,D) & par(A,D,B,C)) => ((pG(A,B,C,D)))))).
fof(lemma_parallelNC,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) => ((ncol(A,B,C) & ncol(A,C,D) & ncol(B,C,D) & ncol(A,B,D)))))).
fof(lemma_collinear5,axiom, (! [A,B,C,D,E] : ((neq(A,B) & col(A,B,C) & col(A,B,D) & col(A,B,E)) => ((col(C,D,E)))))).
fof(proposition_41,axiom, (! [A,B,C,D,E] : ((pG(A,B,C,D) & col(A,D,E)) => ((eT(A,B,C,E,B,C)))))).
fof(lemma_parallelflip,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) => ((par(B,A,C,D) & par(A,B,D,C) & par(B,A,D,C)))))).
fof(proposition_38,axiom, (! [A,B,C,D,E,F,P,Q] : ((par(P,Q,B,C) & col(P,Q,A) & col(P,Q,D) & cong(B,C,E,F) & col(B,C,E) & col(B,C,F)) => ((eT(A,B,C,D,E,F)))))).
fof(axiom_ETsymmetric,axiom, (! [A,B,C,Ca,Cb,Cc] : ((eT(A,B,C,Ca,Cb,Cc)) => ((eT(Ca,Cb,Cc,A,B,C)))))).
fof(axiom_ETpermutation,axiom, (! [A,B,C,Ca,Cb,Cc] : ((eT(A,B,C,Ca,Cb,Cc)) => ((eT(A,B,C,Cb,Cc,Ca) & eT(A,B,C,Ca,Cc,Cb) & eT(A,B,C,Cb,Ca,Cc) & eT(A,B,C,Cc,Cb,Ca) & eT(A,B,C,Cc,Ca,Cb)))))).
fof(defoppositeside,axiom, (! [P,A,B,Q] : (? [X] : ((tS(P,A,B,Q)) => ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P))))))).
fof(defoppositeside2,axiom, (! [P,A,B,Q,X] : ((betS(P,X,Q) & col(A,B,X) & ncol(A,B,P)) => ((tS(P,A,B,Q)))))).
fof(proposition_34,axiom, (! [A,B,C,D] : ((pG(A,C,D,B)) => ((cong(A,B,C,D) & cong(A,C,B,D) & congA(C,A,B,B,D,C) & congA(A,B,D,D,C,A) & cong_3(C,A,B,B,D,C)))))).
fof(axiom_congruentequal,axiom, (! [A,B,C,Ca,Cb,Cc] : ((cong_3(A,B,C,Ca,Cb,Cc)) => ((eT(A,B,C,Ca,Cb,Cc)))))).
fof(lemma_diagonalsmeet,axiom, (! [A,B,C,D] : (? [X] : ((pG(A,B,C,D)) => ((betS(A,X,C) & betS(B,X,D))))))).
fof(axiom_ETtransitive,axiom, (! [A,B,C,P,Q,R,Ca,Cb,Cc] : ((eT(A,B,C,Ca,Cb,Cc) & eT(Ca,Cb,Cc,P,Q,R)) => ((eT(A,B,C,P,Q,R)))))).
fof(axiom_paste3_1_1,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & betS(A,M,B) & betS(Cc,Cm,Cd) & betS(Ca,Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_1_2,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(A,M) & betS(Cc,Cm,Cd) & betS(Ca,Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_1_3,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(M,B) & betS(Cc,Cm,Cd) & betS(Ca,Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_2_1,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & betS(A,M,B) & betS(Cc,Cm,Cd) & eq(Ca,Cm)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_2_2,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(A,M) & betS(Cc,Cm,Cd) & eq(Ca,Cm)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_2_3,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(M,B) & betS(Cc,Cm,Cd) & eq(Ca,Cm)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_3_1,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & betS(A,M,B) & betS(Cc,Cm,Cd) & eq(Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_3_2,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(A,M) & betS(Cc,Cm,Cd) & eq(Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(axiom_paste3_3_3,axiom, (! [A,B,C,D,M,Ca,Cb,Cc,Cd,Cm] : ((eT(A,B,C,Ca,Cb,Cc) & eT(A,B,D,Ca,Cb,Cd) & betS(C,M,D) & eq(M,B) & betS(Cc,Cm,Cd) & eq(Cm,Cb)) => ((eF(A,C,B,D,Ca,Cc,Cb,Cd)))))).
fof(lemma_equalanglesreflexive,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((congA(A,B,C,A,B,C)))))).
fof(lemma_oppositesidesymmetric,axiom, (! [A,B,P,Q] : ((tS(P,A,B,Q)) => ((tS(Q,A,B,P)))))).
fof(lemma_planeseparation,axiom, (! [A,B,C,D,E] : ((oS(C,D,A,B) & tS(D,A,B,E)) => ((tS(C,A,B,E)))))).
fof(defparallel,axiom, (! [A,B,C,D] : (? [U,V,Su,Sv,X] : ((par(A,B,C,D)) => ((neq(A,B) & neq(C,D) & col(A,B,U) & col(A,B,V) & neq(U,V) & col(C,D,Su) & col(C,D,Sv) & neq(Su,Sv) & nmeet(A,B,C,D) & betS(U,X,Sv) & betS(Su,X,V))))))).
fof(defparallel2,axiom, (! [A,B,C,D,U,V,Su,Sv,X] : ((neq(A,B) & neq(C,D) & col(A,B,U) & col(A,B,V) & neq(U,V) & col(C,D,Su) & col(C,D,Sv) & neq(Su,Sv) & nmeet(A,B,C,D) & betS(U,X,Sv) & betS(Su,X,V)) => ((par(A,B,C,D)))))).
fof(lemma_equalangleshelper,axiom, (! [A,B,C,Xa,Xb,Xc,Xp,Xq] : ((congA(A,B,C,Xa,Xb,Xc) & out(Xb,Xa,Xp) & out(Xb,Xc,Xq)) => ((congA(A,B,C,Xp,Xb,Xq)))))).
fof(lemma_equalanglesflip,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F)) => ((congA(C,B,A,F,E,D)))))).
fof(lemma_equalanglestransitive,axiom, (! [A,B,C,D,E,F,P,Q,R] : ((congA(A,B,C,D,E,F) & congA(D,E,F,P,Q,R)) => ((congA(A,B,C,P,Q,R)))))).
fof(eqSymmetric,axiom, (! [A,B] : ((eq(A,B)) => ((eq(B,A)))))).
fof(neqSymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(eqReflexive,axiom, (! [A] : ((eq(A,A))))).
fof(midpoint_neg_elim,axiom, (! [A,B,C] : ((midpoint(A,B,C) & nmidpoint(A,B,C)) => (($false))))).
fof(betS_neg_elim,axiom, (! [A,B,C] : ((betS(A,B,C) & nbetS(A,B,C)) => (($false))))).
fof(cong_neg_elim,axiom, (! [A,B,C,D] : ((cong(A,B,C,D) & ncong(A,B,C,D)) => (($false))))).
fof(triangle_neg_elim,axiom, (! [A,B,C] : ((triangle(A,B,C) & ntriangle(A,B,C)) => (($false))))).
fof(col_neg_elim,axiom, (! [A,B,C] : ((col(A,B,C) & ncol(A,B,C)) => (($false))))).
fof(eq_neg_elim,axiom, (! [A,B] : ((eq(A,B) & neq(A,B)) => (($false))))).
fof(out_neg_elim,axiom, (! [A,B,C] : ((out(A,B,C) & nout(A,B,C)) => (($false))))).
fof(congA_neg_elim,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F) & ncongA(A,B,C,D,E,F)) => (($false))))).
fof(oS_neg_elim,axiom, (! [A,B,C,D] : ((oS(A,B,C,D) & noS(A,B,C,D)) => (($false))))).
fof(par_neg_elim,axiom, (! [A,B,C,D] : ((par(A,B,C,D) & npar(A,B,C,D)) => (($false))))).
fof(ltA_neg_elim,axiom, (! [A,B,C,D,E,F] : ((ltA(A,B,C,D,E,F) & nltA(A,B,C,D,E,F)) => (($false))))).
fof(meet_neg_elim,axiom, (! [A,B,C,D] : ((meet(A,B,C,D) & nmeet(A,B,C,D)) => (($false))))).
fof(supp_neg_elim,axiom, (! [A,B,C,D,E] : ((supp(A,B,C,D,E) & nsupp(A,B,C,D,E)) => (($false))))).
fof(pG_neg_elim,axiom, (! [A,B,C,D] : ((pG(A,B,C,D) & npG(A,B,C,D)) => (($false))))).
fof(eT_neg_elim,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F) & neT(A,B,C,D,E,F)) => (($false))))).
fof(tS_neg_elim,axiom, (! [A,B,C,D] : ((tS(A,B,C,D) & ntS(A,B,C,D)) => (($false))))).
fof(eF_neg_elim,axiom, (! [A,B,C,D,E,F,G,H] : ((eF(A,B,C,D,E,F,G,H) & neF(A,B,C,D,E,F,G,H)) => (($false))))).
fof(midpoint_excluded_middle,axiom, (! [A,B,C] : ((midpoint(A,B,C)) | (nmidpoint(A,B,C))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(cong_excluded_middle,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) | (ncong(A,B,C,D))))).
fof(triangle_excluded_middle,axiom, (! [A,B,C] : ((triangle(A,B,C)) | (ntriangle(A,B,C))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(out_excluded_middle,axiom, (! [A,B,C] : ((out(A,B,C)) | (nout(A,B,C))))).
fof(congA_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F)) | (ncongA(A,B,C,D,E,F))))).
fof(oS_excluded_middle,axiom, (! [A,B,C,D] : ((oS(A,B,C,D)) | (noS(A,B,C,D))))).
fof(par_excluded_middle,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) | (npar(A,B,C,D))))).
fof(ltA_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((ltA(A,B,C,D,E,F)) | (nltA(A,B,C,D,E,F))))).
fof(meet_excluded_middle,axiom, (! [A,B,C,D] : ((meet(A,B,C,D)) | (nmeet(A,B,C,D))))).
fof(supp_excluded_middle,axiom, (! [A,B,C,D,E] : ((supp(A,B,C,D,E)) | (nsupp(A,B,C,D,E))))).
fof(pG_excluded_middle,axiom, (! [A,B,C,D] : ((pG(A,B,C,D)) | (npG(A,B,C,D))))).
fof(eT_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F)) | (neT(A,B,C,D,E,F))))).
fof(tS_excluded_middle,axiom, (! [A,B,C,D] : ((tS(A,B,C,D)) | (ntS(A,B,C,D))))).
fof(eF_excluded_middle,axiom, (! [A,B,C,D,E,F,G,H] : ((eF(A,B,C,D,E,F,G,H)) | (neF(A,B,C,D,E,F,G,H))))).
fof(midpoint_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & midpoint(A,B,C)) => ((midpoint(X,B,C)))))).
fof(midpoint_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & midpoint(A,B,C)) => ((midpoint(A,X,C)))))).
fof(midpoint_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & midpoint(A,B,C)) => ((midpoint(A,B,X)))))).
fof(nmidpoint_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nmidpoint(A,B,C)) => ((nmidpoint(X,B,C)))))).
fof(nmidpoint_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nmidpoint(A,B,C)) => ((nmidpoint(A,X,C)))))).
fof(nmidpoint_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nmidpoint(A,B,C)) => ((nmidpoint(A,B,X)))))).
fof(betS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & betS(A,B,C)) => ((betS(X,B,C)))))).
fof(betS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & betS(A,B,C)) => ((betS(A,X,C)))))).
fof(betS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & betS(A,B,C)) => ((betS(A,B,X)))))).
fof(nbetS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nbetS(A,B,C)) => ((nbetS(X,B,C)))))).
fof(nbetS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nbetS(A,B,C)) => ((nbetS(A,X,C)))))).
fof(nbetS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nbetS(A,B,C)) => ((nbetS(A,B,X)))))).
fof(cong_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & cong(A,B,C,D)) => ((cong(X,B,C,D)))))).
fof(cong_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & cong(A,B,C,D)) => ((cong(A,X,C,D)))))).
fof(cong_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & cong(A,B,C,D)) => ((cong(A,B,X,D)))))).
fof(cong_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & cong(A,B,C,D)) => ((cong(A,B,C,X)))))).
fof(ncong_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & ncong(A,B,C,D)) => ((ncong(X,B,C,D)))))).
fof(ncong_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & ncong(A,B,C,D)) => ((ncong(A,X,C,D)))))).
fof(ncong_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & ncong(A,B,C,D)) => ((ncong(A,B,X,D)))))).
fof(ncong_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & ncong(A,B,C,D)) => ((ncong(A,B,C,X)))))).
fof(triangle_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & triangle(A,B,C)) => ((triangle(X,B,C)))))).
fof(triangle_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & triangle(A,B,C)) => ((triangle(A,X,C)))))).
fof(triangle_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & triangle(A,B,C)) => ((triangle(A,B,X)))))).
fof(ntriangle_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & ntriangle(A,B,C)) => ((ntriangle(X,B,C)))))).
fof(ntriangle_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & ntriangle(A,B,C)) => ((ntriangle(A,X,C)))))).
fof(ntriangle_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & ntriangle(A,B,C)) => ((ntriangle(A,B,X)))))).
fof(col_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & col(A,B,C)) => ((col(X,B,C)))))).
fof(col_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & col(A,B,C)) => ((col(A,X,C)))))).
fof(col_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & col(A,B,C)) => ((col(A,B,X)))))).
fof(ncol_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & ncol(A,B,C)) => ((ncol(X,B,C)))))).
fof(ncol_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & ncol(A,B,C)) => ((ncol(A,X,C)))))).
fof(ncol_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & ncol(A,B,C)) => ((ncol(A,B,X)))))).
fof(eq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & eq(A,B)) => ((eq(X,B)))))).
fof(eq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & eq(A,B)) => ((eq(A,X)))))).
fof(neq_EqSub_0,axiom, (! [A,B,X] : ((eq(A,X) & neq(A,B)) => ((neq(X,B)))))).
fof(neq_EqSub_1,axiom, (! [A,B,X] : ((eq(B,X) & neq(A,B)) => ((neq(A,X)))))).
fof(out_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & out(A,B,C)) => ((out(X,B,C)))))).
fof(out_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & out(A,B,C)) => ((out(A,X,C)))))).
fof(out_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & out(A,B,C)) => ((out(A,B,X)))))).
fof(nout_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nout(A,B,C)) => ((nout(X,B,C)))))).
fof(nout_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nout(A,B,C)) => ((nout(A,X,C)))))).
fof(nout_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nout(A,B,C)) => ((nout(A,B,X)))))).
fof(congA_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & congA(A,B,C,D,E,F)) => ((congA(X,B,C,D,E,F)))))).
fof(congA_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & congA(A,B,C,D,E,F)) => ((congA(A,X,C,D,E,F)))))).
fof(congA_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & congA(A,B,C,D,E,F)) => ((congA(A,B,X,D,E,F)))))).
fof(congA_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & congA(A,B,C,D,E,F)) => ((congA(A,B,C,X,E,F)))))).
fof(congA_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & congA(A,B,C,D,E,F)) => ((congA(A,B,C,D,X,F)))))).
fof(congA_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & congA(A,B,C,D,E,F)) => ((congA(A,B,C,D,E,X)))))).
fof(ncongA_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(X,B,C,D,E,F)))))).
fof(ncongA_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(A,X,C,D,E,F)))))).
fof(ncongA_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(A,B,X,D,E,F)))))).
fof(ncongA_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(A,B,C,X,E,F)))))).
fof(ncongA_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(A,B,C,D,X,F)))))).
fof(ncongA_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & ncongA(A,B,C,D,E,F)) => ((ncongA(A,B,C,D,E,X)))))).
fof(oS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & oS(A,B,C,D)) => ((oS(X,B,C,D)))))).
fof(oS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & oS(A,B,C,D)) => ((oS(A,X,C,D)))))).
fof(oS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & oS(A,B,C,D)) => ((oS(A,B,X,D)))))).
fof(oS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & oS(A,B,C,D)) => ((oS(A,B,C,X)))))).
fof(noS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & noS(A,B,C,D)) => ((noS(X,B,C,D)))))).
fof(noS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & noS(A,B,C,D)) => ((noS(A,X,C,D)))))).
fof(noS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & noS(A,B,C,D)) => ((noS(A,B,X,D)))))).
fof(noS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & noS(A,B,C,D)) => ((noS(A,B,C,X)))))).
fof(par_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & par(A,B,C,D)) => ((par(X,B,C,D)))))).
fof(par_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & par(A,B,C,D)) => ((par(A,X,C,D)))))).
fof(par_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & par(A,B,C,D)) => ((par(A,B,X,D)))))).
fof(par_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & par(A,B,C,D)) => ((par(A,B,C,X)))))).
fof(npar_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & npar(A,B,C,D)) => ((npar(X,B,C,D)))))).
fof(npar_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & npar(A,B,C,D)) => ((npar(A,X,C,D)))))).
fof(npar_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & npar(A,B,C,D)) => ((npar(A,B,X,D)))))).
fof(npar_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & npar(A,B,C,D)) => ((npar(A,B,C,X)))))).
fof(ltA_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & ltA(A,B,C,D,E,F)) => ((ltA(X,B,C,D,E,F)))))).
fof(ltA_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & ltA(A,B,C,D,E,F)) => ((ltA(A,X,C,D,E,F)))))).
fof(ltA_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & ltA(A,B,C,D,E,F)) => ((ltA(A,B,X,D,E,F)))))).
fof(ltA_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & ltA(A,B,C,D,E,F)) => ((ltA(A,B,C,X,E,F)))))).
fof(ltA_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & ltA(A,B,C,D,E,F)) => ((ltA(A,B,C,D,X,F)))))).
fof(ltA_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & ltA(A,B,C,D,E,F)) => ((ltA(A,B,C,D,E,X)))))).
fof(nltA_EqSub_0,axiom, (! [A,B,C,D,E,F,X] : ((eq(A,X) & nltA(A,B,C,D,E,F)) => ((nltA(X,B,C,D,E,F)))))).
fof(nltA_EqSub_1,axiom, (! [A,B,C,D,E,F,X] : ((eq(B,X) & nltA(A,B,C,D,E,F)) => ((nltA(A,X,C,D,E,F)))))).
fof(nltA_EqSub_2,axiom, (! [A,B,C,D,E,F,X] : ((eq(C,X) & nltA(A,B,C,D,E,F)) => ((nltA(A,B,X,D,E,F)))))).
fof(nltA_EqSub_3,axiom, (! [A,B,C,D,E,F,X] : ((eq(D,X) & nltA(A,B,C,D,E,F)) => ((nltA(A,B,C,X,E,F)))))).
fof(nltA_EqSub_4,axiom, (! [A,B,C,D,E,F,X] : ((eq(E,X) & nltA(A,B,C,D,E,F)) => ((nltA(A,B,C,D,X,F)))))).
fof(nltA_EqSub_5,axiom, (! [A,B,C,D,E,F,X] : ((eq(F,X) & nltA(A,B,C,D,E,F)) => ((nltA(A,B,C,D,E,X)))))).
fof(meet_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & meet(A,B,C,D)) => ((meet(X,B,C,D)))))).
fof(meet_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & meet(A,B,C,D)) => ((meet(A,X,C,D)))))).
fof(meet_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & meet(A,B,C,D)) => ((meet(A,B,X,D)))))).
fof(meet_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & meet(A,B,C,D)) => ((meet(A,B,C,X)))))).
fof(nmeet_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & nmeet(A,B,C,D)) => ((nmeet(X,B,C,D)))))).
fof(nmeet_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & nmeet(A,B,C,D)) => ((nmeet(A,X,C,D)))))).
fof(nmeet_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & nmeet(A,B,C,D)) => ((nmeet(A,B,X,D)))))).
fof(nmeet_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & nmeet(A,B,C,D)) => ((nmeet(A,B,C,X)))))).
fof(supp_EqSub_0,axiom, (! [A,B,C,D,E,X] : ((eq(A,X) & supp(A,B,C,D,E)) => ((supp(X,B,C,D,E)))))).
fof(supp_EqSub_1,axiom, (! [A,B,C,D,E,X] : ((eq(B,X) & supp(A,B,C,D,E)) => ((supp(A,X,C,D,E)))))).
fof(supp_EqSub_2,axiom, (! [A,B,C,D,E,X] : ((eq(C,X) & supp(A,B,C,D,E)) => ((supp(A,B,X,D,E)))))).
fof(supp_EqSub_3,axiom, (! [A,B,C,D,E,X] : ((eq(D,X) & supp(A,B,C,D,E)) => ((supp(A,B,C,X,E)))))).
fof(supp_EqSub_4,axiom, (! [A,B,C,D,E,X] : ((eq(E,X) & supp(A,B,C,D,E)) => ((supp(A,B,C,D,X)))))).
fof(nsupp_EqSub_0,axiom, (! [A,B,C,D,E,X] : ((eq(A,X) & nsupp(A,B,C,D,E)) => ((nsupp(X,B,C,D,E)))))).
fof(nsupp_EqSub_1,axiom, (! [A,B,C,D,E,X] : ((eq(B,X) & nsupp(A,B,C,D,E)) => ((nsupp(A,X,C,D,E)))))).
fof(nsupp_EqSub_2,axiom, (! [A,B,C,D,E,X] : ((eq(C,X) & nsupp(A,B,C,D,E)) => ((nsupp(A,B,X,D,E)))))).
fof(nsupp_EqSub_3,axiom, (! [A,B,C,D,E,X] : ((eq(D,X) & nsupp(A,B,C,D,E)) => ((nsupp(A,B,C,X,E)))))).
fof(nsupp_EqSub_4,axiom, (! [A,B,C,D,E,X] : ((eq(E,X) & nsupp(A,B,C,D,E)) => ((nsupp(A,B,C,D,X)))))).
fof(pG_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & pG(A,B,C,D)) => ((pG(X,B,C,D)))))).
fof(pG_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & pG(A,B,C,D)) => ((pG(A,X,C,D)))))).
fof(pG_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & pG(A,B,C,D)) => ((pG(A,B,X,D)))))).
fof(pG_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & pG(A,B,C,D)) => ((pG(A,B,C,X)))))).
fof(npG_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & npG(A,B,C,D)) => ((npG(X,B,C,D)))))).
fof(npG_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & npG(A,B,C,D)) => ((npG(A,X,C,D)))))).
fof(npG_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & npG(A,B,C,D)) => ((npG(A,B,X,D)))))).
fof(npG_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & npG(A,B,C,D)) => ((npG(A,B,C,X)))))).
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
fof(tS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & tS(A,B,C,D)) => ((tS(X,B,C,D)))))).
fof(tS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & tS(A,B,C,D)) => ((tS(A,X,C,D)))))).
fof(tS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & tS(A,B,C,D)) => ((tS(A,B,X,D)))))).
fof(tS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & tS(A,B,C,D)) => ((tS(A,B,C,X)))))).
fof(ntS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & ntS(A,B,C,D)) => ((ntS(X,B,C,D)))))).
fof(ntS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & ntS(A,B,C,D)) => ((ntS(A,X,C,D)))))).
fof(ntS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & ntS(A,B,C,D)) => ((ntS(A,B,X,D)))))).
fof(ntS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & ntS(A,B,C,D)) => ((ntS(A,B,C,X)))))).
fof(eF_EqSub_0,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(A,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(X,B,C,D,E,F,G,H)))))).
fof(eF_EqSub_1,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(B,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,X,C,D,E,F,G,H)))))).
fof(eF_EqSub_2,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(C,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,X,D,E,F,G,H)))))).
fof(eF_EqSub_3,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(D,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,C,X,E,F,G,H)))))).
fof(eF_EqSub_4,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(E,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,C,D,X,F,G,H)))))).
fof(eF_EqSub_5,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(F,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,C,D,E,X,G,H)))))).
fof(eF_EqSub_6,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(G,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,C,D,E,F,X,H)))))).
fof(eF_EqSub_7,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(H,X) & eF(A,B,C,D,E,F,G,H)) => ((eF(A,B,C,D,E,F,G,X)))))).
fof(neF_EqSub_0,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(A,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(X,B,C,D,E,F,G,H)))))).
fof(neF_EqSub_1,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(B,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,X,C,D,E,F,G,H)))))).
fof(neF_EqSub_2,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(C,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,X,D,E,F,G,H)))))).
fof(neF_EqSub_3,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(D,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,C,X,E,F,G,H)))))).
fof(neF_EqSub_4,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(E,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,C,D,X,F,G,H)))))).
fof(neF_EqSub_5,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(F,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,C,D,E,X,G,H)))))).
fof(neF_EqSub_6,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(G,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,C,D,E,F,X,H)))))).
fof(neF_EqSub_7,axiom, (! [A,B,C,D,E,F,G,H,X] : ((eq(H,X) & neF(A,B,C,D,E,F,G,H)) => ((neF(A,B,C,D,E,F,G,X)))))).
fof(proposition_42,conjecture,(  ! [A,B,C,D,E,J,K] : ((triangle(A,B,C) & ncol(J,D,K) & midpoint(B,E,C)) => ? [X,Z] : (pG(X,E,C,Z) & eF(A,B,E,C,X,E,C,Z) & congA(C,E,X,J,D,K) & col(X,Z,A))))).