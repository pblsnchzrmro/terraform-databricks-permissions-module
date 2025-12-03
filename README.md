# terraform-databricks-permissions-module

## Development Setup

This project uses pre-commit hooks to ensure code quality and enforce commit message standards for semantic versioning.

### Prerequisites

Install pre-commit framework:

```bash
pip install pre-commit
```

### Initial Setup

After cloning the repository, install the git hooks:

```bash
# Install general pre-commit hooks (terraform formatting, validation, etc.)
pre-commit install

# Install commit message validation hook (required for semantic release)
pre-commit install --hook-type commit-msg
```

**Why two installation commands?**

Git supports different types of hooks that run at different stages:
- `pre-commit install` → Installs hooks that run **before** creating a commit (e.g., code formatting, linting)
- `pre-commit install --hook-type commit-msg` → Installs hooks that run **after** writing the commit message to validate its format

Both are required for this project to work correctly.

### Commit Message Format

This project follows [Conventional Commits](https://www.conventionalcommits.org/) specification for automated semantic versioning:

```
<type>(<scope>): <subject>

[optional body]

[optional footer]
```

**Allowed types:**
- `feat`: New feature (triggers minor version bump)
- `fix`: Bug fix (triggers patch version bump)
- `docs`: Documentation changes
- `style`: Code style changes (formatting, whitespace)
- `refactor`: Code refactoring without functionality changes
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `build`: Build system or dependency changes
- `ci`: CI/CD configuration changes
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverting a previous commit

**Examples:**
```bash
git commit -m "feat(storage): add firewall IP whitelist support"
git commit -m "fix(workspace): correct metastore assignment"
git commit -m "docs: update README with pre-commit instructions"
```

❌ **This will be rejected:**
```bash
git commit -m "updated files"
git commit -m "fix stuff"
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | >= 1.80 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | >= 1.80 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_grants.catalog_permissions](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |
| [databricks_grants.schema_permissions](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |
| [databricks_grants.table_permissions](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Permissions configuration from YAML file | `any` | n/a | yes |
| <a name="input_databricks_workspace"></a> [databricks\_workspace](#input\_databricks\_workspace) | Databricks workspace URL | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->