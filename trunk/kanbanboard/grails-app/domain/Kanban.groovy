class Kanban {
	String name
	String description
	static hasMany = [stages:StageRecord]
}
