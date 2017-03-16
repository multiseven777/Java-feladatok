INSERT INTO movie_database(name_m, release_m, genre_m, lead_actor, imdb_rating, user_rating) VALUES ('Seven', '1997', 'thriller', 'Bradd Pitt', 9, 9);
INSERT INTO movie_database(name_m, release_m, genre_m, lead_actor, imdb_rating, user_rating) VALUES ('Fight Club', '1999', 'thriller', 'Edward Norton, Brad Pitt', 9, 9);
INSERT INTO movie_database(name_m, release_m, genre_m, lead_actor, imdb_rating, user_rating) VALUES ('Deadpool', '2016', 'comic', 'Ryan Reynolds', 8, 8);
INSERT INTO movie_database(name_m, release_m, genre_m, lead_actor, imdb_rating, user_rating) VALUES ('The Interview', '2015', 'comedy', 'James Franco, Seth Rogan', 7, 9);
INSERT INTO movie_database(name_m, release_m, genre_m, lead_actor, imdb_rating, user_rating) VALUES ('Test', '2017', 'test', 'test Franco, test Rogan', 1, 1);

INSERT INTO movie_collection(movie_name, movie_release) values((select name_m from movie_database where name_m = 'Seven'), (select release_m from movie_database where name_m = 'Seven'));
INSERT INTO movie_collection(movie_name, movie_release) values((select name_m from movie_database where name_m = 'Fight Club'), (select release_m from movie_database where name_m = 'Fight Club'));
INSERT INTO movie_collection(movie_name, movie_release) values((select name_m from movie_database where name_m = 'Deadpool'), (select release_m from movie_database where name_m = 'Deadpool'));
INSERT INTO movie_collection(movie_name, movie_release) values((select name_m from movie_database where name_m = 'The Interview'), (select release_m from movie_database where name_m = 'The Interview'));
