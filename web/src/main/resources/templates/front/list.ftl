<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
    <title>Advertising</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vant@2.9/lib/vant.min.js"></script>
    <link rel="icon" href="./image/logo.png">
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/vant@2.9/lib/index.css" />
    <style>
       #app{
           background:#fff;
       }
       .van-dropdown-menu__bar{
           box-shadow: 0 0;
       }
       .van-card__title{
            font-size:14px;
            font-family:PingFangSC-Medium,PingFang SC;
            font-weight:600;
            color:rgba(11,28,56,1);
            margin-bottom:9px;
       }
       .van-card{
           background:#fff;
           padding-right: 0;
       }
       .van-card__desc{
           font-size:14px;
           color:rgba(141,153,166,1);

       }
       .van-card__price{
           color:#FF6305 !important;
           margin-top:25px;
           margin-bottom:12px;
       }
       .van-card__price-currency{
           font-size:12px ;
           margin-right:2px;
       }
       .van-card__price-integer{
            font-size:16px;
            font-family:PingFangSC-Medium,PingFang SC;
            font-weight:500;
            color:rgba(255,99,5,1);
       }
       .van-card__content{
           position: relative;
            border-bottom: 1px solid #F0F4F7;
       }
        .van-dropdown-menu__title{
            color: #8D99A6 !important;
        }
        .van-card__thumb{
            width:104px;
            height: 104px;

        }
    </style>
</head>
<body>
    <div id='app'>
        <van-search style='padding-right:4%;padding-left:4%;' v-model="search" placeholder="请输入搜索关键词" @search='fetchData'></van-search>
        <van-dropdown-menu>
            <van-dropdown-item v-model="value1" :options="option1" title='区域'/></van-dropdown-item>
            <van-dropdown-item v-model="value2" :options="option2" title='类型'></van-dropdown-item>
        </van-dropdown-menu>
        <van-list
            style="margin-top: 20px; background:#fff;"
            v-model="loading"
            :finished="finished"
            finished-text="没有更多了"
            @load="onLoad">
            <van-card
                @click='handleDetail(item)'
                v-for="item in advertisings"
                :price="`4000/月`"
                :desc="`规格：20*20`"
                :title="item.title"
                @click-thumb.stop='handleImage(item)'
                :thumb="item.url || './image/小缺省图.png'"/>
        </van-list>
    </div>
    <script>
        var vm = new Vue({
            el: '#app',
            data: {
                search:'',
                value1: 0,
                value2: 'a',
                option1: [
                    { text: '区域', value: 0 },
                   
                ],
                option2: [
                    { text: '类型', value: 0 },

                ],
                finished:true,
                loading:false,
                advertisings:[
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:'https://img.yzcdn.cn/vant/ipad.jpeg'
                    },
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:'https://img.yzcdn.cn/vant/ipad.jpeg'
                    },
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:''
                    },
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:'https://img.yzcdn.cn/vant/ipad.jpeg'
                    },
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:'https://img.yzcdn.cn/vant/ipad.jpeg'
                    },
                    {
                        title: '广告媒体名称广告媒体名称广告媒体名称',
                        specification: '2.2 * 3.3',
                        price:'6666',
                        url:''
                    },
                ]
            },
            created(){
                this.fetchData()
            },
            methods: {
                
                onLoad(){

                },
                // 获取数据
                fetchData(){
                    const params = {
                        search:this.search
                    }
                    // 请求接口
                },
                // 跳转详情
                handleDetail(){
                    window.open('./detail.html')
                },
                handleImage(item){
                    if (item.url){
                     
                        vant.ImagePreview([item.url])
                    }

                }
            }
        })
    </script>
</body>
</html>