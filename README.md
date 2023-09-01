# az-core-policy

The purpose of the GitHub repository titled 'az-core-policy' is to host the several Azure Policy definitions being deployed in the EITaaS environment to ensure compliance with security requirements/best practices and to collect diagnostic logging information on the resources being deployed by EITaaS.

## How to use

For additional policy set definition and assignment, create a new tfvars file for the policy group and add a step to the workflow to run terraform using that file.

![image](https://user-images.githubusercontent.com/78887014/172240011-18841122-cc86-44ef-a7f3-8e50e7122e6e.png)


## Azure Policy Initiatives

[Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview) is a versatile tool used to enforce organizational standards and assess compliance at scale. Common use cases include implementing governance for resource consistency, regulatory compliance, security, cost, and management. Compliance can be easily assessed from within the project's Azure portal destination so that any necessary remediation planning can begin as quickly as possible. From the Portal, search 'Policy', and select the initiative (aka policySet) you want to evaluate.

### Governance

This policy initiative reflects an effort by the EITaaS development team to apply enhanced control over the resources deployed within our environment by establishing settings that are not directly tied to Accreditation/ATO efforts. Under this intiative, an administrator will find various custom policy definitions applied against compute, storage, networking, and app service resources. For example, an administrator will find definitions ranging from setting the 'allowed size' SKUs for VMs to denying public network access to Azure Data Factory.

NOTE: In this initiative, you will also find Azure Policy which controls the deployment of individual 'approved' resource types in a deny-by-default, approve-by-exception fashion. For information on how to request changes to resource types or VM sizes, see the [onboarding](https://github.com/ArmyEITaaS/onboarding) repo of this project.

#### Operational Risk and Cybersecurity Approach (ORCA)

The 'Governance' policy initiative also contains a subset of the security controls required for implementation by the customer under which are commonly refered to as 'ORCA Controls' e.g. Operational Risk and Cybersecurity Approach. Originally generated in Phase 2, the list of EITaaS ORCA controls provided by Accreditation partners are based on the Cybersecurity Maturity Model Certification (CMMC). The subset of policy definitions found in this repository and under this initiative are those which are relevant to the LOE 1.3 Compute & Store workstream alone. Throughout Phase 3 (Implementation) the list of security controls that the LOE 1.3 workstream was directed to solution in support of the broader pursuit of ATO has been validated on multiple occasions for accuracy and completeness by Cross-LOE points of contact as well as other Accreditation partners to this project. A complete list of _all_ ORCA controls required by _all_ LOEs can be found in the Teams Cross-LOE > Accreditation folder.

Control requirements were thoroughly analyzed by contracted Information Assurance (IA) staff and determined to be attainable through policy definitions found under several existing [Azure Blueprints](https://docs.microsoft.com/en-us/azure/governance/blueprints/overview) including those for FedRAMP High, NIST 800-53 Rev4, and NIST 800-171 Rev2. Several controls were also mapped directly to pre-existing Microsoft Managed Controls (MMCs), thereby removing requirements for further code development to satisfy them. Note that a given control statement may have multiple policy definitions supporting its fulfillment. Mapping of control requirements to policy definitions was performed in the following manner...

After analyzing control Access Control (AC) 1.001 for relevance to LOE 1.3, the requirement to 'Limit information system access to authorized users, processes acting on behalf of authorized users, or devices (including other information systems) was found to be derived from prevailing industry publications such as NIST SPs. NIST 800-53 Rev4 has already mapped AC 1.001 to supporting tasks under AC-2 (Account Management), AC-3 (Access Enforcement), and AC-17 (Remote Access). IA personnel then cross-examined these 3x supporting tasks with existing Microsoft [policy blueprint technical documentation](https://docs.microsoft.com/en-us/azure/governance/policy/samples/nist-sp-800-53-r4) to trace policy definitions that will satisfy the larger control requirement.

![Blueprint Example](https://user-images.githubusercontent.com/78887014/115052414-8a2d1400-9ea3-11eb-945e-0cb99f3e7ecc.png)

### Monitoring

This policy initiative reflects a cross-team effort between Automation and Collaborative Data Environment (CDE) developers to collect log information from C&S resources by [enabling monitoring (Diagnostic Settings) on said resources via Azure Policy](https://docs.microsoft.com/en-us/azure/azure-monitor/deploy-scale) - allowing you to automatically replicate the same settings each time you create a given resource _type_. These custom policy definitions, derived from [TyConsulting](https://github.com/tyconsulting/azurepolicy/tree/master/policy-definitions/resource-diagnostics-settings), route the defined resource type logs to both Log Analytics and the appropriate Storage Account.

* Log Analytics Workspace (LAW): Sending logs and metrics to a Log Analytics workspace allows you to analyze them with other monitoring data collected by Azure Monitor using log queries, alerts, and visualizations.

* Storage Account (SA): Archiving logs and metrics to an SA is useful for audit, static analysis, or backup. Logs can be kept in an SA indefinitely.

* Environment Variables, to include the LAW and SA to which the Monitoring Initiative diagnostic settings data are sent, can be found in the .yml files of this repo's path: az-core-policy/.github/workflows

#### VM Monitoring

![image](https://user-images.githubusercontent.com/78887014/172240206-3e72452a-4e7d-48d7-adfb-5e7fa5ee25c9.png)

This policy set reflects a bifurcation from the above 'Monitoring' initiative in that it is oriented towards collecting log data specifically from VMs built from _custom_ images. Through the installation of the [Log Analytics Agent](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/agents-overview#dependency-agent) and [Dependency Agent](https://docs.microsoft.com/en-us/azure/azure-monitor/agents/agents-overview#dependency-agent) via Azure Policy, [VM Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-overview) is enabled which allows users to view aggregated performance metrics on multiple VMs at once. This method ensures that existing and new VMs have required dependencies properly configured and installed. Noncompliant VMs and Scale Sets can be reported on to inform decisions to exclude, enable, or remediate outliers.

  * Log Analytics Agent: Collects VM events and performance data and delivers it to the Log Analytics Workspace. This agent is deployed using the VM Extensions for [Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/oms-windows) and [Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-dependency-linux). These extensions not only install the Log Analytics agent, but also enrolls VMs into an existing Log Analytics Workspace.
  * Dependency Agent: Collects discovered data about processes running on VMs and external process dependencies. This agent also is deployed using VM Extensions for [Windows](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-dependency-windows) and [Linux](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/agent-dependency-linux).

VM Insights, enacted through Azure Policy, monitors key [OS KPIs](https://docs.microsoft.com/en-us/azure/azure-monitor/vm/vminsights-performance). While policy definition compliance can be viewed through the Azure Portal, the performance metrics defined within can also be viewed through Azure Monitor or directly on the VM itself.

# Data Collection Rules

Azure Monitor data collection rules can be used to collect multiple types of logs or performance counters and send them to one or more Azure log analytics workspaces after associating the data collection rule with a VM scope. Each data collection rule can be associated with multiple VM scopes and each VM can be associated to multiple data collection rules.

## Windows Security Event Logs

Unlike the application and system logs, Windows security event logs pulled from the Azure portal use a numeric keyword to reference specific types of security logs. Each rule we use for security should be mentioned below with what kind of security logs it collects.

### Audit Success/Failure

```txt
"Security!*[System[(band(Keywords,13510798882111488))]]"
```
