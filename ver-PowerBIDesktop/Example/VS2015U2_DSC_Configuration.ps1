Configuration VS2015U2 {
    
    Import-DSCResource -ModuleName cChoco

    Node localhost {
        cChocoPackageInstaller VS2015U2 {
            Name   = 'VS2015U2'
            #Source = 'Packager01'
            Ensure = 'Present'
        }
    }
}

VS2015U2 -OutputPath c:\temp
Start-DscConfiguration -Path c:\temp -Wait -Verbose -Force