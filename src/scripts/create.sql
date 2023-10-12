CREATE TYPE sex AS ENUM ('male', 'female', 'both');

CREATE TABLE actions (
    action_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE feels (
    feel_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE actor_categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    sex sex,
    category INT REFERENCES actor_categories(category_id)
);

CREATE TABLE actor_category_history (
    history_id SERIAL PRIMARY KEY,
    actor INT NOT NULL,
    category INT NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (actor) REFERENCES actors(actor_id),
    FOREIGN KEY (category) REFERENCES actor_categories(category_id)
);

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    actor INT REFERENCES actors(actor_id) NOT NULL,
    action INT REFERENCES actions(action_id) NOT NULL,
    timestamp_from BIGINT,
    timestamp_to BIGINT
);

CREATE TABLE expressions (
    expression_id SERIAL PRIMARY KEY,
    who INT REFERENCES actors(actor_id) NOT NULL,
    to_whom INT REFERENCES actors(actor_id) NOT NULL,
    feel INT REFERENCES feels(feel_id) NOT NULL
);