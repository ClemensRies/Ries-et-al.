// Input file: Slidescanner picture .vsi file extracted (!!!) and saved as .tif (all channels organized in one stack)
// For coronal or horizontal analysis
// Makro sets scale to µm, splits stacked channels, assigns colours, contrast settings and merges them


title=getTitle();														// sets title of image as variable title

run("Set Scale...", "distance=3.0723 known=1 pixel=1 unit=µm");			// sets scale from pixel to µm






run("Stack Splitter", "number=4");										// split stack by 4 (three channels); if 4 or only 2 channels change number=3 or =2 accordingly


selectWindow("stk_0001_" + title);										// selects channel 1
run("Red");																// Assigns colour Red (Change to colour needed)
setMinAndMax(500, 12000);												// sets contract settings (change as needed for consistent analysis)
rename("C1");															// renames image "C1"
C1=getTitle();															// assigns title to variable C1

selectWindow("stk_0002_" + title);										// Same as above
run("Green");
setMinAndMax(500, 8000);
rename("C2");
C2=getTitle();

selectWindow("stk_0003_" + title);										// Same as above (If stack splitter number=2 --> delete this part)
run("Green");
setMinAndMax(100, 4000);
rename("C3");
C3=getTitle();

selectWindow("stk_0004_" + title);										// Same as above (If stack splitter number=2 or 3 --> delete this part)
run("Green");
setMinAndMax(100, 4000);
rename("C4");
C4=getTitle();


run("Merge Channels...", "c1="+C1+" c2="+C2+" c3="+C3+" c4="+C4+" create"); // Merges C1 to C4 back together (If only 2 or 3 channels--> delete C3 and/or C4)

//run("Channels Tool...");												// opens channels tool

// Image ready to use
// Use coronal of horizontal counting matrices


