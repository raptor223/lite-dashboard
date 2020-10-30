package ai.ementalist.queries;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import ai.ementalist.database.Mongo;

public class Covid19 {
	HttpServletRequest request;
	String DATABASE = "ementalist";
	String COLLECTION_DATA = "covid19_data";
	
	public Covid19(PrintWriter out, HttpServletRequest request) {
		super();
		this.request = request;
	}

	public BasicDBObject get_bundeslands_list() {
		MongoClient mongo = Mongo.getMongoClient();
		MongoDatabase db = mongo.getDatabase(DATABASE);
		MongoCursor<String> cur = db.getCollection(COLLECTION_DATA).distinct("countriesAndTerritories",String.class).iterator();
		BasicDBList lst = new BasicDBList();		
		while (cur.hasNext()) {
			String st = cur.next();
			lst.add(st);			
		}
		cur.close();
		if (lst.size() > 0) {
			return new BasicDBObject("result", "OK").append("data", lst);

		} else {
			return new BasicDBObject("result", "ERROR").append("message", "No Data!");
		}
	}
	
	//TODO: return required data for barchart
	public BasicDBObject get_barchart_data() {
		return null;
	}
	
	//TODO: return required data for table
	public BasicDBObject get_table_data() {
		return null;
	}

}
