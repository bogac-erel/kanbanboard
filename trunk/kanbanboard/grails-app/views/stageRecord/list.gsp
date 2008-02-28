

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>StageRecord List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New StageRecord</g:link></span>
        </div>
        <div class="body">
            <h1>StageRecord List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="user" title="User" />
                        
                   	        <g:sortableColumn property="startDate" title="Start Date" />
                        
                   	        <g:sortableColumn property="endDate" title="End Date" />
                        
                   	        <th>Kanban</th>
                   	    
                   	        <th>Stage</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${stageRecordList}" status="i" var="stageRecord">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${stageRecord.id}">${stageRecord.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${stageRecord.user?.encodeAsHTML()}</td>
                        
                            <td>${stageRecord.startDate?.encodeAsHTML()}</td>
                        
                            <td>${stageRecord.endDate?.encodeAsHTML()}</td>
                        
                            <td>${stageRecord.kanban?.name?.encodeAsHTML()}</td>
                        
                            <td>${stageRecord.stage?.name?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${StageRecord.count()}" />
            </div>
        </div>
    </body>
</html>
