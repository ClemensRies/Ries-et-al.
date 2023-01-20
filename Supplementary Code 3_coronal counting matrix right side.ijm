// start with this after using ''coronal counting matrix left side'' macro
// Draw segmented line along boarder (or center) on right side of injury
// add to ROI manager (Strg + T)
// Run this macro


run("Set Scale...", "distance=3.07 known=1 unit=µm");		// Set size of picture from pixel to µm

var C=3.07													// sets variable C as 3.07

var dw=50*C													// sets variable dw as 50 * variable C

getSelectionBounds(x, y, w, h);								// already draw segmented line in redrawn
setSelectionLocation(x+dw, y);								// segmented line is moved to +50 µm of position of line at wound boarder

roiManager("Add");											// line is added to ROI manager

var dx=50*C													// same procedure as before; new line pushed to +100 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x+dx, y);

roiManager("Add");

var dy=100*C												// same procedure as before; new line pushed to +200 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x+dy, y);

roiManager("Add");

var dz=100*C												// same procedure as before; new line pushed to +300 µm from original line

getSelectionBounds(x, y, w, h);
setSelectionLocation(x+dz, y);

roiManager("Add");

// Initialize counting tool
// Count cells
// Save data counting tool AND all ROIs in the ROI manager together with picture