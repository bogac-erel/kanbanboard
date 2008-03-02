

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Kanban</title>
    </head>
    <body>

        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Kanban List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Kanban</g:link></span>
	        </div>
            <h1>Edit Kanban</h1>
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
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:kanban,field:'name')}"/>
                                </td>
                            </tr> 
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'description','errors')}">
                                    <textarea id="description" name="description">${fieldValue(bean:kanban,field:'description')}</textarea>
                                </td>
                            </tr> 
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kanban">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'type','errors')}">
                                    <g:select optionKey="id" from="${KanbanType.list()}" name="type.id" value="${kanban?.type?.id}" optionValue="name" ></g:select>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stages">Stages:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanban,field:'stages','errors')}">
									<table cellpadding="0" cellspacing="0" style="margin-bottom: 15px;">
										<tr>
											<th>Stage</th>
											<th>User</th>
											<th>Cycle Time</th>
										</tr>
										<tbody>
										<g:each var="s" in="${kanban.stages}">
											<tr>
												<td><g:link controller="stageRecord" action="show" id="${s.id}">${s.stage.name}</g:link></td>
												<td>${s.user}</td>
												<td>${DateUtil.getDifferenceAsString(s.getCycleTime())}</td>
											</tr>
										</g:each>
										</tbody>
									</table>
									<g:link controller="stageRecord" params="["kanban.id":kanban?.id]" action="create"><img src="${createLinkTo(dir:'images/skin',file:'database_add.png')}" align="absmiddle" /> Add Stage</g:link>
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
