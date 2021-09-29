var limit = 3
function checker(form){
    var checkedCount=0; 
    var checkcards = document.getElementsByName("cards");
    for(var i=0; i<checkcards.length; i++){ 
        if(checkbox[i].checked){ 
           checkedCount++;  
        } 
    } 
  
}