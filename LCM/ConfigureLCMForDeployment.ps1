Configuration ConfigureLCMForDeployment
{
    Node $AllNodes.NodeName
    {
        LocalConfigurationManager
        {
            CertificateId      = $Node.Thumbprint
            ConfigurationMode  = "ApplyAndMonitor"
            RebootNodeIfNeeded = $true
        }
    }
}

###Compiles the example
ConfigureLCMForDeployment -ConfigurationData 'C:\Users\LabAdmin.IACDEMO.001\Documents\GitHub\Infra-As-Code-Symposium\Settings\ExchangeSettings-Prod.psd1'

###Sets up LCM on target computers to decrypt credentials, and to allow reboot during resource execution
Set-DscLocalConfigurationManager -Path .\ConfigureLCMForDeployment -Verbose -ComputerName IACDEMOEX01
