include <../../lib/lib2.scad>

floatSupport(length=120);

module floatSupport(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([px, py, pz])    
    rotate([rx, ry, rz]) {
        difference(){
            union(){
                yMinkCubeCyl(length+6,26,2, 3);
                for (i=[-length/2:20:length/2]){
                    yCyl(3,6,    i,10,2);
                    yCyl(3,6,    i,-10,2);
                }//for
            }//union
            
            for (i=[-120:20:120]){
                yCyl(0.9,20,    i,10,0);
                yCyl(0.9,20,    i,-10,0);
                
                yMinkCubeCyl(18,14,7, 3, i+10,0,0);
            }//for
            
        }//difference
    }//transform
}//module