[Wiki](https://github.com/asledgehammer/PipeWrench/wiki) | [PZPW](https://github.com/Konijima/pzpw) | [Compiler](https://github.com/Konijima/pzpw-compiler)
This repo was create bases on [Konijima template](https://github.com/Konijima/pzpw-template).
|---|---|---|

<br>

# RecipeTweaks

## Description
This mod add api for adding alternatives to source item in recipes. Api is primarily for mod creators.
The main reason I created this api is because I found an item from one mod, but I couldn't use it in a recipe from another mod.
It is similar to [item tweaker](https://steamcommunity.com/sharedfiles/filedetails/?id=566115016&searchtext=item+tweaker) but for recipes.
Mod was written in Typescript and compiled into Lua using PipeWrench and TypescriptToLua projects. 

## How to Use RecipeTweaks:
- make sure that recipeapi is near start of mod order. 
- code
```lua
if getActivatedMods():contains("recipetweaks") then
    -- Import RecipeTweaks API
    local ____RecipeAPi = require("recipetweaks/api/RecipeAPi")

    -- Use the API functions to add tweaks to recipes
    -- (Example tweaks are provided in the code in example mod)
    local AddTweakAllRecipe = ____RecipeAPi.AddTweakAllRecipe
    local CreateRecipeSourceChanges = ____RecipeAPi.CreateRecipeSourceChanges
    
    -- Add your custom changes here
    -- Example: Add alternative item to all recipes with Base.Needle
    AddTweakAllRecipe(CreateRecipeSourceChanges("Base.Needle", { "Hydrocraft.HCBoneneedle" }))

    -- Example: Add Hydrocraft.HCTincan as an alternative to Base.TinCanEmpty
    AddTweakAllRecipe(CreateRecipeSourceChanges("Base.TinCanEmpty", { "Hydrocraft.HCTincan" }))

    -- Example: Reverse the alternative, adding Base.TinCanEmpty as an alternative to Hydrocraft.HCTincan
    AddTweakAllRecipe(CreateRecipeSourceChanges("Hydrocraft.HCTincan", { "Base.TinCanEmpty" }))
end
```
- mode in [example file](./src/recipeteaksexample/client/recipeteaksexample/recipetest.lua)
## Repo  
Mod ID: recipetweaks
Workshop ID: 

## NPM Scripts:
- `npm install` Install dependencies.
- `npm run install-compiler`: Get instruction to install the compiler.
- `npm run update-compiler`: Update the compiler.
- `npm run compile-mods`: Compile your project individual mods.
- `npm run compile-workshop`: Compile your project for workshop.
- `npm run clean-all`: Clean your project and cachedir generated content.
- `npm run clean-project`: Clean your project generated content.
- `npm run clean-cachedir-mods`: Clean your cachedir generated mod directories.
- `npm run clean-cachedir-workshop`: Clean your cachedir generated workshop directory.

## How to use temaplate
1) npm install -g pzpw // https://github.com/Konijima/pzpw
2) pzpw new modId modName author
4) cd modId
5) npm install  pzpw-compiler // -g without for me
6) npm install typescript@5.0.4 --save // problem with new version ...
7) npm run compile-mods
