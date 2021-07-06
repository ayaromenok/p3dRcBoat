include <../../lib/lib2.scad>

//floatHiSpeed_front_v2(ry=-90,rz=-90);
//floatHiSpeed_center_v2(ry=-90,rz=-90);
floatHiSpeed_front_v2(pz=122,ry=90,rz=-90);
floatHiSpeed_front_top_v2(ry=-90,rz=-90);
floatHiSpeed_center_v2(pz=122,ry=90,rz=-90);
module floatHiSpeed_front_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz])    
    {
        difference(){
        intersection(){
            yCyl(40,60, 80,0,0,  0,90,0, $fn=100, sy=5);
            
            translate([-310,0,0])
            rotate_extrude(angle=40,convexity = 10, $fn = 200)
            translate([400, 0, 0])
                //circle(r = 1.5, $fn = 5);
            polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
        }//intersection
        translate([-1.10,0])
        intersection(){
            yCyl(38.9,60, 80,0,0,  0,90,0, $fn=100, sy=5.1);
            
            translate([-310,0,0])
            rotate_extrude(angle=40,convexity = 10, $fn = 200)
            translate([400, 0, 0])                
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-44],[-40,44], [4,40]]);
            }//intersection
        }//difference
        
        //nervure
        //middle
        translate([76,100,0])
        rotate([90,0,0])
        linear_extrude(1)
            polygon( points=[[0,30],[20,0],[0,-30], [0,-34],[-26,-34],[-26,34], [0,34]]);
        //end        
        translate([90,0,0])
        rotate([90,0,0])
        linear_extrude(1)
            polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
        
        //connectors
        yTube(2.5,0.7,6,  53,2,37, 0,90,0);
        yTube(2.5,0.7,6,  53,2,-37, 0,90,0);
        
        yTube(2.5,0.7,6,  53,102,31, 0,90,0);
        yTube(2.5,0.7,6,  53,102,-31, 0,90,0);
        yTube(2.5,0.7,6,  53,197,0, 0,90,0);
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
            yCyl(2.5,26,  87,2,37, 0,90,0);
            yCyl(2.5,26,  87,2,-37, 0,90,0);
        
            yCyl(2.5,26,  87,102,31, 0,90,0);
            yCyl(2.5,26,  87,102,-31, 0,90,0);
            yCyl(2.5,26,  87,197,0, 0,90,0);
        
            yCyl(1.2,26,  80,2,37, 0,90,0);
            yCyl(1.2,26,  80,2,-37, 0,90,0);
        
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
        
        /*
        translate([-1.10,0])
        intersection(){
            yCyl(38.9,23, 83,0,0,  0,90,0, $fn=100, sy=5.1);
            
            translate([-710,0,0])
            rotate_extrude(angle=40,convexity = 10, $fn = 200)
            translate([800, 0, 0])
                //circle(r = 1.5, $fn = 5);
            polygon( points=[[0,40],[10,0],[0,-40],[-40,-44],[-40,44]]);
        }//intersection
        }//difference
        */
        //nervure
        //middle
        /*
        translate([76,100,0])
        rotate([90,0,0])
        linear_extrude(1)
            polygon( points=[[0,30],[20,0],[0,-30], [0,-34],[-26,-34],[-26,34], [0,34]]);
        //end        
        translate([90,0,0])
        rotate([90,0,0])
        linear_extrude(1)
            polygon( points=[[0,40],[10,0],[0,-40],[-40,-44],[-40,44]]);
        */
        
        
    }//transform
}//module

module floatHiSpeed_center_v2(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){        
        difference(){
            translate([90,0,0])
            rotate([90,0,0])
            linear_extrude(200)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
                
            translate([45+43.8,-1.2,0])
            rotate([90,0,0])
            linear_extrude(197.6)
                polygon( points=[[0,30],[20,0],[0,-30], [4,-38.9],[-40,-38.9],[-40,38.9], [4,38.9]]);
        }//difference
        //middle                 
        translate([90,-98,0])
        rotate([90,0,0])
        linear_extrude(1)
            polygon( points=[[0,30],[20,0],[0,-30], [4,-40],[-40,-40],[-40,40], [4,40]]);
        //connectors
        yTube(2.5,0.7,6,  53,-3,37, 0,90,0);
        yTube(2.5,0.7,6,  53,-3,-37, 0,90,0);
        yTube(2.5,0.7,6,  53,-100.9,37, 0,90,0);
        yTube(2.5,0.7,6,  53,-100.9,-37, 0,90,0);
        yTube(2.5,0.7,6,  53,-197,37, 0,90,0);
        yTube(2.5,0.7,6,  53,-197,-37, 0,90,0);
    }//transform
}//module
