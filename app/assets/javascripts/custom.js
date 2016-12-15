function assing_datatable(selector) {

	
	$(selector).dataTable({
      pagingType: "full_numbers",      
      bProcessing: true,
      bServerSide: true,
      pageLength: 25,
      sAjaxSource: $(selector).data('source'),
      responsive: true,
      bAutoWidth: false,      
     fixedColumns: true,
     bLengthChange : false,
     destroy: true
    });
}

