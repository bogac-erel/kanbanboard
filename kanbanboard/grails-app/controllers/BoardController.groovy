class BoardController {

    def index = { 
    	[stages: Stage.list( active: true ) ]
    }
    
}
