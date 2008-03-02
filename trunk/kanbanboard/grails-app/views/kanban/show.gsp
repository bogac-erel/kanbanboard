

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Kanban</title>
    </head>
    <body>
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Kanban List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Kanban</g:link></span>
	        </div>
            <h1>Show Kanban</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
				<g:render template="detail" />
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${kanban?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
