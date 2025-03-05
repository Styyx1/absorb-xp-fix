-- set minimum xmake version
set_xmakever("2.8.2")

-- includes
includes("lib/commonlibsse")

-- set project
set_project("absorb-xp-fix")
set_version("1.1.0")
set_license("GPL-3.0")

-- set defaults
set_languages("c++23")
set_warnings("allextra")
set_defaultmode("releasedbg")

-- add rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- set policies
set_policy("package.requires_lock", true)

-- add requirements 
add_requires("spdlog", { configs = { header_only = false } })

-- set configs
set_config("skyrim_ae", true)

-- targets
target("absorb-xp-fix")
    -- add dependencies to target
    add_deps("commonlibsse")
    add_packages("fmt", "spdlog")
    -- changes build location based on the game version
     if has_config("skyrim_ae") then
        set_targetdir("/build/SkyrimAE/skse/plugins")
    else
        set_targetdir("/build/SkyrimSE/skse/plugins")
    end  

    -- add commonlibsse plugin
    add_rules("commonlibsse.plugin", {
        name = "absorb-xp-fix",
        author = "styyx",
        description = "fixes absorb spells not granting any experience"
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src")
    set_pcxxheader("src/pch.h")

-- copy to MO2
after_build(function(target)
    local copy = function(env, ext)
        for _, env in pairs(env:split(";")) do
            if os.exists(env) then
                local plugins = path.join(env, ext, "SKSE/Plugins")
                os.mkdir(plugins)
                os.trycp(target:targetfile(), plugins)
                os.trycp(target:symbolfile(), plugins)
            end
        end
    end
    if os.getenv("XSE_TES5_MODS_PATH") then
        copy(os.getenv("XSE_TES5_MODS_PATH"), target:name())
    elseif os.getenv("XSE_TES5_GAME_PATH") then
        copy(os.getenv("XSE_TES5_GAME_PATH"), "Data")
    end
end)