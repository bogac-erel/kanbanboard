<head>
	<meta http-equiv="Content-Type" content="text/html;
	charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>Some Title</title>
</head>

<table cellpadding="0" cellspacing="0" width="100%" class="kanban-board-table">
</thead>
	<tr>
	<g:each in="${stages}" status="i" var="stage">
		<th width="${stage.size}%">
			${stage.name}
		</th>
	</g:each>
	</tr>
</thead>
<tr>
<g:each in="${stages}" status="i" var="stage">
	<td style="background-color: ${stage.color}" id="${stage.name}-stage">
		<g:each in="${stage.getKanbans()}" var="kanban">
			<div class="kanban-container">
				<div class="kanban-title">
					<g:link controller="kanban" action="show" id="${kanban.id}">${kanban.name}</g:link>-${kanban.currentUser}
				</div>
				<div class="kanban-description">${kanban.description}</div>
			</div>
		</g:each>
	</td>
</g:each>
</tr>
</table>