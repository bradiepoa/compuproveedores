function pw_gen(){
	var choices = [];
	for (var w = 0; w < 4; w++){
	    var index = Math.floor(Math.random() * wordlist.length);
		choices.push(wordlist[index]);
	}
	$("#result").html(choices.join(" "));
}
$().ready(function(){
    pw_gen();
});
