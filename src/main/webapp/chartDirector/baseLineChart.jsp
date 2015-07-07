<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>

<chart:chartTag chartResult="${chartResult }"/>
<chart:chartTag chartResult="${chartResult1 }"/>

<%-- <%@page import="ChartDirector.*" %>
<%@page import="java.util.*" %>
<%
XYChart c = new XYChart(600, 400);
c.setBackground(c.linearGradientColor(0, 0, 0, 100, 0x99ccff, 0xffffff), 0x888888);
c.setRoundedFrame();
c.setDropShadow();

// Add a title using 18 pts Times New Roman Bold Italic font. Set top margin to 16
// pixels.
c.addTitle("业绩情况表", "华文楷体", 18).setMargin2(0, 0, 16, 0);

// Set the plotarea at (60, 80) and of 510 x 275 pixels in size. Use transparent
// border and dark grey (444444) dotted grid lines
PlotArea plotArea = c.setPlotArea(60, 80, 510, 275, -1, -1, Chart.Transparent, c.dashLineColor(0x444444, 0x0101), -1);
LegendBox legendBox = c.addLegend(plotArea.getLeftX() + plotArea.getWidth() / 2, 45, false, "华文楷体", 10);
legendBox.setAlignment(Chart.TopCenter);
legendBox.setBackground(Chart.Transparent, Chart.Transparent);

c.yAxis().setTickDensity(20);
c.xAxis().setTickDensity(40);

// Set all axes to transparent
c.xAxis().setColors(Chart.Transparent);
c.yAxis().setColors(Chart.Transparent);

// Set the x-axis margins to 15 pixels, so that the horizontal grid lines can extend
// beyond the leftmost and rightmost vertical grid lines
c.xAxis().setMargin(15, 15);

// Set axis label style to 8pts Arial Bold
c.xAxis().setLabelStyle("Courier New Bold", 9);
c.yAxis().setLabelStyle("Courier New Bold", 9);
//c.yAxis2().setLabelStyle("Arial Bold", 8);

// Add axis title using 10pts Arial Bold Italic font
c.yAxis().setTitle("业绩", "微软雅黑", 10);

double[] dataY1 = {1,2,3,4,5,6,7,8,9,10};
double[] dataX1 = {1,2,3,4,5,6,7,8,9,10};

double[] dataY2 = {10,9,8,7,6,5,4,3,2,1};
double[] dataX2 = {1,2,3,4,5,6,7,8,9,10};

double[] dataY3 = {5,2,3,8,5,6,4,8,9};
double[] dataX3 = {2,3,4,5,6,7,8,9,10};

LineLayer layer0 = c.addLineLayer2();
layer0.addDataSet(dataY1, 0xff0000, "昆山").setDataSymbol(Chart.GlassSphere2Shape, 10);
layer0.setXData(dataX1);
layer0.setLineWidth(2);

// Add the second data series
LineLayer layer1 = c.addLineLayer2();
layer1.addDataSet(dataY2, 0x00ff00, "东莞").setDataSymbol(Chart.GlassSphere2Shape, 8);
layer1.setXData(dataX2);
layer1.setLineWidth(3);

// Add the third data series
LineLayer layer2 = c.addLineLayer2();
layer2.addDataSet(dataY3, 0xff6600, "苏州").setDataSymbol(Chart.GlassSphere2Shape, 8);
layer2.setXData(dataX3);
layer2.setLineWidth(3);

// Output the chart
String chartURL = c.makeSession(request, "chart1");

// Include tool tip for the chart
String imageMap = c.getHTMLImageMap("", "", "title='{dataSetName}{x}月{xLabel}业{dataSet}绩为： {value}'");
%>
<img src='<%=response.encodeURL(request.getContextPath() + "/chartDirector/getchart.jsp?" + chartURL)%>'
    usemap="#map1" border="0">
<map name="map1"><%=imageMap%></map> --%>

<%-- <img src='<%=response.encodeURL(request.getContextPath() + "/chartDirector/getchart.jsp?" + ((ChartResult)request.getAttribute("chartResult")).getChartURL())%>'
    usemap="#map1" border="0">
<map name="map1"><%=request.getAttribute("imageMap")%></map> --%>
