$(document).ready(function(){

    var viewportWidth;
        
    function setWidths() {

        // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
        if (typeof window.innerWidth != 'undefined')
        {
            viewportWidth = window.innerWidth;
        }
        
        // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
        else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0)
        {
           viewportWidth = document.documentElement.clientWidth;
        }
        
        // older versions of IE
        else
        {
           viewportWidth = document.getElementsByTagName('body')[0].clientWidth;
        }        
    }

    function positions() {
           
        var grass = $('.grass');
        var scene = $('.scene');
        
        if (viewportWidth >= 1400) {
            
            grass.css({
                'left'  :   'auto'
            });
            scene.css({
                'left'  :   'auto'
            });
            
        } else {

            grass.css({
                'left'  :   -((1400 - viewportWidth) / 2)
            });
            scene.css({
                'left'  :   -((1400 - viewportWidth) / 2)
            });


        }
        
    }
    
    setWidths();
    positions();

    $(window).resize(function(){
        setWidths();
        positions();
        
        
    });
if ($(".slidertop").length) {
	$(".slidertop").wtListRotator({
		screen_width:634,
		screen_height:286,
		item_width:220,
		item_height:109,
		item_display:3,
		list_align:"right",
		scroll_type:"mouse_move",
		auto_start:true,
		delay:5000,
		transition:"fade",
		transition_speed:800,
		display_playbutton:false,
		display_number:false,
		display_timer:false,
		display_arrow:false,
		display_thumbs:true,
		display_scrollbar:true,
		pause_mouseover:true,
		cpanel_mouseover:false,					
		text_mouseover:false,
		text_effect:"fade",
		text_sync:true,
		cpanel_align:"TR",
		timer_align:"bottom",
		move_one:false,
		auto_adjust:true,
		shuffle:false,
		block_size:634,
		vert_size:634,
		horz_size:316,
		block_delay:35,
		vstripe_delay:90,
		hstripe_delay:180					
	});
}
});
