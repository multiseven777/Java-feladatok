package com.sereg.jdbc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sereg.jdbc.db.ConnectionFactory;
import com.sereg.jdbc.db.DbUtil;
import com.sereg.jdbc.to.Movies;

public class MoviesDAO {
	
	private Connection connection;
    private Statement statement;
 
    public MoviesDAO() { }
 
    public Movies getMovies(int movie_ID) throws SQLException {
        String query = "SELECT * FROM movie_collection WHERE movie_ID=" + movie_ID;
        ResultSet rs = null;
        Movies movies = null;
        try {
            connection = ConnectionFactory.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
            	movies = new Movies();
            	movies.setMovie_ID(rs.getInt("movie_ID"));
            	movies.setMovie_name(rs.getString("movie_name"));
            	movies.setMovie_release(rs.getInt("movie_release"));
            }
        } finally {
            DbUtil.close(rs);
            DbUtil.close(statement);
            DbUtil.close(connection);
        }
        return movies;
    }

}
