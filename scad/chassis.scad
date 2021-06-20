include <../../lib/lib2.scad>

chassisCenter();

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
