/* 사용자 메뉴 */
$(document).ready(function() {
	/* 사용자 메뉴 */
	$("#accountMenu").hide();
	
	$('#pageHeaderAccount').click(function() {
		$('#accountMenu').slideToggle('fast');
	});

	$('.cMenu').mouseenter(function() {
		if($(this).css('opacity') == 0.5) {
			$(this).css( 'cursor', 'default' );
		}
		if($(this).css('opacity') == 1) {
			$(this).css( 'cursor', 'pointer' );
		}
    });
    
	/* 비활성화 메뉴 */
	/*
	$('.cMenu').mouseenter(function() {
        $(this).fadeTo('fast',1);
    })
    $('.cMenu').mouseleave(function() {
        $(this).fadeTo('fast',0.5);
    })
    */

	 //전체선택 체크박스 클릭
    $(".flist-chkbox").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우
        if ($(this).prop("checked")) {
            //해당화면에 전체 checkbox들을 체크해준다
        	$(this).prop("checked", true);
            //alert("true");
            //$('#Dday').css({opacity: 1});
			$('#download').css({opacity: 1});
			$('#upload').css({opacity: 0.5});
			$('#delete').css({opacity: 1});
        // 전체선택 체크박스가 해제된 경우
        } else {
            //해당화면에 모든 checkbox들의 체크를해제시킨다.
        	$(this).prop("checked",false);
            //alert("false");
            //$('#Dday').css({opacity: 0.5});
			$('#download').css({opacity: 0.5});
			$('#upload').css({opacity: 1});
			$('#delete').css({opacity: 0.5});
		}
    });

	 //전체선택 체크박스 클릭
    $("#allCheck").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우
        if($("#allCheck").prop("checked")) {
            //해당화면에 전체 checkbox들을 체크해준다
            $("input[type=checkbox]").prop("checked",true);
        // 전체선택 체크박스가 해제된 경우
        } else {
            //해당화면에 모든 checkbox들의 체크를해제시킨다.
            $("input[type=checkbox]").prop("checked",false);
        }
    });
});