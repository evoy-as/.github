<!-- start title -->

# GitHub Action: IotEdgeManifestDeploy

<!-- end title -->
<!-- start description -->

Deploy IoT Edge manifest

<!-- end description -->
<!-- start contents -->
<!-- end contents -->
<!-- start usage -->

```yaml
- uses: evoy/.github@main
  with:
    # service principal in json format
    azure_rbac_credentials: ""

    sem_ver: ""

    # Image url
    image: ""

    # Default: edge-deployment.json
    edge_deployment_fileName: ""

    # IoT Hub target device condition
    # Default: tags.notset='true'
    target_condition: ""

    # IoT Hub deployment priority
    # Default: 3
    priority: ""

    # prefix to use for deployment name
    # Default: ci
    deployment_name_prefix: ""

    # Default: ${{ github.event.repository.name }}
    deployment_name: ""
```

<!-- end usage -->
<!-- start inputs -->

| **Input**                      | **Description**                   | **Default**                           | **Required** |
| ------------------------------ | --------------------------------- | ------------------------------------- | ------------ |
| **`azure_rbac_credentials`**   | service principal in json format  |                                       | **true**     |
| **`sem_ver`**                  |                                   |                                       | **true**     |
| **`image`**                    | Image url                         |                                       | **true**     |
| **`edge_deployment_fileName`** |                                   | `edge-deployment.json`                | **false**    |
| **`target_condition`**         | IoT Hub target device condition   | `tags.notset='true'`                  | **true**     |
| **`priority`**                 | IoT Hub deployment priority       | `3`                                   | **false**    |
| **`deployment_name_prefix`**   | prefix to use for deployment name | `ci`                                  | **false**    |
| **`deployment_name`**          |                                   | `${{ github.event.repository.name }}` | **false**    |

<!-- end inputs -->
<!-- start outputs -->
<!-- end outputs -->
<!-- start [.github/ghadocs/examples/] -->
<!-- end [.github/ghadocs/examples/] -->
