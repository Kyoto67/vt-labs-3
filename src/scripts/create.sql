CREATE TYPE sex AS ENUM ('male', 'female', 'both');

CREATE TABLE actions (
    action_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE feels (
    feel_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    sex sex,
    group_id INT REFERENCES groups(group_id)
);

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    actor INT REFERENCES actors(actor_id),
    action INT REFERENCES actions(action_id),
    timestamp_from BIGINT,
    timestamp_to BIGINT
);

CREATE TABLE expressions (
    expression_id SERIAL PRIMARY KEY,
    who INT REFERENCES actors(actor_id),
    to_whom INT REFERENCES actors(actor_id),
    feel INT REFERENCES feels(feel_id)
);