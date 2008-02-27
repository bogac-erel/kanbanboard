class StageRecord implements Comparable {
	
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

	int compareTo(obj) {
		startDate.compareTo(obj.startDate) * -1
	}
	
	def getCycleTime = {	
		def start = startDate.time
		def end = endDate != null ? endDate.time : new Date().time
		return (end - start)
	}
	
}