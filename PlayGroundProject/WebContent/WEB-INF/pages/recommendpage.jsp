<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/placeRecommend.js"></script>
<style>
.main {
	margin: 0px auto 0;
}

.dropdown {
	margin: 0 20px;
}

#map_top_text {
	margin: 30px;
	text-align: center;
	text-shadow: 2 2 2 0;
}

#map {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

#map {
	height: 400px;
}


/* 선택박스 */
.selectboxdiv {
	margin: 20px auto;
	height: 250px;
	padding: 10px 0;
	position: relative;
	overflow: hidden;
	text-align: center;
}

#inner_sbdiv {
	display: inline;
}

.selectbox {
	position: relative;
	display: inline;
	margin-right: 200px;
}

.box {
	border: 1px solid green;
	border-radius: 20px;
	width: 150px;
	height: 230px;
	float: left;
	margin: 5px;
	background-color: white;
}

.front {
	position: absolute;
	z-index: 2;
}

.end {
	position: absolute;
}

.selectbox_top {
	width: 100%;
	height: 150px;
	border-bottom: 1px solid red;
	
}

.selectbox_bottom {
	vertical-align: middle;
}

/* 박스 위치 설정*/
#ft {
	left: 0px;
	top: 0px;
}

#ed {
	left: 10px;
	top: -10px;
}

/* 코스 추천 */
.recommend {
	margin: 0 auto;
	vertical-align: middle;
	/* border: 1px solid red; */
}

.recommend ul {
	text-align: center;
}

.recommend ul li {
	list-style: none;
	display: inline-block;
	width: 30%;
	height: 50px;
	border: 1px solid black;
	border-collapse: collapse;
	border-radius: 5px;
	margin: 10px;
	font-size: 30px;
	font-weight: bold;
	vertical-align: middle;
	box-shadow: 2px 2px 0px red;
}

.recommend ul li:hover {
	cursor: pointer;
	box-shadow: inset 3px 3px 0px #ced1bf;
	text-shadow: 3px 3px 0px #ced1bf;
}

.markerImgs {
	maxwidth: 450px;
	maxheight: 130px;
	width: 450px;
	height: 130px;
}

.imgs {
	width: 148px;
	height: 150px;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.back_buttons {
	border-radius: 20px;
}

.del_buttons {
	border-radius: 20px;
}
.selected_place{
border : 3px solid blue;

}
</style>

<section>
	<div class="main">
		<c:if test="${aCheck}">
			<h3 id="map_top_text">
				<a href="PlaceDataInsertForm.mvc">데이트 코스 시뮬레이터</a>
			</h3>
		</c:if>
		<c:if test="${!aCheck}">
			<h3 id="map_top_text">데이트 코스 시뮬레이터</h3>
		</c:if>

		<div id="map"></div>
		<script>
			function initMap() {
				var pos;
				// Try HTML5 geolocation.
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(function(position) {
						pos = {
							lat : position.coords.latitude,
							lng : position.coords.longitude
						};
						sessionStorage.setItem("lat", pos.lat);
						sessionStorage.setItem("lng", pos.lng);
						map.setCenter(pos);
					}, function() {
						alert("위치찾기에 실패했습니다.");
					});
				}
		
		
				var map = new google.maps.Map(document.getElementById('map'), {
					center : pos,
					zoom : 18
				});
				var guro = {
					lat : 37.385253,
					lng : 126.901472
				};
				var bora = {
					lat : 37.499998,
					lng : 126.920262
				};
				var isu = {
					lat : 37.4865,
					lng : 126.9819
				};
				var zoom = {
					lat : 37.492867,
					lng : 126.909420
				};
		
		
				var marker = new google.maps.Marker({
					position : guro,
					map : map
				});
				var marker2 = new google.maps.Marker({
					position : bora,
					map : map
				});
		
		
		
				// This event listener calls addMarker() when the map is clicked.
				google.maps.event.addListener(map, 'click', function(event) {
					addMarker(event.latLng, map);
		
				});
		
			}
		
			// Adds a marker to the map.
		
		
		
			function addMarker(location, map) {
				var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
				var labelIndex = 0;
				// Add the marker at the clicked location, and add the next-available label
				// from the array of alphabetical characters.
				var marker = new google.maps.Marker({
					position : location,
					label : labels[labelIndex++ % labels.length],
					map : map
				});
				console.log(marker);
			}
		</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU&callback=initMap">
		</script>
		<c:if test="${not empty sessionScope.PList}">
			<div class="selectboxdiv">
				<div id="inner_sbdiv">
					<div class="selectbox first_sb">
						<div class="box front" id="ft">
							<div class="selectbox_top" data-value='0'>
								<c:if test="${pSize >=1 }" >
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=${sessionScope.PList[0].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=1 }">
									<div>${sessionScope.PList[0].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="0">
									</div>

								</c:if>
							</div>
						</div>
						<div class="box end" id="ed">
							<div class="selectbox_top" data-value='5'>
								<c:if test="${pSize >=6 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[5].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>

							<div class="selectbox_bottom">
								<c:if test="${pSize >=6 }">
									<div>${sessionScope.PList[5].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="5">
									</div>
								</c:if>
							</div>

						</div>
					</div>
					<div class="selectbox">
						<div class="box front" id="ft">
							<div class="selectbox_top" data-value='1'>
								<c:if test="${pSize >=2 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[1].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=2 }">
									<div>${sessionScope.PList[1].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="1">
									</div>
								</c:if>
							</div>
						</div>
						<div class="box end" id="ed">
							<div class="selectbox_top" data-value='6'>
								<c:if test="${pSize >=7 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[6].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=7 }">
									<div>${sessionScope.PList[6].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="6">
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="selectbox">
						<div class="box front" id="ft">
							<div class="selectbox_top" data-value='2'>
								<c:if test="${pSize >=3 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[2].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=3 }">
									<div>${sessionScope.PList[2].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="2">
									</div>
								</c:if>
							</div>
						</div>
						<div class="box end" id="ed">
							<div class="selectbox_top" data-value='7'>
								<c:if test="${pSize >=8 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[7].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=8 }">
									<div>${sessionScope.PList[7].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="7">
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="selectbox ">
						<div class="box front" id="ft">
							<div class="selectbox_top" data-value='3'>
								<c:if test="${pSize >=4 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[3].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=4 }">
									<div>${sessionScope.PList[3].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="3">
									</div>
								</c:if>
							</div>
						</div>
						<div class="box end" id="ed">
							<div class="selectbox_top" data-value=8>
								<c:if test="${pSize >=9 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[8].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=9 }">
									<div>${sessionScope.PList[8].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="8">
									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="selectbox end_sb">
						<div class="box front" id="ft">
							<div class="selectbox_top" data-value=4>
								<c:if test="${pSize >=5 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[4].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=5 }">
									<div>${sessionScope.PList[4].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="4">
									</div>
								</c:if>
							</div>
						</div>
						<div class="box end" id="ed">
							<div class="selectbox_top" data-value=9>
								<c:if test="${pSize >=10 }">
									<img
										src='https://maps.googleapis.com/maps/api/place/photo?maxwidth=148&maxheight=148&photoreference=
						${sessionScope.PList[9].img}&key=AIzaSyBhdedgmrTytwJsq_mhBknZ8RZ4spbmjqU'
										class="imgs">
								</c:if>
							</div>
							<div class="selectbox_bottom">
								<c:if test="${pSize >=10 }">
									<div>${sessionScope.PList[9].name}</div>
									<div class="box_buttons replace_button">
										<input type="button" value="뒷장보기" class="back_buttons">&nbsp;&nbsp;<input
											type="button" value="삭제하기" class="del_buttons" data-del-value="9">
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="recommend" id="themaUl">
			<ul>
				<c:forEach var="tList" items="${tList}">
					<li class="themaName" value="${tList.themaNum}">${tList.themaName}</li>
				</c:forEach>
			</ul>

		</div>
		<div class="recommend"></div>
	</div>
</section>
