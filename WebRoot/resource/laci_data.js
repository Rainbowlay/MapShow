var reader = new FileReader();
otherarr = new Array();
function readText(that){
	otherarr.length = 0;
	if(that.files && that.files[0] ){
		var reader = new FileReader();
		reader.onload = function (e) {  
			var output=e.target.result;
			var lines = output.split("\n");
			for(var i = 0 ; i < lines.length;i++){
				var line = lines[i]
				var temp = line.split("\t");
				if(temp.length < 4){
					continue;
				}
				var point = new Array();
				//var p = temp[1].split(",");
				point.push(parseFloat(temp[0]));
				point.push(parseFloat(temp[1]));
				point.push(parseFloat(temp[2]));
				point.push(String(temp[3]));
				point.push(String(temp[4]));
				point.push(String(temp[5]));
				otherarr.push(point);
			}
		   addmap();
		
		};//end onload()
		reader.readAsText(that.files[0]);
	}//end if html5 filelist suppor
}
function addmap(){

     var poinx = new Array();
	for (var i = 0; i < otherarr.length; i++) {
    	var point = new BMap.Point(otherarr[i][0],otherarr[i][1]);
		poinx.push(point);
    }
	
	 map = new BMap.Map("allmap");
	map.enableScrollWheelZoom();
	map.centerAndZoom(poinx[0], 13);
	// 编写自定义函数,创建标注
	function addMarker(pointss,information){
			var myIcon = new BMap.Icon("http://localhost:8080/lesson-manage/resource/flag_mark_red.png", new BMap.Size(32, 32), {
		offset: new BMap.Size(10, 25), // 指定定位位置
	
		});
		var marker = new BMap.Marker(point, {icon: myIcon});
		map.addOverlay(marker); 
	  marker.addEventListener("onmouseover",function(){ //移入标注时出发事件
                map.openInfoWindow(infoWindow,pointss); 
            });
		marker.addEventListener("onmouseout",function(){ //移除标注时出发事件
                map.closeInfoWindow(); 
            });

			  var opts = { 
                width : 120,     // 信息窗口宽度 
                height: 100,     // 信息窗口高度 
               
            } 
			var infoWindow = new BMap.InfoWindow(String(information), opts);  // 创建信息窗口对象
	}
	// 随机向地图添加25个标注
usernum = 0;
json = {};
var xx = new Array();
function contai(x){
	for(var i=0;i<xx.length;i++){
		if(String(x)==String(xx[i])){
			return "yes";
		}
	}
	return "no";
}
for (var i = 0; i < otherarr.length; i++) {
		if(contai(otherarr[i][5]) =="no"){
			xx.push(otherarr[i][5]);
		
			json[""+otherarr[i][5]]=usernum;
			usernum++;
		}
	}
	poin = new Array();
	info = new Array();
	nu = new Array();
	for(var i=0;i<usernum;i++){
		nu[i] = new Array();
		info[i] = new Array();
		poin[i] = new Array();
	}

for(var i= 0;i<otherarr.length;i++){
	var m = 0;
	while(true){
		if(json[""+otherarr[i][5]]==m){
		nu[m].push(otherarr[i]);
		break;
		}
		else{
		m++;
		}
	}			
}
		for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
			for(var i = 0;i<lenn;i++){
			var point = new BMap.Point(nu[j][i][0],nu[j][i][1]);
			var information = String(nu[j][i][4]);
			addMarker(point,information);
			poin[j].push(point);
			info[j].push(information);
			}
		}
		//创建起	始标签
	for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
	  var x=poin[j].length-1;
	  var lab1 = new BMap.Label("起点",{position:poin[j][0]});        //创建2个label
       var lab3 = new BMap.Label("终点",{position:poin[j][x]});   
        map.addOverlay(lab1);
        map.addOverlay(lab3);
	}
	yy = new Array();
	for(var i=0;i<usernum;i++){
		yy[i] = new Array();
	yy[i].push(new BMapLib.LuShu(map,null));
	}
	for(var j= 0;j<usernum;j++){
	yy[j] =new BMapLib.LuShu(map, poin[j], {
        defaultContent: "",
        autoView: true, //是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
        icon: new BMap.Icon('http://localhost:8080/lesson-manage/resource/222.png', new BMap.Size(48, 48), { anchor: new BMap.Size(27, 13) }),
        enableRotation: true, //是否设置marker随着道路的走向进行旋转
        landmarkPois: []
    }); }  
   }
   function pause(){
	   for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
			yy[j].pause();}
}
function stop(){
	 for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
	yy[j].stop();}
}
function start(){
			showline()
		   for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
	yy[j].start();}
}
color =["#FF0000","#FF44AA","#000000","#99FF33","#00DD00","#33FFDD","#0000AA","#5555FF","#9F88FF","#99FFFF","#D1BBFF","#E8CCFF","#FF3EFF","#CC00CC","#D87093","#FFE4E1","#800000","#0000FF","#220088","#DDDDDD","#FF44AA","#99FF33","#00DD00","#33FFDD","#0000AA","#5555FF","#9F88FF","#99FFFF","#D1BBFF","#E8CCFF","#FF3EFF","#CC00CC","#D87093","#FFE4E1","#800000","#0000FF","#220088"];
  zz = new Array();
   function showline(){
	   addpoint();
	   for(var i=0;i<usernum;i++){
		zz[i] = new Array();
	zz[i].push(new BMap.Polyline(null));
	}
		for(var j= 0;j<usernum;j++){
			 var x=j;
			 if(x>35){
			 x = 2;
			 }
			var colori = color[x];
			var lenn = nu[j].length;
		 zz[j] = new BMap.Polyline(poin[j],{strokeColor:""+colori, strokeWeight:6, strokeOpacity:0.7}); //创建折线
         map.addOverlay(zz[j]); 
		 zz[j].addEventListener("mouseover",function(){ //移入标注时出发事件

            });
			zz[j].addEventListener("mouseout",function(){ //移chu标注时出发事件
            });
		}
		
}
function noline(){
         var allOverlay = map.getOverlays();
        for (var i = 0; i < allOverlay.length ; i++)
        {        
			if (allOverlay[i] =="[object Polyline]")
			{
				map.removeOverlay(allOverlay[i]);
			}
		
        }
}
function range(){
	for(var j= 0;j<usernum;j++){
		var x= j;
			 if(x>35){
			 x = 2;}
			var colori = color[x];
			var lenn = nu[j].length;
			for(var i = 0;i<lenn;i++){
    	var xx = new BMap.Point(nu[j][i][0],nu[j][i][1]);
		var cir= new BMap.Circle(xx,nu[j][i][2],{strokeColor:""+colori});
		map.addOverlay(cir);}
	}
}
function norange(){
         var allOverlay = map.getOverlays();
        for (var i = 0; i < allOverlay.length ; i++)
        {        
			if (allOverlay[i] =="[object Circle]")
			{
				map.removeOverlay(allOverlay[i]);
			}
		
        }
}
function addpoint(){			//加入中点和事件触发显示速度
	   
	var time = new Array();
	var halfp = new Array();
	var speed = new Array();
	var distance = new Array();
	for(var i=0;i<usernum;i++){
		time[i] =new Array();
		halfp[i] =new Array();
		speed[i] =new Array();
		distance[i] =new Array();
	}
	for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
			for(var i = 0;i<lenn-1;i++){
		var xxx = (nu[j][i][0]+nu[j][i+1][0])/2;
		var yyy =	 (nu[j][i][1]+nu[j][i+1][1])/2;
		var point1 = new BMap.Point(xxx,yyy);//中点
		halfp[j].push(point1);
		var x = parseFloat(detime(stime(nu[j][i][3]),stime(nu[j][i+1][3])));//时间差
		time[j].push(x);
		var dis = (getFlatternDistance(nu[j][i][1],nu[j][i][0],nu[j][i+1][1],nu[j][i+1][0])/1000);
		distance[j].push(dis);
		var sp = (dis/time[j][i]).toFixed(2);
		speed[j].push(sp);
		 
	} 
	}
for(var j= 0;j<usernum;j++){
			var lenn = nu[j].length;
			for(var i = 0;i<halfp[j].length;i++){
			var point = halfp[j][i];
			var spp = speed[j][i];
			var tim = hourtomin(time[j][i]);
			var diss = distance[j][i].toFixed(4);
				addevent(point,spp,tim,diss);		
		}
}
function addevent(point,spp,tim,diss){
		var myIcon = new BMap.Icon("http://localhost:8080/lesson-manage/resource/b.png", new BMap.Size(16, 16), {
		offset: new BMap.Size(10, 25), // 指定定位位置

		});
		var marker = new BMap.Marker(point, {icon: myIcon});
		map.addOverlay(marker); 


				marker.addEventListener("onclick",function(){ //移入标注时出发事件
	                map.openInfoWindow(infoWindow1,point); 
	            });
			  var optsq = { 
	                width : 100,     // 信息窗口宽度 
	                height: 50,     // 信息窗口高度 
	            
	            } 
			var infoWindow1 = new BMap.InfoWindow("时间:"+String(tim)+"     "+"距离:"+String(diss)+"km     "+"速度:"+String(spp)+"km/h", optsq);  // 创建信息窗口对象 	
}
}

//求两点距离
var EARTH_RADIUS = 6378137.0; //单位M 
var PI = Math.PI; 

function getRad(d){ 
return d*PI/180.0; 
} 
function getFlatternDistance(lat1,lng1,lat2,lng2){ 
var f = getRad((lat1 + lat2)/2); 

var g = getRad((lat1 - lat2)/2); 
var l = getRad((lng1 - lng2)/2); 

var sg = Math.sin(g); 
var sl = Math.sin(l); 
var sf = Math.sin(f); 

var s,c,w,r,d,h1,h2; 
var a = EARTH_RADIUS; 
var fl = 1/298.257; 

sg = sg*sg; 
sl = sl*sl; 
sf = sf*sf; 

s = sg*(1-sl) + (1-sf)*sl; 
c = (1-sg)*(1-sl) + sf*sl; 

w = Math.atan(Math.sqrt(s/c)); 
r = Math.sqrt(s*c)/w; 
d = 2*w*a; 
h1 = (3*r -1)/2/c; 
h2 = (3*r +1)/2/s; 

return d*(1 + fl*(h1*sf*(1-sg) - h2*(1-sf)*sg)); 
} 
function detime(time1,time2){
var t1=new Date(time1.replace(/-/g, '/'));	
var t2=new Date(time2.replace(/-/g, '/')); 
return (t2-t1)/(1000*3600).toString();
}
//字符串转时间
function stime(y){
	return y.substring(0,4)+'/'+y.substring(4,6)+'/'+y.substring(6,8)+' '+y.substring(8,10)+':'+y.substring(10,12)+':'+y.substring(12,14);
}
function hourtomin(x){
	var y = Math.floor(parseFloat(x));//时
	var h = parseFloat(x) -y;
	var m = h*60;
	var e = Math.floor(m);
	var k =m- Math.floor(m);
	var s = Math.ceil(k*60);
	return String(y)+":"+String(e)+":"+String(s);
}

