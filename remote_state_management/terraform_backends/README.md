# Terraform Backend
### Challenges with storing state files on local

- Nowadays, Terraform project is handled and collaborated on by an entire team. Storing the state file in the local laptop will not allow collaboration.
- So, there is a need of centralizing it. It is done in the following ways:
   1. The terraform code is stored in a git repository.
   2. The state file is stored in a central backend.

![image](https://github.com/begh-azka/terraform_aws/assets/97597065/979ce919-dec6-4ff4-a7d2-0ebee255fd74)

- **Terraform Backend** is a configuration option in Terraform that allows you to store and manage the state of your infrastructure in a remote or local location.
- The backend is responsible for storing the state file and providing an interface for reading and writing state data.
- When you run Terraform, it checks the backend to see if there are any changes to the state file, and if there are, it applies those changes to your infrastructure.
Types:
  1. **Local Backend:** A local backend stores the state file on the machine where Terraform is running. By default, Terraform implicitly uses a backend called local to store state as a local file on disk `terraform.tfstate`.
  2. **Remote Backend:** A remote backend stores the state file in a centralized location, such as a cloud object storage service or a database. Remote backends provide several benefits, such as enabling collaboration between team members, versioning state files, and providing a history of changes. There are several remote backend providers available, such as Amazon S3, Azure Storage, Google Cloud Storage, and HashiCorp Consul.
  
- Backends supported in Terraform are: S3, Consul, Azurerm, Kubernetes, HTTP, ETCD, artifactory.
- Accessing state in a remote service generally requires some kind of access credentials.
- Some backends act like plain "remote disks" for state files; **others support locking the state while operations are being performed, which helps prevent conflicts and inconsistencies**.
