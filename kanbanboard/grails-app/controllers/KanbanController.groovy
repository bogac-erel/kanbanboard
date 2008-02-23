            
class KanbanController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ kanbanList: Kanban.list( params ) ]
    }

    def show = {
        def kanban = Kanban.get( params.id )

        if(!kanban) {
            flash.message = "Kanban not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ kanban : kanban ] }
    }

    def delete = {
        def kanban = Kanban.get( params.id )
        if(kanban) {
            kanban.delete()
            flash.message = "Kanban ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Kanban not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def kanban = Kanban.get( params.id )

        if(!kanban) {
            flash.message = "Kanban not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ kanban : kanban ]
        }
    }

    def update = {
        def kanban = Kanban.get( params.id )
        if(kanban) {
            kanban.properties = params
            if(!kanban.hasErrors() && kanban.save()) {
                flash.message = "Kanban ${params.id} updated"
                redirect(action:show,id:kanban.id)
            }
            else {
                render(view:'edit',model:[kanban:kanban])
            }
        }
        else {
            flash.message = "Kanban not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def kanban = new Kanban()
        kanban.properties = params
        return ['kanban':kanban]
    }

    def save = {
        def kanban = new Kanban(params)
        if(!kanban.hasErrors() && kanban.save()) {
            flash.message = "Kanban ${kanban.id} created"
            redirect(action:show,id:kanban.id)
        }
        else {
            render(view:'create',model:[kanban:kanban])
        }
    }
}