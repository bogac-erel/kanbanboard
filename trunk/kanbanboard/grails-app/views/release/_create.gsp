<div class="body">
	<div class="nav">
        <span class="menuButton"><g:link class="list" action="list">Release List</g:link></span>
    </div>
    <h1>Create Release</h1>
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${release}">
    <div class="errors">
        <g:renderErrors bean="${release}" as="list" />
    </div>
    </g:hasErrors>
    <g:form controller="release" action="save" method="post" >
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
                            <input type="text" id="description" name="description" value="${fieldValue(bean:release,field:'description')}"/>
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
                
                </tbody>
            </table>

			<g:each var="k" in="${release.kanbans}" status="i">
				<div><g:checkBox name="kanbanIds" value="${k.id}" />${k.name}</div>
			</g:each>
        </div>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Create" /></span>
        </div>
    </g:form>
</div>