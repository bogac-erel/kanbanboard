            
class KanbanTypeController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ kanbanTypeList: KanbanType.list( params ) ]
    }

    def show = {
        def kanbanType = KanbanType.get( params.id )

        if(!kanbanType) {
            flash.message = "KanbanType not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ kanbanType : kanbanType ] }
    }

    def delete = {
        def kanbanType = KanbanType.get( params.id )
        if(kanbanType) {
            kanbanType.delete()
            flash.message = "KanbanType ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "KanbanType not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def kanbanType = KanbanType.get( params.id )

        if(!kanbanType) {
            flash.message = "KanbanType not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ kanbanType : kanbanType ]
        }
    }

    def update = {
        def kanbanType = KanbanType.get( params.id )
        if(kanbanType) {
            kanbanType.properties = params
            if(!kanbanType.hasErrors() && kanbanType.save()) {
                flash.message = "KanbanType ${params.id} updated"
                redirect(action:show,id:kanbanType.id)
            }
            else {
                render(view:'edit',model:[kanbanType:kanbanType])
            }
        }
        else {
            flash.message = "KanbanType not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def kanbanType = new KanbanType()
        kanbanType.properties = params
        return ['kanbanType':kanbanType]
    }

    def save = {
        def kanbanType = new KanbanType(params)
        if(!kanbanType.hasErrors() && kanbanType.save()) {
            flash.message = "KanbanType ${kanbanType.id} created"
            redirect(action:show,id:kanbanType.id)
        }
        else {
            render(view:'create',model:[kanbanType:kanbanType])
        }
    }
}