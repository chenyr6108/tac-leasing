用法：
	用法1：区域输入框的ID一定要为："area" 选择的按钮的ID为："ele1"如：
	<input type="text" name="area" id="area"/><input type="button" value="请选择区域" id="ele1" onclick="openAreas()"/>
	用法2：用块级元素包起你要操作的所有元素如：
	 <span id="ele1"><input type="text" name="area" id="area"/><input type="button" value="请选择区域"  onclick="openAreas()"/></span>