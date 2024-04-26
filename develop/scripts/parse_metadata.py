import os
import yaml
import pandas as pd
import numpy as np
from datetime import datetime

# Function to recursively fetch metadata.yml files
def get_metadata(folder_path):
    metadata_list = []
    
    # Recursively search for metadata.yml files
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file == 'metadata.yml':
                file_path = os.path.join(root, file)
                # Load YAML file and append the metadata to the list
                with open(file_path, 'r') as f:
                    metadata = yaml.safe_load(f)
                    metadata_list.append(metadata)
                    
    return metadata_list

# Specify the folder path
folder_path = '/path/to/your/folder'

# Fetch metadata from the specified folder
metadata = get_metadata(folder_path)

# Convert metadata to a pandas DataFrame
metadata_df = pd.DataFrame(metadata)

# Specify the output file name using current date
output_file = f"database_{datetime.now().strftime('%Y%m%d')}.tsv"

# Save the DataFrame as a TSV file
metadata_df.to_csv(output_file, sep='\t', index=False)

# Print confirmation message
print(f"Database saved as {output_file}")
