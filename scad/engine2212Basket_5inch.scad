include <../../lib/lib2.scad>
include <../../lib/lib2/lib2_motor.scad>
include <../../lib/lib2/lib2_prop.scad>
include <../../lib/lib2/lib2_servo.scad>

//engine2212_basket_inch5_back(0,0,36, 180,0,0);
//engine2212_basket_inch5_front(isMetal=true);
//engine2212_support(0,0,-30);

//engine2212_basket_back_inch5();
engine2212_basket_inch5_rudder();
//engine2212_basket_inch5_front();
//engine2212_support(0,0,0, 0,0,45);

module engine2212_basket_inch5_rudder(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){     
        //servoSg90(-55,0,20,  0,90,0);
        yTube(71.3,69,4); 
        yTube(11.3,10,4);
        difference(){    
            yMinkCubeCyl(22,18,20,8.99, -60,0,20, 0,90,0, sx=2);
            yCube(30,12.6,23.6, -60,0,20);
            yCube(20,10,10, -70,0,10);
            yCyl(0.5,20,    -50,0,6,  0,90,0);
            yCyl(0.5,20,    -50,0,34,  0,90,0);
        }//difference
        
        
        yTube(4,2,4,    60,0,80, 0,90,0);
        yTube(4,2,4,    -60,0,80, 0,90,0);
        //yCyl(1.5,120,   0,0,80, 0,90,0);
        
        
        yCyl(3,78,  65,0,39,    0,-7,0, sx=0.5);
        yCyl(3,82,  62,15,39,    20,-6,10, sx=0.5);
        yCyl(3,82,  62,-15,39,    -20,-6,-10, sx=0.5);
        yCyl(3.5,40,  -60,0,58,    0,0,0, sx=0.6);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1,60,  40,0,0,  0,90,0, sx=2);     
            
            rotate([0,0,i])
            yTube(3,1.7,4,  73,0,0);          
        }//for
    }//transform
}//module
        
module engine2212_support(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
            
            //blMotor2212(0,0,14 ,0,0,22.5);            
            //prop5147_3(0,0,39,   0,0,0);
        
        blMotor2212_bot(0,0,14, 0,0,90);        
        yCube(8,6,4, 16,0,-1 );
        yCube(8,6,4, -16,0,-1 );
        yCube(6,8,4, 0,16,-1 );
        yCube(6,8,4, 0,-16,-1 );
        yCube(13,8,4, 10,10,-1, 0,0,45 );
        
        yTube(23.3,20,6);
        for (i=[0:45:360]){            
            rotate([0,0,i+22.5])
            yTube(3,0.9,30,  23,0,12);        
        }//for
        difference(){
            union(){
                yMinkCubeCyl(30,14,60,4, 36,36,12, 0,90,45);
                yMinkCubeCyl(30,30,5,4, 55.5,55.5,12, 0,90,45);
            }//union
            yCube(20,8,65, 36,36,12, 0,90,45);
            yCube(50,8,10,  35,35,0, 0,0,45);
            
            //connection to chassis
            translate([55,55,12])
            rotate([0,90,45])
                {
                yCyl(1.8,15,  10,10,0 );
                yCyl(1.8,15,  10,-10,0);
                yCyl(1.8,15,  -10,10,0 );
                yCyl(1.8,15,  -10,-10,0);
            }//transform
        }//difference        
    }//transform
}//module


module engine2212_basket_inch5_back(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){        
        yTube(71.3,70,4);
        yTube(11.3,10,4);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1,60,  40,0,0,  0,90,0, sx=2);     
            
            rotate([0,0,i])
            yTube(3,1.7,16,  73,0,6);          
        }//for
    }//transform
}//module

module engine2212_basket_inch5_front(px=0,py=0,pz=0, rx=0,ry=0,rz=0, isMetal=false){
    translate([(px), (py), pz])
    rotate([rx,ry,rz]){
        if (isMetal){
            blMotor2212(0,0,-15 ,0,0,22.5);
            blMotor2212_bot(0,0,-15, 0,0,22.5);
            prop5147_3(0,0,10,   0,0,0);
        }//isMetal
        
        yTube(71.3,70,6);        
        yTube(21.3,20,6);
        for (i=[0:45:360]){
            rotate([0,0,i])
            yCyl(1.5,50,  45,0,0,  0,90,0, sx=2);                
            
            rotate([0,0,i+22.5])
            yTube(3,1.7,6,  23,0,0);
            
            rotate([0,0,i])
            yTube(3,0.9,26,  73,0,10);
        }//for
    }//transform
}//module
