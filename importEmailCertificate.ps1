Expand-Archive -Path C:\Users\$env:UserName\Downloads\certificate-root-ca.zip -DestinationPath C:\Users\$env:UserName\Downloads\ -Force
Import-Certificate -FilePath "C:\Users\$env:UserName\Downloads\certificate-root-ca.crt" -CertStoreLocation Cert:\CurrentUser\Root
$mypwd = Get-Credential -UserName $env:UserName -Message 'Enter certificate password below'
Set-Location -Path "C:\Users\$env:UserName\Downloads"
$file = Get-ChildItem $dir -File '*.p12'
Import-PfxCertificate -FilePath $file -CertStoreLocation Cert:\CurrentUser\My -Password $mypwd.Password