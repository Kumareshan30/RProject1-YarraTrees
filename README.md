# Yarra Trees Data Visualization - R Shiny Project

## Project Overview

This project implements an **interactive data visualization application** using **R Shiny, ggplot2, and Leaflet** to analyze and explore tree data from Yarra, Melbourne. The application allows users to interact with a **map visualization**, filter trees based on specific attributes, and view additional **static visualizations** for deeper insights into the dataset.

The application features:

- **Interactive Leaflet Map**: Displays tree locations with filters for **DBH (Diameter at Breast Height) and Height**.
- **DBH vs. Height Scatter Plot**: Visualizes the relationship between tree size and height, grouped by genus.
- **Boxplot of Tree Heights**: Shows the frequency distribution of tree heights across different genus types.
- **User Interaction**: Provides a dynamic interface with **sliders** to adjust DBH and height filters.



## Folder Structure
RProject1-YarraTrees/

   ├── yarra-trees-PE2.csv      # Main dataset containing Yarra tree data
      
   ├── YarraTreesAnalysis.R  # Main R Shiny application script
   
   ├── README.md  # Project documentation
   

## Installation

Ensure you have **R** and **RStudio** installed. Then install the required R packages using:

```r
install.packages(c("shiny", "leaflet", "ggplot2", "dplyr"))
```

## Usage

1. Open **RStudio** and load the `YarraTreesAnalysis.R` file.
2. Run the application by executing:
```r
   shiny::runApp("app.R")
```
3. Interact with the map visualization by applying filters for tree DBH and height.
4. Explore the scatter plot and boxplot for further analysis.

## Dataset Description

- **yarra-trees-PE2.csv**: This dataset contains detailed records of trees in Yarra, Melbourne. It includes the following attributes:
  - **Species**: The scientific name of the tree species.
  - **Genus**: The higher classification of the tree.
  - **DBH (Diameter at Breast Height)**: The trunk diameter measured at 1.3m above the ground.
  - **Height**: The total height of the tree in meters.
  - **Age**: The estimated age of the tree.
  - **Longitude & Latitude**: The geographic coordinates of the tree.



## Methodology

### 1. Data Preprocessing

- **Dataset Used**: `yarra-trees-PE2.csv` (contains tree species, DBH, height, genus, and location attributes).
- **Data Filtering**: Applied based on user-selected DBH and height values.

### 2. Interactive Leaflet Map

- **Markers**: Circle markers representing trees.
- **Color Mapping**: Tree **age** mapped to a **Greens** color palette.
- **Size Mapping**: Marker size adjusted based on **DBH (scaled by 0.1)**.
- **Popups**: Display tree details such as species, genus, age, height, and DBH when clicked.
- **Sliders**: Allow filtering of trees based on **DBH and height**.

### 3. Visualization 1: DBH vs Height Scatter Plot

- **Graph Type**: Scatter plot using `ggplot2`.
- **X-axis**: **DBH** (Diameter at Breast Height).
- **Y-axis**: **Tree Height**.
- **Color Encoding**: Points colored by **Genus**.
- **Insights**:
  - Shows the distribution of tree sizes by genus.
  - Highlights correlations between tree height and DBH.

### 4. Visualization 2: Tree Height Distribution Boxplot

- **Graph Type**: Boxplot using `ggplot2`.
- **X-axis**: **Tree Height**.
- **Y-axis**: **Genus** (Tree type classification).
- **Insights**:
  - Shows median, quartiles, and outliers in tree heights.
  - Provides insights into variation in height among different tree species.


## Notes

- Modify the **color palette** in Leaflet if needed for better visibility.
- Experiment with additional **filters** (e.g., tree age, species) to enhance interactivity.
