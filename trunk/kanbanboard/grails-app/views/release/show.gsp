

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Release</title>
    </head>
    <body>
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Release List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Release</g:link></span>
	        </div>
            <h1>Show Release</h1>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${release.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${release.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${release.description}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Release Date:</td>
                            
                            <td valign="top" class="value">${release.releaseDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Kanbans:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="k" in="${release.kanbans}">
                                    <li><g:link controller="kanban" action="show" id="${k.id}">${k}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${release?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
