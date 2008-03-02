

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Stage List</title>
    </head>
    <body>
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="create" action="create">New Stage</g:link></span>
	        </div>
            <h1>Stage List</h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="size" title="Size" />
                        
                   	        <g:sortableColumn property="maxKanbans" title="Max Kanbans" />
                        
                   	        <g:sortableColumn property="stageOrder" title="Stage Order" />
                        
                   	        <g:sortableColumn property="active" title="Active" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stageList}" status="i" var="stage">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stage.id}">${stage.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${stage.name?.encodeAsHTML()}</td>
                        
                            <td>${stage.size?.encodeAsHTML()}</td>
                        
                            <td>${stage.maxKanbans?.encodeAsHTML()}</td>
                        
                            <td>${stage.stageOrder?.encodeAsHTML()}</td>
                        
                            <td>${stage.active?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Stage.count()}" />
            </div>
        </div>
    </body>
</html>
