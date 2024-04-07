speaks(bob,english).
speaks(mary,rushian).
speaks(allen,english).
speaks(mary,english).

speakswith(P1,P2) :- speaks(P1,L), speaks(P2,L), P1\==P2.

