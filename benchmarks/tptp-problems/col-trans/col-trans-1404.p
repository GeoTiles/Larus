include('col-axioms.ax').

fof(pipo,conjecture,
(! [O, E, AB, ABprime] : ( (
 wd( O, E) &
 wd( O, E) & col( O, E, AB) & col( O, E, ABprime) ) => col( AB, O, ABprime))  )).
