

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>KanbanType List</title>
    </head>
    <body>
        <div class="body">
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create">New KanbanType</g:link></span>
	        </div>
            <h1>KanbanType List</h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="color" title="Color" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${kanbanTypeList}" status="i" var="kanbanType">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${kanbanType.id}">${kanbanType.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${kanbanType.color?.encodeAsHTML()}</td>
                        
                            <td>${kanbanType.description?.encodeAsHTML()}</td>
                        
                            <td>${kanbanType.name?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${KanbanType.count()}" />
            </div>
        </div>
    </body>
</html>
