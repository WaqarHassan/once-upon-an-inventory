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

            var get_sum = function(column_number) {
                total = api
                    .column( column_number )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );

                // Total over this page
                pageTotal = api
                    .column( column_number, { page: 'current'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );

                // Update footer
                $( api.column( column_number ).footer() ).html(
                    '$'+pageTotal +' ( $'+ total +' total)'
                );
            }
            get_sum(2)
            get_sum(3)
            if($("#drugs_stock_report").length > 0) {
                get_sum(4)
                get_sum(5)
                get_sum(6)
                get_sum(7)
            }
        }
    });
    $(".datepicker").datepicker({
        format: "dd/mm/yyyy"
    });

})