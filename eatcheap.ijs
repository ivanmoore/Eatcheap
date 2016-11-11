0!:1 < '/home/rob/j64-804-user/projects/eatcheap/foods.ijs'

NB. Necassary protein per day in grams
proteinPerDay =: 60

NB. Necassary meals per day
mealsPerDay =: 3

NB. Necassary calories per meal
caloriesPerMeal =: 1000 

NB. =============== FoodType objects (Instances of an enum) =======================
NB. Main macronutrient of the food
CARBS =: 0
PROTEIN =: 1
FAT =: 2
SUGAR =: 3
MIXTURE =: 4
FRUITVEG =: 5

NB. £££ per serving
poundsPerServing =: pounds % servings

NB. Calories per £££
caloriesPerPound =: calories % poundsPerServing

NB. Protein per £££
proteinPerPound =: protein % poundsPerServing

NB. =============== Meal objects =======================

NB. Usage example: basicchilli =: meal rice and mince and onions and tomatosauce

NB. You might also say: ingredients =: rice and mince and onions and tomatosauce
NB.	              basicchilli =: meal ingredients

NB. If I for example have 4 slices of bread with 2 servings of peanutbutter and 2 servings of butter, I can say:
NB. meal =: (4 of brownbread) and (2 of peanutbutter) and (2 of butter)
NB. This meal is amazingly efficient by the way. It's stats are 0.479529 1 30.12 864

NB.                  £££ per serving      srv      protein          calories      foodType (mixture)
meal =: ,&4 @: ((+/ @: poundsPerServing) , 1 , (+/ @: protein) , (+/ @: calories)) NB. 4

of =: #"0

and =: ,.

proteinshake =: meal wheypowder and (5 of milk) 

NB. =============== BowlOfCereal objects (implements Meal) =======================

NB. Making a bowl of some cereal
bowlofcereal =: meal @: (milk&and)

bowlofalpen =: bowlofcereal alpen

NB. =============== Sandwich objects (implements Meal) =======================

NB. Making a sandiwich
sandwich =: meal @: ((2 of brownbread)&and)

peanutbutterAndButterSandwich =: sandwich peanutbutter and butter

NB. =============== Tabling functions =======================

tabledimensions =: 2&,@:(>:@:#)

columnlabels =: [: <;._2 [: , [: ,&';'"1 'name' , ]

rowlabelnames =: 'unit price;servings per unit;protein (g)/serving;calories/serving;food type;'
rowlabels =: (< ([ ;. _2) rowlabelnames)

data =: <@:,."1@:".

tablebody =: columnlabels , rowlabels , data

parseinput =: ([ ;. _2) @: ,&';'

maketable =: (tabledimensions $ tablebody) @: parseinput

with =: [ , ';' , ]

cereals =: 'cocopops' with 'cornflakes' with 'alpen'

compareCereals =: maketable cereals
