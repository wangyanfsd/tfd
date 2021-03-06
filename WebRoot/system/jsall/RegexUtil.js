function RegexUtil(){
	/**
	 * 正则表达式：座机电话、传真号码
	 */
	this.REGEX_TELEPHONE=/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/;
	/**
	 * 正则表达式：电子邮箱
	 */
	this. REGEX_EMAIL=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	/**
	 * 正则表达式：手机号码
	 */
	this.REGEX_MOBILE_PHONE=/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
	/**
	 * 正则表达式：大于等于0的整数
	 */
	this.REGEX_INT_0_=/^(0|([1-9]\d*))$/;
	/**
	 * 正则表达式：大于0的整数
	 */
	this.REGEX_INT_1_=/^[1-9]\d*(\.\d+)?$/;
	/**
	 * 正则表达式：大于等于0的浮点数
	 */
	this.REGEX_DOUBLE_0_=/^\d+(\.\d+)?$/;
	/**
	 * 正则表达式：所有日期格式验证
	 */
	this.REGEX_DATE_ALL=/^(((1[8-9]\d{2})|([2-9]\d{3}))([-\/])(10|12|0?[13578])([-\/])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/])(11|0?[469])([-\/])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/])(0?2)([-\/])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/])(0?2)([-\/])(29)$)|(^([3579][26]00)([-\/])(0?2)([-\/])(29)$)|(^([1][89][0][48])([-\/])(0?2)([-\/])(29)$)|(^([2-9][0-9][0][48])([-\/])(0?2)([-\/])(29)$)|(^([1][89][2468][048])([-\/])(0?2)([-\/])(29)$)|(^([2-9][0-9][2468][048])([-\/])(0?2)([-\/])(29)$)|(^([1][89][13579][26])([-\/])(0?2)([-\/])(29)$)|(^([2-9][0-9][13579][26])([-\/])(0?2)([-\/])(29))|(((((0[13578])|([13578])|(1[02]))[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9])|(3[01])))|((([469])|(11))[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9])|(30)))|((02|2)[\-\/\s]?((0[1-9])|([1-9])|([1-2][0-9]))))[\-\/\s]?\d{4})(\s(((0[1-9])|([1-9])|(1[0-2]))\:([0-5][0-9])((\s)|(\:([0-5][0-9])\s))([AM|PM|am|pm]{2,2})))?$/;
	
	this.test=function(str,regex){
		return regex.test(str);
	}
}