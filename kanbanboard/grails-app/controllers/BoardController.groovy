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
    
	def createKanban = {
        def kanban = new Kanban()
        kanban.properties = params
        return ['kanban':kanban]
	}

    def saveKanban = {
        def kanban = new Kanban(params)
		if(!kanban.hasErrors() && kanban.save()) {
			def stage = Stage.listOrderByStageOrder().get(0);
			kanban.moveToStage(stage, "created").save()
            flash.message = "Kanban ${kanban.id} created"
        }
        else {
			String errorMsgs = "Error no kanban created"
			kanban.errors.allErrors.each {
				errorMsgs = errorMsgs + it
			}
            flash.mesage = errorMsgs
        }
        redirect(action:index)
    }
}
