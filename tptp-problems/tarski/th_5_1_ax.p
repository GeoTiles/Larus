fof(ax_4_1_1,axiom,(![A,B,C,D,A1,B1,C1,D1]:(ifs(A,B,C,D,A1,B1,C1,D1)=>(bet(A,B,C)&bet(A1,B1,C1)&cong(A,C,A1,C1)&cong(B,C,B1,C1)&cong(A,D,A1,D1)&cong(C,D,C1,D1))))).
fof(ax_4_1_2,axiom,(![A,B,C,D,A1,B1,C1,D1]:((bet(A,B,C)&bet(A1,B1,C1)&cong(A,C,A1,C1)&cong(B,C,B1,C1)&cong(A,D,A1,D1)&cong(C,D,C1,D1))=>(ifs(A,B,C,D,A1,B1,C1,D1))))).
fof(ax_4_15_1,axiom,(![A,B,C,D,A1,B1,C1,D1]:((fs(A,B,C,D,A1,B1,C1,D1))=>(col(A,B,C)&cong3(A,B,C,A1,B1,C1)&cong(A,D,A1,D1)&cong(B,D,B1,D1))))).
fof(ax_4_15_2,axiom,(![A,B,C,D,A1,B1,C1,D1]:((col(A,B,C)&cong3(A,B,C,A1,B1,C1)&cong(A,D,A1,D1)&cong(B,D,B1,D1))=>(fs(A,B,C,D,A1,B1,C1,D1))))).
fof(ax_4_10_1,axiom,(![A,B,C]:((col(A,B,C))=>(bet(A,B,C)|bet(B,C,A)|bet(C,A,B))))).
fof(ax_4_10_2,axiom,(![A,B,C]:((bet(A,B,C))=>col(A,B,C)))).
fof(ax_4_10_3,axiom,(![A,B,C]:((bet(B,C,A))=>col(A,B,C)))).
fof(ax_4_10_4,axiom,(![A,B,C]:((bet(C,A,B))=>col(A,B,C)))).
fof(ax_4_4_1,axiom,(![A,B,C,A1,B1,C1]:((cong3(A,B,C,A1,B1,C1))=>(cong(A,B,A1,B1)&cong(A,C,A1,C1)&cong(B,C,B1,C1))))).
fof(ax_4_4_2,axiom,(![A,B,C,A1,B1,C1]:((cong(A,B,A1,B1)&cong(A,C,A1,C1)&cong(B,C,B1,C1))=>cong3(A,B,C,A1,B1,C1)))).