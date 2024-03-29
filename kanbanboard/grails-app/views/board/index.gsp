<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;
	charset=UTF-8"/>
	<meta name="layout" content="main" />
	<title>Some Title</title>
</head>

<body>
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
	<tbody>
	<tr>
	<g:each in="${stages}" status="i" var="stage">
		<td class="stage-cell" style="background-color: ${stage.color}" id="${stage.name}-stage" stage="${stage.id}">
			<g:each in="${stage.getKanbans()}" var="kanban">
				<div class="kanban-container" stage="${stage.id}" style="background-color: ${kanban.type.color}">
					<div class="kanban-header">
						<div class="kanban-owner">${kanban.currentUser}</div>
						<div class="kanban-edit-owner">
							<g:form action="updateKanbanOwner">
								<input type="text" name="user" value="${kanban.currentUser}" class="kanbanOwnerInput"/>
								<input type="hidden" name="id" value="${kanban.id}" />
							</g:form>
						</div>				
						<div class="kanban-icons">
							<img src="/kanbanboard/images/icons/arrow_down.png" class="kanban-expand"/>
						</div>
						<div class="kanban-title">${kanban.name}</div>
					</div>
					<div class="kanban-description">
						<div>${kanban.description}</div>
						<div class="kanban-detail-link">
							<g:link controller="kanban" action="detail" id="${kanban.id}" class="thickbox" title="${kanban.name}">...view detail</g:link>
							<g:form action="moveToStage" class="move-stage-form">
								<input type="hidden" name="kanbanId" value="${kanban.id}" />
								<input type="hidden" name="stageId" class="move-stageId" />
							</g:form>
						</div>
					</div>
				</div>
			</g:each>
			&nbsp;
		</td>
	</g:each>
	</tr>
	</tbody>
	<tfoot>
	<tr>
		<g:each in="${stages}" status="i" var="stage">
			<td>${DateUtil.getDifferenceAsString(stage.getCycleTime())}</td>
		</g:each>
	</tr>
	</tfoot>
	</table>
	<div style="padding: 10px;">
        <span class="menuButton"><g:link class="create thickbox" action="createKanban" title="Create Kanban">Add Kanban</g:link></span>
		<span class="menuButton"><g:link class="release thickbox" action="createRelease" title="Create Release">Create Release</g:link></span>
    </div>
</body>
</html>