class BootStrap {

     def init = { servletContext ->
     	new Kanban(name:"Fix This", description:"This needs to work.").save()
     }
     def destroy = {
     }
} 