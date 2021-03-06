//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JSON2Apex {

    public QueryResponse QueryResponse;
    public String timeStamp;

	public class BudgetDetail {
		public String BudgetDate;
		public Double Amount;
		public AccountRef AccountRef;
	}

	public class MetaData {
		public String CreateTime;
		public String LastUpdatedTime;
	}

	public class QueryResponse {
		public List<Budget> Budget;
		public Integer startPosition;
		public Integer maxResults;
		public Integer totalCount;
	}

	public class AccountRef {
		public String value;
		public String name;
	}

	public class Budget {
		public String Name;
		public String StartDate;
		public String EndDate;
		public String BudgetType;
		public String BudgetEntryType;
		public Boolean Active;
		public List<BudgetDetail> BudgetDetail;
		public String domain;
		public Boolean sparse;
		public String Id;
		public String SyncToken;
		public MetaData MetaData;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}