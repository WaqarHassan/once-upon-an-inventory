$(document).ready(function(){
    data_table_options = {
        "order": [],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
    }
    $("#distributors , #invoices, #drugs ,#drugs_stock").DataTable(data_table_options );
    $("#invoices_report,#drugs_stock_report").DataTable({
        "paging":   false,
        "info": false,
    });
    $(".datepicker").datepicker({
        format: "dd/mm/yyyy"
    });

})