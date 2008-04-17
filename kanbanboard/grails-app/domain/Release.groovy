class Release {

	String name
	String description
	Date releaseDate
	static hasMany = [kanbans:Kanban]
	
	static constraints = {
		name(blank:false)
		description(blank:true)
		releaseDate(nullable:false)
		kanbans(empty:false)
	}
	
}
