class Stage {
	String name
	String color = "#FFFFFF"
	boolean active = true
	boolean releaseStage
	Integer stageOrder = 0
	Integer size
	Integer maxKanbans
	
	static constraints = {
		name(blank:false)
		size(scale:0, max: 100, min: 0)
		maxKanbans(scale:0, nullable:true)
		stageOrder(scale:0)
	}
	
	def getKanbans = {
		Kanban.list().findAll({it.getCurrentStage()==this})
	}
	
	def getCycleTime() {
		def totalCycleTime = 0
		def records = StageRecord.findAllByStage(this)
		def finishedRecords = 0;
		records.each { it ->
		    if(it.endDate != null) {
		        finishedRecords = finishedRecords + 1
			    totalCycleTime += it.getCycleTime()
		    }
		}
		return finishedRecords != 0 ? totalCycleTime / finishedRecords : 0
	}
	
}
