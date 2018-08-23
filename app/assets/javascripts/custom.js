$(document).ready(function(){
    data_table_options = {
        "order": []
    }
    $("#distributors , #invoices, #drugs ,#drugs_stock").DataTable(data_table_options );
    $(".datepicker").datepicker({
        format: "dd/mm/yyyy"
    });

})