<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
 $(function(){
	 $("#resetBtn").click(function(){
		 window.location.reload();
	 });
	 $("#theStarryNight").click(function(){
		 $("#photo").attr("src","resources/images/realEyeTest/theStarryNight.jpg");
	 });
	 $("#forest").click(function(){
		 $("#photo").attr("src","resources/images/realEyeTest/forest.jpg");
	 });
	 
	 $("#fireworks").click(function(){
		 $("#photo").attr("src","resources/images/realEyeTest/fireworksDisplay.jpg");
	 });
 });
</script>
<style type="text/css">
 body{
  height:100%;
  background-image:url("resources/images/leaf/halloween3.jpg");
  background-size: 100% 100%;
 }
#photo{
 margin-top:30px;
 margin-left:470px;
 margin-right:30px;
 float:right;
 width:400px;
 height:400px;
 position:absolute;
}
 input[type="radio"]{
  display:none;
}
body{
  margin:0;
  text-align:center;
}
.board{
  font-size:1vmin;
  outline:2em solid #333;
  width:60em;
  height:60em;
  position:absolute;
  left:calc(50% - 30em);
  top:calc(50% - 30em);
  overflow:hidden;
}
[class^=peice]{
  position:absolute;
  width:20em;
  height:20em;
  transition:top .5s, left .5s;
}
[class^=peice]::after{
  content:'';
  position:absolute;
  top:0;
  left:0;
  right:0;
  bottom:0;
  z-index:10;
  background-size:60em 60em;
  border-radius:2em;
  border:.5em groove #999;
  box-sizing:box-border;
}
.peice-a::after{
  background-position:top left;
}
.peice-b::after{
  background-position:top center;
}
.peice-c::after{
  background-position:top right;
}
.peice-d::after{
  background-position:center left;
}
.peice-e::after{
  background-position:center center;
}
.peice-f::after{
  background-position:center right;
}
.peice-g::after{
  background-position:bottom left;
}
.peice-h::after{
  background-position:bottom center;
}
[class^=peice] label{
  display:block;
  width: 13em;
  height: 13em;
  position:absolute;
  transform:rotate(45deg);
  background:#444;
}
[class^=peice] label:hover{
  background:#666;
  outline:.5em solid #111;
}
[class^=peice] label[for$="up"]{
  top: -6em;
  left:3.5em;
}
[class^=peice] label[for$="middle"]{
  display:none;
  z-index:5;
  left:3.5em;
}
[class^=peice] label[for$="down"]{
  bottom: -6em;
  left:3.5em;
}
[class^=peice] label[for$="left"]{
  left: -6em;
  top:3.5em;
}
[class^=peice] label[for$="center"]{
  display:none;
  z-index:5;
  top:3.5em;
}
[class^=peice] label[for$="right"]{
  right: -6em;
  top:3.5em;
}

#a-up:checked ~* [for="a-middle"],
#b-up:checked ~* [for="b-middle"],
#c-up:checked ~* [for="c-middle"],
#d-up:checked ~* [for="d-middle"],
#e-up:checked ~* [for="e-middle"],
#f-up:checked ~* [for="f-middle"],
#g-up:checked ~* [for="g-middle"],
#h-up:checked ~* [for="h-middle"]{
  display:block;
  transform:translate(0,13em) rotate(45deg);
}
#a-down:checked ~* [for="a-middle"],
#b-down:checked ~* [for="b-middle"],
#c-down:checked ~* [for="c-middle"],
#d-down:checked ~* [for="d-middle"],
#e-down:checked ~* [for="e-middle"],
#f-down:checked ~* [for="f-middle"],
#g-down:checked ~* [for="g-middle"],
#h-down:checked ~* [for="h-middle"]{
  display:block;
  transform:translate(0,-6em) rotate(45deg);
}
#a-left:checked ~* [for="a-center"],
#b-left:checked ~* [for="b-center"],
#c-left:checked ~* [for="c-center"],
#d-left:checked ~* [for="d-center"],
#e-left:checked ~* [for="e-center"],
#f-left:checked ~* [for="f-center"],
#g-left:checked ~* [for="g-center"],
#h-left:checked ~* [for="h-center"]{
  display:block;
  transform:translate(13em,0) rotate(45deg);
}
#a-right:checked ~* [for="a-center"],
#b-right:checked ~* [for="b-center"],
#c-right:checked ~* [for="c-center"],
#d-right:checked ~* [for="d-center"],
#e-right:checked ~* [for="e-center"],
#f-right:checked ~* [for="f-center"],
#g-right:checked ~* [for="g-center"],
#h-right:checked ~* [for="h-center"]{
  display:block;
  transform:translate(-6em,0) rotate(45deg);
}

#a-up:checked ~ * .peice-a,
#b-up:checked ~ * .peice-b,
#c-up:checked ~ * .peice-c,
#d-up:checked ~ * .peice-d,
#e-up:checked ~ * .peice-e,
#f-up:checked ~ * .peice-f,
#g-up:checked ~ * .peice-g,
#h-up:checked ~ * .peice-h{
  top:0;
}
#a-middle:checked ~ * .peice-a,
#b-middle:checked ~ * .peice-b,
#c-middle:checked ~ * .peice-c,
#d-middle:checked ~ * .peice-d,
#e-middle:checked ~ * .peice-e,
#f-middle:checked ~ * .peice-f,
#g-middle:checked ~ * .peice-g,
#h-middle:checked ~ * .peice-h{
  top:20em;
}
#a-down:checked ~ * .peice-a,
#b-down:checked ~ * .peice-b,
#c-down:checked ~ * .peice-c,
#d-down:checked ~ * .peice-d,
#e-down:checked ~ * .peice-e,
#f-down:checked ~ * .peice-f,
#g-down:checked ~ * .peice-g,
#h-down:checked ~ * .peice-h{
  top:40em;
}
#a-left:checked ~ * .peice-a,
#b-left:checked ~ * .peice-b,
#c-left:checked ~ * .peice-c,
#d-left:checked ~ * .peice-d,
#e-left:checked ~ * .peice-e,
#f-left:checked ~ * .peice-f,
#g-left:checked ~ * .peice-g,
#h-left:checked ~ * .peice-h{
  left:0;
}
#a-center:checked ~ * .peice-a,
#b-center:checked ~ * .peice-b,
#c-center:checked ~ * .peice-c,
#d-center:checked ~ * .peice-d,
#e-center:checked ~ * .peice-e,
#f-center:checked ~ * .peice-f,
#g-center:checked ~ * .peice-g,
#h-center:checked ~ * .peice-h{
  left:20em;
}
#a-right:checked ~ * .peice-a,
#b-right:checked ~ * .peice-b,
#c-right:checked ~ * .peice-c,
#d-right:checked ~ * .peice-d,
#e-right:checked ~ * .peice-e,
#f-right:checked ~ * .peice-f,
#g-right:checked ~ * .peice-g,
#h-right:checked ~ * .peice-h{
  left:40em;
}
.winner{
  font-family:arial;
  color: #fff;
  text-align: center;
  font-size: 4vw;
  z-index: 100;
  width:100%;
  height:2em;
  position:absolute;
  top:calc(50% - 1em);
  line-height: 2em;
  background: red;
  transform:scale(0);
}
#a-up:checked ~ #a-left:checked ~ #b-up:checked ~ #b-center:checked ~ #c-up:checked ~ #c-right:checked ~ #d-middle:checked ~ #d-left:checked ~ #e-middle:checked ~ #e-center:checked ~ #f-middle:checked ~ #f-right:checked ~ #g-down:checked ~ #g-left:checked ~ #h-down:checked ~ #h-center:checked ~ .winner{
  animation:winner 3s 1 1s;
}
@keyframes winner{
  0%,100%{transform:scale(0);}
  10%,90%{transform:scale(1);}
}

.selectBG{
  display:inline-block;
  font-family:arial;
  font-size:2vmin;
  width:8em;
  text-align:center;
  padding:1em 0;
  background:#000;
  color:#fff;
  border:.25em solid #333;
  margin:2em .25em;
}
#theStarryNight:checked ~ *[for="theStarryNight"],
#forest:checked ~ *[for="forest"],
#fireworks:checked ~ *[for="fireworks"]{
  border-bottom-color:teal;
}
#theStarryNight:checked ~ * [class^=peice]::after{
  background-image:url('resources/images/realEyeTest/theStarryNight.jpg');
}
#forest:checked ~ * [class^=peice]::after{
  background-image:url('resources/images/realEyeTest/forest.jpg');
}  
#fireworks:checked ~ * [class^=peice]::after{
  background-image:url('resources/images/realEyeTest/fireworksDisplay.jpg');
}


</style>
</head>
<body>
<input type="radio" id="theStarryNight" name="image" checked>
<input type="radio" id="forest" name="image">
<input type="radio" id="fireworks" name="image">
<div>
 <img id="photo" src="resources/images/realEyeTest/theStarryNight.jpg"/>
</div>
<label class="selectBG" for="theStarryNight">The Starry Night</label>
<label class="selectBG" for="forest">Forest</label>
<label class="selectBG" for="fireworks">Fireworks Display</label>

<input type="radio" id="a-up" name="a-vertical">
<input type="radio" id="a-middle" name="a-vertical" checked>
<input type="radio" id="a-down" name="a-vertical">
<input type="radio" id="a-left" name="a-horazontal" checked>
<input type="radio" id="a-center" name="a-horazontal">
<input type="radio" id="a-right" name="a-horazontal">
<input type="radio" id="b-up" name="b-vertical" checked>
<input type="radio" id="b-middle" name="b-vertical">
<input type="radio" id="b-down" name="b-vertical">
<input type="radio" id="b-left" name="b-horazontal" checked>
<input type="radio" id="b-center" name="b-horazontal">
<input type="radio" id="b-right" name="b-horazontal">
<input type="radio" id="c-up" name="c-vertical">
<input type="radio" id="c-middle" name="c-vertical" checked>
<input type="radio" id="c-down" name="c-vertical">
<input type="radio" id="c-left" name="c-horazontal">
<input type="radio" id="c-center" name="c-horazontal">
<input type="radio" id="c-right" name="c-horazontal" checked>
<input type="radio" id="d-up" name="d-vertical" checked>
<input type="radio" id="d-middle" name="d-vertical">
<input type="radio" id="d-down" name="d-vertical">
<input type="radio" id="d-left" name="d-horazontal">
<input type="radio" id="d-center" name="d-horazontal" checked>
<input type="radio" id="d-right" name="d-horazontal">
<input type="radio" id="e-up" name="e-vertical">
<input type="radio" id="e-middle" name="e-vertical">
<input type="radio" id="e-down" name="e-vertical" checked>
<input type="radio" id="e-left" name="e-horazontal">
<input type="radio" id="e-center" name="e-horazontal" checked>
<input type="radio" id="e-right" name="e-horazontal">
<input type="radio" id="f-up" name="f-vertical">
<input type="radio" id="f-middle" name="f-vertical" checked>
<input type="radio" id="f-down" name="f-vertical">
<input type="radio" id="f-left" name="f-horazontal">
<input type="radio" id="f-center" name="f-horazontal" checked>
<input type="radio" id="f-right" name="f-horazontal">
<input type="radio" id="g-up" name="g-vertical" checked>
<input type="radio" id="g-middle" name="g-vertical">
<input type="radio" id="g-down" name="g-vertical">
<input type="radio" id="g-left" name="g-horazontal">
<input type="radio" id="g-center" name="g-horazontal">
<input type="radio" id="g-right" name="g-horazontal" checked>
<input type="radio" id="h-up" name="h-vertical">
<input type="radio" id="h-middle" name="h-vertical">
<input type="radio" id="h-down" name="h-vertical" checked>
<input type="radio" id="h-left" name="h-horazontal" checked>
<input type="radio" id="h-center" name="h-horazontal">
<input type="radio" id="h-right" name="h-horazontal">

<div class="board">
  <div class="peice-a">
    <label for="a-up"></label>
    <label for="a-middle"></label>
    <label for="a-down"></label>
    <label for="a-left"></label>
    <label for="a-center"></label>
    <label for="a-right"></label>
  </div>
  <div class="peice-b">
    <label for="b-up"></label>
    <label for="b-middle"></label>
    <label for="b-down"></label>
    <label for="b-left"></label>
    <label for="b-center"></label>
    <label for="b-right"></label>
  </div>
  <div class="peice-c">
    <label for="c-up"></label>
    <label for="c-middle"></label>
    <label for="c-down"></label>
    <label for="c-left"></label>
    <label for="c-center"></label>
    <label for="c-right"></label>
  </div>
  <div class="peice-d">
    <label for="d-up"></label>
    <label for="d-middle"></label>
    <label for="d-down"></label>
    <label for="d-left"></label>
    <label for="d-center"></label>
    <label for="d-right"></label>
  </div>
  <div class="peice-e">
    <label for="e-up"></label>
    <label for="e-middle"></label>
    <label for="e-down"></label>
    <label for="e-left"></label>
    <label for="e-center"></label>
    <label for="e-right"></label>
  </div>
  <div class="peice-f">
    <label for="f-up"></label>
    <label for="f-middle"></label>
    <label for="f-down"></label>
    <label for="f-left"></label>
    <label for="f-center"></label>
    <label for="f-right"></label>
  </div>
  <div class="peice-g">
    <label for="g-up"></label>
    <label for="g-middle"></label>
    <label for="g-down"></label>
    <label for="g-left"></label>
    <label for="g-center"></label>
    <label for="g-right"></label>
  </div>
  <div class="peice-h">
    <label for="h-up"></label>
    <label for="h-middle"></label>
    <label for="h-down"></label>
    <label for="h-left"></label>
    <label for="h-center"></label>
    <label for="h-right"></label>
  </div>
</div>
<div class="winner">WINNER!</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" id="resetBtn" value="Reset"/>
</body>
</html>