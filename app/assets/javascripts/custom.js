$(document).ready(function () {
    data_table_options = {
        "order": [],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
    }
    $("#invoices-datatable").DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": $('#invoices-datatable').data('source')
        },
        "pagingType": "full_numbers",
        "columns": [
            { "data": "invoice_number" },
            { "data": "patient_name" },
            { "data": "age" },
            { "data": "amount" },
            { "data": "date" },
            { "data": "dt_action" }
        ]
    });

    $("#invoice-drugs-datatable").DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": $('#invoice-drugs-datatable').data('source')
        },
        "pagingType": "full_numbers",
        "columns": [
            { "data": "date" },
            { "data": "invoice_id" },
            { "data": "patient_name" },
            { "data": "drug_name" },
            { "data": "quantity" }
        ],
        "order": [],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "footerCallback": function (row, data, start, end, display) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function (i) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '') * 1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            var get_sum = function (column_number) {
                total = api
                    .column(column_number)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Total over this page
                pageTotal = api
                    .column(column_number, { page: 'current' })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Update footer
                $(api.column(column_number).footer()).html(
                    '<span class="text-green">' + pageTotal + '</span></span> <span class="gray-text"> ( ' + total + ' total) </span>'
                );
            }
            get_sum(4)

        }
    });

    $("#drug-stocks-datatable").DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": $('#drugs-stocks-datatable').data('source')
        },
        "pagingType": "full_numbers",
        "createdRow": function (row, data, dataIndex) {
            if (data['is_return'] == 'true') {
                $(row).addClass('drug_return');
            }
        },
        "columns": [
            { "data": "invoice_number" },
            { "data": "invoice_date" },
            { "data": "drug" },
            { "data": "quantity" },
            { "data": "retail_price" },
            { "data": "trade_price" },
            { "data": "purchase_price" },
            { "data": "company" },
            { "data": "dt_action" }
        ]
    });

    $("#distributors").DataTable(data_table_options);
    $("#invoices_report, #drugs_stock_report").DataTable({
        "paging": false,
        "info": false,
        "createdRow": function (row, data, dataIndex) {
            if (data[9] == 'true') {
                $(row).addClass('drug_return');
            }
        },
        "footerCallback": function (row, data, start, end, display) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function (i) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '') * 1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            var get_sum = function (column_number) {
                total = api
                    .column(column_number)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Total over this page
                pageTotal = api
                    .column(column_number, { page: 'current' })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Update footer
                $(api.column(column_number).footer()).html(
                    '<span class="text-green">' + pageTotal + '</span></span> <span class="gray-text"> ( ' + total + ' total) </span>'
                );
            }
            get_sum(2)
            get_sum(3)
            get_sum(4)
            get_sum(5)
            if ($("#drugs_stock_report").length > 0) {
                // get_sum(4)
                // get_sum(5)
                get_sum(6)
                get_sum(7)
            }
        }
    });


    $("#drugs").DataTable({
        // "paging":   false,
        // "info": false,
        "order": [],
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "footerCallback": function (row, data, start, end, display) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function (i) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '') * 1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            var get_sum = function (column_number) {
                total = api
                    .column(column_number)
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Total over this page
                pageTotal = api
                    .column(column_number, { page: 'current' })
                    .data()
                    .reduce(function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0).toFixed(2);

                // Update footer
                $(api.column(column_number).footer()).html(
                    '<span class="text-green">' + pageTotal + '</span></span> <span class="gray-text"> ( ' + total + ' total) </span>'
                );
            }
            if ($("#drugs").length > 0) {
                get_sum(2)
            }
            get_sum(3)
            get_sum(4)
            get_sum(5)
            get_sum(6)

        }
    });



    $(".datepicker").datepicker({
        format: "dd/mm/yyyy"
    });

})