/*
***********************
*/
var _gGantt;
var Gantt = {};

Gantt.IE = (window.ActiveXObject) ? 1 : 0;
Gantt.opera = (window.opera) ? 1 : 0;

Gantt.Task = function(suid, uid, id, title, duration, startDate, endDate, progress, hasChild){	
	
	this.index = -1;
	this.suid = suid;
	this.uid = uid;
	this.id = id;
  this.title = title;
  this.parentTaskId;
  this.duration = duration;  
  this.startDate = new Date(Date.parse(startDate));
  this.endDate = new Date(Date.parse(endDate));
  this.progress = progress;
  this.hasChild = hasChild;
  this.isVisible = true;
  
  this.barDiv= null;
  this.prereqs = [];
  this.requires = function(task){
    this.prereqs[this.prereqs.length] = task;
  };
  
};



Gantt.Chart = function(id){	
	
	var self = this;
	_gGantt = this;
	
	this.divContainer = $(id); 

  this.width = 1000;
  //this.allow_tooltip_copy = true;
  this.showTooltip = true;
  this.gridHeight = 22;
  this.cellWidth = 22;
  this.tooltip = true;
  this.divTooltip = null;
  
  this.startDate = null;
  this.endDate = null;
  this.tasks = [];
  this.tasksIndex = [];
  
  this.taskListTable = null;
  this.chartDiv = null;
  this.dateGrid = null;
  
  this.selectedTask = null; 


  this.init = function(){
 
	  this.divContainer.attr("className", "gantt-chart");
	  //---
	  this.taskListTable = $('<table class="task-list" id="tabTaskList"><tbody></tbody></table>');
    this.taskListTable.append($('<tr  height="' + this.gridHeight + '"><td class="task-list" id="taskHeader1">&nbsp;</td><td  class="task-list" id="taskHeader2">&nbsp;</td></tr>'));
    this.taskListTable.append($('<tr  height="' + this.gridHeight + '"><td class="task-list" align="center">任务名</td><td class="task-list" align="center"><nobr>周期</nobr></td></tr>'));	  
	  this.divContainer.append(this.taskListTable);
	  
	  //---
	  this.chartDiv  = $('<div class="chart-div" id="divChart"/>');
	  this.divContainer.append(this.chartDiv); 
	
	  //---
	  this.dateGrid = $('<table class="data-grid"><tbody></tbody></table>');
	  this.chartDiv.append(this.dateGrid);
	  
  
	  //  ---- Initialize Tooltip ----
	  this.divTooltip = $('<div id="task-bar-tooltip" class="gantt-tooltip"/>');	  
	  this.divContainer.append(this.divTooltip);	  
	  this.tooltip = new Gantt.Tooltip("task-bar-tooltip");

	};
  
  
  //  ---- Begin method definitions ----  
  this.schedule = function(){
    
    //get min start date and max end date
    var maxEndDate = null;
    var minStartDate = null;
    
    for(var i = 0; i < this.tasks.length; i++){
    	
      if(maxEndDate == null)
        maxEndDate = this.tasks[i].endDate;
      else{
        if(this.tasks[i].endDate > maxEndDate)
          maxEndDate = this.tasks[i].endDate;
      }
      
      if(minStartDate == null)
        minStartDate = this.tasks[i].startDate;
      else{
        if(this.tasks[i].startDate < minStartDate)
          minStartDate = this.tasks[i].startDate;
      }   
      
    }    
 
    this.endDate = new Date(maxEndDate.getTime());
    this.startDate = new Date(minStartDate.getTime());    
    
    //
    this.tasks.sort(taskSort);
    for(var i = 0; i < this.tasks.length; i++){
      this.tasks[i].index = i;
      //if(this.tasks[i].barDiv!= null)this.tasks[i].barDiv.remove();
    }  
    
    //
    this.drawTaskInfo();
   
    //
    this.drawDateGrid();
    
    //
    this.drawTaskBar();    
    
    //
    this.drawConnectionLine();

  };
  
  this.drawTaskInfo = function(){
  	
  	
 
 		for(var i=0; i<this.tasks.length; i++){
 			var task = this.tasks[i];

 			var intant = '';
 			for(var j =0; j< task.id.split("-").length-1; j++){
 				intant += '<img src="/common/js/gantt/img/blank.gif" width="9" height="9"/>';
 			}
 			
 						
    	var tr = $('<tr class=""  height="' + this.gridHeight + '" id="lstInfo_' + task.id + '" onmouseover="taskMouseMove(\'' + task.id  + '\')"  onmouseout="taskMouseMove(\'' + task.id  + '\')" >'
    	            + '<td class="task-list" ><nobr>' 
    	            + intant + (task.hasChild?'<img src="/common/gantt/img/sub.jpg"  width="9" height="9" id="imgPoint_'+ task.id +'" state="open" onclick="showTask(\'' + task.id  + '\')"/> ':'<img src="/common/gantt/img/blank.gif" width="9px" height="9px"/>') + task.title 
    	            + '</nobr></td><td class="task-duration">' + task.duration + '</td></tr>');    
    	this.taskListTable.append(tr);
    	
			// Show menu when #myDiv is clicked
			$('#lstInfo_' + task.id ).contextMenu({
				menu: 'myMenu'
			},
				function(action, el, pos) {
				   switch   (action)  
					  {  
			        case   "create"   :
			        	window.location = "create.jsp";
			        	break;  
			        default   :   ;  
					  }  
  
			});
    	
    }
    
    this.resize();
  };
  
  this.drawTaskBar = function(task){
  	
  	visibleTaskCount = 0; 	
  	$('#divChart > div').remove();
  	$('#divChart > img').remove(); 	
  	
  	for(var i = 0; i < this.tasks.length; i++) {
		  	
		  	var task = this.tasks[i];
		  	if(task.barDiv)task.barDiv.html('');
		  	
		  	if(!task.isVisible)	continue; 	
  
		  		
		  	var dayOffset = Math.floor((task.startDate.getTime() - this.startDate.getTime()) / (1000 * 60 * 60 * 24) + this.startDate.getDay()) - 1;
		  	
		  	var divBar = $('<div class="gantt-task-bar" idx="'+ task.index +'"></div>');
		  	divBar.css({left:(dayOffset * this.cellWidth - 1), 
		  							top:Math.floor((2+visibleTaskCount++) * this.gridHeight + 2 - Gantt.IE), 
		  							height:15 + Gantt.IE * 2,
		  							width: (this.cellWidth * Math.floor(task.duration) - 1 + Gantt.IE * 2)
		  							});
			  task.barDiv = divBar;
			  
		  	var divBarProgress = $('<div class="gantt-task-bar-progress" ></div>');
		  	divBarProgress.css({left:0, 
		  							top: 12, 
		  							height:2,
		  							width: (this.cellWidth * Math.floor(task.duration) - 1 + Gantt.IE * 2) * task.progress/100,
		  							borderColor: (task.progress==100?'green':'yellow')
		  							});
		
				divBar.append(divBarProgress);
		    this.chartDiv.append(divBar);
		    
		    divBar.mouseover(function(){
		    	
			      for(var i = 0; i < self.tasks.length; i++){
			        self.tasks[i].barDiv.attr('className', 'gantt-task-bar');
			      }
			
			     this.className = "gantt-task-bar-light";
			     var task  =  self.tasks[$(this).attr('idx')];
			     self.selectedTask = task;
			     
			      var prereqs = task.prereqs;
			      for(var idx=0; idx<prereqs.length; idx++){      	
									var tsk = prereqs[idx];		        
					        tsk.barDiv.attr('className', 'gantt-task-bar-light');  	
			      }    
			      
			      // show the tooltip
			      var left = dayOffset * self.cellWidth - self.chartDiv.get(0).scrollLeft + self.taskListTable.get(0).scrollWidth;
			      if(left < self.taskListTable.get(0).scrollWidth)left = self.taskListTable.get(0).scrollWidth;
			        
			   
			      var msg = task.title + ": " + task.startDate.format("MMM d");      
			      msg += " - " + task.endDate.format("MMM d");      
			      msg += "<br/>前置任务:";
			      
			      if(task.prereqs.length == 0)
			        msg += "无";
			      else{
			        var reqStr = "";
			        for(var i = 0; i < task.prereqs.length; i++){
			          if(reqStr != "") reqStr += ", ";
			          reqStr += task.prereqs[i].title;
			        }
			        msg += reqStr;
			      }      
			      
			      msg += "<br>进度:" + task.progress + ' %';
			
			      //self.tooltip.show(left, (2 + task.index) * self.gridHeight, msg, "top-right"); 
		      
		    });
		  }

  };
  
  this.drawConnectionLine = function(){
    
    for(var t = 0; t < this.tasks.length; t++){
    	
      var task = this.tasks[t];
      if(!task.isVisible)continue;
      
      for(var i = 0; i < task.prereqs.length; i++){
        var prereq = task.prereqs[i];
        
        if(!prereq.isVisible)continue;
        
        var px = prereq.barDiv.position().left + prereq.barDiv.width() + 1;
        var py = prereq.barDiv.position().top + 8;
        
        var tx = task.barDiv.position().left;
        var ty = task.barDiv.position().top + 8;
        
        px -= Gantt.IE * 2;
        
        var hLine = $('<div class="h-line"/>');
        hLine.css({top:py, left:px, width:tx-px});
        
        var vLine = $('<div class="v-line"/>');
        vLine.css({top:py, left:tx, height:ty-py-this.gridHeight/2});
        
        var img = $('<img src="/common/js/gantt/img/arrow_blue_down.gif" />');
        img.css({position:"absolute", left:tx-4, top:ty-this.gridHeight/2});
        
        this.chartDiv.append(hLine);
        this.chartDiv.append(vLine);
        this.chartDiv.append(img);
      }
    }

  	
  };
  
  this.onBarDivMouseover = function(){
  	
  };
  

  
  this.drawDateGrid = function(){
  	
  	var timeSpan = this.endDate.getTime() - this.startDate.getTime();
    timeSpan /= 1000 * 60 * 60 * 24 * 7;
    
    var gridHeader1Count = Math.floor(timeSpan + 1.5)
  	
    this.chartDiv.width("");
    this.divContainer.width("");
    
    var startPointDate = this.startDate;
    
    while(startPointDate.getDay() != 1)
      startPointDate.setTime(startPointDate.getTime() - 1000 * 60 * 60 * 24);
    

    this.dateGrid.width(this.cellWidth * 7 * gridHeader1Count);
    
    var d = new Date(startPointDate.getTime());
    

    //draw date header
    var trDateSpanTitle = $('<tr/>');    
    for(var i = 0; i < gridHeader1Count; i++){    	

      var label = d.format("MMM d") + " to ";      
      d.setTime(d.getTime() + 1000 * 60 * 60 * 24 * 6);

      label += d.format("MMM d");
      d.setTime(d.getTime() + 1000 * 60 * 60 * 24 * 1);
      
      trDateSpanTitle.append($('<td align="center" class="grid-title" colspan="7" height="' + (this.gridHeight)  + '"><nobr>' + label + '</nobr></td>'));
    }
    
    var days_of_week = ["一", "二", "三", "四", "五", "六", "日"];
    var trDateBlockTitle = $('<tr/>');
    for(var i = 0; i < gridHeader1Count; i++){
      for(var j = 0; j < days_of_week.length; j++){
        trDateBlockTitle.append($('<td  align="center" class="grid-title" height="' + this.gridHeight + '">' + days_of_week[j] + '</td>'));
      }
    }
    
    this.dateGrid.append(trDateSpanTitle);
    this.dateGrid.append(trDateBlockTitle);
    
    
    //draw date grid
    for(var x = 0; x < this.tasks.length; x++){   	
      
      var task = this.tasks[x];
      var trDateBlock = $('<tr id="lstGrid_' + task.id + '"'
      						+ ' onmouseover="taskMouseMove(\'' + task.id + '\')" '
      						+ ' onmouseout="taskMouseMove(\'' + task.id + '\')"/>');
      
      for(var i = 0; i < gridHeader1Count; i++){
      	
        for(var j = 0; j < days_of_week.length; j++){

          trDateBlock.append($('<td class="' + (j>=5?'gantt-grid-weekend':'gantt-grid-weekday') + '"  height="' + (this.gridHeight + Gantt.IE) + '">&nbsp;</td>'));
        }
        
      }
      this.dateGrid.append(trDateBlock.get(0));
      
    }
    this.resize();

  };
  
  this.addTask = function(task){  	
    this.tasks[this.tasks.length] = task;   
    this.tasksIndex[task.id] = task; 
  }
  
  
  
  this.resize = function(){
  	
    var tasksListWidth = this.taskListTable.attr('scrollWidth');
    var tasksListHeight = this.taskListTable.attr('scrollHeight');
    
    this.taskListTable.attr('width', tasksListWidth);
    $('[id^=taskHeader]').each(function(i, n){
			  $(n).attr('width', $(n).attr('scrollWidth'));
			});
			    
    this.chartDiv.css({left:(tasksListWidth - 1 + 2 * Gantt.IE),
                       height:(tasksListHeight+ 15 + 3 * Gantt.IE),
                      width : this.width});
    
    this.divContainer.css({width:(tasksListWidth + this.width),
                          height:(tasksListHeight + 17)});
  };
  

  
  this.init();
  
};

function taskSort(a,b){
	if(a.id>b.id)return 1;
	if(a.id<b.id)return -1;
	if(a.startDate<b.startDate)return 1;
	if(a.startDate<b.startDate)return -1;
	if(a.endDate<b.endDate)return 1;
	if(a.endDate>b.endDate)return -1;
	
	return 0;
}

function taskMouseMove(id){
	$('#lstGrid_'+id).toggleClass('task-highlight');
	$('#lstInfo_'+id).toggleClass('task-highlight');	
}

function showTask(id){
	//$('[id=lstInfo_' + id + '-*]' ).css('display', 'none');	
	//alert($('#imgPoint_' + id).attr('state'));
	if($('#imgPoint_' + id).attr('state') == 'open'){
		$('[id^=lstInfo_' + id + '-]').hide();
		$('[id^=lstGrid_' + id + '-]').hide();	
		
		
		
		for(i in _gGantt.tasksIndex){
			//alert(i.indexOf(id));
			if(i.indexOf(id)>=0 && i!=id){
					_gGantt.tasksIndex[i].isVisible = false;
			}
		}
		
		$('#imgPoint_' + id).attr('state', 'close');
		$('#imgPoint_' + id).attr('src', 'img/plus.jpg');
	}else{
	  $('[id^=lstInfo_' + id + '-]').show();
	  $('[id^=lstGrid_' + id + '-]').show();
	  
		for(i in _gGantt.tasksIndex){
			//alert(i.indexOf(id));
			if(i.indexOf(id)>=0 && i!=id){
					_gGantt.tasksIndex[i].isVisible = true;
			}
		}
	  
	  	
	  $('#imgPoint_' + id).attr('state', 'open');
	  $('#imgPoint_' + id).attr('src', 'img/sub.jpg');
	}
	
	_gGantt.drawTaskBar();
	_gGantt.drawConnectionLine();
}
