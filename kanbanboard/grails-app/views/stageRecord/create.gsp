

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create StageRecord</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">StageRecord List</g:link></span>
        </div>
        <div class="body">
            <h1>Create StageRecord</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stageRecord}">
            <div class="errors">
                <g:renderErrors bean="${stageRecord}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'user','errors')}">
                                    <input type="text" id="user" name="user" value="${fieldValue(bean:stageRecord,field:'user')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'startDate','errors')}">
                                    ${fieldValue(bean:stageRecord,field:'startDate')}
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'endDate','errors')}">
                                    ${fieldValue(bean:stageRecord,field:'endDate')}
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="kanban">Kanban:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'kanban','errors')}">
                                    <g:select optionKey="id" from="${Kanban.list()}" name="kanban.id" value="${stageRecord?.kanban?.id}"  optionValue="name"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stage">Stage:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:stageRecord,field:'stage','errors')}">
                                    <g:select optionKey="id" from="${Stage.list()}" name="stage.id" value="${stageRecord?.stage?.id}"  optionValue="name"></g:select>
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
