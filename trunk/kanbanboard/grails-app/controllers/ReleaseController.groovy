            
class ReleaseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ releaseList: Release.list( params ) ]
    }

    def show = {
        def release = Release.get( params.id )

        if(!release) {
            flash.message = "Release not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ release : release ] }
    }

    def delete = {
        def release = Release.get( params.id )
        if(release) {
            release.delete()
            flash.message = "Release ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Release not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def release = Release.get( params.id )

        if(!release) {
            flash.message = "Release not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ release : release ]
        }
    }

    def update = {
        def release = Release.get( params.id )
        if(release) {
            release.properties = params
            if(!release.hasErrors() && release.save()) {
                flash.message = "Release ${params.id} updated"
                redirect(action:show,id:release.id)
            }
            else {
                render(view:'edit',model:[release:release])
            }
        }
        else {
            flash.message = "Release not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def release = new Release()
        release.properties = params
        return ['release':release]
    }

    def save = {
        def release = new Release(params)
		
		System.out.println(params)
		params.kanbanIds?.each {
			System.out.println(it)
			release.addToKanbans(Kanban.get(it)) 
		}

        if(!release.hasErrors() && release.save()) {
            flash.message = "Release ${release.id} created"
            redirect(action:show,id:release.id)
        }
        else {
            render(view:'create',model:[release:release])
        }
    }
}