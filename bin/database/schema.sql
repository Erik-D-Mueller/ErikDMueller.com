-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE TABLE app_user (
  app_user_id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  drivers_license varchar(32),
  salt varchar(255) NOT NULL
);

CREATE TABLE tool_type (
  tool_type_id SERIAL PRIMARY KEY,
  tool_name varchar(128) NOT NULL,
  tool_description varchar(1000) NOT NULL

);

CREATE TABLE tool (
  tool_id SERIAL PRIMARY KEY,
  tool_type_id int NOT NULL,

  constraint fk_tool_type foreign key (tool_type_id) references tool_type(tool_type_id)
);

CREATE TABLE reservation (
  reservation_id SERIAL PRIMARY KEY,
  app_user_id int NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,

  constraint fk_user_id foreign key (app_user_id) references app_user(app_user_id)
);

CREATE TABLE tool_reservation (
  tool_id int NOT NULL,
  reservation_id int NOT NULL,

  constraint fk_tool_id foreign key (tool_id) references tool(tool_id),
  constraint fk_reservation_id foreign key (reservation_id) references reservation(reservation_id)
);

COMMIT;