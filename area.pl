% Input radius
read_radius(Radius) :-
    write('Enter the radius of the circle: '),
    read(Radius).

% Calculate area
circle_area(Radius, Area) :-
    PI = 3.14159, % Define PI constant
    Area is PI * Radius * Radius.

% Main program
main :-
    read_radius(Radius),
    circle_area(Radius, Area),
    write('The area of the circle is: '),
    write(Area),
    nl.

