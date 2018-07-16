# diversity-across-geography
A project seeking it to make it easier for companies to compare the representation of different groups in their workforce to the local labor force across geography

What does this project to?
This project aims to make it easier for HR/people analysts to compare the representation of different demographics in their company to the communities they have a presence in. It also helps identify if a company is getting the application numbers from different groups they would expect based on the same criteria. 

Why is this project useful? 
Especially with very distributed companies, it is often difficult to see which areas you have the biggest struggles in attracting and retaining talent from different backgrounds. This project helps make that process a bit easier, by creating a framework for these comparisons to be made

You work at GitHub. Is this a GitHub sponsored project?
I do work at GitHub, and it’s awesome! While GitHub is supportive of me contributing to open source, this project is independent of my work there, and in no way reflects GitHub’s philosophy or projects on this topic. This is just something I find personally interesting and want to build with the community. 

How can I use this project as an analyst?
Download the project and unzip it. Open the R file, and import the data sources from your company as instructed. This project will calculate the representation numbers of a particular demographic (starting with gender) across different geographic regions (starting with states in the USA). Then, it will take the labour market data I’ve compiled to estimate the representation of that demographic group in the labour force in that reason. Finally, it calculates the difference between the expected and actual representations of underrepresented groups, and writes a CSV file that highlights areas where your company has a significant presence and has a lot less of a particular group than one would expect. If you want to add the optional application rates piece, it goes through a similar process to help you see if you have issues attracting talent from underrepresented groups at the top of the funnel.

Where did you get your Data?
Labor force participation comes from the Bureau of Labor Statistics, and demographics by state comes from the American Community Survey.

Why is there only Gender by state in the USA right now?
This is the case because it is the only area where I personally was able to find the data I wanted. This was always meant to be a starting place, and I’m looking forward to the open source process in helping this project advance.

What is on the roadmap and how can I help?
Check out the “Contributing” file; your help is much appreciated!
