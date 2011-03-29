function initializeTwits()
{
	$(document).ready(function(){
		$.get('todos/twits.js', function(data) {
			eval(data);
		});	
	});
}

function alertbox(s)
{
	$('#alertbox').html(s);
	$(function () {
		var $alert = $('#alertbox');
		if($alert.length) {
			var alerttimer = window.setTimeout(function () {
				$alert.trigger('click');
			}, 3000);
			$alert.animate({height: $alert.css('line-height') || '50px'}, 200)
				.click(function () {
					window.clearTimeout(alerttimer);
					$alert.animate({height: '0'}, 200);
				});
			}
		}
	);
}
