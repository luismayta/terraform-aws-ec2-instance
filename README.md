 <!-- Space: TerraformAwsEc2Instance -->
<!-- Title: Project -->

<!--


  ** DO NOT EDIT THIS FILE
  **
  ** 1) Make all changes to `provision/generator/README.yaml`
  ** 2) Run`task readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **


  -->

[![Latest Release](https://img.shields.io/github/release/hadenlabs/terraform-aws-ec2-instance)](https://github.com/hadenlabs/terraform-aws-ec2-instance/releases) [![Lint](https://img.shields.io/github/workflow/status/hadenlabs/terraform-aws-ec2-instance/lint-code)](https://github.com/hadenlabs/terraform-aws-ec2-instance/actions?workflow=lint-code) [![CI](https://img.shields.io/github/workflow/status/hadenlabs/terraform-aws-ec2-instance/ci)](https://github.com/hadenlabs/terraform-aws-ec2-instance/actions?workflow=ci) [![Test](https://img.shields.io/github/workflow/status/hadenlabs/terraform-aws-ec2-instance/test)](https://github.com/hadenlabs/terraform-aws-ec2-instance/actions?workflow=test) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit) [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow)](https://conventionalcommits.org) [![KeepAChangelog](https://img.shields.io/badge/Keep%20A%20Changelog-1.0.0-%23E05735)](https://keepachangelog.com)

# terraform-aws-ec2-instance

terraform-aws-ec2-instance for project

## Requirements

This is a list of plugins that need to be installed previously to enjoy all the goodies of this configuration:

- [Pyenv](https://github.com/pyenv/pyenv)
- [Docker](https://www.docker.com/)
- [python](https://www.python.org)
- [taskfile](https://github.com/go-task/task)

## Usage

```hcl
  module "main" {
    source = "hadenlabs/ec2-instance/aws"
    version = "0.0.0"
  }
```

Full working examples can be found in [examples](./examples) folder.

## Examples

### common

```hcl
  module "main" {
    source  = "hadenlabs/ec2-instance/aws"
    version = "0.0.0"

    providers = {
      aws = aws
    }

    ami            = data.aws_ami.amazon_linux.id

    public_key     = var.public_key
    private_key    = var.private_key
  }
```

### with docker

```hcl

  module "tags" {
    source      = "hadenlabs/tags/null"
    version     = "0.1.1"
    namespace   = var.namespace
    environment = var.environment
    stage       = var.stage
    name        = var.name
    tags        = var.tags
  }

  module "main" {
    source  = "hadenlabs/ec2-instance/aws"
    version = "0.0.0"
    providers = {
      aws = aws
    }

    name           = module.tags.name
    ami            = data.aws_ami.amazon_linux.id
    tags           = module.tags.tags
    enabled_docker = var.enabled_docker
    public_key     = var.public_key
    private_key    = var.private_key
  }
```

 <!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >=3.2.0 |
| <a name="requirement_null"></a> [null](#requirement_null)                | >=0.1.0 |

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)    | >=3.2.0 |
| <a name="provider_null"></a> [null](#provider_null) | >=0.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
| --- | --- |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [null_resource.provision_core](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.provision_docker](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | :-: |
| <a name="input_ami"></a> [ami](#input_ami) | Id of ami of aws | `string` | n/a | yes |
| <a name="input_enabled_docker"></a> [enabled_docker](#input_enabled_docker) | enabled install docker | `bool` | `false` | no |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | type instance | `string` | `"t2.micro"` | no |
| <a name="input_name"></a> [name](#input_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| <a name="input_private_key"></a> [private_key](#input_private_key) | private key | `string` | n/a | yes |
| <a name="input_public_key"></a> [public_key](#input_public_key) | public key | `string` | n/a | yes |
| <a name="input_rule_ingress"></a> [rule_ingress](#input_rule_ingress) | list rule for security group | <pre>list(object({<br> from_port = number<br> to_port = number<br> protocol = string<br> cidr_blocks = list(string)<br> }))</pre> | `[]` | no |
| <a name="input_ssh_port"></a> [ssh_port](#input_ssh_port) | port ssh | `number` | `22` | no |
| <a name="input_ssh_user"></a> [ssh_user](#input_ssh_user) | user ssh | `string` | `"ubuntu"` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name                                                                    | Description           |
| ----------------------------------------------------------------------- | --------------------- |
| <a name="output_aws_key_pair"></a> [aws_key_pair](#output_aws_key_pair) | key_pair of instance. |
| <a name="output_instance"></a> [instance](#output_instance)             | instance instance.    |
| <a name="output_private_ip"></a> [private_ip](#output_private_ip)       | private ip.           |
| <a name="output_public_ip"></a> [public_ip](#output_public_ip)          | public ip.            |

<!-- END_TF_DOCS -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/hadenlabs/terraform-aws-ec2-instance/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/hadenlabs/terraform-aws-ec2-instance/issues) to report any bugs or file feature requests.

### Development

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your own machine
3.  **Commit** changes to your own branch
4.  **Push** your work back up to your fork

5.  Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to rebase the latest changes from "upstream" before making a pull request!

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)](https://semver.org/).

Using the given version number of `MAJOR.MINOR.PATCH`, we apply the following constructs:

1. Use the `MAJOR` version for incompatible changes.
1. Use the `MINOR` version when adding functionality in a backwards compatible manner.
1. Use the `PATCH` version when introducing backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- In the context of initial development, backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- In the context of pre-release, backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## Copyright

Copyright © 2018-2021 [Hadenlabs](https://hadenlabs.com)

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## License

The code and styles are licensed under the LGPL-3.0 license [See project license.](LICENSE).

## Don't forget to 🌟 Star 🌟 the repo if you like terraform-aws-ec2-instance

[Your feedback is appreciated](https://github.com/hadenlabs/terraform-aws-ec2-instance/issues)
