var productTable;
$(function () {
    productList();
    searchProductList();
})

function productList() {
    productTable = $('#product_table').dataTable({
        language: datatable_zn,
        'bAutoWidth': false,
        'bFilter': false,
        'bProcessing': false,
        'bSort': false,
        'bServerSide': true,
        'fnServerParams': function (aoData) {
            getAllSearchValue(aoData);
        },
        'sAjaxSource': '/console/ajaxProductList',
        "createdRow": function (row, data, index) {
            $('td', row).eq(5).css('text-align', "center");
        },
        'aoColumns': [
            {
                'mDataProp': 'id',
                'bSortable': false
            }, {
                'mDataProp': 'name',
                'bSortable': false
            }, {
                'mDataProp': 'thumbnail',
                'bSortable': false,
                'mRender': function (data, type, row) {
                    if (data.indexOf("http")>=0){
                        return '<img width="50" class="picture-thumb" src="' + data + '">';
                    }
                    return '<img class="picture-thumb '+data+'">';
                }
            }, {
                'mDataProp': 'area',
                'bSortable': false
            }, {
                'mDataProp': 'category',
                'bSortable': false
            }, {
                'mDataProp': 'createTime',
                'bSortable': false,
                'mRender': function (data, type, row) {
                    return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                }
            }, {
                'mDataProp': 'updateTime',
                'bSortable': false,
                'mRender': function (data, type, row) {
                    return new Date(data).Format("yyyy-MM-dd hh:mm:ss");
                }
            }
            , {
                'mDataProp': 'operation',
                'bSortable': false,
                'mRender': function (data, type, row) {
                    return getAllOperation(row);
                }
            }
        ]
    });
}

function getAllSearchValue(aoData) {
    aoData.push({
        "name": 'name',
        "value": trimStr($('#name').val())
    });
    aoData.push({
        "name": 'area',
        "value": trimStr($('#area').val())
    });
    aoData.push({
        "name": 'category',
        "value": trimStr($('#category').val())
    });
}

function searchProductList() {
    $("#search").on("click", function () {
        productTable.fnDraw();
    });
}

function getAllOperation(row) {
    var edit = '<input id="edit" data-id="' + row.id + '" class="btn btn-secondary radius" type="button" value="编辑">';
    var remove = '<input id="remove" data-id="' + row.id + '" class="btn btn-danger radius" type="button" value="删除">';
    return edit + remove;
}

$("#product_table").on("click", '#edit', function () {
    var id = $(this).attr("data-id");
    layer_show('编辑广告位', '/console/editProduct?id=' + id + '', '', '800');
});

$("#product_table").on("click", '#remove', function () {
    var id = $(this).attr("data-id");
    layer.confirm("确定删除该广告位", function (result) {
        if (result) {
            $.post(
                '/console/removeProduct', { id: id }, function (data) {
                    if (data.success) {
                        layer.msg('操作成功', { icon: 1, time: 1000 });
                        domainConfigTable.fnDraw();
                    } else {
                        layer.msg(data.errorDesc, { icon: 5, time: 1000 });
                    }
                }
            );
        }
    });
});