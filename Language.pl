speaks(bob,english).
speaks(mary,russian).
speaks(allen,russian).
speaks(mary,english).

speakswith(P1,P2) :- speaks(P1,L), speaks(P2,L), P1\==P2.
