$fn=100;
a=12.5;
b=15.5;

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
 translate ([-20,2-12.5,10]) cube([50,0.2,63]);   
translate ([0,2-12.5,10]) cube([5,116+25,63]);
 
hull(){
translate ([-10,120/2-106/2-12.5,0])rotate (a = [0,0,0])cylinder (d=10,h=10);

translate ([-10,120/2+106/2+12.5,0])rotate (a = [0,0,0])cylinder (d=10,h=10);
translate ([23,120/2-106/2-12.5,0])rotate (a = [0,0,0])cylinder (d=10,h=10);
   translate ([23,120/2+106/2+12.5,0])rotate (a = [0,0,0])cylinder (d=10,h=10); 
}

}

translate ([10,5+5-b,10+63-4]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5+58-b,10+63-4]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5-b,10+63-4-49]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([10,5+5+58-b,10+63-4-49]) rotate (a = [-90,0,90]) cylinder (d=2.7,h=10);
translate ([5,5+5-b,10+63-4]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5-b,10+63-4-49]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5+58-b,10+63-4]) rotate (a = [-90,0,90]) M25nut();
translate ([5,5+5+58-b,10+63-4-49]) rotate (a = [-90,0,90]) M25nut();

translate ([2,10+7-b,10+63-4.5]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7-b,10+63-4.5]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);
translate ([2,10+7-b,10+63-4.5-48]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7-b,10+63-4.5-48]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);

translate ([2,10+7+63.9-b+25,10+63-4.5]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7+63.9-b+25,10+63-4.5]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);
translate ([2,10+7+63.9-b+25,10+63-4.5-48]) rotate (a = [-90,0,90]) M3nut();
translate ([7,10+7+63.9-b+25,10+63-4.5-48]) rotate (a = [-90,0,90]) cylinder (d=3.2,h=10);

translate ([20,6-a,10+63-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);

translate ([20,116-2+a,10+63-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);
translate ([20,116-2+a,10+63+59-4-49-10]) rotate (a = [-90,0,90]) cylinder (d=5.5,h=60);


translate ([-5,-12.5,10]) rotate (a = [-90,0,0]) cylinder (d=10,h=145);
translate ([10,-12.5,10]) rotate (a = [-90,0,0]) cylinder (d=10,h=145);
translate ([10,-12.5,5]) cube([45,120+25,5]);
translate ([-17,-12.5,5]) cube([12,120+25,5]);
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












