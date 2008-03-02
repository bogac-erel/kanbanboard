<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'kanban.css')}" />
		<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'thickbox.css')}" />
		
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery-1.2.3.pack.js')}" ></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'thickbox.js')}" ></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js',file:'kanban.js')}" ></script>
		
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'jquery.dimensions.js')}"></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'ui.mouse.js')}"></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'ui.draggable.js')}"></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'ui.draggable.ext.js')}"></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'ui.droppable.js')}"></script>
		<script type="text/javascript" src="${createLinkTo(dir:'js/jquery',file:'ui.droppable.ext.js')}"></script>
    	
		<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
        <div id="header">
       		<img src="${createLinkTo(dir:'images',file:'lsdboard-logo-small.png')}" id="header-logo">
			<div id="tagline">keepin' it lean</div>
			<div id="navbar">
				<div class="tab tab-on"><g:link controller="board">Home</g:link></div>
				<div class="tab tab-off"><g:link controller="kanban">Kanbans</g:link></div>
				<div class="tab tab-off"><g:link controller="setup">Setup</g:link></div>
			</div>
        </div>
        <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
		<div id="content"><g:layoutBody /></div>
    </body>	
</html>