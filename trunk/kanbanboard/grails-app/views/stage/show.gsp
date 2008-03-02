

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Stage</title>
    </head>
    <body>
        
        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Stage List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Stage</g:link></span>
	        </div>
            <h1>Show Stage</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${stage.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Size:</td>
                            
                            <td valign="top" class="value">${stage.size}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Max Kanbans:</td>
                            
                            <td valign="top" class="value">${stage.maxKanbans}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Stage Order:</td>
                            
                            <td valign="top" class="value">${stage.stageOrder}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Active:</td>
                            
                            <td valign="top" class="value">${stage.active}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Color:</td>
                            
                            <td valign="top" class="value">${stage.color}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${stage?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
