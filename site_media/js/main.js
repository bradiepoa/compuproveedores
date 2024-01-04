$(document).ready(function(){
            $('.tooltip').tooltip();
            $('#cssdropdown li.headlink').hover(
                function() { $('ul', this).css('display', 'block'); },
                function() { $('ul', this).css('display', 'none'); }
            );
            
        });
    loadTopMenu = function(){   
        if (document.all && document.getElementById){      
            menunavParent = document.getElementById("nav");
            for (x=0; x < menunavParent.childNodes.length; x++){      
                menunode = menunavParent.childNodes[x];
                if (menunode.nodeName=="LI"){          
                    menunode.onmouseover=function(){               
                        this.className+=" over";            
                    }           
                    menunode.onmouseout=function(){               
                        this.className=this.className.replace(" over", "");
                    }
                }
           }
        }
    }
    window.onload=loadTopMenu;