# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

foods = {
  "banana cake, made with sugar"	=> 47,
  "banana cake, made without sugar"	=> 55,
  "sponge cake, plain"	=> 46,
  "vanilla cake made from packet mix with vanilla frosting (betty crocker)"	=> 42,
  "apple, made with sugar"	=> 44,
  "apple, made without sugar"	=> 48,
  "waffles, aunt jemima (quaker oats)"	=> 76,
  "bagel, white, frozen"	=> 72,
  "baguette, white, plain"	=> 95,
  "coarse barley bread, 75-80% kernels, average"	=> 34,
  "hamburger bun"	=> 61,
  "kaiser roll"	=> 73,
  "pumpernickel bread"	=> 56,
  "50% cracked wheat kernel bread"	=> 58,
  "white wheat flour bread"	=> 71,
  "wonder™ bread, average"	=> 73,
  "whole wheat bread, average"	=> 71,
  "100% whole grain™ bread (natural ovens)"	=> 51,
  "pita bread, white"	=> 68,
  "corn tortilla"	=> 52,
  "wheat tortilla"	=> 30,
  "coca cola®, average"	=> 63,
  "fanta®, orange soft drink"	=> 68,
  "lucozade®, original (sparkling glucose drink)"	=> 95,
  "apple juice, unsweetened, average"	=> 44,
  "cranberry juice cocktail (ocean spray®)"	=> 68,
  "gatorade"	=> 78,
  "orange juice, unsweetened"	=> 50,
  "tomato juice, canned"	=> 38,
  "all-bran™, average"	=> 55,
  "coco pops™, average"	=> 77,
  "cornflakes™, average"	=> 93,
  "cream of wheat™ (nabisco)"	=> 66,
  "cream of wheat™, instant (nabisco)"	=> 74,
  "grapenuts™, average"	=> 75,
  "muesli, average"	=> 66,
  "oatmeal, average"	=> 55,
  "instant oatmeal, average"	=> 83,
  "puffed wheat, average"	=> 80,
  "raisin bran™ (kellogg's)"	=> 61,
  "special k™ (kellogg's)"	=> 69,
  "pearled barley, average"	=> 28,
  "sweet corn on the cob, average"	=> 60,
  "couscous, average"	=> 65,
  "quinoa"	=> 53,
  "white rice, average"	=> 89,
  "quick cooking white basmati"	=> 67,
  "brown rice, average"	=> 50,
  "converted, white rice (uncle ben's®)"	=> 38,
  "whole wheat kernels, average"	=> 30,
  "bulgur, average"	=> 48,
  "graham crackers"	=> 74,
  "vanilla wafers"	=> 77,
  "shortbread"	=> 64,
  "rice cakes, average"	=> 82,
  "rye crisps, average"	=> 64,
  "soda crackers"	=> 74,
  "ice cream, regular"	=> 57,
  "ice cream, premium"	=> 38,
  "milk, full fat"	=> 41,
  "milk, skim"	=> 32,
  "reduced-fat yogurt with fruit, average"	=> 33,
  "apple, average"	=> 39,
  "banana, ripe"	=> 62,
  "dates, dried"	=> 42,
  "grapefruit"	=> 25,
  "grapes, average"	=> 59,
  "orange, average"	=> 40,
  "peach, average"	=> 42,
  "peach, canned in light syrup"	=> 40,
  "pear, average"	=> 38,
  "pear, canned in pear juice"	=> 43,
  "prunes, pitted"	=> 29,
  "raisins"	=> 64,
  "watermelon"	=> 72,
  "baked beans, average"	=> 40,
  "blackeye peas, average"	=> 33,
  "black beans"	=> 30,
  "chickpeas, average"	=> 10,
  "chickpeas, canned in brine"	=> 38,
  "navy beans, average"	=> 31,
  "kidney beans, average"	=> 29,
  "lentils, average"	=> 29,
  "soy beans, average"	=> 15,
  "cashews, salted"	=> 27,
  "peanuts, average"	=> 7,  
  "fettucini, average"	=> 32,
  "macaroni, average"	=> 47,
  "macaroni and cheese (kraft)"	=> 64,
  "spaghetti, white, boiled, average"	=> 46,
  "spaghetti, white, boiled 20 min, average"	=> 58,
  "spaghetti, wholemeal, boiled, average"	=> 42,
  "corn chips, plain, salted, average"	=> 42,
  "fruit roll-ups®"	=> 99,
  "m & m's®, peanut"	=> 33,
  "microwave popcorn, plain, average"	=> 55,
  "potato chips, average"	=> 51,
  "pretzels, oven-baked"	=> 83,
  "snickers bar®"	=> 51,
  "carrots, average"	=> 35,
  "parsnips"	=> 52,
  "baked russet potato, average"	=> 111,
  "boiled white potato, average"	=> 82,
  "instant mashed potato, average"	=> 87,
  "sweet potato, average"	=> 70,
  "yam, average"	=> 54,
  "green peas, average"	=> 51,
  "hummus (chickpea salad dip)"	=> 6,  
  "chicken nuggets, frozen, reheated in microwave oven 5 min"	=> 46,
  "pizza, plain baked dough, served with parmesan cheese and tomato sauce"	=> 80,
  "pizza, super supreme (pizza hut)"	=> 36,
  "honey, average"	=> 61
}

foods.each do |k,v|
  Food.create(name: k, glycemic_index: v)
end

exercises = {
  "crunches" =>	20,
  "walking"	=> 15,
  "running"	=> 40,
  "sprinting"	=> 60,
  "squats" =>	60,
  "bench press" => 45
}

exercises.each do |k,v|
  Exercise.create(name: k, exercise_index: v)
end


events = [
  ["food", 50, Time.now - 40000], 
  ["food", 30, Time.now - 35000], 
  ["food", 60, Time.now - 30000], 
  ["exercise", 50, Time.now - 25000], 
  ["food", 60, Time.now - 20000], 
  ["exercise", 100, Time.now - 15000]
]

events.each do |event|
  Event.create(event_type: event[0], index: event[1], created_at: event[2])
end