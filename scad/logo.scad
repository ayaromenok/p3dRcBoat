include <../../lib/lib2.scad>

vespa_logo();

module vespa_logo(px=0,py=0,pz=0, rx=0,ry=0,rz=0, length=200){
    translate([px, py, pz])    
    rotate([rx, ry, rz]) {
        scale([0.2,0.2,0.2])
        linear_extrude(height = 5, center = true, convexity = 10)
            import(file = "../svg/vespa_logo.svg");
    }//transform
}//module