class StageRecord {
	String user
	Date startDate
	Date endDate
	Kanban kanban
	static belongsTo = Kanban
	
    static constraints = {
    	user(blank:false)
    	startDate(nullable: false)
    	endDate(nullable: true)
    	kanban(nullable: false)
    }
}
