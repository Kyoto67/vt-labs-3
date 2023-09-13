% Facts with one argument
is_ghoul(kaneki).
is_ghoul(touka).
is_human(amon).
is_investigator(furuta).
is_investigator(juzo).
is_ghoul(ayato).
is_human(akira).
is_investigator(haise).
is_investigator(mado).

has_kagune(kaneki, rinkaku).
has_kagune(touka, ukaku).
has_quinque(amon, jason).
has_quinque(akira, arata).
has_quinque(haise, ukaku).
has_kagune(ayato, ukaku).

is_ghoul_investigator(kaneki).
is_ghoul_investigator(haise).
is_ghoul_investigator(furuta).

% Facts with two arguments
is_friend(kaneki, touka).
is_enemy(kaneki, amon).
is_superior(furuta, juzo).
is_subordinate(juzo, furuta).
is_part_of(amon, ccg).
is_part_of(kaneki, ghouls).
is_part_of(akira, ccg).
is_part_of(haise, ccg).
is_part_of(haise, quinx).

is_kagune_type(rinkaku, sss).
is_kagune_type(ukaku, ss).
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
