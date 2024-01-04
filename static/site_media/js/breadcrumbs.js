function createBreadCrumbs(branch){
	var contenedor = $("#breadcrumbs")
	var links = new Array()
	nodos_breadcrumbs = branch
	
	for(var i = 0; i < branch.length; ++i){
		
		var a =  $("<a></a>");
		a.addClass("item_navegacion")
		
		if(i == 0){
			a.attr("href", "/")
			
			a.html("INICIO")
		}
		else{
			if(branch[i].children !== undefined && branch[i].children.length > 0){
				a.attr("href", "#")
				a.attr("alt", i)
				var current = branch[i]
				a.click(function(){
					GenerarMenu(nodos_breadcrumbs[$(this).attr("alt")])
				})
			}
			else
				a.attr("href", "/admin" + branch[i].buildPath())
				
			a.html(branch[i].description)
		}
		
		if(i == branch.length-1)
			a.addClass("bold")
		links.push(a)
	}
	
	for(var i = 0; i < links.length; ++i){
		contenedor.append(links[i])
		if(i < links.length - 1)
			contenedor.append(" / ")
	}
}
