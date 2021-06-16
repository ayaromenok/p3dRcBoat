include <rcBoatBody.scad>
include <engine2212Basket_5inch.scad>
include <chassis.scad>

chassisCenter();
engine2212_basket_inch5_assembly(-40,0,86);

frontSection(0,80,-24);
backSection(0,80,-24);
frontSection(0,-80,-24);
backSection(0,-80,-24);
