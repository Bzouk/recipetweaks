/**
 * @noSelfInFile   @noResolution 
 *
 * NOTE: Use this at the top of your TypeScript files. This prevents functions & methods
 *       from prepending a 'self' reference, which is usually not necessary and complicates
 *       rendered Lua code.
 */

 declare module "recipetweaks/api/RecipeAPi" {
    export enum WhenAdd {
        NORULE,
        DESTROY,
        NODESTROY,
        KEEP,
        NOKEEP
    }

    export interface RecipeChanges {
        filter?: RecipeFilter;
        sourceChange?: RecipeSourceChanges;
        resultChanges?: RecipeResultChanges;
    }

    export interface RecipeFilter {
        resultName?: string;
        resultCount?: number;
        modName?: string;
        includeRecipeNames?: Array<string>;
        excludeRecipeNames?: Array<string>;
    }

    export interface RecipeResultChanges {
        resultDrainableCount?: number;
        resultCount?: number;
    }

    export interface RecipeSourceChanges {
        sourceItem: string;
        sourcesNewItemsList?: Array<string>;
        sourceCount?: number;
        sourceDrainableCount?: number;
        whenadd?: WhenAdd;
    }

    export function AddTweakOneRecipe(
        recipeName: string,
        sourceCountChanges?: RecipeSourceChanges,
        resultChanges?: RecipeResultChanges,
        filter?: RecipeFilter
    ): null;

    export function AddTweakAllRecipe(sourceCountChanges?: RecipeSourceChanges, resultChanges?: RecipeResultChanges, filter?: RecipeFilter):null;

    export function GetItemsListByTag(typeTag: string): string[]

    export function CreateFilter(
        modName?: string,
        includeRecipeNames?: Array<string>,
        excludeRecipeNames?: Array<string>,
        resultName?: string,
        resultCount?: string | number
      ): RecipeFilter

      export function CreateResultChanges(resultCount?: number | string, resultDrainableCount?: number | string): RecipeResultChanges

      export function CreateRecipeSourceChanges(
        sourceItem: string,
        sourcesNewItemsList?: Array<string>,
        sourceCount?: string | number,
        sourceDrainableCount?: string | number,
        whenadd?: WhenAdd
      ): RecipeSourceChanges
}