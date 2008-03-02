Kanban = {
	
	initialize : function() {
		this.toggleKanbans();
		this.toggleEditKanbanOwner();
		this.dragKanbans();
		this.navbarSetup();
	},
	
	toggleKanbans : function() {
		$('.kanban-expand').toggle(function() {
			$('.kanban-description', $(this)[0].parentNode.parentNode.parentNode).slideDown('fast');
		}, function() {
			$('.kanban-description', $(this)[0].parentNode.parentNode.parentNode).slideUp('fast');
		});
		$('.kanban-description').hide();
	},
	
	toggleEditKanbanOwner : function() {
		$('.kanban-owner').click(function () {
			$('.kanban-edit-owner', $(this)[0].parentNode.parentNode).show();
			$('.kanban-owner', $(this)[0].parentNode.parentNode).hide();
			$('.kanbanOwnerInput', $(this)[0].parentNode.parentNode).select();
		});
		$('.kanbanOwnerInput').blur(function() {
			$('.kanban-edit-owner', $(this)[0].parentNode.parentNode.parentNode).hide();
			$('.kanban-owner', $(this)[0].parentNode.parentNode.parentNode).show();
		});
		$('.kanban-edit-owner').hide();
	},
	
	dragKanbans : function() {
		$(".kanban-container").draggable({
			helper: 'clone',
			opacity: .50
		});
		$(".stage-cell").droppable({
			accept: function(draggable) {
				return $(this).attr('stage') !== (draggable).attr('stage');
			},
			hoverClass: 'droppable-hover',
			tolerance: 'intersect',
			drop: function(ev, ui) {
				$('.move-stageId', ui.draggable).val($(this).attr('stage'));
				$('.move-stage-form', ui.draggable).submit();
			}
		});
	},
	
	navbarSetup : function() {
	    $('.tab-off').hover(function() {
	        $(this).addClass('tab-hover');
	    }, function() {
	        $(this).removeClass('tab-hover');
	    });
	    $('.tab:contains(a)').click(function() {
	       document.location = $('a', $(this)).attr('href');
	    });
	}
	
}
$(function() { Kanban.initialize(); });