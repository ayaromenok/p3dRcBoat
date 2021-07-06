include <../../lib/lib2.scad>

//floatHiSpeed_front_v2();
//floatHiSpeed_front_top_v2_1(133,ry=180);
//floatHiSpeed_center_v2();
//rotated in Y axis for better print
//floatHiSpeed_front_v2(pz=-60,ry=-90,rz=0);
//floatHiSpeed_front_top_v2(ry=-90,rz=0);
floatHiSpeed_center_v2(pz=-60,ry=-90,rz=0);

module floatHiSpeed_front_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        scale([1.2,1,1])
        union(){
            difference(){
                intersection(){
                    yCyl(40,60, 80,0,0,  0,90,0, $fn=100, sy=5);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])
                
                    polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
                }//intersection
                translate([-1.50,0])
                intersection(){
                    yCyl(38.9,60, 80,0,0,  0,90,0, $fn=100, sy=5.1);
            
                    translate([-310,0,0])
                    rotate_extrude(angle=40,convexity = 10, $fn = 200)
                    translate([400, 0, 0])                
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
                }//intersection
            }//difference
        
            //nervure from front
            //1st 
            translate([76,150,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[-13,26],[6,0], [-13,-26],[-26,-26],[-26,26]]);
            //2nd(middle)
            translate([76,100,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [0,-34],[-26,-34],[-26,34], [0,34]]);
            //3rd
            translate([86,50,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-38],[-36,-38],[-36,38], [4,38]]);
            //4th (last)        
            difference(){
                union(){
                    translate([90,0,0])
                    rotate([90,0,0])
                    linear_extrude(1)
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                    yCube(6,3,80,  53,1,0);    
                }//union
                yCyl(1.5,6,  53,0,27, 90,90,0);
                yCyl(1.5,6,  53,0,-27, 90,90,0);
            }//difference
        
            //connectors from front 
            yTube(2.5,0.7,6,  53,197,0, 0,90,0);
            
            yTube(2.5,0.7,6,  53,102,31, 0,90,0);
            yTube(2.5,0.7,6,  53,102,-31, 0,90,0);
            
            yTube(2.5,0.7,6,  53,47,35, 0,90,0);
            yTube(2.5,0.7,6,  53,47,-35, 0,90,0);
            
            yTube(2.5,0.7,6,  53,37,35, 0,90,0);
            yTube(2.5,0.7,6,  53,37,-35, 0,90,0);
        
            yTube(2.5,0.7,6,  53,3,37, 0,90,0);
            yTube(2.5,0.7,6,  53,3,-37, 0,90,0);
        
            //    
            difference(){
                yCyl(40,4, 52,0,0,  0,90,0, $fn=100, sy=5);
                yCyl(37,6, 52,0,0,  0,90,0, $fn=100, sy=5.35);
                yCube(10,200,100,  52,-100,0);
            }//difference
            
        }//union
    }//transform
}//module


module floatHiSpeed_front_top_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){
            intersection(){
                yCyl(40,23, 83,0,0,  0,90,0, $fn=100, sy=5);
            
                translate([-710,0,0])
                rotate_extrude(angle=40,convexity = 10, $fn = 200)
                translate([800, 0, 0])                
                    polygon( points=[[0,40],[10,0],[0,-40],[-40,-44],[-40,44]]);
            }//intersection
        
            //connectors
            yCyl(2.5,26,  87,3,37, 0,90,0);
            yCyl(2.5,26,  87,3,-37, 0,90,0);
        
            yCyl(2.5,26,  87,102,31, 0,90,0);
            yCyl(2.5,26,  87,102,-31, 0,90,0);
            yCyl(2.5,26,  87,197,0, 0,90,0);
        
            yCyl(1.2,26,  80,3,37, 0,90,0);
            yCyl(1.2,26,  80,3,-37, 0,90,0);
        
            yCyl(1.2,26,  80,102,31, 0,90,0);
            yCyl(1.2,26,  80,102,-31, 0,90,0);
            yCyl(1.2,26,  80,197,0, 0,90,0);
            
            translate([0,50,0])
            scale([1,1.4,1])
            rotate([45,0,0])
                yCone(50,26,    82,0,0, 0,90,0,  $fn=4);
            yCyl(5,50,  79,50,0, 0,90,0);    
            translate([0,135,0])
            scale([1,1.8,1])
            rotate([45,0,0])
                yCone(30,18,    79,0,0, 0,90,0,  $fn=4);                 
        
            yCyl(5,80,  85.5,95,0, 85,90,0);   
        }//difference
    }//transform
}//module

module floatHiSpeed_center_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        scale([1.2,1,1])    
        union(){
            difference(){
                union(){
                    difference(){
                        translate([90,0,0])
                        rotate([90,0,0])
                        linear_extrude(200)
                        polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                
                        translate([45+43.8,-1.5,0])
                        rotate([90,0,0])
                        linear_extrude(197.6)
                            polygon( points=[[0,30],[20,0],[0,-30], [4,-38.9],[-40,-38.9],[-40,38.9], [4,38.9]]);
                    }//difference
                    yCube(6,3,70,  53,-3,0);    
                    yCube(6,3,70,  53,-198,0);    
                    yCube(4,200,4,  52,-100,37);    
                    yCube(4,200,4,  52,-100,-37);    
                }//union
                
                yCyl(0.8,6,  53,-3,27, 90,90,0);
                yCyl(0.8,6,  53,-3,-27, 90,90,0);
                yCyl(1.5,6,  53,-198,27, 90,90,0);
                yCyl(1.5,6,  53,-198,-27, 90,90,0);
                
                //connectors from front ot back            
                yCyl(0.7,16,  53,-3,37, 0,90,0);
                yCyl(0.7,16,  53,-3,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-37.9,37, 0,90,0);
                yCyl(0.7,16,  53,-37.9,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-47.9,37, 0,90,0);
                yCyl(0.7,16,  53,-47.9,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-103,37, 0,90,0);
                yCyl(0.7,16,  53,-103,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-153,37, 0,90,0);
                yCyl(0.7,16,  53,-153,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-163,37, 0,90,0);
                yCyl(0.7,16,  53,-163,-37, 0,90,0);
            
                yCyl(0.7,16,  53,-197,37, 0,90,0);
                yCyl(0.7,16,  53,-197,-37, 0,90,0);
            }//difference
            
            //nervure from front
            //2st 
            translate([90,-50,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            translate([90,-100,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            translate([90,-150,0])
            rotate([90,0,0])
            linear_extrude(1)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
            
            
        }//union
    }//transform
}//module
