@echo off
echo "Installing git"
choco install git

echo Setting git http.proxy to %HTTP_PROXY%
git config --global http.proxy %HTTP_PROXY% 

echo Setting git https.proxy to %HTTPS_PROXY%
git config --global https.proxy %HTTP_PROXY% 

echo "Installing tortoisesvn"
choco install tortoisesvn

echo "Please restart command prompt to have environment changes take effect."
