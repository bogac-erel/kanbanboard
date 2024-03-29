class Kanban {

	String name
	String description
	KanbanType type
	Release release
	SortedSet stages
	static hasMany = [stages:StageRecord]
	
	static constraints = {
		name(blank:false)
		description(blank:true)
		type(nullable:false)
		release(nullable:true)
	}
	
	def getCurrentStage() {
		if (getCurrentStageRecord() != null) {
			return getCurrentStageRecord().stage
		}
	}
	
	def getStartDate() {
		def firstStageRecord = getFirstStageRecord()
		if(firstStageRecord != null) {
			return firstStageRecord.startDate
		}
	}
	
	def getLeadTime() {
		if (getFirstStageRecord() != null) {
			def start = getFirstStageRecord().startDate.time
			def endRecord = getCurrentStageRecord()
			def end = (endRecord != null && endRecord.endDate != null) ? endRecord.endDate : new Date().time
			return (end - start)
		} else {
			return 0
		}
	}
	
	def getCurrentUser() {
		if (getCurrentStageRecord() != null) {
			return getCurrentStageRecord().user
		}
	}
	
	def setCurrentUser(String user) {
		def current = getCurrentStageRecord()
		if (current != null) {
			current.user = user
		}
	}
	
	def getCurrentStageRecord() {
		if (stages != null && stages.isEmpty() == false) {
			return stages.first()
		}
	}
	
	def getFirstStageRecord() {
		if (stages != null && stages.isEmpty() == false) {
			return stages.last()
		}
	}
	
	def moveToStage(Stage stage, String user) {
		if (getCurrentStageRecord() != null) {
			getCurrentStageRecord().setEndDate(new Date())
		}
		this.addToStages(new StageRecord(stage: stage, user: user));
	}
}
