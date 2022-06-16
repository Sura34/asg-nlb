# Infrastructure as Code to create and Maintain NSG and NLB

This repository contains the config-as-code to create and maintain the NSG and NLB. 

```bash
# generated using `tree -d`
.
$ tree -d

.
├── Auto-scaling
│   └── terragrunt.hcl
├── NLB
│   └── terragrunt.hcl
├── README.md
├── TF-modules
│   ├── Auto-scaling
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── NLB
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
└── terragrunt.hcl
            

## Usage

### Prerequisites:
- [terraform](https://terraform.io)
- [terragrunt](https://terragrunt.io)

### Terraform backend

 ```bash
 $ cd Auto-scaling
 $ terragrunt apply --auto-approve
````
`

 ```bash
 $ cd NLB
 $ terragrunt apply --auto-approve
````
`


