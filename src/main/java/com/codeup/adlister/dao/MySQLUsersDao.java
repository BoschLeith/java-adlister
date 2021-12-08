package com.codeup.adlister.dao;

import com.codeup.adlister.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users{
	private Connection connection = null;

	public MySQLUsersDao(Config config){
		try {
			DriverManager.registerDriver(new Driver());
			connection = DriverManager.getConnection(
					config.getUrl(),
					config.getUser(),
					config.getPassword()
			);
		} catch (SQLException e) {
			throw new RuntimeException("Error connecting to the database!", e);
		}
	}

	@Override
	public User findByUsername(String username) {
		String query = "SELECT * FROM users WHERE username LIKE ?";
		String searchTermWithWildcards = "%" + username + "%";

		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, searchTermWithWildcards);

			ResultSet resultSet = statement.executeQuery();
			if (! resultSet.next()){
				return null;
			} else {
				return new User(resultSet.getString("username"), resultSet.getString("email"), resultSet.getString("password"));
			}
		} catch (SQLException e){
			throw new RuntimeException("Error retrieving username.", e);
		}
	}

	@Override
	public Long insert(User user) {
		try {
			String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			statement.setString(1, user.getUsername());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());

			statement.executeUpdate();

			ResultSet resultSet = statement.getGeneratedKeys();
			resultSet.next();

			return resultSet.getLong(1);
		} catch (SQLException e){
			throw new RuntimeException("Error creating a new user.", e);
		}
	}
}
