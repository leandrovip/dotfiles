function mig-erp
{	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration 'Inicial'
}

function mig-pdv
{	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration 'Inicial'
}

function temp-erp
{	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration 'Temp'
}

function temp-pdv
{	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration 'Temp'
}

function script-erp {
    update-database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration -Script -SourceMigration:'Temp'
}

function script-pdv {
    update-database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration -Script -SourceMigration:'Temp'
}

function script-inicial-erp {
		update-database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration -Script -SourceMigration:0
}

function script-inicial-pdv {
	update-database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration -Script -SourceMigration:0
}

## BACKUP ##

# function bkp-mig-erp
# {
#     [CmdletBinding(DefaultParameterSetName='Name')]
#     Param
#     (
#          [Parameter(Mandatory=$true, Position=0, ParameterSetName='Name')]
#          [string] $Name
#     )
	
# 	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration $Name
# }

# function bkp-mig-pdv
# {
#     [CmdletBinding(DefaultParameterSetName='Name')]
#     Param
#     (
#          [Parameter(Mandatory=$true, Position=0, ParameterSetName='Name')]
#          [string] $Name
#     )
	
# 	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration $Name
# }

# function up-erp {
# 	Update-Database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration
# }

# function up-pdv {
# 	Update-Database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration
# }