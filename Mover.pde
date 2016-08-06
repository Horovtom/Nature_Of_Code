class Mover {
 PVector loc;
 PVector vel;
 PVector acc;
 float mass;
 
 void update(){
   vel.add(acc);
   loc.add(vel);
   //vel.limit(5);
   acc.mult(0);
 }
 
 Mover(){
   loc = new PVector(width / 2, height / 2);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
   mass = 2;
 }
 
 Mover(float mass, PVector location, PVector velocity){
   loc = location;
   vel  = velocity;
   acc = new PVector(0,0);
   this.mass = mass;
 }
 
 float getSpeed(){
    return vel.mag(); 
 }
 
 Mover(float mass){
   loc = new PVector(width / 2, height / 2);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
   this.mass = mass;
 }
 
 void display(){
   stroke(0);
   strokeWeight(2);
   fill(127, 100);
   ellipse(loc.x, loc.y, mass * 15, mass*15);
 }
 
 void applyForce(PVector force){
     PVector f = PVector.div(force, mass);
     acc.add(f);   
 }
 
 void edges(){
  if (loc.x > width){
      loc.x = width;
      vel.x *= -1;
   } else if (loc.x < 0){
      loc.x = 0;
      vel.x *= -1;
   }
   if (loc.y > height){
     loc.y = height;
     vel.y *= -1;
   } else if (loc.y < 0){
     loc.y = 0;
     vel.y *= -1;
   }
 }
}