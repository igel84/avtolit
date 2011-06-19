$(document).ready(function() {	
		
	jQuery.fn.fileList = function() {
		this.click(function() {
			var id = $(this).next().attr('id');
			if ($('#'+id).is(':visible'))
				{ $('#'+id).fadeOut(100); }
			else
			{
				var br = this.getBoundingClientRect();			
				$('#'+id).css(
					{'top': br.top, 'left': br.left, 'position': 'absolute'}
				);
				$('#'+id).fadeIn(500);
			}
			return false;
		});
	};
	
	$('.filetip').fileList();
	
	jQuery.fn.animatesTable = function () {  
  	this.mousedown(function() {
			$(this).removeClass("over");
			$(this).removeClass('current') 
			$(this).addClass("current");
		});
		this.mouseover(function() {
			$(this).addClass("over");		
		});
		this.mouseout(function() {
			$(this).removeClass("over");	
		});
		this.click(function() {
			var id = $(this).attr("id");
			$("#artNum").html("<input id='article_id' name='num_spec' size='30' type='text' value='"+id+"'/>");
			$("#subNum").click();
		});
	};  
	//
	// СКРЫТИЕ ОБЪЕКТОВ
	//
	$('#f > div').hide();
	$('#editInfo').hide();
	$('#hideShow').hide();
	$('#fileTable').hide();
	//
	// АНИМАЦИЯ НАВЕДЕНИЯ МЫШИ НА ОБЬЕКТ
	//	
	$(".striping tr").animatesTable();
	//
	// ДОБАВЛЕНИЕ ЭЛЕМЕНТА
	//
	$("#newID").click(function() {
		
		//return false;
		/*
		$('div#editForm form').attr('method', 'put').attr('action', '/cms/articles/add');
		$("#inputID").html("<input name='id' type='hidden'/>");
		$("#inputTitle").html("<input id='title' value='' name='title' type='text'/>");
		$("#inputBody").html("<textarea id='body' name='body'></textarea>");
		$("#inputInfo").html("<input id='info' value='' name='info' type='text'/>");
		*/		
		//return false;
	});
	//
	
	//
	// УДАЛЕНИЕ ЭЛЕМЕНТА
	//
	$('#dialog').dialog({
		autoOpen: false,
		height: 180,
		modal: true,
		resizable: false,
		buttons: {
			'Подтвердить': function(){
				$(this).dialog('close');
				//$('#f > div').hide();		
				//$('div#editForm form').attr('method', 'post').attr('action', '/cms/articles/rem');
				//$('#but').click();
				//$("#remThis").trigger('click');
			},
			'Отмена': function(){
				$(this).dialog('close');
				//$('#f > div').hide();
			}
		}
	});	
	$("#destroyID").click(function() {
		alert('kjhkj');
		//if ($('.striping tr').attr('class') == 'current') {
		if ($('#f > div').is(':visible')) {		
			$('#dialog').dialog('open');
			//$('div#editForm form').attr('method', 'delete').attr('action', '/cms/articles/rem');
		}	else {
			alert('нужно выбрать строку!');
		}
		return false;
	});
	
	
	
	// ОТПРАВКА ЭЛЕМЕНТА И СКРЫТИЕ ФОРМЫ
	//
	$('div#editForm form').submit(function() {		
		alert('dfdf');		
		
		if (action == 'rem') {
			alert('dsf');		
			$('div#editForm form').attr('method', 'post').attr('action', '/cms/articles/rem');					
		}
		//$('div#editForm form').attr('method', 'post').attr('action', ('/cms/articles/'+action));		
		$('.striping tr').removeClass('current');
		$('#f hr').next().animate({opacity: 'hide', height:'hide'}, 'slow');	
	});
});
