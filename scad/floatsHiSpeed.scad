include <../../lib/lib2.scad>

//floatHiSpeedFront(0,0,0, 180,0,0);
//floatHiSpeedCenter(0,0,0, 180,0,0);
floatHiSpeedBack(0,0,0, 180,0,0);

//floatHiSpeedFront(-200,0,0);
//floatHiSpeedCenter(-200,0,0);
//floatHiSpeedBack(-200,0,0);

module floatHiSpeedFront(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        //yCube(30,20,10);
        difference(){
            translate([-0,0,0])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");

            yCube(400,100,150,   400,0,50);                            
            for (i=[-0:20:200]){
                yCyl(0.9,30,    i,10,60);
                yCyl(0.9,30,    i,-10,60);
            }//for
        }//difference       
    }//transform
}//module


module floatHiSpeedCenter(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){        
        difference(){
            union(){
                translate([0,0,0])
                scale([1.2,0.60,1])
                    import("../stl/in/hull_complete.stl");                
                yCube(360,48,5,   372,0,67.5);        
            }//union
            yCube(400,100,150,   600,0,50);
            yCube(400,100,150,   100,0,50);
            for (i=[200:20:400]){
                yCyl(0.9,30,    i,10,60);
                yCyl(0.9,30,    i,-10,60);
            }//for      
            //water  output
            yCyl(6.9,30,    310,0,60);
            yCyl(6.9,30,    390,0,60);
        }//difference  
        //support back
        yPoly(p=[[44,0],[0,25],[-44,0],[-22,-40],[22,-40]], szz=5, px=400,pz=25.4,rx=-90,rz=90);
        //support middle
        yPoly(p=[[43,0],[0,25],[-43,0],[-22,-40],[22,-40]], szz=0.8, px=350,pz=25.4,rx=-90,rz=90);
        //yPoly(p=[[42,-0.5],[0,24],[-42,-0.5],[-22,-40],[22,-40]], szz=5, px=300,pz=25.4,rx=-90,rz=90);
        yPoly(p=[[42,-0.5],[0,24],[-42,-0.5],[-22,-40],[22,-40]], szz=5, px=305,pz=25.4,rx=-90,rz=90);
            
            
    }//transform
}//module

module floatHiSpeedBack(px=0,py=0,pz=0, rx=0,ry=0,rz=0){
    translate([(px),(py),pz])
    rotate([rx,ry,rz]){
        //yCube(30,20,10);
        difference(){
            union(){
                translate([-0,0,0])
                scale([1.2,0.6,1])
                import("../stl/in/hull_complete.stl");
                yCube(360,54,14,   372,0,63);        
            }//union
            yCube(400,100,150,   800,0,50);
            yCube(600,100,150,   200,0,50);
            for (i=[400:20:600]){
                yCyl(0.9,30,    i,10,60);
                yCyl(0.9,30,    i,-10,60);
            }//for            
            //water  output
            yCyl(6.9,30,    410,0,60);
            yCyl(6.9,30,    530,0,60);
        }//difference  
  
        //support front
        //yPoly(p=[[44,0],[0,25],[-44,0],[-22,-40],[22,-40]], szz=5, px=405,pz=25.4,rx=-90,rz=90);      
        //support middle
        //yPoly(p=[[44,0],[0,25],[-44,0],[-22,-40],[22,-40]], szz=0.8, px=455,pz=25.4,rx=-90,rz=90); 
        yPoly(p=[[44,0],[0,25],[-44,0],[-22,-40],[22,-40]], szz=0.8, px=500.8,pz=25.4,rx=-90,rz=90);         
    }//transform
}//module

