:- dynamic interest/1.

% Data
% nursery(Name, Rating, Location, Curriculum, Facilities)
nursery(lasaille, 5, karen, montessori, playground).
nursery(calvary, 4, karen, academic, playground).
nursery(red_rose, 5, karen, play, playground).

nursery(forlklore, 5, karen, montessori, music).
nursery(cornelia, 5, karen, academic, music).
nursery(taylor, 5, karen, play, music).

nursery(swift, 4, karen, montessori, karate).
nursery(colors, 3, karen, academic, karate).
nursery(enchanted, 4, karen, play, karate).

nursery(tornado, 3, wakra, montessori, playground).
nursery(colorado, 4, wakra, academic, playground).
nursery(august, 5, wakra, play, playground).

nursery(st_mary, 3, wakra, montessori, music).
nursery(petals, 5, wakra, academic, music).
nursery(carmel, 2, wakra, play, music).

nursery(ergalyana, 4, wakra, montessori, karate).
nursery(qalbi, 5, wakra, academic, karate).
nursery(maak, 2, wakra, play, karate).

nursery(mush, 4, kiserian, montessori, playground).
nursery(adir, 4, kiserian, academic, playground).
nursery(anshawak, 5, kiserian, play, playground).

nursery(yahayati, 4, kiserian, montessori, playground).
nursery(yaahlamalak, 5, kiserian, academic, playground).
nursery(yarohelroh, 3, kiserian, play, playground).

nursery(rosef, 4, kiserian, montessori, karate).
nursery(slatep, 4, kiserian, academic, karate).
nursery(imani, 3, kiserian, play, karate).

% Main function
nursery_advisory :-
    write('This is a program to help select a preferable nursery based on the answers you give.'), nl,
    start.

% Start
start :-
    retractall(interest(_)),
    ask_questions,
    suggest_nursery.

% Questions
ask_questions :-
    question(location),
    question(curriculum),
    question(facilities).

% Defining questions
question(location) :-
    write('What location do you prefer (karen/wakra/kiserian)? '),
    read(Location),
    assert(interest(location(Location))).

question(curriculum) :-
    write('What curriculum do you prefer (montessori/play/academic)? '),
    read(Curriculum),
    assert(interest(curriculum(Curriculum))).

question(facilities) :-
    write('What facility do you prefer (playground/music/karate)? '),
    read(Facilities),
    assert(interest(facilities(Facilities))).

% Recommending nurseries
suggest_nursery :-
    findall([Name, Rating], (
        interest(location(Location)),
        interest(curriculum(Curriculum)),
        interest(facilities(Facilities)),
        nursery(Name, Rating, Location, Curriculum, Facilities)
    ), Suggestions),
    (
        Suggestions \= [] ->
        write('Based on your preferences, you should consider the following nursery school with a rating of: '), nl,
        print_suggestions(Suggestions)
        ;
        write('No nursery school matches all your preferences. Please consider adjusting your criteria.')
    ).

% Printing recommendations with ratings
print_suggestions([]).
print_suggestions([[Name, Rating]|T]) :-
    write('= '), write(Name), write(' with a rating of: ('), write(Rating), write('/5)'), nl,
    print_suggestions(T).

% Initialization
:- initialization(nursery_advisory).
