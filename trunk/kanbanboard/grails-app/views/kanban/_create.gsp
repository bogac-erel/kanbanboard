<div class="body">
	 <div class="nav">
        <span class="menuButton"><g:link class="list" controller="kanban" action="list">Kanban List</g:link></span>
     </div>
     <h1>Create Kanban</h1>
     <g:hasErrors bean="${kanban}">
     <div class="errors">
         <g:renderErrors bean="${kanban}" as="list" />
     </div>
     </g:hasErrors>
     <g:form action="saveKanban" method="post" >
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
                 </tbody>
             </table>
         </div>
         <div class="buttons">
             <span class="button"><input class="save" type="submit" value="Create" /></span>
         </div>
     </g:form>
</div>