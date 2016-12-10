function assing_datatable(selector) {
	var url = get_json_of_locales();
	
	$(selector).dataTable({
      pagingType: "full_numbers",      
      bProcessing: true,
      bServerSide: true,
      pageLength: 25,
      sAjaxSource: $(selector).data('source'),
      responsive: true,
      bAutoWidth: false,
      language: {
                url: url
            },
     fixedColumns: true,
     bLengthChange : false,
     destroy: true
    });
}

function get_json_of_locales(argument) {
	var arr = window.location.href.split("/");
	if (jQuery.inArray( "pt-BR", arr) >= 1 ){
		return "//cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json";
	}else{	
		return "//cdn.datatables.net/plug-ins/1.10.12/i18n/English.json";
	}
}