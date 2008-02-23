class Stage {
	String name
	String color = "#FFFFFF"
	boolean active = true
	Integer stageOrder = 0
	Integer size
	Integer maxKanbans
	
	static constraints = {
		name(blank:false)
		size(scale:0, max: 100, min: 0)
		maxKanbans(scale:0, nullable:true)
		stageOrder(scale:0)
	}
}
