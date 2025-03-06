# Urban Tree Data Visualization - Tableau Project

## Project Overview
This Tableau project analyzes urban tree data to uncover patterns in tree species distribution, planting trends, and location-based insights. The dataset contains detailed records of tree species, planting years, and geographic locations. The project provides interactive visualizations to explore:
- The spatial distribution of tree species
- Trends in tree planting over time
- The relationship between tree species and planting locations


## Folder Structure
Tableau Project 1- Urban Trees Visualization/

   ├── PE1-trees-data-v2.csv      # Main dataset containing tree data
      
   ├── Urban_Tree_Data_Visualization.twb  # Tableau workbook containing all dashboards
   
   ├── README.md  # Project documentation
   

## Installation
To view and interact with the Tableau dashboards, install Tableau Public or Tableau Desktop:
1. Download Tableau Public: https://public.tableau.com/en-us/s/download
2. Open Urban_Tree_Data_Visualization.twb in Tableau.

## Dataset Description
- **PE1-trees-data-v2.csv**: The dataset includes information on urban trees, such as:
  - **Common Name**: The species of the tree.
  - **Scientific Name**: Botanical name of the species.
  - **Genus & Family**: Taxonomic classification.
  - **Date Planted & Year Planted**: Planting history.
  - **Age Description**: Categorization of tree maturity.
  - **Longitude & Latitude**: Geographic coordinates of trees.
  - **Located In**: Whether the tree is in a park, street, or other location.


## Results & Analysis
The Tableau workbook contains the following dashboards and insights:

### 1. Data Cleaning and Anomaly Detection
- **Textual Data Errors in Common Names**: Special characters were present in some tree names. This was resolved using a find-and-replace method.
- **Longitudinal Errors in Plant Location**: A tree was found outside Melbourne, which was an error in data collection and was removed.
- **Future Dated Entries**: A Callery Pear tree was recorded as planted in 2024, which is impossible. This record was ignored.

### 2. Tree Planting Trends Over Time
- **Genus Types Planted Each Year** (Fig 5): The number of trees planted from different Genus groups was analyzed.
  - Post-2005, the number of trees planted annually became stable, especially in Ulmus, Quercus, Croymbia, and Platanus groups.
  - Eucalyptus saw a peak in 2013 but fluctuated between 500-1000 annually after that.
  - Pre-2004, tree planting was more erratic but at a significantly higher volume.
- **Yearly Trends in Tree Planting** (Fig 6): Overlaid discrete line graphs confirmed that post-2005 tree planting volumes were a fraction of pre-2004 levels.
- **Running Sum of Trees Planted per Genus** (Fig 7):
  - Eucalyptus was found to be the most planted genus, making up nearly 33% of all trees.
  - Other Genus groups, except "Other," never exceeded 5000 trees in total.

### 3. Spatial Distribution of Trees
- **Tree Locations Across Melbourne** (Fig 8):
  - Eucalyptus is concentrated in central city areas.
  - Croymbia is more dominant near water bodies.
- **Location Preference of Genus Groups** (Fig 9):
  - Eucalyptus is commonly planted in parks.
  - Platanus is predominantly found on streets.
  - These spatial distributions do not impact the overall conclusions about planting trends.
