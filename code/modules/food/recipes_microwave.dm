
// see code/datums/recipe.dm
/datum/recipe/plainburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat
	)
	result = /obj/item/reagent_containers/food/snacks/burger/meat

/datum/recipe/fishburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/carpmeat
	)
	result = /obj/item/reagent_containers/food/snacks/burger/fish

/datum/recipe/tofuburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/burger/tofu

/datum/recipe/ratburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/rat
	)
	result = /obj/item/reagent_containers/food/snacks/burger/mouse

/datum/recipe/hotdog
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/sausage
	)
	result = /obj/item/reagent_containers/food/snacks/hotdog

/datum/recipe/classichotdog
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat/corgi
	)
	result = /obj/item/reagent_containers/food/snacks/classichotdog


/datum/recipe/donkpocket
	items = list(
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meatball
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket //does it make sense for newly made donk to come out cold? no, do I care? coincidentally, also no.

/datum/recipe/hotdiggitydonk //heated donk
	items = list(
		/obj/item/reagent_containers/food/snacks/donkpocket
	)
	result = /obj/item/reagent_containers/food/snacks/donkpocket/warm

/datum/recipe/muffin
	reagents = list("milk" = 5, "sugar" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/dough
	)
	result = /obj/item/reagent_containers/food/snacks/muffin


/datum/recipe/humankabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/human,
		/obj/item/reagent_containers/food/snacks/meat/human
	)
	result = /obj/item/reagent_containers/food/snacks/human/kabob

/datum/recipe/monkeykabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/monkey,
		/obj/item/reagent_containers/food/snacks/meat/monkey
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/syntikabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh,
		/obj/item/reagent_containers/food/snacks/meat/syntiflesh
	)
	result = /obj/item/reagent_containers/food/snacks/monkeykabob

/datum/recipe/tofukabob
	items = list(
		/obj/item/stack/rods,
		/obj/item/reagent_containers/food/snacks/tofu,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/tofukabob



/datum/recipe/microchips
	appliance = MICROWAVE
	items = list(
		/obj/item/reagent_containers/food/snacks/rawsticks
	)
	result = /obj/item/reagent_containers/food/snacks/microchips

/datum/recipe/cheesyfries
	items = list(
		/obj/item/reagent_containers/food/snacks/fries,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/cheesyfries




/datum/recipe/meatsteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat)
	result = /obj/item/reagent_containers/food/snacks/meatsteak

/datum/recipe/syntisteak
	reagents = list("sodiumchloride" = 1, "blackpepper" = 1)
	items = list(/obj/item/reagent_containers/food/snacks/meat/syntiflesh)
	result = /obj/item/reagent_containers/food/snacks/meatsteak





/datum/recipe/bigbiteburger
	items = list(
		/obj/item/reagent_containers/food/snacks/burger/monkey,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list("egg" = 3)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/burger/bigbite

/datum/recipe/fishandchips
	items = list(
		/obj/item/reagent_containers/food/snacks/fries,
		/obj/item/reagent_containers/food/snacks/carpmeat
	)
	result = /obj/item/reagent_containers/food/snacks/fishandchips

/datum/recipe/sandwich
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/sandwich

/datum/recipe/toastedsandwich
	items = list(
		/obj/item/reagent_containers/food/snacks/sandwich
	)
	result = /obj/item/reagent_containers/food/snacks/toastedsandwich

/datum/recipe/grilledcheese
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/grilledcheese

/datum/recipe/slimetoast
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/slime

/datum/recipe/jelliedtoast
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jelliedtoast/cherry

/*/datum/recipe/spagetti We have the processor now
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice
	)
	result= /obj/item/reagent_containers/food/snacks/spagetti*/


/datum/recipe/superbiteburger
	fruit = list("tomato" = 1)
	reagents = list("sodiumchloride" = 5, "blackpepper" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/burger/bigbite,
		/obj/item/reagent_containers/food/snacks/dough,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/cheesewedge,
		/obj/item/reagent_containers/food/snacks/boiledegg
	)
	result = /obj/item/reagent_containers/food/snacks/burger/superbite

/datum/recipe/candiedapple
	fruit = list("apple" = 1)
	reagents = list("water" = 5, "sugar" = 5)
	result = /obj/item/reagent_containers/food/snacks/candiedapple

/datum/recipe/slimeburger
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/burger/jelly/slime

/datum/recipe/jellyburger
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/burger/jelly/cherry

/datum/recipe/twobread
	reagents = list("wine" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/twobread

/datum/recipe/slimesandwich
	reagents = list("slimejelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/slime

/datum/recipe/cherrysandwich
	reagents = list("cherryjelly" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/cherry

/datum/recipe/chocolateegg
	items = list(
		/obj/item/reagent_containers/food/snacks/egg,
		/obj/item/reagent_containers/food/snacks/chocolatebar
	)
	result = /obj/item/reagent_containers/food/snacks/chocolateegg

/datum/recipe/sausage
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/cutlet
	)
	result = /obj/item/reagent_containers/food/snacks/sausage
	result_quantity = 2



/datum/recipe/tossedsalad
	fruit = list("cabbage" = 2, "tomato" = 1, "carrot" = 1, "apple" = 1)
	result = /obj/item/reagent_containers/food/snacks/salad/tossedsalad

/datum/recipe/aesirsalad
	fruit = list("goldapple" = 1, "ambrosiadeus" = 1)
	result = /obj/item/reagent_containers/food/snacks/salad/aesirsalad

/datum/recipe/validsalad
	fruit = list("potato" = 1, "ambrosia" = 3)
	items = list(/obj/item/reagent_containers/food/snacks/meatball)
	result = /obj/item/reagent_containers/food/snacks/salad/validsalad
	make_food(var/obj/container as obj)

		. = ..(container)
		for (var/obj/item/reagent_containers/food/snacks/salad/validsalad/being_cooked in .)
			being_cooked.reagents.del_reagent("toxin")



// Fuck Science!
/datum/recipe/ruinedvirusdish
	items = list(
		/obj/item/virusdish
	)
	result = /obj/item/ruinedvirusdish

//////////////////////////////////////////
// bs12 food port stuff
//////////////////////////////////////////

/datum/recipe/taco
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice,
		/obj/item/reagent_containers/food/snacks/cutlet,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/taco


/datum/recipe/meatball
	items = list(
		/obj/item/reagent_containers/food/snacks/rawmeatball
	)
	result = /obj/item/reagent_containers/food/snacks/meatball
	appliance = MICROWAVE | SKEWER

/datum/recipe/cutlet
	items = list(
		/obj/item/reagent_containers/food/snacks/rawcutlet
	)
	result = /obj/item/reagent_containers/food/snacks/cutlet
	appliance = MICROWAVE | SKEWER



/datum/recipe/mint
	reagents = list("sugar" = 5, "frostoil" = 5)
	result = /obj/item/reagent_containers/food/snacks/mint

/////////////////////////////////////////////////////////////
//Synnono Meme Foods
//
//Most recipes replace reagents with RECIPE_REAGENT_REPLACE
//to simplify the end product and balance the amount of reagents
//in some foods. Many require the space spice reagent/condiment
//to reduce the risk of future recipe conflicts.
/////////////////////////////////////////////////////////////

/datum/recipe/bearburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/bearmeat
	)
	result = /obj/item/reagent_containers/food/snacks/burger/bear

/datum/recipe/chickenfillet //Also just combinable, like burgers and hot dogs.
	items = list(
		/obj/item/reagent_containers/food/snacks/chickenkatsu,
		/obj/item/reagent_containers/food/snacks/bun
	)
	result = /obj/item/reagent_containers/food/snacks/chickenfillet

/datum/recipe/honeytoast
	reagents = list("honey" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice
	)
	reagent_mix = RECIPE_REAGENT_REPLACE //Simplify end product
	result = /obj/item/reagent_containers/food/snacks/honeytoast


/datum/recipe/donerkebab
	fruit = list("tomato" = 1, "cabbage" = 1)
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/meatsteak,
		/obj/item/reagent_containers/food/snacks/sliceable/flatdough
	)
	result = /obj/item/reagent_containers/food/snacks/donerkebab



/datum/recipe/nugget
	reagents = list("flour" = 5)
	items = list(
		/obj/item/reagent_containers/food/snacks/meat/chicken
	)
	reagent_mix = RECIPE_REAGENT_REPLACE
	result = /obj/item/reagent_containers/food/snacks/nugget

// Chip update
/datum/recipe/tortila
	reagents = list("flour" = 5,"water" = 5)
	result = /obj/item/reagent_containers/food/snacks/tortilla
	reagent_mix = RECIPE_REAGENT_REPLACE //no gross flour or water

/datum/recipe/taconew
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla,
		/obj/item/reagent_containers/food/snacks/cutlet,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/taco

/datum/recipe/chips
	reagents = list("sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla
	)
	result = /obj/item/reagent_containers/food/snacks/chipplate

/datum/recipe/nachos
	items = list(
		/obj/item/reagent_containers/food/snacks/chipplate,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/chipplate/nachos

/datum/recipe/salsa
	fruit = list("chili" = 1, "tomato" = 1, "lime" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	result = /obj/item/reagent_containers/food/snacks/dip/salsa
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/guac
	fruit = list("chili" = 1, "lime" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/dip/guac
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/cheesesauce
	fruit = list("chili" = 1, "tomato" = 1)
	reagents = list("spacespice" = 1, "blackpepper" = 1,"sodiumchloride" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/dip
	reagent_mix = RECIPE_REAGENT_REPLACE //Ingredients are mixed together.

/datum/recipe/burrito
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla,
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/meatball
	)
	reagents = list("spacespice" = 1)
	result = /obj/item/reagent_containers/food/snacks/burrito

/datum/recipe/burrito_vegan
	items = list(
		/obj/item/reagent_containers/food/snacks/tortilla,
		/obj/item/reagent_containers/food/snacks/tofu
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_vegan

/datum/recipe/burrito_spicy
	fruit = list("chili" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/burrito
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_spicy

/datum/recipe/burrito_cheese
	items = list(
		/obj/item/reagent_containers/food/snacks/burrito,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_cheese

/datum/recipe/burrito_cheese_spicy
	fruit = list("chili" = 2)
	items = list(
		/obj/item/reagent_containers/food/snacks/burrito,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_cheese_spicy

/datum/recipe/burrito_hell
	fruit = list("chili" = 10)
	items = list(
		/obj/item/reagent_containers/food/snacks/burrito_spicy
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_hell
	reagent_mix = RECIPE_REAGENT_REPLACE //Already hot sauce

/datum/recipe/burrito_mystery
	items = list(
		/obj/item/reagent_containers/food/snacks/burrito,
		/obj/item/reagent_containers/food/snacks/soup/mystery
	)
	result = /obj/item/reagent_containers/food/snacks/burrito_mystery

//Ligger food, and also bacon.

/datum/recipe/bacon
	items = list(
		/obj/item/reagent_containers/food/snacks/rawbacon
	)
	result = /obj/item/reagent_containers/food/snacks/bacon
	appliance = MICROWAVE | SKEWER | POT

/datum/recipe/stuffed_meatball
	items = list(
		/obj/item/reagent_containers/food/snacks/meatball,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/stuffed_meatball

/datum/recipe/grilled_carp
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/carpmeat
	)
	reagents = list("spacespice" = 1)
	fruit = list("cabbage" = 1, "lime" = 1)
	result = /obj/item/reagent_containers/food/snacks/sliceable/grilled_carp
	appliance = MICROWAVE | SKEWER

/datum/recipe/sushi_roll
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/boiledrice
	)
	fruit = list("cabbage" = 1)
	result = /obj/item/reagent_containers/food/snacks/sliceable/sushi_roll

/datum/recipe/bacon_stick
	items = list(
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/boiledegg
	)
	result = /obj/item/reagent_containers/food/snacks/bacon_stick
	appliance = MICROWAVE | SKEWER

/datum/recipe/cheese_cracker
	items = list(
		/obj/item/reagent_containers/food/snacks/spreads,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	reagents = list("spacespice" = 1)
	result = /obj/item/reagent_containers/food/snacks/cheese_cracker
	result_quantity = 4

/datum/recipe/baconburger
	items = list(
		/obj/item/reagent_containers/food/snacks/bun,
		/obj/item/reagent_containers/food/snacks/meat,
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/bacon
	)
	result = /obj/item/reagent_containers/food/snacks/burger/bacon

/datum/recipe/ntmuffin
	items = list(
		/obj/item/reagent_containers/food/snacks/plumphelmetbiscuit,
		/obj/item/reagent_containers/food/snacks/sausage,
		/obj/item/reagent_containers/food/snacks/friedegg,
		/obj/item/reagent_containers/food/snacks/cheesewedge
	)
	result = /obj/item/reagent_containers/food/snacks/nt_muffin

/datum/recipe/fish_taco
	fruit = list("chili" = 1, "lemon" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/carpmeat,
		/obj/item/reagent_containers/food/snacks/tortilla
	)
	result = /obj/item/reagent_containers/food/snacks/fish_taco

/datum/recipe/blt
	fruit = list("tomato" = 1, "cabbage" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/breadslice,
		/obj/item/reagent_containers/food/snacks/bacon,
		/obj/item/reagent_containers/food/snacks/bacon
	)
	result = /obj/item/reagent_containers/food/snacks/blt

/datum/recipe/onionrings
	fruit = list("onion" = 1)
	items = list(
		/obj/item/reagent_containers/food/snacks/doughslice
	)
	result = /obj/item/reagent_containers/food/snacks/onionrings

/datum/recipe/berrymuffin
	reagents = list("milk" = 5, "sugar" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/dough
	)
	fruit = list("berries" = 1)
	result = /obj/item/reagent_containers/food/snacks/berrymuffin

/datum/recipe/icecreamsandwich
	reagents = list("milk" = 5, "ice" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/icecream
	)
	result = /obj/item/reagent_containers/food/snacks/icecreamsandwich

/datum/recipe/banana_split
	fruit = list("banana" = 1)
	reagents = list("milk" = 5, "ice" = 5)
	reagent_mix = RECIPE_REAGENT_REPLACE
	items = list(
		/obj/item/reagent_containers/food/snacks/icecream
	)
	result = /obj/item/reagent_containers/food/snacks/banana_split
