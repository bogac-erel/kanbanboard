<table>
    <tbody>

    
        <tr class="prop">
            <td valign="top" class="name">Id:</td>
            
            <td valign="top" class="value">${kanban.id}</td>
            
        </tr>
    
        <tr class="prop">
            <td valign="top" class="name">Description:</td>
            
            <td valign="top" class="value">${kanban.description}</td>
            
        </tr>
    
        <tr class="prop">
            <td valign="top" class="name">Name:</td>
            
            <td valign="top" class="value">${kanban.name}</td>
            
        </tr>
    
        <tr class="prop">
            <td valign="top" class="name">Stages:</td>
            
            <td  valign="top" style="text-align:left;" class="value">
                <table>
				<tr>
					<th>Start Date</th>
					<th>Stage</th>
					<th>User</th>
				</tr>
                <g:each var="s" in="${kanban.stages}">
                    <tr>
						<td>${s.startDate}</td>
						<td><g:link controller="stageRecord" action="show" id="${s.id}">${s.stage.name}</g:link></td>
						<td>${s.user}</td>
					</tr>
                </g:each>
                </table>
            </td>
            
        </tr>
    
    </tbody>
</table>