Mover[] movers;

void setup(){
 movers = new Mover[5];
 size(640,360);
 for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover(i + 1);    
 }
}

void draw(){
   background(255);
   PVector gravity = new PVector(0,0.3);
   PVector wind = new PVector(0.1,0);
   float coeffitientOfFriction = -0.05;
   float coeffitientOfDrag = -0.005;
   
   for (Mover mover : movers){
      mover.applyForce(new PVector(gravity.x, gravity.y).mult(mover.mass));
      mover.applyForce(wind);
      
      //Friction
      if (mover.loc.y == 0){
        PVector friction = mover.vel.copy();
        friction.normalize();
        friction.mult(coeffitientOfFriction);
        mover.applyForce(friction);    
      }
      
      //Drag
      PVector drag = mover.vel.copy();
      drag.normalize();
      drag.mult(coeffitientOfDrag * pow(mover.getSpeed(),2));
      mover.applyForce(drag);
      
      
      mover.update();
      mover.edges();
      mover.display();
   }
}