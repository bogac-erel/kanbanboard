

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create KanbanType</title>         
    </head>
    <body>
        <div class="body">
	        <div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">KanbanType List</g:link></span>
	        </div>
            <h1>Create KanbanType</h1>
            <g:hasErrors bean="${kanbanType}">
	            <div class="errors">
	                <g:renderErrors bean="${kanbanType}" as="list" />
	            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanbanType,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:kanbanType,field:'name')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="color">Color:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanbanType,field:'color','errors')}">
                                    <input type="text" id="color" name="color" value="${fieldValue(bean:kanbanType,field:'color')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:kanbanType,field:'description','errors')}">
                                    <textarea id="description" name="description">${fieldValue(bean:kanbanType,field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
