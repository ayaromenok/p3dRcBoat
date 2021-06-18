include <rcBoatBody.scad>
include <engine2212Basket_5inch.scad>
include <chassis.scad>
include <fuselage.scad>
include <hydrofoil.scad>

chassisCenter();
engine2212_basket_inch5_assembly(-40,0,86);

frontSection(0,80,-24);
backSection(0,80,-24);
frontSection(0,-80,-24);
backSection(0,-80,-24);

fuselageSupport(30,0,8);
fuselageMainBot(60,0,58);


wingMain(80,0,-60, 90,-10,0);
wingHolder(80,10,-35,  0,180,180, length=60);
wingHolder(80,-10,-35,  0,180,180, length=60);