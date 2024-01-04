var heightAccionesRapidas, heightAccionesImportantes, accionesRapidasEscondidas, accionesImportantesEscondidas;
function ocultar_recordatorio(){
        $.ajax("/admin/ocultar_recordatorio/")
    }
    
function mostrar_recordatorio(){
        $.ajax("/admin/mostrar_recordatorio/")
    }
    	
	$(document).ready(function(){
		heightAccionesRapidas = $("#acciones_rapidas_wrapper").height();
		heightAccionesImportantes = $("#acciones_importantes").height();
		
		$("#esconder_acciones_rapidas").click(function(){
			if(accionesRapidasEscondidas)
				expandirAccionesRapidas();
			else
				esconderAccionesRapidas();
				
				
		});
		
		$("#esconder_acciones_importantes").click(function(){
			if(accionesImportantesEscondidas){
				expandirAccionesImportantes();
				mostrar_recordatorio() 	
			}
			else{
				esconderAccionesImportantes();
				
		        ocultar_recordatorio() 		
		
			}
			
			
			
		});

	});
	
	function animarMenu(){
		$("#menu table a").mouseenter(function(){
			var backcolor;
			
			if($(this).attr("class") == "volver")
				backcolor = "#F96F1C"
			else if($(this).attr("class") == "submenu" || $(this).attr("class") == "menu_option")
				backcolor = "#3784B6"
			else
				backcolor = "#3f98d2";
				
			$(this).animate({ backgroundColor:backcolor }, 300);
		});
		
		$("#menu table a").mouseleave(function(){
			var backcolor;
			
			if($(this).attr("class") == "volver")
				backcolor = "#F9AD1C"
			else if($(this).attr("class") == "submenu" || $(this).attr("class") == "menu_option")
				backcolor = "#5CA2D0"
			else
				backcolor = "#2e75a3";
				
			$(this).animate({ backgroundColor:backcolor }, 300);
		});
	}
	
	function esconderMenu(){
		//$("#menu table td").animate({opacity:"0", display:"none"}, 2000).remove();
		//setTimeout('$("#menu>table tr").remove()', 3000)
		$("#menu>table tr").remove()
	}
	
	function desplegarMenu(){
		$("#menu table td").each(function(index){
			$(this).delay(index*100).animate({opacity: "1"}, 1000);
		});
	}
	
	function esconderAccionesRapidas(){
		$("#acciones_rapidas_base").css("background-image", "url('imagenes/base_acciones_oculto.png')");
		$("#acciones_rapidas_wrapper").animate({height:18}, 400)
		$("#acciones_rapidas_wrapper2").animate({height:18, paddingTop:"5px"}, 400)
		$(".acciones_rapidas_caption").animate({fontSize:12}, 400)		
		$("#acciones_rapidas_base").css("top", "0px");
		$("#esconder_acciones_rapidas").attr("src", "imagenes/icono_mostrar.png");
		accionesRapidasEscondidas = true;
	}
	
	function expandirAccionesRapidas(){
		$("#acciones_rapidas_wrapper").animate({height:heightAccionesRapidas}, 400)
		$("#acciones_rapidas_wrapper2").animate({height:heightAccionesRapidas, paddingTop:"1em", backgroundImage:"none"}, 400)
		$(".acciones_rapidas_caption").animate({fontSize:15}, 400);		
		$("#esconder_acciones_rapidas").attr("src", "imagenes/icono_ocultar.png");
		accionesRapidasEscondidas = false;
		$("#acciones_rapidas_base").css("background-image", "url('imagenes/base_acciones.png')");
	}
	
	function esconderAccionesImportantes(){
		$("#acciones_importantes").animate({height:30}, 400)
		$("#acciones_importantes_footer").animate({marginBottom:"7px"}, 400)
		$("#acciones_importantes_vermas").css("display", "none")
		$("#esconder_acciones_importantes_link_text").html("Mostrar")
		$("#esconder_acciones_importantes_link_img").attr("src", "/site_media/css/images/vinetas/vineta_abajo_pestana.png")
		accionesImportantesEscondidas = true;
	}
	
	function expandirAccionesImportantes(){
		$("#acciones_importantes").animate({height:heightAccionesImportantes}, 400)
		$("#acciones_importantes_footer").animate({marginBottom:"15px"}, 400)
		$("#acciones_importantes_vermas").css("display", "block")
		$("#esconder_acciones_importantes_link_text").html("Ocultar")
		$("#esconder_acciones_importantes_link_img").attr("src", "/site_media/css/images/vinetas/vineta_arriba_pestana.png")
		accionesImportantesEscondidas = false;
	}
