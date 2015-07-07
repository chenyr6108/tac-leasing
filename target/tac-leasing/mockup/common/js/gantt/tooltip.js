/*
 *  tooltip.js manages the creation and display of DHTML tooltips.
 *  
 *  Written on 5/20/2008 by Robert Miller for Delphic Sage
 *  http://www.delphicsage.com/
*/

Gantt.Tooltip = function(id)
{
  this.last_show_time = 0;
  
  this.div = document.getElementById(id);
  
  this.zIndex = 1;
  
  this.color = "#F3DC6B";
  
  this.div.style.position = "absolute";
  this.div.style.display = "none";
  
  this.triangle_div = document.createElement("div");
  this.div.appendChild(this.triangle_div);
  
  this.message_div = document.createElement("div");
  this.message_div.className = "tooltip-message";
  this.message_div.style.padding = "8px";
  this.message_div.style.borderWidth = "1px";
  this.message_div.style.borderStyle = "solid";
  this.message_div.style.borderColor = "#000";
  this.message_div.style.backgroundColor = this.color; // F3DC6B
  
  // this.message_div.style.MozBorderRadius = "11px;"
  
  this.message_div.align = "left";
  this.message_div.style.top = "-1px";
  this.message_div.style.position = "relative";
  this.message_div.style.textAlign = "left";
  this.message_div.className = this.div.className;
  
  this.div.appendChild(this.message_div);
  
  
  /*
   *  show displays tooltip with the specified message
   *  at the specified coordinates. pos determines the
   *  position of the tooltip in relation to the given
   *  coordinate pair.
   *  
   *    top - the tooltip appears above the point
   *    bottom - the tooltip appears below the point
   *  
   *  You can also specify the horizontal positioning:
   *  "top-left", or "bottom-right", etc. If no horizontal
   *  position is specified, the tooltip will be
   *  positioned to the right of the point unless it won't
   *  fit on the page that way, in which case it is placed
   *  to the left of the point.
  */
  this.show = function(x, y, msg_txt, pos)
  {
    this.last_show_time = new Date().getTime();
    
    this.triangle_div.innerHTML = "";
    this.message_div.innerHTML = msg_txt;
    this.message_div.style.zIndex = this.zIndex;
    
    var mx = x;
    var my = y;
        
    var window_width;
    if(window.innerWidth)
      window_width = window.innerWidth;
    else if(document.body.clientWidth)
      window_width = document.body.clientWidth;
    else if(document.documentElement.clientWidth)
      window_width = document.documentElement.clientWidth;
    
    var tooltip_width = this.message_div.scrollWidth;
    var tooltip_height = this.message_div.scrollHeight;
    
    // if only top/bottom is specified for the
    // triangle's position, figure out left/right
    // based on where on the screen the tooltip
    // will be.
    if(pos.indexOf("-") < 0)
    {
      if(mx + tooltip_width + 16 > window_width)
        pos += "-left";
      else
        pos += "-right";
    }
    
    var html = "";
    if(pos == "bottom-left")
    {
      var left = tooltip_width - 36;
      var top = -21;
      mx -= left + 20;
      my += 20;
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-top-width: 21px;";
      html += "border-top-style: solid;";
      html += "border-top-color: transparent;";
      html += "border-right-width: 21px;";
      html += "border-right-style: solid;";
      html += "border-right-color: " + this.color + ";";
      html += "position: absolute; left: " + left + "px; top: " + top + "px; z-index: " + (this.zIndex + 1) + ";"; // z-index: 2
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-top-width: 22px;";
      html += "border-top-style: solid;";
      html += "border-top-color: transparent;";
      html += "border-right-width: 22px;";
      html += "border-right-style: solid;";
      html += "border-right-color: #000001;";
      html += "position: absolute; top: " + (top - 2) + "px; left: " + left + "px; z-index: " + (this.zIndex - 1) + ";"; // z-index: 1;
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
    }
    else if(pos == "top-left")
    {
      var left = tooltip_width - 36;
      var top = tooltip_height - 2;
      mx -= left + 20;
      my -= top + 20;
      
      window.status = tooltip_width + " x " + tooltip_height;
      
      html += "<div style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-bottom-width: 22px;";
      html += "border-bottom-style: solid;";
      html += "border-bottom-color: transparent;";
      html += "border-right-width: 22px;";
      html += "border-right-style: solid;";
      html += "border-right-color: " + this.color + ";";
      html += "position: absolute; left: " + (left - 1) + "px; top: " + (top - 1 - Gantt.IE) + "px; z-index: " + (this.zIndex + 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
      
      html += "<div style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-bottom-width: 23px;";
      html += "border-bottom-style: solid;";
      html += "border-bottom-color: transparent;";
      html += "border-right-width: 23px;";
      html += "border-right-style: solid;";
      html += "border-right-color: #000001;";
      html += "position: absolute; top: " + (top - Gantt.IE) + "px; left: " + (left - 1) + "px; z-index: " + (this.zIndex - 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
    }
    else if(pos == "top-right")
    {
      var left = 16;
      var top = tooltip_height - 2;
      mx -= left;
      my -= top + 20;
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0px;";
      html += "border-bottom-width: 22px;";
      html += "border-bottom-style: solid;";
      html += "border-bottom-color: transparent;";
      html += "border-left-width: 22px;";
      html += "border-left-style: solid;";
      html += "border-left-color: " + this.color + ";";
      html += "position: absolute; left: " + left + "px; top: " + (top - 1 - Gantt.IE) + "px; z-index: " + (this.zIndex + 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-bottom-width: 23px;";
      html += "border-bottom-style: solid;";
      html += "border-bottom-color: transparent;";
      html += "border-left-width: 23px;";
      html += "border-left-style: solid;";
      html += "border-left-color: #000001;";
      html += "position: absolute; top: " + (top - Gantt.IE) + "px; left: " + (left - 1) + "px; z-index: " + (this.zIndex - 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
    }
    else
    {
      var top = -21;
      my += 20;
      mx -= 16;
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-top-width: 21px;";
      html += "border-top-style: solid;";
      html += "border-top-color: transparent;";
      html += "border-left-width: 21px;";
      html += "border-left-style: solid;";
      html += "border-left-color: " + this.color + ";";
      html += "position: absolute; left: 16px; top: " + top + "px; z-index: " + (this.zIndex + 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
      
      html += "<div class='ds-tooltip-triangle' style='width: 0px; height: 0px; font-size: 0pt;";
      html += "border-top-width: 22px;";
      html += "border-top-style: solid;";
      html += "border-top-color: transparent;";
      html += "border-left-width: 22px;";
      html += "border-left-style: solid;";
      html += "border-left-color: #000001;";
      html += "position: absolute; top: " + (top - 2) + "px; left: 15px; z-index: " + (this.zIndex - 1) + ";";
      html += "filter: chroma(color=#000000);'>";
      html += "</div>";
    }
    
    
    // shift the tooltip up a few pixels in IE only
    my -= 5 * Gantt.IE;
    
    this.triangle_div.innerHTML = html;
    this.div.style.left = (10 + mx) + "px";
    this.div.style.top = (10 + my) + "px";
    this.div.style.display = "block";
  }
  
  this.hide = function()
  {
    this.triangle_div.innerHTML = "";
    this.div.style.display = "none";
  }
}