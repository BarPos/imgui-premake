project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin/tmp/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.h",
        "*.cpp",
        "misc/**.h",
        "misc/**.cpp"
	}

    includedirs {
        "%{IncludeDir.imgui}",
        "%{IncludeDir.glfw}",
        "%{IncludeDir.VulkanSDK}"
    }

    links {
        "GLFW",
        "opengl32.lib",
        "%{Library.Vulkan}",
        "%{Library.VulkanUtils}"
    }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
