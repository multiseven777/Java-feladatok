package com.sereg.jdbc.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;

import com.sereg.jdbc.dao.MoviesDAO;
import com.sereg.jdbc.to.Movies;

public class SelectDemo {
	
	public static void main(String[] args) {
        //1. Get Employee
		getMovies();
    }
 
    private static void getMovies() {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter the MovieID:");
         
        try {
            int movie_ID = Integer.parseInt(br.readLine());
            MoviesDAO moviesDao = new MoviesDAO();
            Movies movies = moviesDao.getMovies(movie_ID);
            if(movies != null)
                displayMovies(movies);
            else
                System.out.println("No Movie with ID: " + movie_ID);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    private static void displayMovies(Movies movies) {
        System.out.println("Movie ID:" + movies.getMovie_ID());
        System.out.println("Movie Title:" + movies.getMovie_name());
        System.out.println("Movie Release:" + movies.getMovie_release());
        System.out.println();
    }

}
