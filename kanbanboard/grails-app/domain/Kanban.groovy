class Kanban {
	String name
	String description
	SortedSet stages
	static hasMany = [stages:StageRecord]
	
	def getCurrentStage() {
		if (stages.isEmpty() == false){
			return stages.first().stage
		}
	}
	
	def moveToStage(Stage stage, String user) {
		this.addToStages(new StageRecord(stage: stage, user: user)).save();
	}
}
