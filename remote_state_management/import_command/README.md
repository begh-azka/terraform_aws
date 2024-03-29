# Terraform Import
[Import](https://www.cloudbolt.io/terraform-best-practices/terraform-import-example/)

**Scenario:**
- It can happen that all the resources in an organization were created manually.
- Later, the organization decided to migrate to Terraform and manage these resources using IaC.
  
**How will they accomplish this?**

*Through Terraform Import*

**Earlier Approach:**
- In the older versions of Terraform, `import` command would create the state file associated with the resources running in your environment.
- Users still had to write configuration (.tf) files from scratch.

**Now:**
- In the latest versions of Terraform (>=1.5), `import` can automatically create both the state files and the terraform config files for the resources you want to import.
  x However, you need to write a resource config block manually for the resource, to which the imported object will be mapped. x


## Commands
The import block takes two parameters:
1. id → The id of the resource used in your cloud provider
2. to → The resource address that will be used in Terraform

- Put an import block in your config file. 

```sh
import {
  to = aws_security_group.mysg  #resource_name.local_name
  id = "sg-0c35f69038268c64f"   
}
```
**CLI : `terraform import aws_resource.local_name resource.id`**

- Then run:
```sh
terraform plan -generate-config-out=my_sg.tf
```

- This will generate a state file and a config file of that resource.

** In aws_instance import, there is an issue with ipv6. Once you run `terraform plan -generate-config-out=my_instance.tf` command, go to the config file and remove ipv6 fields and then run `terraform plan`. This will successfully let Terraform manage the resource.
