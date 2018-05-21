<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sung.sf.controller.MapController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ page import="net.sf.json.JSONObject" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   	 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=JsRivo1hBqek9J_l3Tw3&submodules=geocoder"></script>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

    <title>간단한 지도 표시하기</title>
    
</head>
<body>

<div id="map" style="width:100%;height:400px;"></div>

<script>

//현재 위치 콘솔에 출력해보기
navigator.geolocation.getCurrentPosition(function(position) {
	  console.log(position.coords.latitude + ", " + position.coords.longitude);

// 현재위치 변수 만들기 + 위도 경도를 네이버 지도에 맞는 위도 경도로 만들기
var thisposition = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
var utmk = naver.maps.TransCoord.fromLatLngToUTMK(thisposition); // 위/경도 -> UTMK
var tm128 = new naver.maps.Point(position.coords.latitude, position.coords.longitude);
tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128

console.log("tm122222228 ," + tm128);
console.log("tm128 ," + tm128.x); //tm128 x 좌표
console.log("tm1282222222 ," + tm128.y); //tm128 y좌표
var posi= new naver.maps.Point(tm128.x, tm128.y);


// 현재 위도 확인
var latitude =position.coords.latitude;
console.log("now la   ," + latitude);

// 현재 경도 확인
var longitude =position.coords.longitude;
console.log("now lo   ," + longitude);

//지도 옵션 설정하기
/* var mapOptions = {
    center: thisposition,
    zoom: 10
};
 */
//지도 생성하기
 


var HOME_PATH = window.HOME_PATH || '.';
map = new naver.maps.Map("map", {
    center: new naver.maps.Point(tm128.x, tm128.y),
    zoom: 8,
    mapTypes: new naver.maps.MapTypeRegistry({
        'normal': naver.maps.NaverMapTypeOption.getNormalMap({
            projection: naver.maps.TM128Coord
        }),
        'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
            projection: naver.maps.TM128Coord
        }),
        'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
            projection: naver.maps.TM128Coord
        }),
        'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
            projection: naver.maps.TM128Coord
        })
    }),
    mapTypeControl: true
});

var circle = new naver.maps.Circle({
    map: map,
    center: tm128,
    radius:1000,
    fillColor: 'crimson',
    fillOpacity: 0.8
 });


var marker1 = new naver.maps.Marker({//현재 내위치
	position: posi,
    map: map,
   
    icon: {
        path: [
            new naver.maps.Point(0, 70), new naver.maps.Point(20, 100), new naver.maps.Point(40, 70),
            new naver.maps.Point(30, 70), new naver.maps.Point(70, 0), new naver.maps.Point(10, 70)
        ],
        style: "closedPath",
        anchor: new naver.maps.Point(23, 103),
        fillColor: '#ff0000',
        fillOpacity: 1,
        strokeColor: '#000000',
        strokeStyle: 'solid',
        strokeWeight: 3
    }
   
    
});
 

var object = ${food.items}; 
var jmapx= [];
var jmapy = [];
for(var i = 0; i<object.length; i++){
	
	
	var mapx = object[i].mapx;
	var mapy = object[i].mapy;
	//var mapxx = mapx-tm128.x; 
	//var mapyy = mapy-tm128.y;
	
 	if(mapx-tm128.x<1000){//참거짓을 판별하는 척도 일뿐  1000보다 작으면 그것에 해당하는 mapx 
 		
 		jmapx.push(mapx);
 		console.log("if문 사이에서의 " + jmapx[2]);
 		
 		
	}
 	

 	if(mapy-tm128.y<1000){//참거짓을 판별하는 척도 일뿐
		jmapy.push(mapy);
	}
	
 
	console.log("x값 = " + jmapx+ ""+ "y값= " + jmapy);

	// 

	//위치 비교하여 마커 찍기
	
	   
	
 	
	

}//상단 for문


/* var marker2 = new naver.maps.Marker({
    position: new naver.maps.Point(jmapx ,jmapy),
    map: map 
});   */
var markers = [],   //마커의 모임
infoWindows = [];   //정보창의 모임
var markerpo ; // 각각의 마커위치에 대한 좌표
var markerpoarr = []; //마커좌표의 배열

//마커 있던 자리
 for(var i = 0; i<object.length; i++){ //찍는 위치
var marker2 = new naver.maps.Marker({
    position: new naver.maps.Point(jmapx[i],jmapy[i]),
    map: map
});

 } //상단 for문 마침
//여기까지가 마커찍기 



/* for(var i = 0; i<object.length; i++){
 markerpo = new naver.maps.Point(jmapx[i],jmapy[i]);
 markerpoarr.push(markerpo);
}
console.log(markerpoarr[0]); */
//자표값들을 (x,y)형식으로 묶어 생성




for(var i = 0; i<object.length; i++){
	 console.log("title :    "  ,    object[i].title);
	contentString=(object[i].title + object[i].address + object[i].category +);
	console.log("두개 합친거 "      ,   contentString);
	contentStringarr.push(contentString); 
	
}
	console.log(contentStringarr);
// 가게 이름과 위치를 [i] = (title, address) 형식으로 맞춰줌

 

	 var infoWindows = new naver.maps.InfoWindow({
     content:'<div style="width:150px;text-align:center;padding:10px;"> <b>"'+  contentStringarr +'"</b>.</div>' 
});
 	
//infowindow가 한번만 생성되는 문제


	//잠시만 꺼져있어봐 infoWindows.push(infoWindow);
	 markers.push(marker2);
// content에 각각의 내용이 들어 가는 것. 

 	 //각각의 마커들을 모으자 !
 naver.maps.Event.addListener(markers, "click", function(e) {
    for(var i=0; i<object.length; i++)
	 if ()   n                              {
    	infowindows.open(map, markers);
      
    } else {
    	  infowindows.close();
    }
});

infowindows.open(map, markers);

    
  
/* 	for(var i = 0; i<object.length; i++){
		contentString1.push(object[i].title);
		contentString2.push(object[i].address);
		
	
	}
 	console.log(contentString1[0]);
	contentString3=contentString1.concat(contentString2);
	console.log("오브젝트 내용들     " + contentString3[0]); */
	
	
	//document.write(contentString3);
/* 	var infoWindow = new naver.maps.InfoWindow({
    content: 
}); */
	//for 문 마무리
/* 	markers.push(marker2);
	infoWindows.push(infoWindow);


naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});  */
	


})//지우지 말것 최상단 메소드 
 
</script>

	<form action ="map_view.sf" method="post">
    <input type="text" name="check" id="check"  ></input>
	<button type="submit">검색</button>
	
	
	 
	<%--  <c:forEach items="${food.items}" var="food" begin="0" end="${food.total}" varStatus="status">
        	
             	  <p>${food.title}</p>
                  <p>${food.mapx}</p>
                  <p>${food.mapy}</p>
     
   </c:forEach>  --%>
	
	 </form>
</body>
</html>