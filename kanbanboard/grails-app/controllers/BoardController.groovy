class BoardController {

    def index = { 
    	[stages: Stage.list( active: true ) ]
    }

	def moveToStage = {
		def kanban = Kanban.get( params.kanbanId );
		def stage = Stage.get( params.stageId );
				
		if(!kanban) {
            flash.message = "Kanban not found with id ${params.id}"
        } else if (!stage) {
			flash.message = "Stage not found with id ${params.stageId}"
		} else {
			kanban.moveToStage(stage, "moved");
			flash.message = "Kanban <b>${kanban.name}</b> moved to <b>${stage.name}</b>"	
		}
		redirect(action:index);
	}
    
	def createKanban = {
        def kanban = new Kanban()
        kanban.properties = params
        return ['kanban':kanban]
	}
	
	def createRelease = {
		def release = new Release()
		def stages = Stage.list()
		def lastStage = stages.get(stages.size()-1)
		release.kanbans = lastStage.getKanbans()
        release.properties = params
        return ['release':release]
	}
	
    def saveKanban = {
        def kanban = new Kanban(params)
		if(!kanban.hasErrors() && kanban.save()) {
			def stage = Stage.listOrderByStageOrder().get(0);
			kanban.moveToStage(stage, "created").save()
            flash.message = "Kanban <b>${kanban.name}</b> created"
        }
        else {
			String errorMsgs = "Error no kanban created"
			kanban.errors.allErrors.each {
				errorMsgs = errorMsgs + it
			}
            flash.message = errorMsgs
        }
        redirect(action:index)
    }

	def updateKanbanOwner = {
		def kanban = Kanban.get( params.id )
        if(kanban) {
            kanban.setCurrentUser(params.user)
            if(!kanban.hasErrors() && kanban.save()) {
                flash.message = "Kanban <b>${kanban.name}</b> updated with owner <b>${params.user}</b>"
            }
		} else {
			flash.message = "Kanban not found with id ${params.id}"
		}
		redirect(action:index)
	}
}
