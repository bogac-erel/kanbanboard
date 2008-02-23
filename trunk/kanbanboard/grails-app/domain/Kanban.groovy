class Kanban {
	String name
	String description
	SortedSet stages
	static hasMany = [stages:StageRecord]
	
	def getCurrentStage = {
		if (stages.isEmpty() == false){
			return stages.first().stage
		}
	}
}
