class BootStrap {

     def init = { servletContext ->
     	/**
     	new Stage(name:"Ready", size:10, stageOrder: 1).save();
     	new Stage(name:"Story Analysis", size:10, stageOrder: 2).save();
     	new Stage(name:"Developement", size:25, stageOrder: 3).save();
     	new Stage(name:"Code/Peer Review", size:15, stageOrder: 4).save();
     	new Stage(name:"Walkthrough", size:10, stageOrder: 5).save();
     	new Stage(name:"QA", size:20, stageOrder: 6).save();
     	new Stage(name:"Release Ready", size:10, stageOrder: 7).save();
     	*/
     	
     	
     	def readyStage = new Stage(name:"Ready", size:10, stageOrder: 1, color: "#FFFEBF").save();
     	new Stage(name:"Story Analysis", size:10, stageOrder: 2, color: "#FFB997").save();
     	new Stage(name:"Developement", size:25, stageOrder: 3, color: "#FF9797").save();
     	def peerStage = new Stage(name:"Code/Peer Review", size:15, stageOrder: 4, color: "#EF97FF").save();
     	new Stage(name:"Walkthrough", size:10, stageOrder: 5, color: "#9797FF").save();
     	def qaStage = new Stage(name:"QA", size:20, stageOrder: 6, color: "#97E3FF").save();
     	new Stage(name:"Release Ready", size:10, stageOrder: 7, color: "#9EFF97").save();
     	
     	def firstKanban = new Kanban(name:"Kanban Board Crud", description:"Get the basic crud for the board working.").save()
		def secondKanban = new Kanban(name:"Stage getKanbans", description:"Implement method to allows stages to get kanbans currently the state.").save()
		def thirdKanban = new Kanban(name:"Second Ready", description:"Second kanban").save();
		def firstStage = new StageRecord(user:"brad", kanban: firstKanban, stage: readyStage).save();
		firstKanban.addToStages(firstStage).save()
		secondKanban.moveToStage(peerStage, "skye");
		thirdKanban.moveToStage(readyStage, "skye");
		secondKanban.moveToStage(qaStage, "skye");
     }
     def destroy = {
     }
} 