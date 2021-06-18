include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>


//wingMain(isAdhesion=true);
wingHolderDual(isAdhesion=true, length=60);

module wingHolderDual(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=100, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        wingHolder(0,10,0,isAdhesion=true, length=length);
        wingHolder(0,-10,0,isAdhesion=true, length=length);
        yCyl(3,20,  0,0,-length/2+3,  90,0,0, sx=3);
    }//transform
}//module            
        
module wingHolder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=100, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yCyl(4,length,   0,0,0,  0,0,0,  sx=5);              
                translate([0,0,-length/2]){            
                if (isAdhesion){
                    yTube(10,8,0.8,   0,0,0,  0,0,0,  sx=2);  
                    yTube(10,8,0.8,   15,0,0,  0,0,0,  sx=2);  
                    yTube(10,8,0.8,   -15,0,0,  0,0,0,  sx=2);  
                    yCube(12,3,1,     25,0,0,  0,0,0 );
                    yCube(12,3,1,     -25,0,0,  0,0,0 );
                }//isAdhesion
                }//translate
            }//union
            yCyl(0.9,20,    10,0,-length/2);
            yCyl(0.9,20,    -10,0,-length/2);
            yCyl(0.9,40,    10,0,length/2);
            yCyl(0.9,40,    -10,0,length/2);            
            rotate([0,10,0]){
                yCyl(3,20,   0,0,length/2-3,  90,0,0,  sx=8);
                yCube(50, 20,20,    0,0,length/2+7);
            }//rotate
        }//difference        
    }//transform
}//module            

module wingMain(px=0,py=0,pz=0, rx=0,ry=0,rz=0,  length=100, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            yCyl(3,length,   0,0,0,  0,0,0,  sx=8);              
            yCyl(1.8,20,    10,0,10,  90,0,0);
            yCyl(1.8,20,    -10,0,10,  90,0,0);
            yCyl(1.8,20,    10,0,-10,  90,0,0);
            yCyl(1.8,20,    -10,0,-10,  90,0,0);
            
            yCone(3,7,    10,0,10,  90,0,0);
            yCone(3,7,    -10,0,10,  90,0,0);
            yCone(3,7,    10,0,-10,  90,0,0);
            yCone(3,7,    -10,0,-10,  90,0,0);
        }//difference
            
        if (isAdhesion){
            yTube(10,8,0.8,   0,0,-length/2,  0,0,0,  sx=2);  
            yTube(10,8,0.8,   15,0,-length/2,  0,0,0,  sx=2);  
            yTube(10,8,0.8,   -15,0,-length/2,  0,0,0,  sx=2);  
            yCube(12,3,1,     25,0,-length/2,  0,0,0 );
            yCube(12,3,1,     -25,0,-length/2,  0,0,0 );
        }//isAdhesion
    }//transform
}//module      