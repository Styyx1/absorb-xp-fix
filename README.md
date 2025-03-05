# absorb-xp-fix

In the vanilla game, concentration spells with the Absorb archetype (such as Vampiric Drain) do not grant experience when used. This SKSE plugin fixes that issue, ensuring that these spells properly contribute to skill progression. Lightweight, efficient, and seamlessly integrated into the game.
It will work with all mod added spells and does not need any patches. 
I was only able to test it quite limited cause not many mods add absorb type concentration spells and from my limited testing, it appears that only concentration spells are affected and other absorb spells grant experience just fine.

### Requirements
* [XMake](https://xmake.io) [2.8.2+]
* C++23 Compiler (MSVC, Clang-CL)

## Getting Started
```bat
git clone https://github.com/Styyx1/absorb-xp-fix --recursive
cd absorb-xp-fix
```

### Build
To build the project, run the following command:
```bat
xmake build
```

> ***Note:*** *This will generate a `build/windows/` directory in the **project's root directory** with the build output.*

### Build Output (Optional)
If you want to redirect the build output, set one of or both of the following environment variables:

- Path to a Skyrim install folder: `XSE_TES5_GAME_PATH`

- Path to a Mod Manager mods folder: `XSE_TES5_MODS_PATH`

### Project Generation (Optional)
If you want to generate a Visual Studio project, run the following command:
```bat
xmake project -k vsxmake
```

> ***Note:*** *This will generate a `vsxmakeXXXX/` directory in the **project's root directory** using the latest version of Visual Studio installed on the system.*

### Upgrading Packages (Optional)
If you want to upgrade the project's dependencies, run the following commands:
```bat
xmake repo --update
xmake require --upgrade
```
