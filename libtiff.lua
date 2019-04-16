-- scaffold geniefile for libtiff

libtiff_script = path.getabsolute(path.getdirectory(_SCRIPT))
libtiff_root = path.join(libtiff_script, "libtiff")

libtiff_includedirs = {
	path.join(libtiff_script, "config"),
	libtiff_root,
}

libtiff_libdirs = {}
libtiff_links = {}
libtiff_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libtiff_includedirs }
	end,

	_add_defines = function()
		defines { libtiff_defines }
	end,

	_add_libdirs = function()
		libdirs { libtiff_libdirs }
	end,

	_add_external_links = function()
		links { libtiff_links }
	end,

	_add_self_links = function()
		links { "libtiff" }
	end,

	_create_projects = function()

project "libtiff"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libtiff_includedirs,
	}

	defines {}

	files {
		path.join(libtiff_script, "config", "**.h"),
		path.join(libtiff_root, "**.h"),
		path.join(libtiff_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
