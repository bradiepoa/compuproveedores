function GenerarMenu(raiz, base_url, back_url){
	//removemos a los mosaicos existentes
	esconderMenu();

	var tabla = $("#menu>table");
	
	var row, i, length, offset;
	
	if(raiz.parent !== null && !back_url){
		row = $("<tr></tr>")
		row.append(MosaicoVolver(raiz.parent))
		tabla.append(row)
		i = 1
		length = raiz.children.length + 1
		offset = 1
	}
	else{
		i = 0
		length = raiz.children.length
		offset = 0
	}
	
	for(; i < length; ++i){
		if(i%2 == 0)
			row = $("<tr></tr>")
		var index = i-offset
		cell = CrearMosaico(raiz.children[index])	
		
		row.append(cell)
		
		if(i%2 == 0)
			tabla.append(row)
	}
	
	animarMenu()
	desplegarMenu()
}

function CrearMosaico(nodo){
	var cell = $("<td></td>")
	cell.css("opacity", "0")
	var anchor = $("<a></a>")
	//anchor.css("opacity", "0")
	var backColorSubMenu = "#5CA2D0";
	var backColorOpcion = "#2e75a3";
	
	if(nodo.children === undefined || nodo.children.length == 0){
		anchor.attr("href", '/admin' + nodo.buildPath())
	}
	else{
		anchor.attr("href", "#")
		anchor.click(function(){
			GenerarMenu(nodo)
		})
	}	
	
	if(nodo.imageUrl !== undefined)
		anchor.css("background-image", "url("+nodo.imageUrl+")")
	else{
		var span = $("<div></div>")
		span.addClass(TextCssClass(nodo.description))
		anchor.append(span);
		span.html(nodo.description)
	}
	
	if(nodo.parent.parent != null){
		if(nodo.children === undefined || nodo.children.length == 0)
			anchor.addClass("menu_option")
		else
			anchor.addClass("submenu")
		anchor.css("background-color", backColorSubMenu)
	}
	else{
		
		anchor.css("background-color", backColorOpcion)
	}
	
	cell.append(anchor)
	
	return cell
}

function MosaicoVolver(padre){
	var cell = $("<td></td>")
	cell.css("opacity", "0")
	var anchor = $("<a></a>")
	
	anchor.attr("href", "#")
	anchor.click(function(){
		GenerarMenu(padre)
	})
	
	
	anchor.css("background-color", "#F9AD1C");
	anchor.addClass("volver")
	
	cell.append(anchor)
	
	return cell
}

function TextCssClass(string){
	if(string == "Conciliaciones")
		return "menu_text menu_longtext"
	else if(string.lastIndexOf(" ") != -1)
		return "menu_text_2lines"
	else
		return "menu_text menu_text"
}

