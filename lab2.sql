DROP TABLE IF EXISTS theatres;
CREATE TABLE theatres (
   name TEXT,
   capacity INTEGER,

   PRIMARY KEY(name)
);


DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
   imdb TEXT, 
   title TEXT,
   production_year INTEGER,
   run_time INTEGER,

   PRIMARY KEY(imdb)
);


DROP TABLE IF EXISTS performances;
CREATE TABLE performances (
   p_id TEXT DEFAULT (lower(hex(randomblob(16)))),
   start_time TIME,
   start_date DATE,
   
   imdb TEXT,
   name TEXT,
   PRIMARY KEY(p_id),
   FOREIGN KEY (imdb) REFERENCES movies (imdb),
   FOREIGN KEY (name) REFERENCES theatres (name)
);


DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
   ticket_id TEXT DEFAULT (lower(hex(randomblob(16)))),
   
   p_id TEXT,
   user_name TEXT,
   PRIMARY KEY(ticket_id),
   FOREIGN KEY (p_id) REFERENCES performances (p_id),
   FOREIGN KEY (user_name) REFERENCES customers (user_name)
);


DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
   user_name TEXT,
   full_name TEXT,
   password INTEGER,

   PRIMARY KEY(user_name)
);

INSERT 
INTO theatres (name, capacity)
VALUES ('Kino', 300),
       ('Södran', 200);

INSERT 
INTO movies (imdb, title, production_year, run_time)
VALUES ('034256', 'House of Gucci', 2021, 158),
       ('937548', 'Madres paralelas', 2021, 123),
       ('732789', 'Death of the Nile', 2022, 127),
       ('165721', 'Hytti nro 6', 2021, 107);

INSERT 
INTO performances (start_time, start_date, imdb, name)
VALUES ('13:00', '2022-02-11', '034256', 'Södran'),
       ('15:00', '2022-02-11', '937548', 'Södran'),
       ('19:00', '2022-02-12', '732789', 'Södran'),
       ('11:00', '2022-02-11', '937548', 'Kino'),
       ('21:00', '2022-02-13', '034256', 'Kino'),
       ('16:00', '2022-02-11', '165721', 'Kino');
                                   
INSERT 
INTO customers (user_name, full_name, password)
VALUES ('4NGIEinCAP5', 'Angelica Larsson', 'an7061la-s'),
       ('cerealkiller1337', 'Märta Holmquist', 'ma7061ho-s');

INSERT
INTO tickets (p_id, user_name)
VALUES ('c972ad3788214c530e95a88680a8d62b', '4NGIEinCAP5');