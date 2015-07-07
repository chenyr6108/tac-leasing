/** @author sxh 
 *  2009-10-21 */
function goodDrag(outerDiv, innerDiv, s) {
	if (typeof outerDiv == "string")
		outerDiv = document.getElementById(outerDiv);
	if (typeof innerDiv == "string")
		innerDiv = document.getElementById(innerDiv);
	outerDiv.orig_x = parseInt(outerDiv.style.left) - document.body.scrollLeft;
	outerDiv.orig_y = parseInt(outerDiv.style.top) - document.body.scrollTop;
	outerDiv.orig_index = outerDiv.style.zIndex;

	innerDiv.onmousedown = function(a) {
		this.style.cursor = "move";
		outerDiv.style.zIndex = 10000;
		var d = document;
		if (!a)
			a = window.event;
		var x = a.clientX + d.body.scrollLeft - outerDiv.offsetLeft;
		var y = a.clientY + d.body.scrollTop - outerDiv.offsetTop;
		d.ondragstart = "return false;"
		d.onselectstart = "return false;"
		d.onselect = "document.selection.empty();"

		if (outerDiv.setCapture)
			outerDiv.setCapture();
		else if (window.captureEvents)
			window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);

		d.onmousemove = function(a) {
			if (!a)
				a = window.event;
			outerDiv.style.left = a.clientX + document.body.scrollLeft - x;
			outerDiv.style.top = a.clientY + document.body.scrollTop - y;
			outerDiv.orig_x = parseInt(outerDiv.style.left)
					- document.body.scrollLeft;
			outerDiv.orig_y = parseInt(outerDiv.style.top)
					- document.body.scrollTop;
		}

		d.onmouseup = function() {
			if (outerDiv.releaseCapture)
				outerDiv.releaseCapture();
			else if (window.captureEvents)
				window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
			d.onmousemove = null;
			d.onmouseup = null;
			d.ondragstart = null;
			d.onselectstart = null;
			d.onselect = null;
			outerDiv.style.cursor = "normal";
			outerDiv.style.zIndex = outerDiv.orig_index;
		}
	}

	if (s) {
		var orig_scroll = window.onscroll ? window.onscroll : function() {
		};
		window.onscroll = function() {
			orig_scroll();
			outerDiv.style.left = outerDiv.orig_x + document.body.scrollLeft;
			outerDiv.style.top = outerDiv.orig_y + document.body.scrollTop;
		}
	}
}