INSERT INTO template(movie_name, movie_release, movie_genre) VALUES ('Seven', '1997', 'thriller');
INSERT INTO template(movie_name, movie_release, movie_genre) VALUES ('Fight Club', '1999', 'thriller');
INSERT INTO template(movie_name, movie_release, movie_genre) VALUES ('Deadpool', '2016', 'comic');
INSERT INTO template(movie_name, movie_release, movie_genre) VALUES ('The Interview', '2015', 'comedy');

INSERT INTO dvd(name_m, release_m, lead_actor, imdb_rating, user_rating) values((select movie_name from template where movie_name = 'Seven'), (select movie_release from template where movie_name = 'Seven'), 'Bradd Pitt', 9, 9);
INSERT INTO dvd(name_m, release_m, lead_actor, imdb_rating, user_rating) values((select movie_name from template where movie_name = 'Fight Club'), (select movie_release from template where movie_name = 'Fight Club'), 'Edward Norton, Brad Pitt', 9, 9);
INSERT INTO dvd(name_m, release_m, lead_actor, imdb_rating, user_rating) values((select movie_name from template where movie_name = 'Deadpool'), (select movie_release from template where movie_name = 'Deadpool'), 'Ryan Reynolds', 8, 8);
INSERT INTO dvd(name_m, release_m, lead_actor, imdb_rating, user_rating) values((select movie_name from template where movie_name = 'The Interview'), (select movie_release from template where movie_name = 'The Interview'), 'James Franco, Seth Rogan', 7, 9);
