class AEMLinkGenerator:
    def __init__(self, df):
        self.df = df
        self.source = "CEE"
        self.audience_group = "AI"
        self.product_category = "NA"

    def generate_links(self):
        bid_links = []   # list
        aem_links = []   # list
        draft_paths = [] # list
        live_paths = []  # list
        
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

            # Generate the BID and AEM Links
            dynamic_asset_bid = f"{self.source}-{self.audience_group}-{milestone_detail}-{self.product_category}-{nbc_name}-{location}-{segment}"
            dynamic_asset_aem = f"CA-CEE/FWB/{self.source}-{self.audience_group}-{milestone_detail}-{self.product_category}-{nbc_name}-{location}-{segment}.af.json"
            
            # Generate draft and live paths
            dynamic_asset_ext_draft = f"/content/ext/ActivityFeed/Draft/Automation/{milestone_detail}/{dynamic_asset_bid}"
            dynamic_asset_ext_live = f"/content/ext/ActivityFeed/LiveCopy/Automation/{milestone_detail}/{dynamic_asset_bid}"

            # Append (add) the list of links to their respective lists
            bid_links.append(dynamic_asset_bid)
            aem_links.append(dynamic_asset_aem)
            draft_paths.append(dynamic_asset_ext_draft)
            live_paths.append(dynamic_asset_ext_live)

        
        self.df["BID_Links"] = bid_links
        self.df["AEM_Links"] = aem_links
        self.df["Draft_Path"] = draft_paths
        self.df["Live_Path"] = live_paths
        return self.df

# Creating a copy of the original DataFrame
loaded_df_copy = loaded_df.copy()
        
# Creating an instance of the AEMlinkGenerator class
link_generator = AEMLinkGenerator(loaded_df_copy)
        
# Call the generate_bid_links & generate_aem_links method to generate AEM links
generate_links_df = link_generator.generate_links()

# Select the first 7 columns from the original input, and append both BID and AEM links for continiuity (handed to Digital teams)
final_generate_links = generate_links_df.iloc[:, 0:7].join(generate_links_df[["BID_Links","AEM_Links"]])
final_generate_links_df = pd.DataFrame(data=final_generate_links)
print(final_generate_links_df)

#====================================

# Creating a dictionary to store the static data for this step - DataFrame columns
static_data = {
    "jcr:primaryType": "cq:Page",
    "jcr:content/jcr:primaryType": "cq:PageContent",
    "jcr:content/cq:template": "/apps/activity-feeds/templates/activity-feeds-content-template",
    "jcr:content/sling:resourceType": "/apps/activity-feeds/components/page/contentpagecomponent",
    "jcr:content/jcr:title": final_df["BID_Links"], #calling from "def generate_links(self):"
    "jcr:content/dataImporter": "true"
}

# Creating the DataFrame
df1 = pd.DataFrame(static_data)

# Adding the 'path' column with our previously generated AEM links -- calling from "def generate_links(self):"
df1.insert(0, "path", original_df["Draft_Path"])

# Printing the dataframe
print(df1)
