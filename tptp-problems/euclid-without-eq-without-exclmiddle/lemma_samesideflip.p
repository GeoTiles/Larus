fof(defsameside,axiom, (! [P,Q,A,B] : (? [X,U,V] : ((oS(P,Q,A,B)) => ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q))))))).
fof(defsameside2,axiom, (! [P,Q,A,B,X,U,V] : ((col(A,B,U) & col(A,B,V) & betS(P,U,X) & betS(Q,V,X) & ncol(A,B,P) & ncol(A,B,Q)) => ((oS(P,Q,A,B)))))).
fof(lemma_collinearorder,axiom, (! [A,B,C] : ((col(A,B,C)) => ((col(B,A,C) & col(B,C,A) & col(C,A,B) & col(A,C,B) & col(C,B,A)))))).
fof(lemma_NCorder,axiom, (! [A,B,C] : ((ncol(A,B,C)) => ((ncol(B,A,C) & ncol(B,C,A) & ncol(C,A,B) & ncol(A,C,B) & ncol(C,B,A)))))).
fof(lemma_samesideflip,conjecture,(  ! [A,B,P,Q] : ((oS(P,Q,A,B)) => (oS(P,Q,B,A))))).