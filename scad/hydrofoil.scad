include <../../lib/lib2.scad>
//include <../../lib/lib2/lib2_motor.scad>
//include <../../lib/lib2/lib2_prop.scad>
//include <../../lib/lib2/lib2_servo.scad>


//wingMain(isAdhesion=true);
//wingHolderDual(isAdhesion=true, length=60);
//wingMainNACA(isAdhesion=true);

function naca_half_thickness(x,t) = 5*t*(0.2969*sqrt(x) - 0.1260*x - 0.3516*pow(x,2) + 0.2843*pow(x,3) - 0.1015*pow(x,4));
function naca_top_coordinates(t,n) = [ for (x=[0:1/(n-1):1]) [x, naca_half_thickness(x,t)]];
function naca_bottom_coordinates(t,n) = [ for (x=[1:-1/(n-1):0]) [x, - naca_half_thickness(x,t)]];
function naca_coordinates(t,n) = concat(naca_top_coordinates(t,n), naca_bottom_coordinates(t,n));

module wingMainNACA(px=0,py=0,pz=0, rx=0,ry=0,rz=0, chord = 40, length=100, isAdhesion=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        difference(){
            linear_extrude(height=length, center=true) {                    
                points = naca_coordinates(t=0.12,n=300);
                    scale([chord,chord,1])
                    polygon(points);
            }//linear_extrude
            yCyl(1.8,20,    10,0,10,  90,0,0);
            yCyl(1.8,20,    30,0,10,  90,0,0);
            yCyl(1.8,20,    10,0,-10,  90,0,0);
            yCyl(1.8,20,    30,0,-10,  90,0,0);
            
            yCone(3,7,    10,0,10,  90,0,0);
            yCone(3,7,    30,-1,10,  90,0,0);
            yCone(3,7,    10,0,-10,  90,0,0);
            yCone(3,7,    30,-1,-10,  90,0,0);            
        }//difference

    }//transform
    if (isAdhesion){
            yTube(10,8,0.4,   10,0,-length/2+0.2,  0,0,0,  sx=2);              
            yTube(10,8,0.4,   30,0,-length/2+0.2,  0,0,0,  sx=2);  
            yCube(10,3,0.4,     -2.5,0,-length/2+0.2,  0,0,0 );
            yCube(10,3,0.4,     42.5,0,-length/2+0.2,  0,0,0 );
        }//isAdhesion
}//module            

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