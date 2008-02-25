Kanban = {
	
	initialize : function() {
		this.toggleKanbans();
	},
	
	toggleKanbans : function() {
		$('.kanban-expand').toggle(function() {
			$('.kanban-description', $(this)[0].parentNode.parentNode.parentNode).slideDown('fast');
		}, function() {
			$('.kanban-description', $(this)[0].parentNode.parentNode.parentNode).slideUp('fast');
		});
		$('.kanban-description').hide();
	}
	
}
$(function() { Kanban.initialize(); });