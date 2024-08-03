CREATE TABLE "TYPE_SHIP" (
  "ID_TYPE" integer PRIMARY KEY,
  "TYPE_NAME" varchar(255) UNIQUE
);

CREATE TABLE "SHIP" (
  "ID_SHIP" integer PRIMARY KEY,
  "SHIP_NAME" varchar(255) UNIQUE
);

CREATE TABLE "SHIP_RO_RO" (
  "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_TYPE" integer,
  "ID_SHIP" integer,
  "DATE_" date,
  "ID_PORT" integer,
  "TYPE_COST" varchar(255),
  "VALUE" numeric,
  "NUMBER_OF_VEHICLES" numeric,
  "LOAD_NAME" varchar(255)
);

CREATE TABLE "SHIP_PORTA_CONTEINER" (
  "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_TYPE" integer,
  "ID_SHIP" integer,
  "DATE_" date,
  "ID_PORT" integer,
  "TYPE_COST" varchar(255),
  "VALUE" numeric,
  "NUMBER_OF_CONTAINERS" numeric,
  "LOAD_NAME" varchar(255)
);

CREATE TABLE "SHIP_CARGA_GERAL" (
  "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_TYPE" integer,
  "ID_SHIP" integer,
  "DATE_" date,
  "ID_PORT" integer,
  "TYPE_COST" varchar(255),
  "VALUE" numeric,
  "LOAD_NAME" varchar(255),
  "VOLUME" numeric
);

CREATE TABLE "SHIP_FRIGORIFICO" (
  "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_TYPE" integer,
  "ID_SHIP" integer,
  "DATE_" date,
  "ID_PORT" integer,
  "TYPE_COST" varchar(255),
  "VALUE" numeric,
  "LOAD_NAME" varchar(255),
  "TEMP" numeric,
  "VOLUME" numeric
);

CREATE TABLE "SHIP_GRANELEIRO" (
  "ID" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_TYPE" integer,
  "ID_SHIP" integer,
  "DATE_" date,
  "ID_PORT" integer,
  "TYPE_COST" varchar(255),
  "VALUE" numeric,
  "LOAD_NAME" varchar(255),
  "WEIGHT_TONNAGE" numeric
);

CREATE TABLE "PORT" (
  "ID_PORT" integer PRIMARY KEY,
  "PORT_NAME" varchar(255) UNIQUE,
  "COUNTRY" varchar(255),
  "LATITUDE" numeric,
  "LONGITUDE" numeric
);

CREATE TABLE "ROUTES" (
  "ID_ROUTE" integer PRIMARY KEY,
  "ID_PORT_ORIGIN" integer,
  "ID_PORT_DESTINATION" integer,
  "DISTANCE" numeric,
  "AVERAGE_TIME" numeric
);

CREATE TABLE "PORT_COSTS" (
  "ID_COST" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "ID_PORT" integer,
  "RATE_TYPE" varchar(255),
  "VALUE_PER_SHIP" numeric,
  "VALUE_PER_TON" numeric
);

ALTER TABLE "SHIP_RO_RO" ADD FOREIGN KEY ("ID_TYPE") REFERENCES "TYPE_SHIP" ("ID_TYPE");

ALTER TABLE "SHIP_RO_RO" ADD FOREIGN KEY ("ID_SHIP") REFERENCES "SHIP" ("ID_SHIP");

ALTER TABLE "SHIP_RO_RO" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "SHIP_PORTA_CONTEINER" ADD FOREIGN KEY ("ID_TYPE") REFERENCES "TYPE_SHIP" ("ID_TYPE");

ALTER TABLE "SHIP_PORTA_CONTEINER" ADD FOREIGN KEY ("ID_SHIP") REFERENCES "SHIP" ("ID_SHIP");

ALTER TABLE "SHIP_PORTA_CONTEINER" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "SHIP_CARGA_GERAL" ADD FOREIGN KEY ("ID_TYPE") REFERENCES "TYPE_SHIP" ("ID_TYPE");

ALTER TABLE "SHIP_CARGA_GERAL" ADD FOREIGN KEY ("ID_SHIP") REFERENCES "SHIP" ("ID_SHIP");

ALTER TABLE "SHIP_CARGA_GERAL" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "SHIP_FRIGORIFICO" ADD FOREIGN KEY ("ID_TYPE") REFERENCES "TYPE_SHIP" ("ID_TYPE");

ALTER TABLE "SHIP_FRIGORIFICO" ADD FOREIGN KEY ("ID_SHIP") REFERENCES "SHIP" ("ID_SHIP");

ALTER TABLE "SHIP_FRIGORIFICO" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "SHIP_GRANELEIRO" ADD FOREIGN KEY ("ID_TYPE") REFERENCES "TYPE_SHIP" ("ID_TYPE");

ALTER TABLE "SHIP_GRANELEIRO" ADD FOREIGN KEY ("ID_SHIP") REFERENCES "SHIP" ("ID_SHIP");

ALTER TABLE "SHIP_GRANELEIRO" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "ROUTES" ADD FOREIGN KEY ("ID_PORT_ORIGIN") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "ROUTES" ADD FOREIGN KEY ("ID_PORT_DESTINATION") REFERENCES "PORT" ("ID_PORT");

ALTER TABLE "PORT_COSTS" ADD FOREIGN KEY ("ID_PORT") REFERENCES "PORT" ("ID_PORT");
