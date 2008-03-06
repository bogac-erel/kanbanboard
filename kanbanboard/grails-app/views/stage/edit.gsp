

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Stage</title>
    </head>
    <body>

        <div class="body">
			<div class="nav">
	            <span class="menuButton"><g:link class="list" action="list">Stage List</g:link></span>
	            <span class="menuButton"><g:link class="create" action="create">New Stage</g:link></span>
	        </div>
            <h1>Edit Stage</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stage}">
            <div class="errors">
                <g:renderErrors bean="${stage}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${stage?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:stage,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="size">Size:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'size','errors')}">
                                    <input type="text" id="size" name="size" value="${fieldValue(bean:stage,field:'size')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="maxKanbans">Max Kanbans:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'maxKanbans','errors')}">
                                    <input type="text" id="maxKanbans" name="maxKanbans" value="${fieldValue(bean:stage,field:'maxKanbans')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stageOrder">Stage Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'stageOrder','errors')}">
                                    <input type="text" id="stageOrder" name="stageOrder" value="${fieldValue(bean:stage,field:'stageOrder')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active">Active:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'active','errors')}">
                                    <g:checkBox name="active" value="${stage?.active}" ></g:checkBox>
                                </td>
                            </tr> 
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active">Release Stage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'releaseStage','errors')}">
                                    <g:checkBox name="releaseStage" value="${stage?.releaseStage}" ></g:checkBox>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="color">Color:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stage,field:'color','errors')}">
                                    <input type="text" id="color" name="color" value="${fieldValue(bean:stage,field:'color')}"/>
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
