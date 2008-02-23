class StageRecord {
	
	String user
	Date startDate = new Date()
	Date endDate
	Kanban kanban
	Stage stage
	
	static belongsTo = [kanban:Kanban, stage:Stage]
	
    static constraints = {
    	user(blank:false)
    	startDate(nullable: false)
    	endDate(nullable: true)
    	kanban(nullable: false)
    	stage(nullable: false)
    }
}
