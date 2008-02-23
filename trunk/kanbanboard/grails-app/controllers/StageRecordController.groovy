            
class StageRecordController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ stageRecordList: StageRecord.list( params ) ]
    }

    def show = {
        def stageRecord = StageRecord.get( params.id )

        if(!stageRecord) {
            flash.message = "StageRecord not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ stageRecord : stageRecord ] }
    }

    def delete = {
        def stageRecord = StageRecord.get( params.id )
        if(stageRecord) {
            stageRecord.delete()
            flash.message = "StageRecord ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "StageRecord not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def stageRecord = StageRecord.get( params.id )

        if(!stageRecord) {
            flash.message = "StageRecord not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ stageRecord : stageRecord ]
        }
    }

    def update = {
        def stageRecord = StageRecord.get( params.id )
        if(stageRecord) {
            stageRecord.properties = params
            if(!stageRecord.hasErrors() && stageRecord.save()) {
                flash.message = "StageRecord ${params.id} updated"
                redirect(action:show,id:stageRecord.id)
            }
            else {
                render(view:'edit',model:[stageRecord:stageRecord])
            }
        }
        else {
            flash.message = "StageRecord not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def stageRecord = new StageRecord()
        stageRecord.properties = params
        return ['stageRecord':stageRecord]
    }

    def save = {
        def stageRecord = new StageRecord(params)
        if(!stageRecord.hasErrors() && stageRecord.save()) {
            flash.message = "StageRecord ${stageRecord.id} created"
            redirect(action:show,id:stageRecord.id)
        }
        else {
            render(view:'create',model:[stageRecord:stageRecord])
        }
    }
}