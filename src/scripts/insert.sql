INSERT INTO actor_categories (name)
VALUES
    ('взрослые'),
    ('дети'),
    ('динозавры'),
    ('экспонаты');

INSERT INTO actors (name, sex, category)
VALUES
    ('элли', 'female', (SELECT category_id FROM actor_categories WHERE name = 'взрослые')),
    ('малкольм', 'male', (SELECT category_id FROM actor_categories WHERE name = 'взрослые')),
    ('грант', 'male', (SELECT category_id FROM actor_categories WHERE name = 'взрослые')),
    ('мальчик', 'male', (SELECT category_id FROM actor_categories WHERE name = 'дети')),
    ('ребенок', 'both', (SELECT category_id FROM actor_categories WHERE name = 'дети')),
    ('родитель', 'both', (SELECT category_id FROM actor_categories WHERE name = 'взрослые')),
    ('динозавр', 'both', (SELECT category_id FROM actor_categories WHERE name = 'экспонаты'));

INSERT INTO actor_category_history (actor, category, start_date, end_date)
VALUES
    ( (SELECT actor_id FROM actors WHERE name = 'элли'), (SELECT category_id FROM actor_categories WHERE name = 'дети'), '1970-02-03', '1988-02-03'),
    ( (SELECT actor_id FROM actors WHERE name = 'элли'), (SELECT category_id FROM actor_categories WHERE name = 'взрослые'), '1988-02-03', NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'малкольм'), (SELECT category_id FROM actor_categories WHERE name = 'дети'), '1978-03-12', '1996-03-12'),
    ( (SELECT actor_id FROM actors WHERE name = 'малкольм'), (SELECT category_id FROM actor_categories WHERE name = 'взрослые'), '1996-03-12', NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT category_id FROM actor_categories WHERE name = 'дети'), '1974-12-10', '1992-12-10'),
    ( (SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT category_id FROM actor_categories WHERE name = 'взрослые'), '1992-12-10', NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'мальчик'), (SELECT category_id FROM actor_categories WHERE name = 'дети'), '2000-12-10', NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT category_id FROM actor_categories WHERE name = 'дети'), NULL, NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'родитель'), (SELECT category_id FROM actor_categories WHERE name = 'взрослые'), NULL, NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'динозавр'), (SELECT category_id FROM actor_categories WHERE name = 'динозавры'), NULL, NULL),
    ( (SELECT actor_id FROM actors WHERE name = 'динозавр'), (SELECT category_id FROM actor_categories WHERE name = 'экспонаты'), '1980-03-05', NULL);

INSERT INTO feels (name)
VALUES
    ('любовь'),
    ('интерес'),
    ('впечатляться'),
    ('обожание'),
    ('страх');

INSERT INTO actions (name)
VALUES
    ('обойти здание'),
    ('следовать'),
    ('смотреть'),
    ('стоять');


INSERT INTO expressions (who, to_whom, feel)
VALUES
    ((SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT feel_id FROM feels WHERE name = 'любовь')),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT actor_id FROM actors WHERE name = 'динозавр'), (SELECT feel_id FROM feels WHERE name = 'интерес')),
    ((SELECT actor_id FROM actors WHERE name = 'динозавр'), (SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT feel_id FROM feels WHERE name = 'впечатляться')),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT actor_id FROM actors WHERE name = 'динозавр'), (SELECT feel_id FROM feels WHERE name = 'любовь')),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT actor_id FROM actors WHERE name = 'родитель'), (SELECT feel_id FROM feels WHERE name = 'обожание')),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT actor_id FROM actors WHERE name = 'родитель'), (SELECT feel_id FROM feels WHERE name = 'страх')),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT actor_id FROM actors WHERE name = 'родитель'), (SELECT feel_id FROM feels WHERE name = 'любовь'));

INSERT INTO events (actor, action, timestamp_from, timestamp_to)
VALUES
    ((SELECT actor_id FROM actors WHERE name = 'элли'), (SELECT action_id FROM actions WHERE name = 'обойти здание'), 1000, 2000),
    ((SELECT actor_id FROM actors WHERE name = 'малкольм'), (SELECT action_id FROM actions WHERE name = 'обойти здание'), 1000, 2000),
    ((SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT action_id FROM actions WHERE name = 'обойти здание'), 1000, 2000),
    ((SELECT actor_id FROM actors WHERE name = 'мальчик'), (SELECT action_id FROM actions WHERE name = 'следовать'), 2000, 3000),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT action_id FROM actions WHERE name = 'стоять'), 3000, 4000),
    ((SELECT actor_id FROM actors WHERE name = 'ребенок'), (SELECT action_id FROM actions WHERE name = 'смотреть'), 4000, 5000);