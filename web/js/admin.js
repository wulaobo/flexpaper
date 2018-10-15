$(function(){
     changeFrameHeight();  
     /*tip*/
    toggleInfo('.adminMessage','.dropdownMessages');
    toggleInfo('.adminTask','.dropdowTask01');
    $('.caret').click(function(){
    	$('.nav-sec-toggle').toggle()
    })
});
	 

/*iframe的高度随着屏幕而改变*/
function changeFrameHeight(){
    var ifm = document.getElementById("pageWellcome"); 
    ifm.height =document.documentElement.clientHeight;
}
function toggleInfo(a,b){
	$(a).on('click',function(){
		$(b).toggle();
	})
}