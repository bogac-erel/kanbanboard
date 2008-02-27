class BootStrap {

     def init = { servletContext ->
         
        def releaseType = new KanbanType(name:"Release Feature", color:"#9EFF97", description:"Features to be delivered in a release").save()
        def conversionType = new KanbanType(name:"Data Conversion", color:"#3FA6E2", description:"Data Conversion for release").save()
        
     	def readyStage = new Stage(name:"Ready", size:10, stageOrder: 1, color: "#ECECEC").save()
     	new Stage(name:"Story Analysis", size:10, stageOrder: 2, color: "#FFFFFF").save()
     	def devStage = new Stage(name:"Developement", size:25, stageOrder: 3, color: "#ECECEC").save()
     	def peerStage = new Stage(name:"Code/Peer Review", size:15, stageOrder: 4, color: "#FFFFFF").save()
     	new Stage(name:"Walkthrough", size:10, stageOrder: 5, color: "#ECECEC").save()
     	def qaStage = new Stage(name:"QA", size:20, stageOrder: 6, color: "#FFFFFF").save()
     	new Stage(name:"Release Ready", size:10, stageOrder: 7, color: "#ECECEC").save()
     	
     	def firstKanban = new Kanban(name:"Kanban Board Crud", description:"Get the basic crud for the board working.", type: releaseType).save()
		def secondKanban = new Kanban(name:"Stage getKanbans", description:"Implement method to allows stages to get kanbans currently the state.", type: releaseType).save()
		def thirdKanban = new Kanban(name:"Second Ready", description:"Second kanban", type: releaseType).save()
		def conversionKanban = new Kanban(name:"Convert Whiteboard Kanbans", description:"Convert the stickies on the whiteboard into kanban data", type: conversionType).save()
		
		firstKanban.moveToStage(readyStage, "brad").save()
		secondKanban.moveToStage(readyStage, "brad").save()
		thirdKanban.moveToStage(readyStage, "skye").save()
		secondKanban.moveToStage(devStage, "skye").save()
		secondKanban.moveToStage(peerStage, "skye").save()
		conversionKanban.moveToStage(readyStage, "").save()
		conversionKanban.moveToStage(devStage, "skye").save()
		
     }
     def destroy = {
     }
} 