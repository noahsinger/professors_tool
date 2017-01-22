jQuery.fn.reorderTable = function( url, token ) {
	this.tableDnD({
		onDrop: function(table, row) {
			$.ajax({
				type: "POST",
				url: url,
				processData: false,
				data: $.tableDnD.serialize() + '&authenticity_token=' + encodeURIComponent(token),
				dataType: "script"
			});
		}
	});
};
