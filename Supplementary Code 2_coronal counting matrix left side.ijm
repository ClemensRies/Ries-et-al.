// Input file: Usable after the appropriate Preprocessing macro
// Draw segmented line along boarder (or center) in left side of injury
// add to ROI manager (Strg + T)
// Run this macro


run("Set Scale...", "distance=3.07 known=1 unit=µm");   // Set size of picture from pixel to µm



var C=3.07												// sets variable C as 3.07




var dw=50*C												// sets variable dw as 50 * variable C					

getSelectionBounds(x, y, w, h);							// already draw segmented line in redrawn
setSelectionLocation(x-dw, y);							// segmented line is moved to -50 µm of position of line at wound boarder

roiManager("Add");										// line is added to ROI manager

var dx=50*C												// same procedure as before; new line pushed to -100 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x-dx, y);

roiManager("Add");

var dy=100*C											// same procedure as before; new line pushed to -200 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x-dy, y);

roiManager("Add");

var dz=100*C											// same procedure as before; new line pushed to -300 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x-dz, y);

roiManager("Add");

run("Brightness/Contrast...");							// Brightness/Contrast tool is opened

run("Cell Counter");									// Cell counter tool is opened

roiManager("Select", 0);								// Select first line drawn
roiManager("Measure");									// Measure properties

roiManager("Select", 0);
roiManager("Measure");
	
var O=getResult("BY", nResults-1)*C						// Assign result BY (lowest position of drawn line) to variable O			

var H=getResult("Height", nResults-1)*C					// Assign heigth of drawn line to variable H

makeLine(0, O, 3071, O);								// Draw horizontal line at lower boarder of drawn line (position of variable O) with length 3071


roiManager("Add");										// line is added to ROI manager

makeLine(0, O+H, 3071, O+H)								// Draw horizontal line at upper boarder of drawn line (position of variable H) with length 3071

roiManager("Add");										// line is added to ROI manager

print(getResult("Length", nResults-1)					// height of dran line is printed

// go to ''coronal counting matrix right side''


