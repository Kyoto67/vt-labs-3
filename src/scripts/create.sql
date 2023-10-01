-- Создание enum
CREATE TYPE sex AS ENUM ('male', 'female', 'both');

-- Создание таблицы actions
CREATE TABLE actions (
    action_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Создание таблицы feels
CREATE TABLE feels (
    feel_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Создание таблицы groups
CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Создание таблицы actors
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    sex sex,
    group_id INT REFERENCES groups(group_id)
);

-- Создание таблицы events
CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    actor INT REFERENCES actors(actor_id),
    action INT REFERENCES actions(action_id),
    order_or INT
);

-- Создание таблицы expressions
CREATE TABLE expressions (
    expression_id SERIAL PRIMARY KEY,
    who INT REFERENCES actors(actor_id),
    to_whom INT REFERENCES actors(actor_id),
    feel INT REFERENCES feels(feel_id)
);
