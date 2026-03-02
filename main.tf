

# Get existing organization
data "aws_organizations_organization" "org" {}

# Security OU
resource "aws_organizations_organizational_unit" "security" {
  name      = "Security-OU"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

# Sandbox OU
resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox-OU"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

# Dev OU
resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev-OU"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

# Prod OU
resource "aws_organizations_organizational_unit" "prod" {
  name      = "Prod-OU"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}
# Dummy OU
resource "aws_organizations_organizational_unit" "dummy" {
  name      = "Dummy-OU"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}
# Log Archive Account
resource "aws_organizations_account" "log_archive" {
  name      = "Log-Archive-Account"
  email     = "aakarsha.cloud+log@gmail.com"
  parent_id = aws_organizations_organizational_unit.security.id
}

# Audit Account
resource "aws_organizations_account" "audit" {
  name      = "Audit-Account"
  email     = "aakarsha.cloud+audit@gmail.com"
  parent_id = aws_organizations_organizational_unit.security.id
}

