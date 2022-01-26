# AzureRBAC BasedOnRegion
> A group of Azure ARM .json templates and a bit of script to implement role assignments based on the Azure region where a resource group is deployed.

## Overview
_CopyTemplateIntoRegionFiles.ps1 has the steps to edit and deploy these ARM templates.
After the templates are created, the roleDefinitionId guid for the role and the principalId needs to be updated with wanted RBAC role assignment for each region .json file needed. Guids for the roles and principals can be found in Azure Active Directory.
Create an Azure Blueprint definition and add the resource group artifact. Under the resource group artifact add the ARM template artifact and point to the _main.json file. The other regional .json files need to be copied to an anonymously accessible HTTP/s location. The URL needs to be updated in the _main.json template.

### Steps
	1. Create .json templates for each region with RBAC principals.
		a. Edit _rbac_template.json and copy into each regions .json file using _CopyTemplateIntoRegionFiles.ps1.
		The folder will now have a .json tempalte file for each Azure region.
		b. Update the roleDefinitionId and principalId for each region with the RBAC needed. Get the role and principal IDs from AAD.
	2. Copy to open HTTP location.
	3. Create ARM template for Blueprint from master, update with URL of location.
	4. Create Blueprint template with ARM artifact.
	5. Publish Blueprint.
    6. Assign Blueprint.