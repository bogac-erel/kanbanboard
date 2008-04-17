

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Release List</title>
    </head>
    <body>
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="create" action="create">New Release</g:link></span>
	        </div>
            <h1>Release List</h1>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="releaseDate" title="Release Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${releaseList}" status="i" var="release">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${release.id}">${release.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${release.name?.encodeAsHTML()}</td>
                        
                            <td>${release.description?.encodeAsHTML()}</td>
                        
                            <td>${release.releaseDate?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Release.count()}" />
            </div>
        </div>
    </body>
</html>
