

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Release</title>
    </head>
    <body>
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Release List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Release</g:link></span>
	        </div>
            <h1>Edit Release</h1>
            <g:hasErrors bean="${release}">
            <div class="errors">
                <g:renderErrors bean="${release}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${release?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:release,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:release,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:release,field:'description','errors')}">
                                    <textarea id="description" name="description">${fieldValue(bean:release,field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="releaseDate">Release Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:release,field:'releaseDate','errors')}">
                                    <g:datePicker name="releaseDate" value="${release?.releaseDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kanbans">Kanbans:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:release,field:'kanbans','errors')}">
                                    
<ul>
<g:each var="k" in="${release?.kanbans?}">
    <li><g:link controller="kanban" action="show" id="${k.id}">${k}</g:link></li>
</g:each>
</ul>

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
