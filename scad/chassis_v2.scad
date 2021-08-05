include <../../lib/lib2.scad>
include <../../lib/lib2/ext/motor.scad>
include <../../lib/lib2/ext/prop.scad>
include <../../lib/lib2/ext/servo.scad>


//chassisAssembly();
//chassisSide();
//chassisCenter();
//fuselageWithMotorMount(isMetal=false);
module fuselageWithMotorMount(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([px, py, pz])
    rotate([rx, ry, rz]){
        difference(){
            union(){
                rotate([90,0,90]){
                    yPoly(p=[[80,0], [80,50],[78,50],[78,2],[-78,2],[-78,50],[-80,50],[-80,0]],szz=80);
                    yPoly(p=[[80,0], [80,50],[75,50],[70,5],[-70,5],[-75,50],[-80,50],[-80,0]],szz=5);
                    translate([0,0,75])
                    yPoly(p=[[80,0], [80,50],[75,50],[70,5],[-70,5],[-75,50],[-80,50],[-80,0]],szz=5);
                    //yPoly(p=[[70,0], [80,40],[-80,40],[-70,0]],szz=5);
                }//rotate
                //back
                rotate([0,0,90]){
                    yPoly(p=[[80,0],[10,60],[-10,60],[-80,0]]);
                    yPoly(p=[[80,0],[10,60],[-10,60],[-80,0],[-75,0],[-8,38],[8,38],[75,0]],szz=50);
                }//rotate
            //front        
                translate([80,0,0])
                rotate([0,0,-90]){
                    yPoly(p=[[80,0],[30,40],[-30,40],[-80,0]]);
                    yPoly(p=[[80,0],[30,40],[-30,40],[-80,0],[-78,0],[-28,38],[28,38],[78,0]],szz=50);
                }//transform                
             //engine mount       
                yMinkCubeCyl(26,22,102, 6,  -47,0,50.5,  0,0,0);
            }//union
            //engine cables
            yCyl(14,20, -55,0,110,  0,90,0);
            yMinkCubeCyl(14,7,110, 3,  -44.5,0,57.5,  0,0,0);
            yCube(15,7,45,   -37,0,25,  0,0,0);
            yCyl(7,20, -37.5,0,100,  0,90,0);
            //to chassis
            for (i=[-30:20:30]){                                
                yCyl(1.8,20,    10,i,0);        
                yCyl(1.8,20,    30,i,0);
                yCyl(1.8,20,    50,i,0);
                yCyl(1.8,20,    70,i,0);
            }//for
        }//difference
        translate([-57,0,110])
        rotate([-45,0,0])
            blMotor2212_bot(2,0,0 ,0,-90,0, height=10);
        if(isMetal){
            translate([-57,0,110])
            rotate([-45,0,0]){
                blMotor2212(0,0,0 ,0,-90,0);                            
            }
            prop5147_3(-75,0,110,   0,90,0);
            prop8060(-75,0,110,   0,90,0);
        }//isMetal
    }//transform
}//module            

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
