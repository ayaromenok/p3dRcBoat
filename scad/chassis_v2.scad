include <../../lib/lib2.scad>
include <../../lib/lib2/ext/motor.scad>
include <../../lib/lib2/ext/prop.scad>
include <../../lib/lib2/ext/servo.scad>


//chassisAssembly();
//chassisSide();
//chassisCenter();
module chassisAssembly(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]){
        chassisSide(160,20,-10);
        chassisSide(160,-20,-10, 0,0,180);
        chassisSide(0,20,-10);
        chassisSide(0,-20,-10, 0,0,180);
        chassisSide(-160,20,-10);
        chassisSide(-160,-20,-10, 0,0,180);
    }//transform
}//module            

module chassisSide(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {        
        difference(){
            union(){
                yMinkCubeCyl(76,32,10, 4,  0);                
                yMinkCubeSphere(10,170,10, 3,   30,90,0);
                yMinkCubeSphere(10,170,10, 3,   -30,90,0);
                
                yCube(76,10,5,  0,150,-2.5);
                yCube(76,10,5,  0,170,-2.5);
                
            }//union            
            yMinkCubeCyl(50,12,12, 4);
            
                       
            for (i=[-30:20:200]){                
                yCyl(1.8,20,    30,i,0);            
                yCyl(1.8,20,    -30,i,0);                
                
                yCyl(1.8,20,    i,10,0);
                yCyl(1.8,20,    i,-10,0);
                
                yCyl(1.8,20,    i,150,0);
                yCyl(1.8,20,    i,170,0);
            }//for
        }//difference
    }//transform
}//module        

//chassisCenter();
module chassisCenter(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {        
        difference(){
            union(){
                yMinkCubeCyl(190,32,10, 4,  0);
                yMinkCubeSphere(10,190,10, 3,   90,0,0);
                yMinkCubeSphere(10,190,10, 3,   30,0,0);
                yMinkCubeSphere(10,190,10, 3,   -30,0,0);
                yMinkCubeSphere(10,190,10, 3,   -90,0,0);
                yCube(190,10,5,  0,90,-2.5);
                yCube(190,10,5,  0,-90,-2.5);
                
            }//union            
            yMinkCubeCyl(50,12,12, 4);
            yMinkCubeCyl(50,12,12, 4, 60,0,0);
            yMinkCubeCyl(50,12,12, 4, -60,0,0);
                       
            for (i=[-90:20:100]){
                yCyl(1.8,20,    90,i,0);
                yCyl(1.8,20,    30,i,0);            
                yCyl(1.8,20,    -30,i,0);
                yCyl(1.8,20,    -90,i,0);
                
                yCyl(1.8,20,    i,10,0);
                yCyl(1.8,20,    i,-10,0);
                
                yCyl(1.8,20,    i,90,0);
                yCyl(1.8,20,    i,-90,0);
            }//for
        }//difference
    }//transform
}//module        
