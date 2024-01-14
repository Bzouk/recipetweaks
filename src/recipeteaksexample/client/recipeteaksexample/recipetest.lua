if getActivatedMods():contains("recipetweaks") then
    local ____RecipeAPi = require("recipetweaks/api/RecipeAPi")

    --- Changes all recipes, use filter to specifi what recipes to change
    --
    -- @param {RecipeSourceChanges} sourceCountChanges - optinal Object of source change, use CreateRecipeSourceChanges(...)
    -- @param {RecipeResultChanges} resultChanges - Optional. The changes to apply to the recipe results., use CreateResultChanges(...)
    -- @param  {RecipeFilter} filter  - Optional. The filter to apply to the recipes., use CreateFilter(...)
    local AddTweakAllRecipe = ____RecipeAPi.AddTweakAllRecipe

    --- Change only one recipe
    --
    -- @param {string} recipeName - The name of the recipe to add a tweak to.  like "Hydrocraft.Make Tailor's Workbench"
    -- @param {RecipeSourceChanges} sourceCountChanges - Optional. The changes to the recipe's source, use CreateRecipeSourceChanges(...)
    -- @param {RecipeResultChanges} resultChanges - Optional. The changes to the recipe's result, use CreateResultChanges(...)
    -- @param {RecipeFilter} filter - Optional. The filter to apply to the recipe, use CreateFilter(...)
    local AddTweakOneRecipe = ____RecipeAPi.AddTweakOneRecipe

    --- This function creates a recipe filter object based on the provided parameters.
    -- It takes in several optional parameters such as modName, includeRecipeNames, excludeRecipeNames, resultName, and resultCount.
    -- It then creates a RecipeFilter object and assigns values to its properties based on the provided parameters. Finally, it returns the created RecipeFilter object.
    --
    -- @param {string} modName - The name of the mod to filter by like "Hydrcraft".
    -- @param {Array<string>} includeRecipeNames - Optinal. An array of recipe names to include.
    -- @param {Array<string>} excludeRecipeNames - Optinal. An array of recipe names to exclude.
    -- @param {string} resultName - Optinal Name of result to match in recipe like "Hydrocraft.Make Bottle of Juice"
    -- @param {string | number} - Optinal number of result like 3
    -- @return {RecipeFilter} - The created recipe filter object.
    local CreateFilter = ____RecipeAPi.CreateFilter

    --- This function creates a  RecipeSourceChanges object.
    --  It takes several parameters, including sourceItem, which is the name of the item to find in a recipe, and sourcesNewItemsList, which is a list of alternatives to add to sourceItem.
    --  The function also takes optional parameters such as sourceCount, sourceDrainableCount, and whenadd.
    --  The function creates an object called recipeSourceChanges and assigns the value of sourceItem to it.
    --  It then checks if the optional parameters have values and assigns them to the corresponding properties of recipeSourceChanges.
    --  Finally, the function assigns the value of whenadd to the whenadd property of recipeSourceChanges and returns the object.
    --  Overall, this function is used to create an object that represents changes to a recipe source, including adding alternatives and modifying counts.
    --
    -- @param  {string} sourceItem - The source item for the RecipeSourceChanges object. Name of item to find in recipe
    -- @param  {Array<string>} sourcesNewItemsList - Optional. An array of new items for the RecipeSourceChanges object.
    -- @param {string | number} sourceCount - Optional. The count of the source item.
    -- @param {string | number} sourceDrainableCount - Optional. The drainable count of the source item.
    -- @param {WhenAdd} whenadd - Optional. Enum of when to change source.
    -- @return {RecipeSourceChanges} The created RecipeSourceChanges object.
    local CreateRecipeSourceChanges = ____RecipeAPi.CreateRecipeSourceChanges

    --- Creates a RecipeResultChanges object based on the provided result count and result drainable count.
    --
    -- @param {number | string} resultCount - The number of results.
    -- @param {number | string} resultDrainableCount - The number of tDrainable result.
    -- @return {RecipeResultChanges} The created RecipeResultChanges object.
    local CreateResultChanges = ____RecipeAPi.CreateResultChanges

    --- Retrieves a list of items based on a given type tag.
    --
    -- @param {string} typeTag - The type tag to filter the items by.
    -- @return {string[]}  An array of strings representing the full names of the items.
    local GetItemsListByTag = ____RecipeAPi.GetItemsListByTag

    -- enum WhenAdd {
    --     NORULE,
    --     DESTROY,
    --     NODESTROY,
    --     KEEP,
    --     NOKEEP
    --  }
    -- use like WhenAdd.NORULE
    -- when add new source item, depend if recipe source is DESTROY, NODESTROY, KEEP, NOKEEP
    local WhenAdd = ____RecipeAPi.WhenAdd


    --  ======================================EXAMPLES========================

    -- item HCBoneneedle
    -- {
    --    Weight    		= 0.1,
    --    Type    		= Normal,
    --    DisplayName         	= Bone Needle,
    ----    icon 			= HCBoneneedle,
    --	DisplayCategory          =   CraftTailor,
    --}
    -- Now every recipe with Base.Needle will use also HCBoneneedle
    AddTweakAllRecipe(CreateRecipeSourceChanges("Base.Needle", { "Hydrocraft.HCBoneneedle" }))

    --item TinCanEmpty
    --{
    --    DisplayCategory = Material,
    --    Weight = 0.2,
    --    Type = Normal,
    --    DisplayName	= Empty Tin Can,
    --    Icon = TinCanEmpty,
    --    MetalValue = 20,
    --    StaticModel = CanOpen,
    --    WorldStaticModel = TinCanEmpty_Ground,
    --}
    -- add Hydrocraft.HCTincan item as alternative to Base.TinCanEmpty
    AddTweakAllRecipe(CreateRecipeSourceChanges("Base.TinCanEmpty", { "Hydrocraft.HCTincan" }))
    -- reverse
    AddTweakAllRecipe(CreateRecipeSourceChanges("Hydrocraft.HCTincan", { "Base.TinCanEmpty" }))
     --  ====================================== yours changes here========================


end
