If you compile Python from source, you must have the lzma-dev package installed, or it will not be built into python.

For ubuntu: `sudo apt-get install liblzma-dev` 

[Multiple python versions on Ubuntu][1]
[Using Python from WSL in VSCode][2]
[Encounter lsb_release issue?][3]

# SSH
To use SSH from windows
1. Install keychain `sudo apt-get install keychain`
2. Append to your `~/.bash_profile`: 
```
/usr/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh
```
or use the location of your SSH on Windows `/mnt/c/Users/<username>/.ssh/id_rsa`

I wasn't able to make the `.ssh/config` to work, so if you know how, please let me know.

[More ways to enable SSH in WSL][4]

[1]: https://hackersandslackers.com/multiple-versions-python-ubuntu/
[2]: https://docs.microsoft.com/en-us/windows/python/web-frameworks
[3]: https://stackoverflow.com/questions/44967202/pip-is-showing-error-lsb-release-a-returned-non-zero-exit-status-1
[4]: https://pscheit.medium.com/use-an-ssh-agent-in-wsl-with-your-ssh-setup-in-windows-10-41756755993e