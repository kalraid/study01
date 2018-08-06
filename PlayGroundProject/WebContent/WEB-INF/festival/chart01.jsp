<%@page import="java.util.*, com.playground.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<style>
		.zc-ref {
		  /* display: none; */
		}		
	</style>
	<script src= "https://cdn.zingchart.com/zingchart.min.js"></script>
	
<script>
// [dskfsd, sjkfsd, fjskd]
var aList = ${ aList };
var nameList = ${ nameList };
var chartList = ${ chartList};	

$(function(){
	
	zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
	ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9","ee6b7db5b51705a13dc2339db3edaf6d"];
	zingchart.THEME="classic";

	
	
			
	var myConfig = {
		    "background-color":"#ecf2f6",
		    "graphset":[
		        {
		            "type":"bar",
		            "background-color":"#fff",
		            "border-color":"#dae5ec",
		            "border-width":"1px",
		            "height":"30%",
		            "width":"96%",
		            "x":"2%",
		            "y":"3%",
		            "title":{
		                "margin-top":"7px",
		                "margin-left":"9px",
		                "font-family":"Arial",
		                "text":"DEPARTMENT PERFORMANCE",
		                "background-color":"none",
		                "shadow":0,
		                "text-align":"left",
		                "font-size":"11px",
		                "font-weight":"bold",
		                "font-color":"#707d94"
		            },
		            "scale-y":{
		                "values":"0:300:100",
		                "max-ticks":4,
		                "max-items":4,
		                "line-color":"none",
		                "tick":{
		                    "visible":false
		                },
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding-right":"5px"
		                },
		                "guide":{
		                    "rules":[
		                        {
		                          "rule":"%i == 0",
		                          "line-width":0
		                        },
		                        {
		                          "rule":"%i > 0",
		                          "line-style":"solid",
		                          "line-width":"1px",
		                          "line-color":"#d2dae2",
		                          "alpha":0.4 
		                        }
		                    
		                    ]
		                }
		            },
		            "scale-x":{
		                "items-overlap":true,
		                "max-items":9999,
		                "values":["Apparel","Drug","Footwear","Gift Card","Home","Jewelry","Garden","Other"],
		                "offset-y":"1px",
		                "line-color":"#d2dae2",
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "padding-top":"2px"
		                },
		                "tick":{
		                    "visible":false,
		                    "line-color":"#d2dae2"
		                },
		                "guide":{
		                    "visible":false
		                }
		            },
		            "plotarea":{
		                "margin":"45px 20px 38px 45px"
		            },
		            "plot":{
		                "bar-width":"33px",
		                "hover-state":{
		                    "visible":false
		                },
		                "animation":{
		                    "delay":500,
		                    "effect":"ANIMATION_SLIDE_BOTTOM"
		                },
		                "tooltip":{
		                    "font-color":"#fff",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "border-radius":"6px",
		                    "shadow":false,
		                    "padding":"5px 10px",
		                    "background-color":"#707e94"
		                }
		            },
		            "series":[
		                {
		                    "values":[150,165,173,201,185,195,162,125],
		                    "styles":[
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#25a6f7"
		                        },
		                        {
		                            "background-color":"#ad6bae"
		                        },
		                        {
		                            "background-color":"#707d94"
		                        },
		                        {
		                            "background-color":"#f3950d"
		                        },
		                        {
		                            "background-color":"#e62163"
		                        },
		                        {
		                            "background-color":"#4e74c0"
		                        },
		                        {
		                            "background-color":"#9dc012"
		                        }
		                    ]
		                }
		            ]
		        },
		        {
		            "type":"hbar",
		            "background-color":"#fff",
		            "border-color":"#dae5ec",
		            "border-width":"1px",
		            "x":"2%",
		            "y":"35.2%",
		            "height":"63%",
		            "width":"30%",
		            "title":{
		                "margin-top":"7px",
		                "margin-left":"9px",
		                "text":"BRAND PERFORMANCE",
		                "background-color":"none",
		                "shadow":0,
		                "text-align":"left",
		                "font-family":"Arial",
		                "font-size":"11px",
		                "font-color":"#707d94"
		            },
		            "scale-y":{
		                "line-color":"none",
		                "tick":{
		                    "visible":false
		                },
		                "item":{
		                    "visible":false
		                },
		                "guide":{
		                    "visible":false
		                }
		            },
		            "scale-x":{
		                "values":["Kenmore","Craftsman","DieHard","Land's End","Laclyn Smith","Joe Boxer"],
		                "line-color":"none",
		                "tick":{
		                    "visible":false
		                },
		                "item":{
		                    "width":200,
		                    "text-align":"left",
		                    "offset-x":206,
		                    "offset-y":-12,
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "padding-bottom":"8px"
		                },
		                "guide":{
		                    "visible":false
		                }
		            },
		            "plot":{
		                "bars-overlap":"100%",
		                "bar-width":"12px",
		                "thousands-separator":",",
		                "tooltip":{
		                    "font-color":"#ffffff",
		                    "background-color":"#707e94",
		                    "font-family":"Arial",
		                    "font-size":"11px",
		                    "border-radius":"6px",
		                    "shadow":false,
		                    "padding":"5px 10px"
		                },
		                "hover-state":{
		                    "background-color":"#707e94"
		                },
		                "animation":{
		                    "delay":500,
		                    "effect":"ANIMATION_EXPAND_LEFT"
		                }
		            },
		            "plotarea":{
		                "margin":"50px 15px 10px 15px"
		            },
		            "series":[
		                {
		                    "values":[103902,112352,121823,154092,182023,263523],
		                    "z-index":2,
		                    "styles":[
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#4dbac0"
		                        },
		                        {
		                            "background-color":"#4dbac0"
		                        }
		                    ],
		                    "tooltip-text":"$%node-value"
		                },
		                {
		                    "max-trackers":0,
		                    "values":[300000,300000,300000,300000,300000,300000],
		                    "data-rvalues":[103902,112352,121823,154092,182023,263523],
		                    "background-color":"#d9e4eb",
		                    "z-index":1,
		                    "value-box":{
		                        "visible":true,
		                        "offset-y":"-12px",
		                        "offset-x":"-54px",
		                        "text-align":"right",
		                        "font-color":"#8391a5",
		                        "font-family":"Arial",
		                        "font-size":"11px",
		                        "text":"$%data-rvalues",
		                        "padding-bottom":"8px"
		                    }
		                }
		            ]
		        },
		        {
		            "type":"line",
		            "background-color":"#fff",
		            "border-color":"#dae5ec",
		            "border-width":"1px",
		            "width":"64%",
		            "height":"63%",
		            "x":"34%",
		            "y":"35.2%",
		            "title":{
		                "margin-top":"7px",
		                "margin-left":"12px",
		                "text":"TODAY'S SALES",
		                "background-color":"none",
		                "shadow":0,
		                "text-align":"left",
		                "font-family":"Arial",
		                "font-size":"11px",
		                "font-color":"#707d94"
		            },
		            "plot":{
		                "animation":{
		                    "delay":500,
		                    "effect":"ANIMATION_SLIDE_LEFT"
		                }
		            },
		            "plotarea":{
		                "margin":"50px 25px 70px 46px"
		            },
		            "scale-y":{
		                "values":"0:100:25",
		                "line-color":"none",
		                "guide":{
		                    "line-style":"solid",
		                    "line-color":"#d2dae2",
		                    "line-width":"1px",
		                    "alpha":0.5
		                },
		                "tick":{
		                    "visible":false
		                },
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding-right":"5px"
		                }
		            },
		            "scale-x":{
		                "line-color":"#d2dae2",
		                "line-width":"2px",
		                "values":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
		                "tick":{
		                    "line-color":"#d2dae2",
		                    "line-width":"1px"
		                },
		                "guide":{
		                    "visible":false
		                },
		                "item":{
		                    "font-color":"#8391a5",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding-top":"5px"
		                }
		            },
		            "legend":{
		                "layout":"x4",
		                "background-color":"none",
		                "shadow":0,
		                "margin":"auto auto 15 auto",
		                "border-width":0,
		                "item":{
		                    "font-color":"#707d94",
		                    "font-family":"Arial",
		                    "padding":"0px",
		                    "margin":"0px",
		                    "font-size":"9px"
		                },
		                "marker":{
		                    "show-line":"true",
		                    "type":"match",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "size":4,
		                    "line-width":2,
		                    "padding":"3px"
		                }
		            },
		            "crosshair-x":{
		                "lineWidth":1,
		                "line-color":"#707d94",
		                "plotLabel":{
		                    "shadow":false,
		                    "font-color":"#000",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding":"5px 10px",
		                    "border-radius":"5px",
		                    "alpha":1
		                },
		                "scale-label":{
		                    "font-color":"#ffffff",
		                    "background-color":"#707d94",
		                    "font-family":"Arial",
		                    "font-size":"10px",
		                    "padding":"5px 10px",
		                    "border-radius":"5px"
		                }
		            },
		            "tooltip":{
		                "visible":false
		            },
		            "series":[
		                {
		                    "values":[69,68,54,48,70,74,98,70,72,68,49,69],
		                    "text":"Kenmore",
		                    "line-color":"#4dbac0",
		                    "line-width":"2px",
		                    "shadow":0,
		                    "marker":{
		                        "background-color":"#fff",
		                        "size":3,
		                        "border-width":1,
		                        "border-color":"#36a2a8",
		                        "shadow":0
		                    },
		                    "palette":0
		                },
		                {
		                    "values":[51,53,47,60,48,52,75,52,55,47,60,48],
		                    "text":"Craftsman",
		                    "line-width":"2px",
		                    "line-color":"#25a6f7",
		                    "shadow":0,
		                    "marker":{
		                        "background-color":"#fff",
		                        "size":3,
		                        "border-width":1,
		                        "border-color":"#1993e0",
		                        "shadow":0
		                    },
		                    "palette":1,
		                    "visible":1
		                },
		                {
		                    "values":[42,43,30,50,31,48,55,46,48,32,50,38],
		                    "text":"DieHard",
		                    "line-color":"#ad6bae",
		                    "line-width":"2px",
		                    "shadow":0,
		                    "marker":{
		                        "background-color":"#fff",
		                        "size":3,
		                        "border-width":1,
		                        "border-color":"#975098",
		                        "shadow":0
		                    },
		                    "palette":2,
		                    "visible":1
		                },
		                {
		                    "values":[25,15,26,21,24,26,33,25,15,25,22,24],
		                    "text":"Land's End",
		                    "line-color":"#f3950d",
		                    "line-width":"2px",
		                    "shadow":0,
		                    "marker":{
		                        "background-color":"#fff",
		                        "size":3,
		                        "border-width":1,
		                        "border-color":"#d37e04",
		                        "shadow":0
		                    },
		                    "palette":3
		                }
		            ]
		        }
		    ]
		};
			

	
	zingchart.render({ 
		id : 'myChart', 
		data : myConfig, 
		height: 670, 
		width: '100%' 
	});
	
	
});
</script>	

</head>
<body>
	<div id='myChart'><a class="zc-ref" href="https://www.zingchart.com/"></a></div>
</body>
</html>