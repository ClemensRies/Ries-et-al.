// Quantification matrix for horizontal sections
// Task: Generation of 50 to 300 µm circles  around the center of the injury
			//In case of a cell free hole in the middle the area of the hole is added to the area of the circles to normalize the actually counted area
// Input file: Slidescanner picture .vsi file extracted (!!!) and saved as .tif (all channels organized in one stack)
// Draw polygon around empty area in the center of the wound (tissue free) or a very small ROI in the center (if no tissue is missing)

run("Set Scale...", "distance=3.0723 known=1 pixel=1 unit=µm");		// Set size of picture from pixel to µm
roiManager("Add");													// Polygon is adde to ROI manager
run("Measure");														// Polygon is measured
getStatistics(area)
print(area)

var C=3.0723														// variable C is set as 3.0723
var A=getResult("X", nResults-1)*C									// X and Y define center of Polygon and are set as variables A and B
var B=getResult("Y", nResults-1)*C


var D1=2*sqrt((area+7853.982)/PI)*C									// Calculation of diameter of circle with area of a 100 µm circle; Area of polygon is added to correct for the empty area; If no hole area of polygon close to zero and D1 = 100 µm 

var D2=2*sqrt((area+31415.927)/PI)*C								//Same calculation for circle with 200 µm diameter + polygon area

var D3=2*sqrt((area+70685.835)/PI)*C								//Same calculation for circle with 300 µm diameter + polygon area

var D4=2*sqrt((area+125663.706)/PI)*C								//Same calculation for circle with 400 µm diameter + polygon area


var D5=2*sqrt((area+196349.541)/PI)*C								//Same calculation for circle with 500 µm diameter + polygon area

var D6=2*sqrt((area+282743.339)/PI)*C								//Same calculation for circle with 600 µm diameter + polygon area

var R1=D1/2															// Calculation of radius of given diameters
var R2=D2/2
var R3=D3/2
var R4=D4/2
var R5=D5/2
var R6=D6/2

makeOval(A-R1, B-R1, D1, D1)										// Circles with D1 to D6 are drawn around center of polygon (A, B)
roiManager("Add");													// Circles are added to ROI manager
makeOval(A-R2, B-R2, D2, D2)
roiManager("Add");
makeOval(A-R3, B-R3, D3, D3)
roiManager("Add");
makeOval(A-R4, B-R4, D4, D4)
roiManager("Add");
makeOval(A-R5, B-R5, D5, D5)
roiManager("Add");
makeOval(A-R6, B-R6, D6, D6)
roiManager("Add");

roiManager("Show All");
run("Channels Tool...");											// channels tool is opened
run("Cell Counter");												// Cell counting tool is opened
					
// Initialize counting tool
// Count cells
// Save data cell counter and all ROIs with picture


