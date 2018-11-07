$(document).ready(function(){
    data_table_options = {
        "order": [],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
    }
    $("#distributors , #invoices, #drugs ,#drugs_stock").DataTable(data_table_options );
    $("#invoices_report,#drugs_stock_report").DataTable({
        "paging":   false,
        "info": false,
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            // Total over all pages
            total = api
                .column( 2 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Total over this page
            pageTotal = api
                .column( 2, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Update footer
            $( api.column( 2 ).footer() ).html(
                '$'+pageTotal +' ( $'+ total +' total)'
            );
        }
    });
    $(".datepicker").datepicker({
        format: "dd/mm/yyyy"
    });

})