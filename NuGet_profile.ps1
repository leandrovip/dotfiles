function mig-erp
{
    [CmdletBinding(DefaultParameterSetName='Name')]
    Param
    (
         [Parameter(Mandatory=$true, Position=0, ParameterSetName='Name')]
         [string] $Name
    )
	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration $Name
}

function mig-pdv
{
    [CmdletBinding(DefaultParameterSetName='Name')]
    Param
    (
         [Parameter(Mandatory=$true, Position=0, ParameterSetName='Name')]
         [string] $Name
    )
	
	Add-Migration -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration $Name
}

function up-erp {
	Update-Database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration
}

function up-pdv {
	Update-Database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration
}