package ai.ementalist.database;

import com.mongodb.MongoClient;
import com.mongodb.ServerAddress;

public final class Mongo {
	private static MongoClient mongoClient = null;

	public static MongoClient getMongoClient() {
		if (mongoClient == null) {
			mongoClient = new MongoClient(
					new ServerAddress("localhost"));
		}
		return mongoClient;
	}

	public static void closeMongoClient() {
		if (mongoClient != null) {
			mongoClient.close();
		}
	}

}
