import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.mysql.cj.jdbc.Driver;

public class MySQLAdsDao implements Ads{
	private Connection connection;
	private Config config = new Config();

	public MySQLAdsDao() throws SQLException {
			DriverManager.registerDriver(new Driver());
			this.connection = DriverManager.getConnection(
					config.getUrl(),
					config.getUser(),
					config.getPassword()
			);
	}

	@Override
	public List<Ad> all() throws SQLException{
		String selectQuery = "SELECT * FROM ads";
		Statement statement;
		ResultSet resultSet;
		List<Ad> ads = new ArrayList<>();

			statement = connection.createStatement();
			resultSet = statement.executeQuery(selectQuery);
			while (resultSet.next()) {
				Ad currentAd = new Ad(resultSet.getInt("user_id"), resultSet.getString("title"), resultSet.getString("description"));
				ads.add(currentAd);
			}

		System.out.println(ads);
		return ads;
	}

	@Override
	public Long insert(Ad ad) throws SQLException {

		String query = "INSERT INTO ads(user_id, title, description) " +
				"VALUES ( " + ad.getUserId() + ", '" + ad.getTitle() + "', '" + ad.getDescription() + "')";
		Statement statement = connection.createStatement();
		statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
		ResultSet resultSet = statement.getGeneratedKeys();
		resultSet.next();

		return resultSet.getLong(1);
	}

}
