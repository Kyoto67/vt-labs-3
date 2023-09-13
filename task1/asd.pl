is_kagune_type(bikaku, s).
is_quinque_type(jason, ss).
is_quinque_type(arata, sss).
is_quinque_type(ukaku, s).

% Relationships between facts
is_enemy(X, Y) :- is_ghoul(X), is_investigator(Y).
is_enemy(Y, X) :- is_ghoul(X), is_investigator(Y).

is_superior(X, Y) :- is_investigator(X), is_investigator(Y), X\=Y.
is_subordinate(Y, X) :- is_investigator(X), is_investigator(Y), X\=Y.
is_part_of(X, Y) :- is_ghoul(X), is_ghoul(Y).
is_part_of(X, Y) :- is_investigator(X), is_investigator(Y).

% Rules
is_ghoul_enemy(X, Y) :- is_ghoul(X), is_ghoul(Y), X\=Y, is_enemy(X, Y).
is_investigator_enemy(X, Y) :- is_investigator(X), is_investigator(Y), X\=Y, is_enemy(X, Y).
is_ghoul_friendly(X, Y) :- is_ghoul(X), is_ghoul(Y), X\=Y, is_friend(X, Y).
is_investigator_friendly(X, Y) :- is_investigator(X), is_investigator(Y), X\=Y, is_friend(X, Y).
