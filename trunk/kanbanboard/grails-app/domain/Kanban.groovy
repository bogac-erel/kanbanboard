class Kanban {
	String name
	String description
	SortedSet stages
	static hasMany = [stages:StageRecord]
	
	def getCurrentStage() {
		if (getCurrentStageRecord() != null) {
			return getCurrentStageRecord().stage
		}
	}
	
	def getCurrentUser() {
		if (getCurrentStageRecord() != null) {
			return getCurrentStageRecord().user
		}
	}
	
	def getCurrentStageRecord() {
		if (stages != null && stages.isEmpty() == false) {
			return stages.first()
		}
	}
	
	def moveToStage(Stage stage, String user) {
		if (getCurrentStageRecord() != null) {
			getCurrentStageRecord().setEndDate(new Date())
		}
		this.addToStages(new StageRecord(stage: stage, user: user));
	}
}
