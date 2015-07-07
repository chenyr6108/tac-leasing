<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="zc_grid ui-jqgrid ui-widget ui-widget-content ui-corner-all">
	<div class="zc_grid_body jqgrowleft">
		<div class="ui-state-default ui-jqgrid-hdiv ">
			<table cellspacing="0" cellpadding="0" border="0" class="ui-jqgrid-htable zc_grid_title">
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td style="text-align: center" width="10%">会签部门:</td>
					<td style="text-align: center;" width="90%">
						<div style="float:left; margin:10px 0 0 50px;">
							<span class="">所有部门：</span>
							<ul id="all" class="connectedSortable">
							
								<c:forEach items="${depts}" var="d">
									<c:set var="isDoing" value="0"/>
									<c:forEach items="${selectDepts}" var="sd">
										<c:if test="${d.CODE == sd }">
										 	<c:set var="isDoing" value="1"/>
										</c:if>
									</c:forEach>
									<c:if test="${isDoing != 1}">
										<li id="${d.CODE }" class="ui-state-default" deptId="${d.CODE }" userId="${d.REMARK}">${d.FLAG}</li>
									</c:if>
								
										
							  	</c:forEach>
							</ul>
						</div>
						<div style="float:left; color:red; margin:100px 0 0 20px; width:50px;">
							向右拖动添加&gt;&gt;<br/><br/><br/><br/><br/><br/><br/><br/>&lt;&lt;向左拖动删除
						</div>
						<div style="float:left; margin:10px 0 0 50px;">
							<span class="">已选择会签部门：</span>
							<ul id="selectDept" class="connectedSortable">
								<c:forEach items="${selectDepts}" var="sd">
									<c:forEach items="${depts}" var="d">
										<c:if test="${d.CODE == sd }">
							  				<li id="${d.CODE }" class="ui-state-default <c:forEach items="${disabledDepts}" var="dd">
								  					<c:if test="${d.CODE == dd }">ui-state-disabled</c:if>
								  				</c:forEach>" deptId="${d.CODE }" userId="${d.REMARK}">${d.FLAG}</li>
							  			</c:if>
							  		</c:forEach>
							  	</c:forEach>
							</ul>
						</div>
					</td>
				</tr>
				<tr class="ui-widget-content jqgrow ui-row-ltr">
					<td colspan="2" style="text-align: center; height: 30px;" width="100%">
						<input id="BPM_DEPTUI_SUBMIT" type="button" class="ui-state-default ui-corner-all" value="保存" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>