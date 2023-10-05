#Import the Pandas/datetime/operating system libraries
import pandas as pd #pandas
from datetime import datetime #datetime
import os #operating system

# Importing file
csv = pd.read_csv('AEM_input_20230908_formatted_v6.csv')    

# Adjusting the width of the notebook
pd.set_option('display.width', 1000)

# Exporting CSV function
def save_to_csv(df, filename_prefix):
    now = datetime.now()
    timestamp = now.strftime("%d-%m-%Y_%H.%M.%S")
    filename = f"{filename_prefix}_{timestamp}.csv"
    df.to_csv(filename, index=False)
    return filename

#=================

# Load the CSV file into a DataFrame
#class pandas.DataFrame(data=None, index=None, columns=None, dtype=None, copy=None)
loaded_df = pd.DataFrame(data=csv)
print(loaded_df)

#=================

# Save DataFrame to CSV with a timestamp
Imported_data = save_to_csv(loaded_df, "Imported_data")

# Print the generated CSV filename
print(f"CSV saved as {Imported_data}")

#=================

class AEMLinkGenerator:
    def __init__(self, df):
        self.df = df
        self.source = "CEE"
        self.audience_group = "AI"
        self.product_category = "NA"

    def generate_links(self):
        bid_links = []
        aem_links = []
        
        for index, row in self.df.iterrows():
            milestone_detail = row["Milestone"]
            nbc_name = row["NBC"]
            location = row["Location"]
            segment = row["Segment Code"]
            var_1 = row["VAR_DATA_1"]
            var_2 = row["VAR_DATA_2"]
            var_3 = row["VAR_DATA_3"]
            var_4 = row["VAR_DATA_4"]
            var_5 = row["VAR_DATA_5"]

            # dynamic_asset_bid = f"{self.source}-{self.audience_group}-{milestone_detail}-{self.product_category}-{nbc_name}-{location}-{segment}"
            # print(f"{dynamic_asset_bid}")

            dynamic_asset_bid = f"{self.source}-{self.audience_group}-{milestone_detail}-{self.product_category}-{nbc_name}-{location}-{segment}"
            dynamic_asset_aem = f"CA-CEE/FWB/{self.source}-{self.audience_group}-{milestone_detail}-{self.product_category}-{nbc_name}-{location}-{segment}.af.json"

            bid_links.append(dynamic_asset_bid)
            aem_links.append(dynamic_asset_aem)

        self.df["BID_Links"] = bid_links
        self.df["AEM_Links"] = aem_links
        return self.df

# Creating a copy of the original DataFrame
loaded_df_copy = loaded_df.copy()
        
# Creating an instance of the AEMlinkGenerator class
link_generator = AEMLinkGenerator(loaded_df_copy)
        
# Call the generate_bid_links & generate_aem_links method to generate AEM links
generate_links_df = link_generator.generate_links()

# Select the first 7 columns from the original input, and append both BID and AEM links for continiuity 
final_generate_links = generate_links_df.iloc[:, 0:7].join(generate_links_df[["BID_Links","AEM_Links"]])
final_generate_links_df = pd.DataFrame(data=final_generate_links)
print(final_generate_links_df)

#=================

# Save DataFrame to CSV with a timestamp
Digital_links = save_to_csv(final_generate_links_df, "Digital_links")

# Print the generated CSV filename
print(f"CSV saved as {Digital_links}")

#=================

# Adding a pre-text to the AEM link for the 'path'
dynamic_assets_ext = ["/content/ext/ActivityFeed/LiveCopy/Automation/FWB/" + asset for asset in dynamic_assets]

#=================

# AEM Upload - Step 1

import pandas as pd

# Adjusting the width of the notebook
pd.set_option('display.width', 1000)

# Future function that will ladder up to main():
def AEM_UploadFile_1():
    '''
            Purpose: 

            Parameters:
                

            Returns:
                
    '''
    # Creating a dictionary to store the static data for this step - DataFrame columns
    static_data = {
        "jcr:primaryType": "cq:Page",
        "jcr:content/jcr:primaryType": "cq:PageContent",
        "jcr:content/cq:template": "/apps/activity-feeds/templates/activity-feeds-content-template",
        "jcr:content/sling:resourceType": "/apps/activity-feeds/components/page/contentpagecomponent",
        "jcr:content/jcr:title": dynamic_assets,
        "jcr:content/dataImporter": "true"
    }
    
    # Creating the DataFrame
    df1 = pd.DataFrame(static_data)
    
    # Adding the 'path' column with our previously generated AEM links
    df1.insert(0, "path", dynamic_assets_ext)
    
    # Printing the dataframe, the columns are weird though.. I don't know how to fix it
    print(df1)

# Calling the function
AEM_uploadFile_1()

# =======================

#=================

#=================
