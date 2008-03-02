

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show KanbanType</title>
    </head>
    <body>
        <div class="body">
	        <div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">KanbanType List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New KanbanType</g:link></span>
	        </div>
            <h1>Show KanbanType</h1>
            <div class="dialog">
                <table>
                    <tbody>
                
	                    <tr class="prop">
	                        <td valign="top" class="name">Name:</td>
                        
	                        <td valign="top" class="value">${kanbanType.name}</td>
	                    </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${kanbanType.description}</td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Color:</td>
                            
                            <td valign="top" class="value">${kanbanType.color}</td>                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${kanbanType?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
