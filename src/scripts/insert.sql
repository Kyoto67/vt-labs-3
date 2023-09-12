INSERT INTO groups (name)
VALUES
    ('взрослые'),
    ('дети'),
    ('родители'),
    ('экспонаты');

INSERT INTO actors (name, gender, group_id)
VALUES
    ('элли', 'female', (SELECT group_id FROM groups WHERE name = 'взрослые')),
    ('малкольм', 'male', (SELECT group_id FROM groups WHERE name = 'взрослые')),
    ('грант', 'male', (SELECT group_id FROM groups WHERE name = 'взрослые')),
    ('мальчик', 'male', (SELECT group_id FROM groups WHERE name = 'дети')),
    ('дети', NULL, (SELECT group_id FROM groups WHERE name = 'дети')),
    ('родители', NULL, (SELECT group_id FROM groups WHERE name = 'родители')),
    ('динозавры', NULL, (SELECT group_id FROM groups WHERE name = 'экспонаты'));

INSERT INTO feels (name)
VALUES
    ('любовь'),
    ('интерес'),
    ('производить впечатление'),
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
    ((SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT feel_id FROM feels WHERE name = 'любовь')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT actor_id FROM actors WHERE name = 'динозавры'), (SELECT feel_id FROM feels WHERE name = 'интерес')),
    ((SELECT actor_id FROM actors WHERE name = 'динозавры'), (SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT feel_id FROM feels WHERE name = 'производить впечатление')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT actor_id FROM actors WHERE name = 'динозавры'), (SELECT feel_id FROM feels WHERE name = 'любовь')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT actor_id FROM actors WHERE name = 'родители'), (SELECT feel_id FROM feels WHERE name = 'обожание')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT actor_id FROM actors WHERE name = 'родители'), (SELECT feel_id FROM feels WHERE name = 'страх')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT actor_id FROM actors WHERE name = 'родители'), (SELECT feel_id FROM feels WHERE name = 'любовь'));

INSERT INTO events (actor, action)
VALUES
    ((SELECT actor_id FROM actors WHERE name = 'элли'), (SELECT action_id FROM actions WHERE name = 'обойти здание')),
    ((SELECT actor_id FROM actors WHERE name = 'малкольм'), (SELECT action_id FROM actions WHERE name = 'обойти здание')),
    ((SELECT actor_id FROM actors WHERE name = 'грант'), (SELECT action_id FROM actions WHERE name = 'обойти здание')),
    ((SELECT actor_id FROM actors WHERE name = 'мальчик'), (SELECT action_id FROM actions WHERE name = 'следовать')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT action_id FROM actions WHERE name = 'стоять')),
    ((SELECT actor_id FROM actors WHERE name = 'дети'), (SELECT action_id FROM actions WHERE name = 'смотреть'));