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
    update-database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration -Script -TargetMigration:'Temp'
}

function script-pdv {
    update-database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration -Script -TargetMigration:'Temp'
}

function script-inicial-erp {
		update-database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration -Script -SourceMigration:0
}

function script-inicial-pdv {
	update-database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration -Script -SourceMigration:0
}

function up-erp-force {
		update-database -ConfigurationTypeName VipERP.Data.Migrations.ERP.Configuration -Force
}

function up-pdv-force {
	update-database -ConfigurationTypeName VipERP.Data.Migrations.PDV.Configuration -Force
}

function remove-erp{
    remove-bd 'viperpDevTemp'
}

function remove-pdv{
    remove-bd 'pdvDevTemp'
}

function remove-bd {
    param(
        [string] $database = "viperpDevTemp"
      )

    $connectionString = "SERVER=localhost; " +
            "Database=master; " +
			"User Id=sa;Password=Teste12345"

    $sqlCommand = "DROP DATABASE $database"

    $connection = new-object system.data.SqlClient.SQLConnection($connectionString)
    $command = new-object system.data.sqlclient.sqlcommand($sqlCommand,$connection)
    
    $connection.Open()
    $command.ExecuteNonQuery()
    $connection.Close()
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