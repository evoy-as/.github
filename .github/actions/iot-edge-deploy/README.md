# GitHub Action for creating an IOT Edge Deployment

The action creates an IoT Edge deployment in a target IoT Hub.

:exclamation: NOTE: If there is an existing deployment in the IoT Hub with an equal deployment name, then the existing deployment will be deleted to avoid duplicates. TODO: add a new parameter (type boolean) to be able to turn this functionality on or off (default to off).

## Usage

```yaml
- uses: evoy-as/.github/.github/actions/iot-edge-deploy@main
  with:
    # Credentials used to authenticate Azure CLI.
    azure-credentials: ""
    # IoT Edge deployment content. Provide file path or raw json.
    # NOTE: The raw json must start and end with an escaped double quote, e.g '"{"modulesContent":{...}}"'.
    content: ./modules_content.json
    # Wether or not this deployment should be layered. Defaults to false.
    layered: true
    # The name of the IoT Hub that the deployment should be created for.
    iot-hub-name: ""
    # The name used for the deployment.
    deployment-name: ""
    # Weight of deployment in case of competing rules (highest wins). Defaults to 0.
    priority: 3
    # Target condition in which an edge deployment applies to. Deployments with no target condition will target no device.
    target-condition: ""
    # IoT hub allows 100 deployment configurations, so we need to delete previous or unused deployements
    # to avoid failed deployments
    # Options 
    # - Update -  use this if existing deployment should be updated instead of creating a new deployment before deleting the previous.
    # - DeletePrevious - use this if previous deployment should be deleted. I.e. deployment is "ci-1_0_2". "ci-1_0_1" will be deleted
    # - DeletePreRelease - use this if pre-releases for current deployment should be deleted. I.e. deployment is "ci-1_0_2". 
    #                       "ci-1_0_2-pull-request_1" will be deleted. "ci-1_0_1" will remain.
    # NOTE: Semver needs to be part of the deployment-name when set to true
    deployment-strategy: false
```

Read more about the different parameters at [az iot edge deployment create](https://learn.microsoft.com/en-us/cli/azure/iot/edge/deployment?view=azure-cli-latest#az-iot-edge-deployment-create)
