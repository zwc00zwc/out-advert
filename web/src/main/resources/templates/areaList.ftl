<#import "/layout/layout.ftl" as layout>
<@layout.layout>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span> 系统管理
        <span class="c-gray en">&gt;</span> 区域列表管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
            <i class="Hui-iconfont">&#xe68f;</i>
        </a>
    </nav>
    <div class="page-container">
        <div class="text-c">
            区域:<input type="text" class="input-text" style="width:250px" placeholder="" id="key" name="key">
            <button type="submit" class="btn btn-success radius" id="search" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="javascript:;" onclick="layer_show('新增','/console/addArea','','700');" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 新增
                    </a>
                </span>
        </div>
        <table id="area_table" class="table table-border table-bordered table-hover table-bg">
            <thead>
            <tr class="text-c">
                <th>id</th>
                <th>区域</th>
                <th>创建时间</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
    <#include "/layout/footer.ftl">
    <script type="text/javascript" src="${request.getContextPath()}/js/areaList.js"></script>
</@layout.layout>
