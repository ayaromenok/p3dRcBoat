include <../../lib/lib2.scad>


//fuselageSupport();
//fuselageMainBot();
module fuselageSupport(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])    
    rotate([rx, ry, rz]) {
        difference(){
            yMinkCubeCyl(48,32,6, 3);
            for (i=[-20:20:20]){
                yCyl(1.8,20,    i,10,0);
                yCyl(1.8,20,    i,-10,0);
            }//for
        }//difference
        yMinkCubeCyl(30,14,20,  5,  0,0,13);
        
        translate([0,0,26]){            
            difference(){
                //yMinkCubeCyl(48,32,6, 3);
                scale([2,1,1])
                yCyl(rb=9, rt=19, szz=16, $fn=4, rz=45, pz=-5);
                    for (i=[-20:20:20]){
                    yCyl(0.9,20,    i,10,0);
                    yCyl(0.9,20,    i,-10,0);
                }//for
            }//difference
        }//translate
    }//transform
}//module

module fuselageMainBot(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])    
    rotate([rx, ry, rz]) {
        difference(){            
            yMinkCubeSphere(200,80,46, 10);
            for (i=[-60:20:-20]){
                yCyl(1.8,20,    i,10,-20);
                yCyl(1.8,20,    i,-10,-20);
            }//for
            for (i=[20:20:70]){
                yCyl(1.8,20,    i,10,-20);
                yCyl(1.8,20,    i,-10,-20);
            }//for
            yCube(210,90,40,    0,0,33);
            yMinkCubeSphere(196,76,34, 10);
            yCube(20,2.6,20, -100,0,5,   0,90,0);
            
            for (i=[-100:20:100]){
                yCyl(0.9,4.5,    i,40,10, 90,0,0);
                yCyl(0.9,4.5,    i,40,-10, 90,0,0);
            
                yCyl(0.9,4.5,    i,-40,10, 90,0,0);
                yCyl(0.9,4.5,    i,-40,-10, 90,0,0);
            
                yCyl(0.9,4.50,    100,i,10, 0,90,0);
                yCyl(0.9,4.5,    100,i,-10, 0,90,0);            
            }//for
        }//difference                
            
        
        difference(){
            union(){
                ySphere(2,  93.5,33,12);
                ySphere(2,  93.5,-33,12);
                ySphere(2,  -93.5,33,12);
                ySphere(2,  -93.5,-33,12);
            }//union
            yCube(200,90,40,    0,0,32);
        }//difference
        
        //battery connectors
        yCyl(3,10,  58,22,-15);
        yCyl(3,10,  58,-22,-15);
        yCyl(3,10,  25,22,-15);
        yCyl(3,10,  25,-22,-15);
        yMinkCubeCyl(39,6,4,    2.5,    41.5,22,-8);
        yMinkCubeCyl(39,6,4,    2.5,    41.5,-22,-8);
        
        yCyl(3,10,  -58,22,-15);
        yCyl(3,10,  -58,-22,-15);
        yCyl(3,10,  -25,22,-15);
        yCyl(3,10,  -25,-22,-15);
        yMinkCubeCyl(39,6,4,    2.5,    -41.5,22,-8);
        yMinkCubeCyl(39,6,4,    2.5,    -41.5,-22,-8);
    }//transform
}//module