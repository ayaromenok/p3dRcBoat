include <../../lib/lib2.scad>
include <../../lib/lib2/ext/servo.scad>

boatRudderHolder(isMetal=true);
//boatRudderHolder(isMetal=false);
//boatRudder(58,0,0, 0,0,180);
module boatRudder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        yTube(5,1.8,4,    0,0,56.5);
        yTube(5,1.8,4,    0,0,-5.2);        
        difference(){
            yCyl(2,180,  -33,0,82.8,   sx=15);
            yCube(6,10,2.4, -10,0,16);
            yTube(5,0.8,58,    0,0,25.8);
        }//difference
        yCube(20,4,4,   -13,0,-5.2);
        yCube(20,4,4,   -13,0,56.6);
    }//transform
}//module


module boatRudderHolder(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        difference(){
            union(){
                yMinkCubeCyl(11,69,6, 4,   -0.5,0,0 );                
                yCube(8,22,6,   32,0,0);
            }//union
            for (i=[-30:20:30]){
                yCyl(1.7,10,    -1.5,i,0);
            }//for                                    
            yCyl(0.8,20,    2.6,0,0);
            yCyl(0.8,20,    30.4,0,0);
        }//difference
        
        yMinkCubeCyl(34,6,6, 2,   19,12,0 );
        yMinkCubeCyl(34,6,6, 2,   19,-12,0 );
        yCube(24,6,6,  44.5,0,0 );
        //horizontal strongest section
        yCube(22,1.4,6,  45.6,0,5 );
        yCube(42,1.4,6,  15.1,-13,5,  0,0,8 );
        yCube(42,1.4,6,  15.1,13,5,   0,0,-8 );
        yCube(1.4,20,6,   35.3,0,5);
        /*
        difference(){
            yTube(34.5,29,6,    -1,0,0, sx=1.8);
            yCube(100,70,10, -50,0,0);
        }//difference
        */
        
        yTube(3,0.8,8,    58,0,1,   sx=1.3);
        yTube(3,0.8,44,    58,0,26,   sx=1.3);
        yTube(3,0.8,6,    58,0,51,   sx=1.3);
        if(isMetal){
            servoSg90(16.5,0,-2);
        }//isMetal
    }//transform
}//module

