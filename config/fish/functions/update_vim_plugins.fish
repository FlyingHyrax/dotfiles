function update_vim_plugins
    env SHELL=(which bash) vim +PluginInstall! +PluginClean
end
