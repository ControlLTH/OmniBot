$fn=100;
module M3nut(){
  
   $fn=6;
   rotate (a = [0,0,0])cylinder(d=6.2,h=2)    ;
}
module M25nut(){
    $fn=6;
    cylinder(d=5.7,h=2);
    
    }
module M4nut(){
  
   $fn=6;
   rotate (a = [0,0,0])cylinder(d=8,h=12)    ;
}   

difference(){
union(){
 translate ([-20,2,10]) cube([50,0.2,63]);   
translate ([0,2,10]) cube([5,116,63]);
//translate ([5,9.5,73]) rotate (a = [-90,0,90])cylinder (d=15,h=5);
//translate ([5,9.5+116-15,73]) rotate (a = [-90,0,90])cylinder (d=15,h=5);    
hull(){
translate ([-10,120/2-106/2,0])rotate (a = [0,0,0])cylinder (d=10,h=10);

translate ([-10,120/2+106/2,0])rotate (a = [0,0,0])cylinder (d=10,h=10);
translate ([23,120/2-106/2,0])rotate (a = [0,0,0])cylinder (d=10,h=10);
   translate ([23,120/2+106/2,0])rotate (a = [0,0,0])cylinder (d=10,h=10); 
}
//translate ([-17,0,0]) cube([50,120,10]);
}
//translate ([5,9.5,75]) rotate (a = [-90,0,90])cylinder (d=5,h=5);
translate ([10,5+5,10+63-4]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5+58,10+63-4]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5,10+63-4-49]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5+58,10+63-4-49]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([5,5+5,10+63-4]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5,10+63-4-49]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5+58,10+63-4]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5+58,10+63-4-49]) rotate (a = [-90,0,90]) M25nut();

translate ([2,10+7,10+63-4.5]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7,10+63-4.5]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);
translate ([2,10+7,10+63-4.5-48]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7,10+63-4.5-48]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);

translate ([2,10+7+63.9,10+63-4.5]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7+63.9,10+63-4.5]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);
translate ([2,10+7+63.9,10+63-4.5-48]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7+63.9,10+63-4.5-48]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);

translate ([20,6,10+63-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);

translate ([20,116-2,10+63-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);
translate ([20,116-2,10+63+59-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);


translate ([-5,0,10]) rotate (a = [-90,0,0]) cylinder (d=10,h=120);
translate ([10,0,10]) rotate (a = [-90,0,0]) cylinder (d=10,h=120);
translate ([10,0,5]) cube([45,120,5]);
translate ([-17,0,5]) cube([12,120,5]);
translate ([-10,120/2-55/2,0])rotate (a = [0,0,0])cylinder (d=4,h=10);
translate ([-10,120/2-55/2,3])rotate (a = [0,0,0])cylinder (d=7,h=2);
translate ([-10,120/2+55/2,0])rotate (a = [0,0,0])cylinder (d=4,h=10);
translate ([-10,120/2+55/2,3])rotate (a = [0,0,0])cylinder (d=7,h=10);



translate ([23,120/2-106/2,0])rotate (a = [0,0,0])cylinder (d=4,h=10);
translate ([23,120/2-106/2,3])rotate (a = [0,0,0])cylinder (d=7,h=2);
translate ([23,120/2+106/2,0])rotate (a = [0,0,0])cylinder (d=4,h=10);
translate ([23,120/2+106/2,3])rotate (a = [0,0,0])cylinder (d=7 ,h=10);





}





//cylinder (d=62,h=20);
//translate ([-10,0,-62/2])rotate (a //= //[0,90,0])cylinder (d=62,h=20);

//translate([60-7-46,0,0])cube([7,0.1,5]);    












