<%@ page language="java" import="java.util.*,com.sakila.utlis.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" type="text/html" charset="UTF-8">
		<meta name="Keywords" content="">
		<meta name="Description" content="">
		<title>音乐平台</title>
		<style type="text/css">
			*{margin:0;padding:0;}
			body{background:#4c5666;font-size:12px;font-family:"微软雅黑";color:#666;}
			a{text-decoration:none;}
			/*music start*/
			#music{width:610px;height:470px;margin:100px auto;overflow:hidden}
			#music .m_lrc{width:300px;height:470px;float:left;background:#787878;border-radius:5px;}
			#music .m_list{width:300px;height:470px;float:right;background:#212732;border-radius:5px;}
			#music .m_lrc .l_title{width:100%;height:65px;border-radius:5px 5px 0 0;border-bottom:1px solid #ced1d3;background-image:-webkit-gradient(linear, left top, left bottom, color-stop(0, #f2f3f3), color-stop(1, #dddfe1));} 
			#music .l_con{width:300px;height:329px;overflow:auto;background:url("images/bg.jpg") no-repeat;background-size:cover;position:relative;}
			#music .l_con .c_lrc{width:300px;height:329px;overflow:auto;position:absolute;top:0;left:0;z-index:2;}
			#music .l_con .c_img{position:absolute;top:10px;left:0;z-index:1;}
			#music .m_lrc .l_tools{width:100%;height:104px;background-image:-webkit-gradient(linear, left top, left bottom, color-stop(0, #f2f3f3), color-stop(1, #dddfe1));border-radius:0 0 5px 5px;}
			#music .m_lrc .l_title .l_dir a{width:24px;height:18px;display:block;background:url("images/sm_icon.png") no-repeat -243px -127px;float:left;margin:26px 12px 0 15px;}
			#music .m_lrc .l_title .l_dir a:hover{background-position:-243px -151px;}
			#music .m_lrc .l_title h2{float:left;line-height:65px;width:200px;text-align:center;font-size:20px;font-wight:500px;}
			#music .m_lrc .l_title .l_share a{width:18px;height:18px;display:block;background:url("images/sm_icon.png") no-repeat -269px -127px;float:right;margin:27px 17px 0 0;}
			#music .m_lrc .l_title .l_share a:hover{background-position:-28px -149px;}
			#music .m_lrc .l_tools .t_play{width:100%;height:40px;padding:5px 0;}
			#music .m_lrc .l_tools .t_play .p_btn .b_com{display:block;background:url("images/sm_icon.png") no-repeat;float:left;}
			#music .m_lrc .l_tools .t_play .p_btn .b_1{width:23px;height:19px;background-position:-291px -127px;margin:12px 0 0 7px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_1:hover{background-position:-291px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_1.sel{background-position:-291px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_2{width:28px;height:18px;background-position:-317px -127px;margin:12px 0 0 55px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_2:hover{background-position:-317px -152px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_3{width:20px;height:25px;background-position:-347px -125px;margin:8px 0 0 20px;display:none;}
			#music .m_lrc .l_tools .t_play .p_btn .b_3:hover{background-position:-347px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_6{width:20px;height:25px;background-position:-369px -125px;margin:8px 0 0 20px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_6:hover{background-position:-369px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_4{width:28px;height:18px;background-position:-392px -127px;margin:12px 0 0 20px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_4:hover{background-position:-392px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_5{width:24px;height:22px;background-position:-421px -126px;margin:12px 0 0 68px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_5:hover{background-position:-421px -151px;}
			#music .m_lrc .l_tools .t_play .p_btn .b_5.sel{background-position:-421px -151px;}
			#music .m_lrc .l_tools .t_time{width:100%;height:14px;padding:2px 0;}
			#music .m_lrc .l_tools .t_time .t_start{float:left;width:35px;padding-left:10px;}
			#music .m_lrc .l_tools .t_time .t_bar{width:206px;height:8px;background:#a2a7aa;float:left;margin-top:5px;border-radius:5px;position:relative;}
			#music .m_lrc .l_tools .t_time .t_bar .b1{width:30%;height:8px;background:#f0676a;border-radius:6px 0 0 6px;}
			#music .m_lrc .l_tools .t_time .t_bar .b2{width:12px;height:8px;background:#fff;position:absolute;top:0px;left:29%;border-radius:50%;cursor:pointer;z-index:2;}
			#music .m_lrc .l_tools .t_time .t_bar .b_click{width:100%;height:100%;position:absolute;top:0;left:0;z-index:1;}
			#music .m_lrc .l_tools .t_time .t_end{float:left;width:35px;padding-left:12px;}
			/*end m_lrc*/
			
			/*m_list start*/
			#music .m_list .l_name{width:100%;height:48px;background:#f0676a;background-image:-webkit-gradient(linear, left top, left bottom, color-stop(0, #f87d7a), color-stop(1, #ef6a6c));border-radius:5px 5px 0 0;}
			#music .m_list .l_name .n_back a{width:16px;height:12px;display:block;background:url("images/sm_icon.png") no-repeat -448px -128px;float:left;margin:20px 0px 0 10px;}
			#music .m_list .l_name .n_back a:hover{background-position:-448px -150px;}
			#music .m_list .l_name .n_text{width:237px;float:left;color:#fff;line-height:48px;text-align:center;font-size:16px;}
			#music .m_list .l_name .n_download a{width:23px;height:16px;display:block;background:url("images/sm_icon.png") no-repeat -468px -128px;float:left;margin-top:18px;}
			#music .m_list .l_name .n_download a:hover{background-position:-468px -151px;}
			
			#music .m_list .l_m_con ul li{width:100%;height:40px;list-style:none;font-size:14px;border-bottom:1px solid #1b1f25;line-height:40px;background-image:-webkit-gradient(linear, left top, left bottom, color-stop(0, #262c35), color-stop(1, #212732));}
			#music .m_list .l_m_con ul .m_sel{border-bottom:1px solid #ec5b62;}
			#music .m_list .l_m_con ul .m_sel i{background-position:-13px -150px;}
			#music .m_list .l_m_con ul .m_sel a{color:#fff;}
			#music .m_list .l_m_con ul li i{width:12px;height:16px;display:block;float:left;background:url("images/sm_icon.png") no-repeat 0 -150px;margin:12px;}
			#music .m_list .l_m_con ul li a{width:224px;display:block;float:left;color:#7e868e;white-space:norwrap;text-overflow:ellipsis;overflow:hidden;}
			#music .m_list .l_m_con ul li a:hover{color:#fff;}

			.lrcLine{font-size:14px;color:#fff;line-height:30px;padding-left:15px;}
			/*css3滚动条*/
			::-webkit-scrollbar{width:5px;height:6px;background:#ccc;}
			::-webkit-scrollbar-button{background-color:#e5e5e5}
			::-webkit-scrollbar-track{background:#999}
			::-webkit-scrollbar-track-piece{background:#ccc}
			::-webkit-scrollbar-thumb{background:#666}
			::-webkit-scrollbar-corner{background:82AFFF;}
			::-webkit-scrollbar-resizer{background:#ff0bee}
			scrollbar{-moz-appearance:none !important;background:rgb(0,255,0)!important;}
			scrollbarbutton{-moz-appearance:none !important;background-color:rgb(0,0,255)!important;}
			scrollbarbutton:hover{-moz-appearance:none !important;background-color:rgb(255,0,0)!important;}

			.lrcSel{font-size:16px;color:yellow;}
			/*end m_list*/
			/*end music*/
			@keyframes rotate{
				0%{
					transform:rotate(0deg);
					-webkit-transform:rotate(0deg);
					-ms-transform:rotate(0deg);
					-moz-transform:rotate(0deg);
					-o-transform:rotate(0deg);
				}
				100%{
					transform:rotate(360deg);
					-webkit-transform:rotate(360deg);
					-ms-transform:rotate(360deg);
					-moz-transform:rotate(360deg);
					-o-transform:rotate(360deg);
				}
			}

			.sakila{
				animation:rotate 10s linear infinite;
				-webkit-animation:rotate 10s linear infinite;
				-ms-animation:rotate 10s linear infinite;
				-moz-animation:rotate 10s linear infinite;
				-o-animation:rotate 10s linear infinite;
			}

		</style>
	 </head>
	<body>
		<!--music start-->
		<div id="music">
			<!--m_lrc start-->
			<div class="m_lrc">
				<div class="l_title">
					<div class="l_dir">
						<a href="javascript:;" class="expandon"></a>
					</div>
					<h2 id="l_name_song">幸福之歌</h2>
					<div class="l_share">
						<a href="javascript:;"></a>
					</div>
				</div>
				<div class="l_con">
					<div class="c_lrc"></div>
					<div class="c_img">
						<img src="images/m.png" alt="音乐旋转图" width="300" height="300" class="sakila" />
					</div>
				</div>
				<div class="l_tools">
					<div class="t_play">
						<div class="p_btn">
							<a href="javascript:;" class="b_com b_1 mark" data-mark="2" title="顺序播放"></a>
						</div>
						<div class="p_btn">
							<a href="javascript:;" class="b_com b_2 prev"></a>
						</div>
						<div class="p_btn">
							<a href="javascript:;" class="b_com b_6" id="play" title="播放"></a>
							<a href="javascript:;" class="b_com b_3" id="pause" title="暂停"></a>
						</div>
						<div class="p_btn">
							<a href="javascript:;" class="b_com b_4 next"></a>
						</div>
						<div class="p_btn">
							<a href="javascript:;" class="b_com b_5 mark" data-mark="1" title="随机播放"></a>
						</div>
					</div>
					<div class="t_time">
						<div class="t_start">0:00</div>
						<div class="t_bar">
							<div class="b1 b_scroll"></div>
							<div class="b2 b_flag"></div>
							<div class="b3 b_click"></div>
						</div>
						<div class="t_end">0:00</div>
					</div>
				</div>
			</div>
			<!--end m_lrc-->
			<!--m_list start-->
			<div class="m_list">
				<div class="l_name">
					<div class="n_back">
						<a href="javascript:;" class="expand"></a>
					</div>
					<div class="n_text">NanYou Music</div>
					<div class="n_download">
						<a href="javascript:;"></a>
					</div>
				</div>
				<div class="l_m_con">
					<ul id="m_box">
						<li class="m_items" data-src="mp3/1.mp3">
							<i></i>
							<a href="javascript:;">咱们结婚吧</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/2.mp3">
							<i></i>
							<a href="javascript:;">当你老了</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/3.mp3">
							<i></i>
							<a href="javascript:;">母亲</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/4.mp3">
							<i></i>
							<a href="javascript:;">相亲相爱的一家人</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/5.mp3">
							<i></i>
							<a href="javascript:;">五星红旗迎风飘扬</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/6.mp3">
							<i></i>
							<a href="javascript:;">壮志在我胸</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/7.mp3">
							<i></i>
							<a href="javascript:;">烛光里面的妈妈</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/8.mp3">
							<i></i>
							<a href="javascript:;">不要忘记我爱你</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/9.mp3">
							<i></i>
							<a href="javascript:;">天意</a>
							<span>分享</span>
						</li>
						<li class="m_items" data-src="mp3/9.mp3">
							<i></i>
							<a href="javascript:;">第一次</a>
							<span>分享</span>
						</li>
					</ul>
				</div>
			</div>
			<!--end m_list-->
		</div>
		<!--end music-->
		<audio id="audio"></audio>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript">
			//创建一个MP3播放器
			//var audioDom = document.createElement("audio");
			var audioDom = document.getElementById("audio");
			//播放索引的记录
			var playIndex = 0;
			//音乐列表的总数
			var len = $("#m_box").children().length; 
			//监听时间
			function timeEvent(){
				//音频加载完成监听
				audioDom.oncanplaythrough = function(){
					//获取总长
					var time = this.duration;
					//格式化时间
					var ftime = formartTime(time);
					$(".t_start").text(ftime);
				}
				audioDom.ontimeupdate = function(){
					//获取总时长
					var time = this.duration;
					//获取播放时长
					var stime = this.currentTime;
					//格式化时间
					var ftime = formartTime(stime);
					$(".t_end").text(ftime);
					//获取播放进度
					var pbit = stime / time
					//计算百分比
					var percent = pbit * 100;
					$(".b1").width(percent + "%");
					$(".b2").css("left",(percent) + "%");
				}
				//音乐播放结束
				audioDom.onended = function(){
					if(mark == 2){
						nextMusic();
					} else{
						randomMusic();
					}
				}
			}
			//格式化日期
			function formartTime(time){
				var m = Math.floor(time / 60);
				var s = Math.floor(time % 60);
				return (m < 10 ? "0" + m:m) + ":" + (s < 10 ? "0" + s:s);
			}
			//动态替换歌名
			function replaceName(obj){
				var name = obj.find("a").text();
				$("#l_name_song").text(name);
			}
			//下一首
			function nextMusic(){
				//如果是最后一首，回归到第一首
				playIndex = (playIndex == (len-1) ? 0:++playIndex);
				//选中音乐文件
				var sel = $("#m_box").find(".m_items").eq(playIndex);
				var src = sel.data("src");
				addMusic(src);
				//播放选中的音乐
				playMusic(sel);
				sel.addClass("m_sel").siblings().removeClass("m_sel");
			}
			//上一首
			function prevMusic(){
				playIndex = (playIndex == 0 ? (len-1):--playIndex);
				//选中音乐文件
				var sel = $("#m_box").find(".m_items").eq(playIndex);
				var src = sel.data("src");

				addMusic(src);
				playMusic(sel);
				sel.addClass("m_sel").siblings().removeClass("m_sel");
			}
			//添加音乐
			function addMusic(src){
				audioDom.src = src;
				loadLrc(src);
			}
			//播放音乐
			function playMusic(obj){
				var name = obj.data("src");
				var s = name.split("/");
				var n = s[1];
				var a = n.split(".");
				//从服务器动态加载歌词
				loadLrc(a[0]);
				audioDom.play();
				replaceName(obj);

			}
			//随机播放
			function randomMusic(){
				var random = Math.floor(Math.random()*len);
				playIndex = random;
				var sel = $("#m_box").find(".m_items").eq(playIndex);
				var src = sel.data("src");
				//添加音乐
				addMusic(src);
				//播放选中的音乐
				playMusic(sel);
				sel.addClass("m_sel").siblings().removeClass("m_sel");
			}
			$(function(){
				//初始化监听时间
				timeEvent();

				//点击播放按钮
				$("#play").click(function(){
					//如果已经有选中的播放文件就直接播放
					var sel = $("#m_box").find(".m_sel");
					//取到歌曲的路径
					var src = sel.data("src");
					if(!src){
						//如果没把第一个当做播放元素时
						sel = $("#m_box").find("li").eq(0);
						src = sel.data("src");
						//添加音乐到播放器
						addMusic(src);
						//选中播放的音乐
						sel.addClass("m_sel");
					}
					//播放音乐
					playMusic(sel);

					$("#play").hide().next().show();
					//将索引记录下来
					prevIndex = sel.index();
				});

				//点击暂停按钮
				$("#pause").click(function(){
					audioDom.pause();
					//播放切换
					$("#pause").hide().prev().show();
				});

				//点击音乐列表播放
				$("#m_box").find(".m_items").click(function(){
					//获取播放文件音乐的地址
					var src = $(this).data("src");
					//播放音乐
					addMusic(src);
					playMusic($(this));
					
					$(this).addClass("m_sel").siblings().removeClass("m_sel");
					playIndex = $(this).index();

					//自动触发播放按钮
					$("#play").trigger("click");
				});

				//点击下一首
				$(".next").click(function(){
					nextMusic();
				});
				//点击上一首
				$(".prev").click(function(){
					prevMusic();
				});

				//随机播放和顺序播放
				$(".mark").click(function(){
					mark = $(this).data("mark");
					$(".mark").removeClass("sel");
					$(this).addClass("sel");
					if(mark ==2){
						nextMusic();
					} else{
						randomMusic();
					}
				});

				//收起
				$(".expand").click(function(){
					$(".m_list").animate({left:-310},function(){
						$("#music").animate({width:300});
					});
				});
				//展开
				$(".expandon").click(function(){
					$("#music").width(610);
					$(".m_list").animate({left:0});
				});

				//拖动播放
				$(".b2").mousedown(function(e){
					//获取拖动对象
					var _this = $(this);
					//获取鼠标的位置
					var x = e.clientX || e.pageX;
					//获取拖动元素的起点位置
					var left = _this.position().left;
					//获取拖动元素的终点位置
					var maxLeft = _this.parent().width() - 10;
					
					//拖拽时停止播放
					audioDom.pause();
					//拖动元素开始
					$(document).mousemove(function(e){
						//获取鼠标点击的位置
						var n1 = (e.clientX || e.pageX) - x + left;
						if(n1 < 0){n1 = 0;}
						if(n1 > maxLeft){n1=maxLeft;}
						//定位拖动进度的最终位置
						_this.css("left",n1);
						//根据拖动的位置除以最大位置得到百分比
						var percent = (n1 / maxLeft) * 100;
						//给进度条和拖动元素赋值
						$(".b_scroll").width(percent + "%");
						$(".b_flag").css("left",(percent-2)+"%");

						//音乐文件的时间加载
						audioDom.currentTime = audioDom.duration * (n1 / maxLeft);
					}).mouseup(function(){
						//松开鼠标，播放音乐
						audioDom.play();
						//移除事件
						$(document).unbind("mousemove");
						$(document).unbind("mouseup");
					});
				});
				//点击进度条
				$(".b_click").mousedown(function(e){
					//获取点击的位置
					var _this = $(this);
					//获取鼠标的位置
					var x = e.clientX || e.pageX;
					//获取起点的位置
					var left = _this.parent().offset().left;
					//获取终点位置
					var maxWidth = _this.parent().width();
					//最大位置
					var w = x - left;
					//
					var percent = (w / maxWidth) * 100;
					//根据进度条赋值
					$(".b_scroll").width(percent + "%");
					$(".b_flag").css("left",(percent-2)+"%");
					//音乐文件的加载
					audioDom.currentTime = audioDom.duration * (w/maxWidth);
				});
			});
			//从服务器动态加载歌词
			function loadLrc(name){
				$.ajax({
					type:"post",
					url:"data.jsp",
					data:{"name":name},
					success:function(data){
						var lrc = data;
						//把时间和歌词分离出来
						var lrcArr = lrc.split("[");
						var htmlLrc = "";
						for(var i=0;i<lrcArr.length;i++){
							//第二次分割
							var arr = lrcArr[i].split("]");
							//console.log(arr);
							//取到歌词
							var message = arr[1];
							//取到时间
							var timer = arr[0].split(".");
							//取到分钟和秒
							var stime = timer[0].split(":");
							//转换成秒数
							var ms = stime[0]*60 + stime[1]*1-1;
							if(message){
								htmlLrc +="<div class='lrcLine' id='"+ms+"'>"+message+"</div>";
							}
						}
						//把解析好的歌词放在div中
						$(".c_lrc").html(htmlLrc);
						//联动音乐播放歌词
						audioDom.addEventListener("timeupdate",function(){
							//获取当前播放时间
							var timer = this.currentTime;
							//解析音乐对应的时间
							var m = parseInt(timer / 60);
							var s = parseInt(timer);
							for(var i=0;i<s;i++){
								$("#"+i).addClass("lrcSel").siblings().removeClass("lrcSel");
							}
							var st = m * 60 + s;
							$(".c_lrc").scrollTop(st*2);
						});
					}
				});
			}
		</script>
	 </body>
</html>
