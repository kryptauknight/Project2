%Grid rooms instanciation
room(1,1).
room(1,2).
room(1,3).
room(1,4).
room(2,1).
room(2,2).
room(2,3).
room(2,4).
room(3,1).
room(3,2).
room(3,3).
room(3,4).
room(4,1).
room(4,2).
room(4,3).
room(4,4).
%Current location of agent
location(room(2,3)).

%stench Locations
stench(room(1,2)).
stench(room(1,4)).
stench(room(2,3)).

%breeze Locations    
breeze(room(2,1)).
breeze(room(4,1)).
breeze(room(3,2)).
breeze(room(3,4)).
breeze(room(2,3)).
breeze(room(4,3)).

safe(room(X,Y)):-
    room(X,Y),
    room(W,Z),
    room(Q,S),
	not(pit(room(W,Z))),
	not(wumpus(room(Q,S))).


%Gold Location
glitter(room(2,3)).

%Existance of a pit in a location
pit(room(A,B)) :-
    room(A,B),
    room(C,D),
    room(E,F),
    room(G,H),
    room(I,J),
    breeze(room(C,D)),
    breeze(room(E,F)),
    breeze(room(G,H)),
    breeze(room(I,J)),
    adjacentTo(room(E,F),room(A,B)),
    adjacentTo(room(C,D),room(A,B)),
	adjacentTo(room(G,H),room(A,B)),
    adjacentTo(room(I,J),room(A,B)).
    

%Is there Gold in a location
gold(room(X,Y)) :-
    room(X,Y),
    location(room(X,Y)),
	glitter(room(X,Y)).

%Can You grab Gold
grabGold(location):-
    gold(room(W,Z)),
    location(room(X,Y)),
    X =:= W,
    Y =:= Z.

%There is a wumpus in a location
wumpus(room(A,B)) :-
    room(C,D),
    room(A,B),
    stench(room(C,D)),
    adjacentTo(room(C,D), room(A,B)).


%Too rooms next to each other
adjacentTo(room(X,Y),room(XT,YT)) :-
    room(X,Y),
    room(XT,YT),
	(X =:= XT, Y =:= YT+1);
	(X =:= XT, Y =:= YT-1);
	(X =:= XT+1, Y =:= YT);
	(X =:= XT-1, Y =:= YT).

%


shootWumpus(location) :-
    location(room(X,Y)),
    room(W,Z),
    wumpus(room(W,Z)),
    adjacentTo(room(W,Z),room(X,Y)).
    
    


















