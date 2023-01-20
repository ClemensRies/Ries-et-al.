//GFAP Intensity measurement
//Input file: SLidescanner picture .vsi file extracted (!!!) and saved as .tif (all channels organized in one stack)

run("Set Scale...", "distance=3.0723 known=1 pixel=1 unit=µm");   // Set size of picture from pixel to µm


title=getTitle();										// assign title of picture to the variable title


run("Stack Splitter", "number=3");						// split stack by three (three channels); if 4 or only 2 channels change number accordingly

selectWindow("stk_0003_" + title);
close();												// closes channels not needed; in this case 1 and 3, because channel 2 is GFAP channel; change to your needs
selectWindow("stk_0001_" + title);
close();

run("Z Project...", "projection=[Max Intensity]");		// maxiumum intensity z-projection of remaining z-stack, all images in stack are projected

run("Threshold...")
setThreshold(1500, 65535);								// Threshold with lower limit 1500 and upper limit 65535 (lower limit used to exclude background signal)


run("Measure");											// Measures intensity in area above threshold (IMPORTANT: Analyze--> Set measurements --> make sure ''limit to threshold'' (!!!), Area and Integraded Density are clicked) ) 



title = getTitle();										// Assigns new title to variable title
      print("title: " + title);							// prints title in summary
      


var A=getResult("Mean", nResults-1);					// sets variable A, B and C as Mean, IntDen and Area from Results
var B=getResult("IntDen",nResults-1);
var C=getResult("Area",nResults-1);
print(A)												//prints Mean, IntDen and Area below title in summary
print(B)
print(C)

title = getTitle();
      
      
saveAs("Results", "C:/.../"+title +".xls");				//saves results as .xls file (Add your destination)
