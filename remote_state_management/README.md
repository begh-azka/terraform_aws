# State Management

## Terraform and gitignore
- Depending on the environments, it is recommended to avoid committing certain files to git. Below files should be mentioned in .gitignore and not committed to your source code.
  
|  No.  |Files to Ignore    |            Description                                                      |
| ----- |------------------ | --------------------------------------------------------------------------- |
|   1   | .terraform        | This file will be recreated when terraform init is run.                     |
|   2   | terraform.tfvars  | Likely to contain sensitive data like usernames and passwords and secrets.  |
|   3   | terraform.tfstate | Should be stored on the remote side.                                        |
|   4   | crash.log         | If terraform crashes, the logs are stored in a file named crash.log         |

## Terraform State Management
- As your Terraform usage becomes more advanced, there are some cases where you might need to modify the terraform state.
- Rather than modify the state directly, the terraform state commands can be used in many cases instead.
- There are multiple sub-commands that can be used with terraform state, these include:

|  No.  | State Sub-Command  |            Description                                      |
| ----- | ------------------ | ----------------------------------------------------------- |
|   1   |      list          |  List resources in the state                                |
|   2   |      mv            |  Move an item in the state                                  |
|   3   |      pull          |  Pull current state and output to stdout                    |
|   4   |      push          |  Update remote state from a local state file                |
|   5   |      rm            |  Replace provider in the state                              |
|   6   |      show          |  Show a resource in the state                               |

1. **list:**
- It lists resources within a Terraform state.
```sh
% terraform state list
aws_iam_user.lb
```
2. **mv:** 
- The terraform state mv command is used to move items in a terraform state.
- This command is used in many cases in which you want to rename an existing resource without destroying and recreating it.
- Due to the destructive nature of this command, it will output a backup copy of the state prior to saving any changes.
  
`terraform state [options] SOURCE DESTINATION`

```sh
% terraform state mv aws_instance.myec2 aws_instance.inst3
Move "aws_instance.myec2" to "aws_instance.inst3"
Successfully moved 1 object(s).
```
3. **pull:**
- The terraform state pull command is used to manually download and output the state from remote state.
- This is useful for reading values out of state (potentially pairing this command with something like jq)
`% terraform state pull`

4. **push:**
- The terraform state push command is used to manually upload a local state file to remote state.
- This command should be used rarely.

5. **remove:**
- The terraform state rm command is used to remove items from the terraform state.
- Items removed from the state are not physically destroyed.
- Items removed from the Terraform state are no longer managed by Terraform.
- For example, if you remove an AWS instance from the state, the AWS instance will continue running, but terraform plan will no longer see that instance.
```sh
% terraform state rm aws_instance.inst3
Removed aws_instance.inst3
Successfully removed 1 resource instance(s).
```

6. **show:**
- It shows all the attributes of a single resource in the Terraform state.
```sh
% terraform state show aws_iam_user.lb
# aws_iam_user.lb:
resource "aws_iam_user" "lb" {
    arn           = "arn:aws:iam::674583976178:user/system/loadbalancer"
    force_destroy = false
    id            = "loadbalancer"
    name          = "loadbalancer"
    path          = "/system/"
    tags_all      = {}
    unique_id     = "AIDAZ2ECWTDZG7FVPAKWS"
}
```
# Terraform Remote State
- **terraform_remote_state** is a data source that can be used to fetch details from the remote state file directly.
- This is useful when you need to reference the outputs of configurations that are stored in different state files.
- When an output block is defined in your configuration, the contents are included in the state file. These details can then be referenced elsewhere in your project
