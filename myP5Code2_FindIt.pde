var pawXPos = [];
var pawYPos = [];
var pawPrints = "🐾";
var pawTotal = 200;

var treatXPos = [];
var treatYPos = [];
var dogTreat = "🦴";
var dogTreatTotal = 5;
var dogTreatFound = 0;
var snoopyComments = ["FIND SNOOPY", "PLS WE NEED TO GET HIM TO CHARLIE BROWN", "HURRY QUICKLY"];

setup = function() {
   size(600, 450); 

   reset();
}

draw = function(){   

   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){
  for(var i = 0; i < treatXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, treatXPos[i], treatYPos[i])<15){
      treatXPos.splice(i, 1);
      treatYPos.splice(i, 1);
      dogTreatFound++;
    }
  }
}

var display = function(){
  background(173, 216, 230);
  //snoopyComments code
   fill(0, 0, 255)
   text(snoopyComments[0], 20, 20)
   text(snoopyComments[1], 280, 20)
   text(snoopyComments[2], 260, 380)

  fill(200,200,0);
  textSize(20);

  for(var i = 0; i < treatXPos.length; i ++){
    text(dogTreat, treatXPos[i], treatYPos[i]);
  }

  for(var i = 0; i < pawXPos.length; i ++){
    text(pawPrints, pawXPos[i], pawYPos[i]);
  }

//black textbox code
  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,255,255);
  text("Find The " +  dogTreat + "s to reveal Snoopy!!  |   " + dogTreat + " " + dogTreatFound + "/" + dogTreatTotal, 0, 425);


//end of game code
  if(dogTreatFound == dogTreatTotal){
    fill(0, 200, 200);
    snoopyComments = 0
    textSize(20);
    text("Press 'r' to restart \nthe game", 50, 350);
  }
}

var reset = function(){
  pawXPos = [];
  pawYPos = [];
  treatXPos = [];
  treatYPos = [];
  dogTreatFound = 0;

//random paw placement code
  for(var i = 0; i < pawTotal; i++){
    pawXPos.push(random(0,600));
    pawYPos.push(random(0,400));
  }

//random dogtreat placement code
  for(var i = 0; i < dogTreatTotal; i++){
    treatXPos.push(random(0,600));
    treatYPos.push(random(0,400));
  }
}