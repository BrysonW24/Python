def main():
    # Call functions below
    NBC_metadata()
    NBC_BID_links()
    NBC_Create_AEM_links()
    NBC_Export_AEM_links()
    AEM_UploadFile_1()
    AEM_UploadFile_2()
    AEM_UploadFile_3()
    AEM_UploadFile_4()

# Entry point of program
if __name__ == "__main__":
    main()

----

# Importing a CSV file from DS Team

#Import the Pandas library
import pandas as pd

# Function that ladders up to main():
def Data_import():
    '''
        Purpose: Loading and printing the dataframe based on data science file / ChatGPT output

            Parameters:
                Setting the notebook to wide view
                Picking up the CSV file
                Printing the dataframe 

    '''
    # Adjusting the width of the notebook
    pd.set_option('display.width', 1000)

    # Step 2: Load the CSV file
    #class pandas.DataFrame(data=None, index=None, columns=None, dtype=None, copy=None)
    csv = pd.read_csv('AEM_input_20230908_formatted_v5.csv')
    df = pd.DataFrame(data=csv)
    AEM_input_clean = df
    print(AEM_input_clean)

# Calling the function
Data_import()

# =======================

# Lists of potential choices for using GenAI, creating AEM links

# Function that will ladder up to main():
def NBC_metadata():
    '''
        Purpose: Assigning the metadata for the AEM links

            Parameters:
                NBC name for CEE x AEM matching 
                Source (CEE)
                Audience group 
                Milestone detail
                Product category
                Location
                Segment code

            Returns:
                List of segments to be used - checking this is aligned to the CSV input / GenAI output
    '''
    # NBC name 
    nbc_name = "BenefitsFinderGeneric"
    
    # AEM Link conventions for Adobe reporting and classification
    source = ["CEE","TNT"]
    audience_group = ["AI","ALL","BEH","DEF","PRO","TBT"]
    milestone_detail = ["ADOC","ADOD","ADOE","ATQ","COLL","FWB","LDG","RET","RTBG","RTDD","RTPC","RTPS","RTRC","RTRD","RTRF","RTRS","SER","SERAW","SEROP","SNS"]
    product_category = ["AF","AP","BL","BNPL","BOS","BTA","BUS","Cards","CC","CCU","CI","CLI","ES","FA","FX","HI","HL","HLP","HLTU","IMT",
                        "INV","LI","MER","NA","PAR","PHI","PL","PMTS","PO","SAV","SB","SHOP","SMSF","TD","TI","TMC","TRAN","X15","YS"]
    location = ["CAAF","CAHB","CAFY"]
    
    # Take segments from the DS CSV column, turn it into a list
    segments = AEM_input_clean["Segment_code"].tolist() # selecting "Segment Code" column from Dataframe
    print(segments) # check segment code output

# Calling the function
NBC_metadata()

# To be worked on 
# AEM_link = source+"-"+audience_group+"-"+milestone_detail+"-"+product_category+"-"+location+"-"+segment
# AEM_link = VAR_1+"-"+VAR_2+"-"+VAR_3+"-"+VAR_4+"-"+VAR_5+"-"+VAR_6

#CEE-AI-FWB-NA-BenenfitsFinderGeneric-CAHB-EXP2

# =======================

# Populating the assets

# Get AEM Links ready or export
# Future function that will ladder up to main():
def NBC_BID_links():
    '''
            Purpose: 

            Parameters:
                

            Returns:
                
    '''
    # Get AEM Links ready or export
    ## Total assets required for this initiaitve is defined by the length (len) or number of segments counted in the previous "segments" variable
    assets_total = len(segments)
    
    ## Initialising the counter for the number of assets to generate
    assets_generated = 0
    
    ## Storing the AEM Links
    dynamic_assets = []
    
    ## While loop to iterate over this - "segments" uses dynamic indexing to print segments
    while assets_generated < assets_total:
        dynamic_asset = source[0] + '-' + audience_group[0] + '-' + milestone_detail[5] + '-' + product_category[23] + '-' + nbc_name + '-' + location[1] + '-' + segments[assets_generated] 
        print(f"{dynamic_asset}")
        dynamic_assets.append(dynamic_asset)
        assets_generated += 1
    
    print("\n Count of segments: ", assets_total)

# Calling the function
NBC_aem_links()

# =======================

# Lists of potential choices for using GenAI, creating AEM links

# Future function that will ladder up to main():
def NBC_metadata():
    # NBC name 
    nbc_name = AEM_input_clean.iat[0,0]
    
    # AEM Link conventions for Adobe reporting and classification
    source = ["CEE","TNT"]
    audience_group = ["AI","ALL","BEH","DEF","PRO","TBT"]
    milestone_detail = ["ADOC","ADOD","ADOE","ATQ","COLL","FWB","LDG","RET","RTBG","RTDD","RTPC","RTPS","RTRC","RTRD","RTRF","RTRS","SER","SERAW","SEROP","SNS"]
    product_category = ["AF","AP","BL","BNPL","BOS","BTA","BUS","Cards","CC","CCU","CI","CLI","ES","FA","FX","HI","HL","HLP","HLTU","IMT",
                        "INV","LI","MER","NA","PAR","PHI","PL","PMTS","PO","SAV","SB","SHOP","SMSF","TD","TI","TMC","TRAN","X15","YS"]
    location = ["CAAF","CAHB","CAFY"]
    
    # Take segments from the DS CSV column, turn it into a list
    segments = AEM_input_clean["Segment Code"].tolist() # selecting "Segment Code" column from Dataframe
    print(segments) # check segment code output

NBC_metadata()

# =======================

# class pandas.DataFrame(data=None, index=None, columns=None, dtype=None, copy=None)
# https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.html
# --------------
# AEM_link = source+"-"+audience_group+"-"+milestone_detail+"-"+product_category+"-"+nbc_name+"-"+location+"-"+segment
# CEE-AI-FWB-NA-BenenfitsFinderGeneric-CAHB-EXP2

def NBC_Digi_links():
    '''
            Purpose: 
                
            Parameters:
               
            Returns:
                
    '''
    # To be worked on 
    #AEM_link = var_1 + "-" + var_2 + "-" + var_3 + " -" + var_4 + "-" + var_5 + "-" + var_6 + "-" + var_7
    # result = str(var_1()) + "-" + str(var_2()) + "-" + str(var_3()) + "-" + str(var_4()) + "-" + str(var_5()) + "-" + str(var_6()) + "-" + str(var_7())
    # result

    # ===========

    ## Total assets required for this initiaitve is defined by the length (len) or number of segments counted in the previous "segments" variable
    assets_total = len(segments)
    
    ## Initialising the counter for the number of assets to generate
    assets_generated = 0
    
    ## Storing the AEM Links
    dynamic_assets = []
    
    ## While loop to iterate over this - "segments" uses dynamic indexing to print segments
    while assets_generated < assets_total:
        dynamic_asset = source[0] + '-' + audience_group[0] + '-' + milestone_detail[5] + '-' + product_category[23] + '-' + nbc_name + '-' + location[1] + '-' + segments[assets_generated] 
        print(f"{dynamic_asset}")
        dynamic_assets.append(dynamic_asset)
        assets_generated += 1
    
    print("\n Count of segments: ", assets_total)

    #=========
    
    # AEM Links
    # Using List Comprehension
    prefix = 'CA-CEE/FWB'
    suffix = '.af.json'
    dynamic_modified = [prefix + i + suffix for i in dynamic_assets]
    
    # Creating the DataFrame
    NBC_AEM_Links = pd.DataFrame(data=dynamic_modified)
    
    # Rename the column
    NBC_AEM_Links = NBC_AEM_Links.rename(columns={0:"NBC_AEM_Links"})
    
    # Printing the dataframe
    print(NBC_AEM_Links)

# Calling the function
NBC_Digi_links()


# Creating a DataFrame for demonstration (pretend file from Accenture)
data = {
    "BID": [],
    "AEM Links": [],
}

df_demo = pd.DataFrame(data)

df_demo

# =======================

def NBC_Export_AEM_links():
    # Import date class from datetime module
    from datetime import datetime
    now = datetime.now() # current date and time
    date_time = now.strftime("%d-%m-%Y_%H-%M-%S")
    
    # using now() to get the current date and time.
    date_time
    
    # Dataframe to CSV
    NBC_AEM_Links.to_csv("AEM_Links_"+date_time+".csv", index=False)

# Calling the function
NBC_Export_AEM_links()

# The strftime() method returns a string representing date and time using date, time or datetime object.
# https://www.programiz.com/python-programming/datetime/strftime

# =======================

# Inserting() the convention before the AEM link
# Adding a pre-text to the AEM link for the 'path'
dynamic_assets_ext = ["/content/ext/ActivityFeed/LiveCopy/Automation/FWB/" + asset for asset in dynamic_assets]

# =============

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

# AEM Upload - Step 2

# Adjusting the width of the notebook
pd.set_option('display.width', 1000)

# Future function that will ladder up to main():
def AEM_uploadFile_2():
    '''
            Purpose: 

            Parameters:
                

            Returns:
                
    '''
    # List of suffixes for the paths
    suffixes_1 = [
        "/jcr:content/af-content",
        "/jcr:content/image"
    ]
    
    # Creating a dictionary to store the data for the DataFrame - DataFrame columns
    data_dict_1 = {
        "path": [],                 # To store the paths based on the dynamic_assets and suffixes
        "jcr:primaryType": [],      # Static value = step2_primaryType
        "sling:resourceType": [],   # Static value = step2_resourceType
        "imageRotate": [],          # Static value = step2_imageRotate
    }
    
    # Content for columns (path is below) - Row values
    step2_primaryType = "nt:unstructured"
    step2_resourceType = ["wcm/foundation/components/parsys", " "]
    step2_imageRotate = [" ", "0"]
    
    # Looping through the lists to add data to the dictionary - appending values in sequence
    for asset in dynamic_assets:
        for suffix_index, suffix in enumerate(suffixes_1):
            path = "/content/ext/ActivityFeed/Draft/Automation/FWB/" + asset + suffix
            data_dict_1["path"].append(path)
            data_dict_1["jcr:primaryType"].append(step2_primaryType)
            data_dict_1["sling:resourceType"].append(str(step2_resourceType[suffix_index]))
            data_dict_1["imageRotate"].append(step2_imageRotate[suffix_index])
    
    # Creating the DataFrame
    df2 = pd.DataFrame(data_dict_1)
    
    # Printing the dataframe, the columns are weird though.. I don't know how to fix it
    print(df2)

# Calling the function
AEM_uploadFile_2()

# =======================

# AEM Upload - Step 3

# Creating a dictionary to store the static data for this step

# Future function that will ladder up to main():
def AEM_uploadFile_3():
    '''
            Purpose: 

            Parameters:
                

            Returns:
                
    '''
    # List of suffixes for the paths
    suffixes_2 = [
        "/jcr:content/af-content/background_image_pri",
        "/jcr:content/af-content/background_image_pri/actions",
        "/jcr:content/af-content/background_image_pri/menuActions"
    ]
    
    # Creating a dictionary to store the data for the DataFrame - DataFrame columns
    data_dict_2 = {
        "path": [],                 # To store the paths based on the dynamic_assets and suffixes
        "jcr:primaryType": [],      # Static value = step3_primaryType 
        "sling:resourceType": [],   # Static value = step3_resourceType
        "dismissable": [],           # Specific pattern = step3_dismissable
        "templateId": [],            # Specific pattern = step3_templateId
        "title": [],                 # Specific pattern = step3_title
        "contentSummary": [],        # Specific pattern = step3_contentSummary
        "content": [],              # Static value = step3_content
        "attributes": [],           # Static value = step3_attributes
    }
    
    
    # Content for columns (path is below) - Row values
    step3_primaryType = "nt:unstructured"
    step3_resourceType = ["activity-feeds/components/content/background-image-primary-action", "", ""]
    step3_dismissable = ["true", "", ""]
    step3_templateId = ["BackgroundImagePrimaryAction", "", ""]
    step3_title = ["Placeholder", "", ""]
    #step3_title = [headline_var, "", ""]
    step3_contentSummary = ["Placeholder", "", ""]
    #step3_contentSummary = [body_var, "", ""]
    step3_content = " "
    step3_attributes = ["Placeholder","", ""]
    #step3_attributes = [image_var,"", ""]
    #step3_attributes = ["https://www.commbank.com.au/content/dam/commbank-assets/app/hero-banner/FWB/" + image + "\n" + "\n" for image in images]
    step3_attributes = ["https://www.commbank.com.au/content/dam/commbank-assets/app/hero-banner/FWB/insert_image", "", ""]
    
    # Looping through the lists to add data to the dictionary - appending values in sequence
    for asset in dynamic_assets:
        for suffix_index, suffix in enumerate(suffixes_2):
            path = "/content/ext/ActivityFeed/Draft/Automation/FWB/" + str(asset) + str(suffix)
            data_dict_2["path"].append(path)
            data_dict_2["jcr:primaryType"].append(step3_primaryType)
            data_dict_2["sling:resourceType"].append(step3_resourceType[suffix_index])
            data_dict_2["dismissable"].append(step3_dismissable[suffix_index])
            data_dict_2["templateId"].append(step3_templateId[suffix_index])
            data_dict_2["title"].append(step3_title[suffix_index])
            data_dict_2["contentSummary"].append(step3_contentSummary[suffix_index])
            data_dict_2["content"].append(step3_content)
            data_dict_2["attributes"].append(step3_attributes[suffix_index])
            
    # Creating the DataFrame
    df3 = pd.DataFrame(data_dict_2)
    
    # Printing the dataframe, the columns are weird though.. I don't know how to fix it
    print(df3)

# Calling the function
AEM_uploadFile_3()

# =======================

# AEM Upload - Step 4

# Creating a dictionary to store and loop on the dynamic and static data for this step

# Future function that will ladder up to main():
def AEM_uploadFile_4():
    '''
            Purpose: Fourth file for bulk AEM Upload

            Parameters:                 

            Returns:
                
    '''
    # List of suffixes for the paths
    suffixes_3 = [
        "/jcr:content/af-content/background_image_pri/actions/item1",
        "/jcr:content/af-content/background_image_pri/actions/item0",
        "/jcr:content/af-content/background_image_pri/menuActions/item1",
        "/jcr:content/af-content/background_image_pri/menuActions/item0"
    ]
    
    # Creating a dictionary to store the data for the DataFrame - DataFrame columns
    data_dict_3 = {
        "path": [],                # To store the paths based on the dynamic_assets and suffixes = path
        "jcr:primaryType": [],     # Static value = step4_primaryType
        "sling:resourceType": [],  # Static value = step4_resourceType
        "behaviour": [],           # Specific pattern = step4_behaviour
        "feedback": [],            # Specific pattern = step4_feedback
        "type": [],                # Specific pattern = step4_type
        "label": [],               # Specific pattern = step4_label
        "value": [],               # Static value = step4_value
    }
    
    # Content for columns (path is below) - Row values
    step4_primaryType = "nt:unstructured"
    step4_resourceType = ""
    step4_behaviour = ["Dismiss", "Unknown", "Dismiss", "Dismiss"] # Set to "Unknown" - options are [Deeplink, External, Sso, Deeplink, Unknown]
    step4_feedback = ["Remind", "Clicked", "Remind", "Dismiss"]
    step4_type = ["secondary", "primary", "menu", "menu"]
    step4_label = ["Hide", "Claim now", "Yes, hide for a week", "No, not interested"] # ["Claim now", "Use Benefits Finder"]
    step4_value = ["", "cba.commbank.phone://products/detail?product=BenefitsFinderDisclaimer&path=content/api/app/products/orphanpages/NBC.jsoncnt.json", "", ""]
    
    # Looping through the lists to add data to the dictionary - appending values in sequence
    for asset in dynamic_assets:
        for suffix_index, suffix in enumerate(suffixes_3):
            path = "/content/ext/ActivityFeed/Draft/Automation/FWB/" + asset + suffix
            data_dict_3["path"].append(path)
            data_dict_3["jcr:primaryType"].append(step4_primaryType)
            data_dict_3["sling:resourceType"].append(step4_resourceType)
            data_dict_3["behaviour"].append(step4_behaviour[suffix_index])
            data_dict_3["feedback"].append(step4_feedback[suffix_index])
            data_dict_3["type"].append(step4_type[suffix_index])
            data_dict_3["label"].append(step4_label[suffix_index])
            data_dict_3["value"].append(step4_value[suffix_index])
    
    # Creating the DataFrame
    df4 = pd.DataFrame(data_dict_3)
    
    # Printing the dataframe, the columns are weird though.. I don't know how to fix it
    print(df4)

# Calling the function
AEM_uploadFile_4()

# =======================

# Exporting Files to Excel

def Export_AEM_links():
    NBC_AEM_Links.to_excel("AEM_Links_"+nbc+date_time+".csv", index=False)

def Export_excel():
    df1.to_excel("AEM_Upload_Step1_"+nbc+date_time+".csv", index=False)
    df2.to_excel("AEM_Upload_Step2_"+nbc+date_time+".csv", index=False)
    df3.to_excel("AEM_Upload_Step3_"+nbc+date_time+".csv", index=False)
    df4.to_excel("AEM_Upload_Step4_"+nbc+date_time+".csv", index=False)

Export_excel():

# ======================

def DJOM_PR():
    pr = {
    "NBC_name": [nbc],
    "Segment": [segment],
    "Headline": [headline],
    "Body": [body],
    "Card_type": ["BackgroundImagePrimaryAction"],
    "Menu_actions_tab": ["Exp","1OAA",],
    "Actions_tab": ["Exp","1OAA",],
    "AEM_BIDS": "CEE-"+AI+"-"+FWB+"-"+NA+"-"+BenefitsFinderGeneric+"-"+CAHB+"-"+YUS0PER,
    "AEM_links": "CA-CEE/"+NA+CEE-AI-FWB-NA-BenefitsFinderGeneric+"-"+CAHB+YUS0PER+".af.json",
    "Imagery_path": "https://author.digital.aem.cba/siteadmin#/content/dam/commbank-assets/app/"+location+"/"+FWB,
    "Imagery_live": "https://www.commbank.com.au/content/dam/commbank-assets/app/hero-banner/X15/Image_9.jpg",
    "AEM_editor_draft": "https://author.digital.aem.cba/editor.html/content/ext/ActivityFeed/Draft/CA-CEE/"+FWB/CEE-AI-FWB-NA-BenefitsFinderGeneric-CAHB-MUR7PER+".html",
    "AEM_editor_prod": "https://author.digital.aem.cba/editor.html/content/ext/ActivityFeed/LiveCopy/CA-CEE/"+FWB/CEE-AI-FWB-NA-BenefitsFinderGeneric-CAHB-MUR7PER+".html",
    "AEM_json_draft": "https://www.commbank.com.au/content/ext/ActivityFeed/Draft/CA-CEE/"+NA+"/"+CEE+"-"+AI+"-"+FWB+"-"+NA+"-"+BenefitsFinderGeneric+"-"+CAHB+segment+".af.json",
    "AEM_json_prod": "https://www.commbank.com.au/content/ext/ActivityFeed/LiveCopy/CA-CEE/"+NA+"/"+CEE+"-"+AI+"-"+FWB+"-"+NA+"-"+BenefitsFinderGeneric+"-"+CAHB+segment+".af.json",
    "VAR_DATA_1": VAR_DATA_1,
    "VAR_DATA_2": VAR_DATA_2,
    "VAR_DATA_3": VAR_DATA_3,
    "VAR_DATA_4": VAR_DATA_4,
    "VAR_DATA_5": VAR_DATA_5,
    "VAR_DATA_6": VAR_DATA_6,
    "VAR_DATA_7": VAR_DATA_7,
    "VAR_DATA_8": VAR_DATA_8,
    "VAR_DATA_9": VAR_DATA_9,
    "VAR_DATA_10": VAR_DATA_10,
    "VAR_DATA_11": VAR_DATA_11,
    "VAR_DATA_12": VAR_DATA_12,
    "VAR_DATA_13": VAR_DATA_13,
    "VAR_DATA_14": VAR_DATA_14,
    "VAR_DATA_15": VAR_DATA_15,
    "VAR_DATA_16": VAR_DATA_16,
    "VAR_DATA_17": VAR_DATA_17,
    "VAR_DATA_18": VAR_DATA_18,
    "VAR_DATA_19": VAR_DATA_19,
    "VAR_DATA_20": VAR_DATA_20,
    }
    df5 = pd.DataFrame(pr)
    print(df5)
    df5.to_excel("Peer_review_spreadsheet-"+nbc+date_time+".csv", index=False)

DJOM_PR()
