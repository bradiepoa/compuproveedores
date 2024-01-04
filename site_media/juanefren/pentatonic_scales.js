var arr = [];
var note_matrix = []
var j = 0;

function create_note_matrix(scale){
    note_matrix = [];
    for(var i=0; i<6; i++){
        for(var k=0; k<scale.length; k++) {
            note_matrix.push(
                "/site_media/juanefren/piano/" + i + '' + scale[k] + ".ogg"
            )
            j++;
        }
    }
    note_matrix.push("piano/6" + scale[0] + ".ogg")
}

function random_int(){
    return parseInt(Math.random() * note_matrix.length)
}

function random_pos(){
    return parseInt(Math.random() * n)
}

function timed_play(audio, milliseconds){
    setTimeout(function(){
        var a = new Audio(audio)
        a.play()
    }, milliseconds)
}

function play_acorde(m){
    for(i=0; i < n; i++){
        timed_play(m[i], (i) * tempo )
    }
}

var c = 0
scales = [
    /**
    ['A', 'C', 'D', 'E', 'G'], //minor pentatonic
    ['C', 'D', 'E', 'G', 'A'], //major pentatonic
    ['D', 'E', 'G', 'A', 'C'], //egypt pentatonic
    ['E', 'G', 'A', 'C', 'D'], //blues minor
    ['G', 'A', 'C', 'D', 'E'] //blues major
    **/
    
    ['C', 'D', 'E', 'G', 'A'], //major pentatonic
    ['A', 'C', 'D', 'E', 'G'], //minor pentatonic
    ['A', 'C', 'D', 'Ds', 'E', 'G'],// blues scale
    ['C', 'D', 'E', 'F', 'G', 'A', 'B'], //major diatonic
    ['A', 'B', 'C', 'D', 'E', 'F', 'G'], //minor diatonic
    ['A', 'B', 'C', 'Ds', 'E', 'F', 'Gs'], //Hungarian minor
    ['A', 'As', 'B', 'C', 'Cs', 'D', 'Ds', 'E', 'F', 'Fs', 'G', 'Gs'], //Chromatic
    ['C', 'Cs', 'E', 'F', 'G', 'Gs', 'B'], //major diatonic
    
]

//create_note_matrix(scales[0]);
function play(number){

    create_note_matrix(scales[number])

    setInterval(function(){
        if(c%2 == 0){
            arr = []
            for(i=0; i < n; i++){
                arr.push(note_matrix[random_int()])
            }
        }
        c++
        play_acorde(arr)
        
    }, (n+1) * tempo)

}

