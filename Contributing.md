# The Types of Contributions I'm looking for
Essentially, I'd love contributions that add better (ie more granularity) datasets, and new functionality of the tool. If you want to alter the base code in some meaningful way, please get in touch with me via GitHub. When you add additional functionality (ie, Gender by country), please make a separate R or python file and specify what it can be used for / how to use it as comments in the code.

# Roadmap / Where you Can Help
Here is a roadmap ordered from most to less impactful in my eye:

1. Taking differential labour force participation rates across states in the USA for Gender
The script I created currently just applies USA-wide labour force participation rates to each individual state’s gender population breakdown, which is obviously imperfect. I could not find a good, free source of labour force participation rates by gender by state. If you have this, it could become a lot more powerful!

2. Adding functionality for comparisons of ethnicity in USA by state
I have actually already built most of the script for this, but I ran into a major roadblock. I have only seen companies collect ethnicity in a format that parses our Hispanic/Latino folks as a separate group, but the American community survey does not. Instead, they have a separate table of what percentage of white folks, black folks, etc are Hispanic for the USA overall. I could make a correction myself, but the problem is that it would end up assuming that Hispanic/ Latino folks are evenly distributed across the USA, which is obviously not the case. So if you know of some better data sets that could solve this problem, we could add this very important functionality. I have added the files I have access to for your reference. 

3. Making comparisons across countries - *GENDER SOLVED by @javaldro with the help of Frank Mu*
Obviously, the USA is not the only place where people are thinking about these topics. I haven’t searched too hard for relevant data, but if someone could find by country breakdowns of the labor force, we could apply this same approach to see if a company is appropriately mirroring the labour force composition of different countries they have a presence in. I think this would be very interesting, as naturally ethnic population base rates vary meaningfully across countries, as does the labour force participation of women. That said, I think the ethnic piece has an additional challenge in that the terminology and definitions of different groups vary meaningfully across countries. 

4. Creating an easy conversion from state shorthand (NY) to state name (New York); Same with Countries
Not all of our state data is in the same format, and the script currently only recognizes full state name. It would be great if someone could create a framework for this conversion to make all of our lives a bit easier. 

5. Making python versions of these tools
I have created this base script in R as it is my tool of preference. That said, I know others prefer python. So to help make the project inclusive, I think it would be nice to add python versions as well. 
