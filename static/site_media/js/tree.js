function TreeNode(name, description, imageUrl){
	this.name = name;
	this.description = description;
	this.imageUrl = imageUrl;
	this.children = [];
	this.parent = null;
}

TreeNode.prototype.toString = function(){
	if(this.name !== undefined && this.description !== undefined)
		return this.name + " - " + this.description
	else
		return "root node"
}

TreeNode.prototype.addChild = function(child){
	this.children.push(child)
	child.parent = this
}

TreeNode.prototype.findNode = function(name){
	var tokens = name.split('/')
	
	var hojas = this.getLeafs(tokens[tokens.length-1])
	
	if(hojas.length == 1)
		return hojas[0]
	else if(hojas.length > 1){
		var nodo = null
		for(var i = 0; i < hojas.length;  ++i){
			var padre = hojas[i].parent
			for(var j = tokens.length - 2; j >= 0; --j){
				if(padre.name == tokens[j])
					padre = padre.parent
				else{
					padre = null
					break
				}
			}
			if(padre != null){
				nodo = hojas[i]
				break
			}
		}
		return nodo
	}
	
	/*else if(name === this.name)
		return [this]
	
	if(this.children === undefined || this.children.length == 0){
		return false
	}
	else{
		
		for(var i = 0; i < this.children.length; ++i){
			x = this.children[i].findNode(name)
			if(x !== false){
				x.push(this)
				return x
			}
		}
		return false
	}*/
}

TreeNode.prototype.getLeafs = function(name){
	if(name === undefined)
		return false;
		
	
	var hojas = new Array()
	
	if(this.children === undefined || this.children.length == 0){
		// Este nodo es una hoja
		if(this.name == name)
			return [this]
		else
			return false
	}
	else
	{
		// cuando es rama
		for(var i = 0; i < this.children.length; ++i){
			ret = this.children[i].getLeafs(name)
			if(ret !== false)
				hojas = hojas.concat(ret)
		}
		return hojas
	}
}

TreeNode.prototype.getBranch = function(){
	var branch = new Array()
	
	branch.push(this)
	
	var current = this
	
	while(current.parent != null){
		branch.push(current.parent)
		current = current.parent
	}
	
	return branch
}

TreeNode.prototype.buildPath = function(){
	path = ""

	if(this.parent != null){
		
		path = this.parent.buildPath() + this.name + "/"
	}
	else
		path = "/"
		
	return path
}

function CreateTree(data, parent){
	
	var name, description, imageUrl;
	
	try{
		name = data.name
		description = data.description
		imageUrl = data.imageUrl
	}
	catch(err){
	}
	
	var nodo = new TreeNode(name, description, imageUrl)
	
	if(parent !== undefined)
		nodo.parent = parent
	else
		nodo.parent = null
	
	try{
		if(data.children !== undefined){
			for(var i = 0; i < data.children.length; ++i)
				nodo.children.push(CreateTree(data.children[i], nodo))
		}
	}
	catch(err){
	}
	
	return nodo
}