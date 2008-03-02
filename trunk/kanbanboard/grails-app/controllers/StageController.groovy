            
class StageController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ stageList: Stage.list( params ) ]
    }

    def show = {
        def stage = Stage.get( params.id )

        if(!stage) {
            flash.message = "Stage not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ stage : stage ] }
    }

    def delete = {
        def stage = Stage.get( params.id )
        if(stage) {
            stage.delete()
            flash.message = "Stage ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Stage not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def stage = Stage.get( params.id )

        if(!stage) {
            flash.message = "Stage not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ stage : stage ]
        }
    }

    def update = {
        def stage = Stage.get( params.id )
        if(stage) {
            stage.properties = params
            if(!stage.hasErrors() && stage.save()) {
                flash.message = "Stage ${params.id} updated"
                redirect(action:show,id:stage.id)
            }
            else {
                render(view:'edit',model:[stage:stage])
            }
        }
        else {
            flash.message = "Stage not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def stage = new Stage()
        stage.properties = params
        return ['stage':stage]
    }

    def save = {
        def stage = new Stage(params)
        if(!stage.hasErrors() && stage.save()) {
            flash.message = "Stage ${stage.id} created"
            redirect(action:show,id:stage.id)
        }
        else {
            render(view:'create',model:[stage:stage])
        }
    }
}