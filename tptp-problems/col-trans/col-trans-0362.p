include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, B, X , C] : ( (
 wd( O, B) &
 wd( B, X) &
  wd( O, X) &
   wd( B, C) & col( B, C, X) & col( B, O, C) ) => col( O, B, X)))  ).
