#!/usr/bin/bash 
iot_hub_name="iot-prod-evoy-235c5e66"
deployment_name_without_version="cd-iot-edge-2_0_2"
existingDeployment=$(az iot edge deployment list --hub-name $iot_hub_name --query "reverse(sort_by([?systemMetrics.results.appliedCount ==\`0\` && starts_with(id,'$deployment_name_without_version')].{id:id, created:createdTimeUtc}, &created))[0].id" --output tsv)

echo "$existingDeployment"