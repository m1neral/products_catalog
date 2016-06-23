user = User.create is_admin: true, email: 'admin@admin.com', password: '1q2w3e4r'

c1 = Category.create name: 'Films'
c2 = Category.create name: 'Books'
c3 = Category.create name: 'Games'
c4 = Category.create name: 'Singers'

f1 = c1.products.create title: 'Homeland', description: 'Homeland is an edge-of-your-seat sensation. CIA officer
  Carrie Mathison (Claire Danes) is tops in her field despite being bipolar, which makes her volatile and unpredictable.
  With the help of her long-time mentor Saul Berenson (Mandy Patinkin), Carrie fearlessly risks everything, including her
  personal well-being and even sanity, at every turn. You won\'t be able to turn away from this gripping, emotional thriller
  in which nothing short of the fate of our nation is at stake.'

f2 = c1.products.create title: 'The Fast and the Furious', description: 'Brian O\'Conner, now working for the FBI in LA, teams
up with Dominic Toretto to bring down a heroin importer by infiltrating his operation.'

b1 = c2.products.create title: 'Hard-Boiled Wonderland and the End of the World ', description: 'In this hyperkinetic and relentlessly
inventive novel, Japan’s most popular (and controversial) fiction writer hurtles into the consciousness of the West. Hard-Boiled
Wonderland and the End of the World draws readers into a narrative particle accelerator in which a split-brained data processor, a
deranged scientist, his shockingly undemure granddaughter, Lauren Bacall, Bob Dylan, and various thugs, librarians, and subterranean
monsters collide to dazzling effect. What emerges is simultaneously cooler than zero and unaffectedly affecting, a hilariously funny
and deeply serious meditation on the nature and uses of the mind.'

g1 = c3.products.create title: 'Prince of Persia: The Forgotten Sands', description: 'Prince of Persia The Forgotten Sands is the next chapter
in the fan-favorite Sands of Time universe. Visiting his brother\'s kingdom following his adventure in Azad, the Prince finds the royal
palace under siege from a mighty army bent on its destruction.'

f2.reviews.create msg: 'Best of the best!'

b1.reviews.create msg: 'Cool book!', user: user
b1.reviews.create msg: 'Smashing!', user: user
b1.reviews.create msg: 'Awesome!!!', user: user