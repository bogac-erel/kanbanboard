class BoardController {

    def index = { 
    	[stages: Stage.list( active: true ) ]
    }

	def moveToStage = {
		def kanban = Kanban.get( params.kanbanId );
		def stage = Stage.get( params.stageId );
		
		if(!kanban) {
            flash.message = "Kanban not found with id ${params.id}"
            redirect(action:list)
        }

		kanban.moveToStage(stage, "moved");
		redirect(action:index);
	}
    
}
