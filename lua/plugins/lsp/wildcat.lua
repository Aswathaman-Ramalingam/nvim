-- Wildcat plugin configuration
-- Java build tool integration

return {
    {
        'javiorfo/nvim-wildcat',
        lazy = true,
        cmd = { "WildcatBuild", "WildcatRun", "WildcatUp", "WildcatServer" },
        dependencies = { 'javiorfo/nvim-popcorn', 'javiorfo/nvim-spinetta' },
        build = function()
            require 'wildcat.build'.build()
        end,
        opts = {
            default_server = "tomcat",
            build_tool = "maven",
        }
    }
}
