var roomTable;
$(function () {
    areaList();
    searchRoomList();
})

function areaList() {
    roomTable = $('#area_table').dataTable({
        language: datatable_zn,
        'bAutoWidth': false,
        'bFilter': false,
        'bProcessing': false,
        'bSort': false,
        'bServerSide': true,
        'fnServerParams': function (aoData) {
            getAllSearchValue(aoData);
        },
        'sAjaxSource': '/console/ajaxAreaList',
        "createdRow": function (row, data, index) {
            $('td', row).eq(5).css('text-align', "center");
        },
        'aoColumns': [
            {
                'mDataProp': 'id',
                'bSortable': false
            }, {
                'mDataProp': 'key',
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
            }, {
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
        "name": 'key',
        "value": trimStr($('#key').val())
    });
}

function searchRoomList() {
    $("#search").on("click", function () {
        roomTable.fnDraw();
    });
}

function getAllOperation(row) {
    var remove = '<input id="remove" data-id="' + row.id + '" class="btn btn-danger radius" type="button" value="删除">';
    return remove;
}

$("#area_table").on("click", '#remove', function () {
    var id = $(this).attr("data-id");
    layer.confirm("确定删除该区域", function (result) {
        if (result) {
            $.post(
                '/console/removeArea', { id: id }, function (data) {
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