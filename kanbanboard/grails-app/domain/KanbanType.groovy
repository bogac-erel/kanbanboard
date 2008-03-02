class KanbanType {
	String name
	String color
	String description
	
	static constraints = {
		name(blank:false)
		description(blank:true)
		color(blank:false)
	}
}
