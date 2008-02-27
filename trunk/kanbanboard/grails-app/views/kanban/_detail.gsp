<table>
    <tbody>
    
        <tr class="prop">
            <td valign="top" class="name">Date Started:</td>
            
            <td valign="top" class="value"><g:formatDate date="${kanban.getStartDate()}" format="MM/dd/yy hh:mm aa" /></td>
            
        </tr>

		<tr class="prop">
            <td valign="top" class="name">Name:</td>
            
            <td valign="top" class="value">${kanban.name}</td>
            
        </tr>

		<tr class="prop">
            <td valign="top" class="name">Type:</td>
            
            <td valign="top" class="value">${kanban.type.name}</td>
        </tr>
    
        <tr class="prop">
            <td valign="top" class="name">Description:</td>
            
            <td valign="top" class="value">${kanban.description}</td>
        </tr>
		
		<tr class="prop">
            <td valign="top" class="name">Lead Time:</td>
            
            <td valign="top" class="value">${kanban.getLeadTime()}</td>
        </tr>

	</tbody>
</table>
<h1>Stages:</h1>
      
<table cellpadding="0" cellspacing="0">
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
			<td>${s.getTimeElapsed()}</td>
		</tr>
	</g:each>
	</tbody>
</table>