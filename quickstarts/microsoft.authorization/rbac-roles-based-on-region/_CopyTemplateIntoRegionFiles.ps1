#Testing creating the .json file in script. Doesn't work very well and have to clean too much.
#foreach($loc in $l|Select-Object Location) {New-Item -Path (".\" + $loc.Location + ".json") -ItemType File;Add-Content -Path (".\" + $loc.Location + ".json") -Value  "{'`$schema':'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#','contentVersion':'1.0.0.0','parameters':{},'variables':{},'resources':[{'type':'Microsoft.Authorization/roleAssignments','apiVersion':'2020-04-01-preview','name':'[guid(resourceGroup().id)]','properties':{'roleDefinitionId':'[resourceId('Microsoft.Authorization/roleDefinitions', '')]','principalId':'','scope':'[resourceGroup().id]'}}],'outputs':{'Loc1':{'type':'string','value':'[resourceGroup().location]'}}}"}

# 1. Use the linked template file called "_rbac_template.json", put the resources you want in it and just copy it.

# 2. Create a linked template file for each Azure region
$l=Get-AzLocation
foreach($loc in $l|Select-Object Location){Copy-Item -Path (".\_rbac_template.json") -Destination (".\" + $loc.Location + ".json")}

# 3. Edit each region's linked template with different roleDefinitionId and principalId per region.