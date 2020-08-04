<#import "/layout/layout.ftl" as layout>
<@layout.layout>
    <div class="page-container">
        <p class="f-20 text-success">欢迎使用控制台</p>
    </div>
    <#include "/layout/footer.ftl">
    <script type="text/javascript">
        function cleanHistory() {
            $('#historyDomain').val('');
            $('#historyRoomId').val('');
            $('#clean_history_modal').modal('show');
        }
        
        function postCleanHistory() {
            var domain = $('#historyDomain').val();
            if (!trimStr(domain)) {
                alert('domain为空');
                return;
            }
            var roomId = $('#historyRoomId').val();
            if (!trimStr(roomId)) {
                alert('roomId为空');
                return;
            }
            jQuery.ajax({
                url: '/console/cleanHistory',
                data: jQuery('#form-cleanhistory').serialize(),
                type: "post",
                success: function (data) {
                    if (data.success) {
                        $('#clean_history_modal').modal('hide');
                    } else {
                        layer.msg(data.errorDesc, { icon: 5, time: 1000 });
                    }
                }
            });
        }

        function cleanChatRoom() {
            $('#chatroomDomain').val('');
            $('#clean_chatroom_modal').modal('show');
        }

        function postCleanChatRoom() {
            var domain = $('#chatroomDomain').val();
            if (!trimStr(domain)) {
                alert('domain为空');
                return;
            }
            jQuery.ajax({
                url: '/console/cleanChatRoom',
                data: jQuery('#form-cleanChatroom').serialize(),
                type: "post",
                success: function (data) {
                    if (data.success) {
                        $('#clean_chatroom_modal').modal('hide');
                    } else {
                        layer.msg(data.errorDesc, { icon: 5, time: 1000 });
                    }
                }
            });
        }
    </script>
</@layout.layout>

