<#import "/layout/layout.ftl" as layout>
<@layout.layout>
    <article class="page-container">
        <form action="" method="post" class="form form-horizontal" id="form-product-add">
            <input type="hidden" value="" id="id" name="id">
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>广告位名：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">区域：</label>
                <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" size="1" name="area">
                        <#if area?exists>
                            <#list area as i>
                                <option value="${i.id!''}">${i.value!''}</option>
                            </#list>
                        </#if>
                    </select>
                </span>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">分类：</label>
                <div class="formControls col-xs-8 col-sm-9">
                <span class="select-box">
                    <select class="select" size="1" name="category">
                        <#if category?exists>
                            <#list category?keys as k>
                                <option value="${k!''}">${category[k]!''}</option>
                            </#list>
                        </#if>
                    </select>
                </span>
                </div>
            </div>
            <#--<div class="row cl">-->
            <#--<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>房间logo：</label>-->
            <#--<div class="formControls col-xs-8 col-sm-9">-->
            <#--<span class="btn-upload form-group">-->
            <#--<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 上传图片</a>-->
            <#--<input id="roomLogoUpload" type="file" class="input-file valid" name="fileupload" data-url="/upload" multiple="">-->
            <#--</span>-->
            <#--<input type="hidden" name="roomLogo" id="roomLogo" value="${room.roomLogo!''}" style="width:200px">-->
            <#--<img id="roomLogoUploadSrc" src="${room.roomLogo!''}" />-->
            <#--</div>-->
            <#--</div>-->
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>缩略图：</label>
                <div id="thumbnail-div" class="formControls col-xs-8 col-sm-9">
                    <span class="btn-upload form-group">
                        <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 上传图片</a>
                        <input id="thumbnailUpload" type="file" class="input-file valid" data-url="/console/upload" multiple="">
                    </span>
                    <input type="hidden" name="thumbnail" id="thumbnail" value="" style="width:200px">
                    <img id="thumbnailSrc" style="width:100px;" onclick="removeThumbnail()" src="" />
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>展示图：</label>
                <div id="showpic-div" class="formControls col-xs-8 col-sm-9">
                    <span class="btn-upload form-group">
                        <a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 上传图片</a>
                        <input id="showPicUpload" type="file" class="input-file valid" data-url="/console/upload" multiple="">
                    </span>
                    <input type="hidden" name="showPic" id="showPic" value="" style="width:200px">
                    <#--                    <img style="width:100px;" onclick="removeShowPic()" src="" />-->
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">参数：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="parm" name="parm">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">编号：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="serialNo" name="serialNo">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">媒体位置：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="place" name="place">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">时间：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="runTime" name="runTime">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">人流量：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" class="input-text" value="" placeholder="" id="flow" name="flow">
                </div>
            </div>

            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-3">媒体介绍：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <textarea name="introduceInfo" cols="" rows="" class="textarea valid" placeholder=""></textarea>
                    <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
                </div>
            </div>

            <div class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                </div>
            </div>
        </form>
    </article>
    <#include "/layout/footer.ftl">
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${request.getContextPath()}/js/jquery.fileupload.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#thumbnailUpload').fileupload({
                dataType: 'json',
                done: function (e, data) {
                    if (data.result.success) {
                        $("#thumbnail").val(data.result.result);
                        $('#thumbnailSrc').attr("src", data.result.result);
                    }
                    else {
                        layer.msg(data.result.errorDesc, { icon: 5, time: 2000 });
                    }
                }
            });

            $('#showPicUpload').fileupload({
                dataType: 'json',
                done: function (e, data) {
                    if (data.result.success) {
                        var val = $("#showPic").val();
                        var sp;
                        if (!val){
                            sp = new Array();
                            sp.push(data.result.result);
                        }else {
                            sp = eval(val);
                            sp.push(data.result.result);
                        }
                        $("#showPic").val(JSON.stringify(sp));
                        $('#showpic-div').append('<img style="width:100px;" onclick="removeShowPic(this)" src="'+data.result.result+'" />');
                    }
                    else {
                        layer.msg(data.result.errorDesc, { icon: 5, time: 2000 });
                    }
                }
            });

            // $('#roomMobileBgUpload').fileupload({
            //     dataType: 'json',
            //     done: function (e, data) {
            //         if (data.result.success) {
            //             $("#roomMobileBg").val(data.result.result);
            //             $('#roomMobileBgUploadSrc').attr("src", data.result.result);
            //         }
            //         else {
            //             layer.msg(data.result.errorDesc, { icon: 5, time: 2000 });
            //         }
            //     }
            // });

            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            $("#form-product-add").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2,
                        maxlength: 16
                    },
                    // sex: {
                    //     required: true,
                    // },
                    // mobile: {
                    //     required: true,
                    //     isMobile: true,
                    // },
                    // email: {
                    //     required: true,
                    //     email: true,
                    // },
                    // uploadfile: {
                    //     required: true,
                    // },

                },
                onkeyup: false,
                focusCleanup: true,
                success: "valid",
                submitHandler: function (form) {
                    jQuery.ajax({
                        url: '/console/saveProduct',
                        data: jQuery('#form-product-add').serialize(),
                        type: "post",
                        success: function (data) {
                            if (data.success) {
                                window.parent.location.reload();
                            }
                            else {
                                layer.msg(data.errorDesc, { icon: 5, time: 2000 });
                            }
                        }
                    });
                }
            });
        });

        function removeShowPic(e) {
            // layer.confirm("确定删除该图片", function (result) {
            //     if (result) {
            //         var rm = $(e).attr("src");
            //         var val = $("#showPic").val();
            //         var sp = eval(val);
            //         sp.splice($.inArray(rm,sp),1);
            //         $("#showPic").val(JSON.stringify(sp));
            //         $(e).remove();
            //     }
            // });

            layer.confirm("确定删除该图片？", {
                btn: ["确定","取消"] //按钮
            }, function(index){
                var rm = $(e).attr("src");
                var val = $("#showPic").val();
                var sp = eval(val);
                sp.splice($.inArray(rm,sp),1);
                $("#showPic").val(JSON.stringify(sp));
                $(e).remove();
                layer.close(index);
            }, function(){

            });
        }


    </script>
</@layout.layout>
