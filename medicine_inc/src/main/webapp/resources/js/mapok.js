var sx;
var sy;

if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {

          sy = position.coords.latitude,
          sx = position.coords.longitude
    }, function(e) {
       sy = 37.48525;
       sx = 126.8992833;
    });
}


$(function(){


console.log(sx+","+sy);
var ey = $("#ex").val();
var ex = $("#ey").val();
console.log(ex+","+ey)

var data;
var key = "ubPSn96E0YfuQSU%2BXL0fSss6zwqlnZ3sEk6%2BtR6QSm8";
var mapOptions = {
		center: new naver.maps.LatLng(ex, ey),
		zoom: 8
	};

var map = new naver.maps.Map('map', mapOptions);



/*var ex = 126.88265238619182;
var ey = 37.481440035175375;*/

function searchPubTransPathAJAX() {
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/searchPubTransPath?SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&apiKey="+key;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
		console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
		//노선그래픽 데이터 호출
		callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
		}
	}
}

//길찾기 API 호출
searchPubTransPathAJAX();

function callMapObjApiAJAX(mabObj){
	var xhr = new XMLHttpRequest();
	//ODsay apiKey 입력
	var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey="+key;
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var resultJsonData = JSON.parse(xhr.responseText);
			drawNaverMarker(sx,sy);					// 출발지 마커 표시
			drawNaverMarker(ex,ey);					// 도착지 마커 표시
			drawNaverPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
			console.log("1111 : "+resultJsonData);
			// boundary 데이터가 있을경우, 해당 boundary로 지도이동
			if(resultJsonData.result.boundary){
					var boundary = new naver.maps.LatLngBounds(
			                new naver.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
			                new naver.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
			                );
					map.panToBounds(boundary);
			}
		}
	}
}

// 지도위 마커 표시해주는 함수
function drawNaverMarker(x,y){
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(y, x),
	    map: map
	});
}

// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
function drawNaverPolyLine(data){
	var lineArray;
	
	for(var i = 0 ; i < data.result.lane.length; i++){
		for(var j=0 ; j <data.result.lane[i].section.length; j++){
			lineArray = null;
			lineArray = new Array();
			for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
				lineArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
			}
			
		//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
			if(data.result.lane[i].type == 1){
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3,
				    strokeColor: '#003499'
				});
			}else if(data.result.lane[i].type == 2){
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3,
				    strokeColor: '#37b42d'
				});
			}else{
				var polyline = new naver.maps.Polyline({
				    map: map,
				    path: lineArray,
				    strokeWeight: 3
				});
			}
		}
	}
}
});