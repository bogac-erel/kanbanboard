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
		if (stages.isEmpty() == false) {
			return stages.first()
		}
	}
	
	def moveToStage(Stage stage, String user) {
		this.addToStages(new StageRecord(stage: stage, user: user)).save();
	}
}
