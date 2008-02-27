

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Kanban</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Kanban List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Kanban</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Kanban</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${kanban}">
            <div class="errors">
                <g:renderErrors bean="${kanban}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${kanban?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:kanban,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:kanban,field:'name')}"/>
                                </td>
                            </tr> 

							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kanban">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'type','errors')}">
                                    <g:select optionKey="id" from="${KanbanType.list()}" name="type.id" value="${kanban?.type?.id}" ></g:select>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stages">Stages:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'stages','errors')}">
                                    
<ul>
<g:each var="s" in="${kanban?.stages?}">
    <li><g:link controller="stageRecord" action="show" id="${s.id}">${s}</g:link></li>
</g:each>
</ul>
<g:link controller="stageRecord" params="["kanban.id":kanban?.id]" action="create">Add StageRecord</g:link>

                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
