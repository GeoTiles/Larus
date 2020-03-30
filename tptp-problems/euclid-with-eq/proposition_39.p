fof(lemma_samesidesymmetric,axiom, (! [A,B,P,Q] : ((oS(P,Q,A,B)) => ((oS(Q,P,A,B) & oS(P,Q,B,A) & oS(Q,P,B,A)))))).
fof(lemma_samesideflip,axiom, (! [A,B,P,Q] : ((oS(P,Q,A,B)) => ((oS(P,Q,B,A)))))).
fof(deftriangle,axiom, (! [A,B,C] : ((triangle(A,B,C)) => ((ncol(A,B,C)))))).
fof(deftriangle2,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((triangle(A,B,C)))))).
fof(lemma_NCdistinct,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((neq(A,B) & neq(B,C) & neq(A,C) & neq(B,A) & neq(C,B) & neq(C,A)))))).
fof(lemma_inequalitysymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(lemma_ray4_1,axiom, (! [A,B,E] : ((betS(A,E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_2,axiom, (! [A,B,E] : ((eq(E,B) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_ray4_3,axiom, (! [A,B,E] : ((betS(A,B,E) & neq(A,B)) => ((out(A,B,E)))))).
fof(lemma_crossbar2,axiom, (! [A,G,H,P,S,T] : (? [X] : ((ltA(H,G,A,H,G,P) & oS(A,P,G,H) & out(G,H,S) & out(G,P,T)) => ((betS(T,X,S) & out(G,A,X))))))).
fof(proposition_39A,axiom, (! [A,B,C,D,M] : ((triangle(A,B,C) & eT(A,B,C,D,B,C) & betS(A,M,C) & out(B,D,M)) => ((par(A,D,B,C)))))).
fof(axiom_ETsymmetric,axiom, (! [A,B,C,Ca,Cb,Cc] : ((eT(A,B,C,Ca,Cb,Cc)) => ((eT(Ca,Cb,Cc,A,B,C)))))).
fof(lemma_parallelflip,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) => ((par(B,A,C,D) & par(A,B,D,C) & par(B,A,D,C)))))).
fof(lemma_NCorder,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((ncol(B,A,C) & ncol(B,C,A) & ncol(C,A,B) & ncol(A,C,B) & ncol(C,B,A)))))).
fof(lemma_angletrichotomy2,axiom, (! [A,B,C,D,E,F] : ((ncol(A,B,C) & ncol(D,E,F) & ncongA(A,B,C,D,E,F) & nltA(D,E,F,A,B,C)) => ((ltA(A,B,C,D,E,F)))))).
fof(axiom_ETpermutation,axiom, (! [A,B,C,Ca,Cb,Cc] : ((eT(A,B,C,Ca,Cb,Cc)) => ((eT(A,B,C,Cb,Cc,Ca) & eT(A,B,C,Ca,Cc,Cb) & eT(A,B,C,Cb,Ca,Cc) & eT(A,B,C,Cc,Cb,Ca) & eT(A,B,C,Cc,Ca,Cb)))))).
fof(lemma_equalanglessymmetric,axiom, (! [A,B,C,Xa,Xb,Xc] : ((congA(A,B,C,Xa,Xb,Xc)) => ((congA(Xa,Xb,Xc,A,B,C)))))).
fof(cn_congruencereflexive,axiom, (! [A,B] : ((cong(A,B,A,B))))).
fof(lemma_equalanglesflip,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F)) => ((congA(C,B,A,F,E,D)))))).
fof(proposition_26A,axiom, (! [A,B,C,D,E,F] : ((triangle(A,B,C) & triangle(D,E,F) & congA(A,B,C,D,E,F) & congA(B,C,A,E,F,D) & cong(B,C,E,F)) => ((cong(A,B,D,E) & cong(A,C,D,F) & congA(B,A,C,E,D,F)))))).
fof(proposition_07,axiom, (! [A,B,C,D] : ((neq(A,B) & cong(C,A,D,A) & cong(C,B,D,B) & oS(C,D,A,B)) => ((eq(C,D)))))).
fof(eqSymmetric,axiom, (! [A,B] : ((eq(A,B)) => ((eq(B,A)))))).
fof(neqSymmetric,axiom, (! [A,B] : ((neq(A,B)) => ((neq(B,A)))))).
fof(eqReflexive,axiom, (! [A] : ((eq(A,A))))).
fof(oS_neg_elim,axiom, (! [A,B,C,D] : ((oS(A,B,C,D) & noS(A,B,C,D)) => (($false))))).
fof(triangle_neg_elim,axiom, (! [A,B,C] : ((triangle(A,B,C) & ntriangle(A,B,C)) => (($false))))).
fof(col_neg_elim,axiom, (! [A,B,C] : ((col(A,B,C) & ncol(A,B,C)) => (($false))))).
fof(eq_neg_elim,axiom, (! [A,B] : ((eq(A,B) & neq(A,B)) => (($false))))).
fof(betS_neg_elim,axiom, (! [A,B,C] : ((betS(A,B,C) & nbetS(A,B,C)) => (($false))))).
fof(out_neg_elim,axiom, (! [A,B,C] : ((out(A,B,C) & nout(A,B,C)) => (($false))))).
fof(ltA_neg_elim,axiom, (! [A,B,C,D,E,F] : ((ltA(A,B,C,D,E,F) & nltA(A,B,C,D,E,F)) => (($false))))).
fof(eT_neg_elim,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F) & neT(A,B,C,D,E,F)) => (($false))))).
fof(par_neg_elim,axiom, (! [A,B,C,D] : ((par(A,B,C,D) & npar(A,B,C,D)) => (($false))))).
fof(congA_neg_elim,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F) & ncongA(A,B,C,D,E,F)) => (($false))))).
fof(cong_neg_elim,axiom, (! [A,B,C,D] : ((cong(A,B,C,D) & ncong(A,B,C,D)) => (($false))))).
fof(oS_excluded_middle,axiom, (! [A,B,C,D] : ((oS(A,B,C,D)) | (noS(A,B,C,D))))).
fof(triangle_excluded_middle,axiom, (! [A,B,C] : ((triangle(A,B,C)) | (ntriangle(A,B,C))))).
fof(col_excluded_middle,axiom, (! [A,B,C] : ((col(A,B,C)) | (ncol(A,B,C))))).
fof(eq_excluded_middle,axiom, (! [A,B] : ((eq(A,B)) | (neq(A,B))))).
fof(betS_excluded_middle,axiom, (! [A,B,C] : ((betS(A,B,C)) | (nbetS(A,B,C))))).
fof(out_excluded_middle,axiom, (! [A,B,C] : ((out(A,B,C)) | (nout(A,B,C))))).
fof(ltA_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((ltA(A,B,C,D,E,F)) | (nltA(A,B,C,D,E,F))))).
fof(eT_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((eT(A,B,C,D,E,F)) | (neT(A,B,C,D,E,F))))).
fof(par_excluded_middle,axiom, (! [A,B,C,D] : ((par(A,B,C,D)) | (npar(A,B,C,D))))).
fof(congA_excluded_middle,axiom, (! [A,B,C,D,E,F] : ((congA(A,B,C,D,E,F)) | (ncongA(A,B,C,D,E,F))))).
fof(cong_excluded_middle,axiom, (! [A,B,C,D] : ((cong(A,B,C,D)) | (ncong(A,B,C,D))))).
fof(oS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & oS(A,B,C,D)) => ((oS(X,B,C,D)))))).
fof(oS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & oS(A,B,C,D)) => ((oS(A,X,C,D)))))).
fof(oS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & oS(A,B,C,D)) => ((oS(A,B,X,D)))))).
fof(oS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & oS(A,B,C,D)) => ((oS(A,B,C,X)))))).
fof(noS_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & noS(A,B,C,D)) => ((noS(X,B,C,D)))))).
fof(noS_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & noS(A,B,C,D)) => ((noS(A,X,C,D)))))).
fof(noS_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & noS(A,B,C,D)) => ((noS(A,B,X,D)))))).
fof(noS_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & noS(A,B,C,D)) => ((noS(A,B,C,X)))))).
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
fof(betS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & betS(A,B,C)) => ((betS(X,B,C)))))).
fof(betS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & betS(A,B,C)) => ((betS(A,X,C)))))).
fof(betS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & betS(A,B,C)) => ((betS(A,B,X)))))).
fof(nbetS_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nbetS(A,B,C)) => ((nbetS(X,B,C)))))).
fof(nbetS_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nbetS(A,B,C)) => ((nbetS(A,X,C)))))).
fof(nbetS_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nbetS(A,B,C)) => ((nbetS(A,B,X)))))).
fof(out_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & out(A,B,C)) => ((out(X,B,C)))))).
fof(out_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & out(A,B,C)) => ((out(A,X,C)))))).
fof(out_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & out(A,B,C)) => ((out(A,B,X)))))).
fof(nout_EqSub_0,axiom, (! [A,B,C,X] : ((eq(A,X) & nout(A,B,C)) => ((nout(X,B,C)))))).
fof(nout_EqSub_1,axiom, (! [A,B,C,X] : ((eq(B,X) & nout(A,B,C)) => ((nout(A,X,C)))))).
fof(nout_EqSub_2,axiom, (! [A,B,C,X] : ((eq(C,X) & nout(A,B,C)) => ((nout(A,B,X)))))).
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
fof(par_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & par(A,B,C,D)) => ((par(X,B,C,D)))))).
fof(par_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & par(A,B,C,D)) => ((par(A,X,C,D)))))).
fof(par_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & par(A,B,C,D)) => ((par(A,B,X,D)))))).
fof(par_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & par(A,B,C,D)) => ((par(A,B,C,X)))))).
fof(npar_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & npar(A,B,C,D)) => ((npar(X,B,C,D)))))).
fof(npar_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & npar(A,B,C,D)) => ((npar(A,X,C,D)))))).
fof(npar_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & npar(A,B,C,D)) => ((npar(A,B,X,D)))))).
fof(npar_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & npar(A,B,C,D)) => ((npar(A,B,C,X)))))).
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
fof(cong_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & cong(A,B,C,D)) => ((cong(X,B,C,D)))))).
fof(cong_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & cong(A,B,C,D)) => ((cong(A,X,C,D)))))).
fof(cong_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & cong(A,B,C,D)) => ((cong(A,B,X,D)))))).
fof(cong_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & cong(A,B,C,D)) => ((cong(A,B,C,X)))))).
fof(ncong_EqSub_0,axiom, (! [A,B,C,D,X] : ((eq(A,X) & ncong(A,B,C,D)) => ((ncong(X,B,C,D)))))).
fof(ncong_EqSub_1,axiom, (! [A,B,C,D,X] : ((eq(B,X) & ncong(A,B,C,D)) => ((ncong(A,X,C,D)))))).
fof(ncong_EqSub_2,axiom, (! [A,B,C,D,X] : ((eq(C,X) & ncong(A,B,C,D)) => ((ncong(A,B,X,D)))))).
fof(ncong_EqSub_3,axiom, (! [A,B,C,D,X] : ((eq(D,X) & ncong(A,B,C,D)) => ((ncong(A,B,C,X)))))).
fof(proposition_39,conjecture,(  ! [A,B,C,D] : ((triangle(A,B,C) & triangle(D,B,C) & oS(A,D,B,C) & eT(A,B,C,D,B,C) & neq(A,D)) => (par(A,D,B,C))))).