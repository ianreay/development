@echo off
echo "Installing chocolaty infrastructure"
call chocolaty.cmd
echo "Installing the vim environment"
call vim.cmd
echo "Installing version control environments"
call version-control.cmd
echo "Installing virtualization environment"
call virtual-machines.cmd
