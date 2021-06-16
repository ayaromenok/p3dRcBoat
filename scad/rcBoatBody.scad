include <../../lib/lib2.scad>

//scale([0.25,0.25,.25])
//{
//frontSection(rx=180);
//backSection(rx=180);

module backSection(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        difference(){
            union(){
                difference(){
                    yMinkCubeSphere(50,50,100, 24, 0,0,0,sx=7);            
                    yCube(210,60,50,    100,0,45);
                    yCube(200,60,100,    -100,0,00);      
                }//difference
                intersection(){
                    yMinkCubeSphere(50,50,100, 24, 0,0,0,sx=7);  
                    yCyl(24.7,70,    0,0,-15,  0,0,30, $fn=6);
                }//intersection
            }//union
            
            //for connectors - 20x20mm
            for (i=[-120:20:120]){
                yCyl(0.9,20,    i,10,20);
                yCyl(0.9,20,    i,-10,20);
            }//for
        }//difference            
    }//transform
}//module
    
module frontSection(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([px, py, pz])
    rotate([rx, ry, rz]) {
        difference(){            
                difference(){
                    yMinkCubeSphere(50,50,100, 24, 0,0,0,sx=7);            
                    yCube(210,60,50,    -100,0,45);
                    yCube(200,60,100,    100,0,00);      
                    yCyl(25.3,77,    0,0,-15,  0,0,30, $fn=6);                
                }//intersection
            
            
            //for connectors - 20x20mm
            for (i=[-120:20:120]){
                yCyl(0.9,20,    i,10,20);
                yCyl(0.9,20,    i,-10,20);
            }//for
        }//difference            
    }//transform
}//module