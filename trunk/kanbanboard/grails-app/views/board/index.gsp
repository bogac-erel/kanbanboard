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
	<td class="stage-cell" style="background-color: ${stage.color}" id="${stage.name}-stage" stage="${stage.id}">&nbsp;
		<g:each in="${stage.getKanbans()}" var="kanban">
			<div class="kanban-container" stage="${stage.id}">
				<div class="kanban-header">
					<div class="kanban-icons">
						<img src="/kanbanboard/images/icons/arrow_down.png" class="kanban-expand"/>
					</div>
					<div class="kanban-title">${kanban.name}</div>
					<div class="kanban-owner">${kanban.currentUser}</div>
				</div>
				<div class="kanban-description">
					<div>${kanban.description}</div>
					<div class="kanban-detail-link">
						<g:link controller="kanban" action="detail" id="${kanban.id}" class="thickbox" title="Kanban Detail">...view detail</g:link>
						<g:form action="moveToStage">
							<input type="hidden" name="kanbanId" value="${kanban.id}" />
							<input type="hidden" name="stageId" class="move-stageId" />
						</g:form>
					</div>
				</div>
			</div>
		</g:each>
	</td>
</g:each>
</tr>
</table>