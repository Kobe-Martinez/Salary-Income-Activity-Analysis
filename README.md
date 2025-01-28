# Salary, Income, and Activity Data Analysis

This project delves into three fascinating areas of data analysis: uncovering salary disparities, exploring household income trends, and tracking activity patterns over time. Through powerful visualizations and statistical methods, these scripts transform raw data into compelling stories. Whether it’s revealing gender-based wage gaps, illustrating how income varies across age groups, or mapping time-based activity behaviors, each analysis is crafted to highlight meaningful insights. With a blend of histograms, box plots, and scatter plots enriched by error bars and custom styling, this project provides a fresh perspective on the dynamics of salary equity, economic trends, and human activity.


## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Requirements](#requirements)
- [File Output](#file-output)
- [License](#license)
- [Important Note](#important-note)


## Features

- **Salary Disparity Analysis (`salary_analysis.R`)**: 

  - Examines gender-based disparities in starting salaries and salaries in 1977
    
  - Generates histograms and box plots to visualize salary distributions by gender
    
  - Computes Hedge's g statistic and confidence intervals to quantify disparities
    
- **Household Income Analysis (`income_analysis.R`)**: 

  - Analyzes median household income data by age groups
    
  - Creates a scatter plot showing income distributions and associated margins of error
    
  - Visualizes survival trends through line graphs for males and females
 
- **Activity Trend Analysis (`activity_analysis.R`)**: 

  - Processes activity datasets using start and stop times with time bins
    
  - Analyzes activity trends to uncover time-based patterns
    
  - Outputs preliminary analysis results to the console
      

## Usage

1. **Prepare the Data**:
   
   - Place the required files (codes.csv, atusact_2019.dat) in the working directory

2. **Run the Scripts**:
   
   - Execute the following scripts in RStudio or an R environment:
       - `salary_analysis.R`
       - `income_analysis.R`
       - `activity_analysis.R`
   
3. **Generated Outputs**:
   
    - `salary_analysis.R`: Visualizations of salary distributions and wage gaps
    - `income_analysis.R`: Plots median household income with error bars
    - `activity_analysis.R`: Activity trends results are displayed in the console for analysis or adaptation into plots
     

## Code Structure

- **salary_analysis.R**:
  
  - Uses salary data to analyze disparities by gender
    
  - Produces histograms and box plots for starting salaries and 1977 salaries
 
  - Calculates statistical measures like Hedge's g and confidence intervals
    
- **income_analysis.R**:
  
   - Creates a scatter plot showing median household income by age group
 
   - Includes error bars to visualize uncertainties
 
   - Defines a custom dataset for median household income by age group
     
   - Includes error bars to visualize uncertainties
     
   - Outputs the visualization as a high-quality PDF
 
   - Uses custom styling for legends, axis labels, and titles
 
- **activity_analysis.R**:
  
   - Analyzes activity data based on start and stop times
     
   - Groups data into time bins for trend analysis
     
   - Outputs analysis to the console, adaptable for visualizations
     

## Requirements

- R programming environment (preferably RStudio)
  
- Required R packages:
     
           - `RColorBrewer`

           - `GISTools`

           - `Cairo`

           - `Sleuth3` (for salary analysis)

## File Output

- **PDF Outputs**:

  - `salary_analysis.pdf`: Histograms and box plots of salary distribution
    
  - `income_analysis.pdf`: Scatter plot showing household income distribution
    
- **Console Outputs**:

  - `activity_analysis.R`: Activity trends grouped by time bins
 

## License

This project is licensed under the MIT License. See the LICENSE file for details.


## Important Note

This repository demonstrates data analysis and visualization techniques using R. It explores trends in salaries, income distributions, and activity patterns through clear and informative visualizations. Ideal for showcasing the power of data-driven insights.
