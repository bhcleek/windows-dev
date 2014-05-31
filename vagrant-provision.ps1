copy-item \vagrant\Documents\WindowsPowerShell ${USERPROFILE}\Documents -recurse

#copy-item \vagrant\ssh ${USERPROFILE}\.ssh -recurse
#copy-item \vagrant\gitignore ${USERPROFILE}\gitignore

#git config --glboal core.excludesfile "${USERPROFILE}\.gitignore"
git config --global core.eol crlf

new-item ${USERPROFILE}\Documents\develop -type directory
cd ${USERPROFILE}\Documents\develop
git clone git@github.com:bhcleek/vim.git
cmd /c mklink /H ${USERPROFILE}\_vimrc ${USERPROFILE}\Documents\develop\vim\_vimrc
cmd /c mklink /J ${USERPROFILE\_vimfiles ${USERPROFILE}\Documents\develop\vim\vimfiles
