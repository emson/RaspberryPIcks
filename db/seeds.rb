# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username:'emson', password:'password', email:'mail@emson.co.uk')

Post.create(user_id:user.id, title:"Turn any application that uses STDIN/STDOUT into a WebSocket server", url:'https://github.com/joewalnes/websocketd')
Post.create(user_id:user.id, title:"New US spy satellite features world-devouring octopus", url:'http://arstechnica.com/tech-policy/2013/12/new-us-spy-satellite-features-world-devouring-octopus/')
Post.create(user_id:user.id, title:"Disqus cracked - security flaw reveals users e-mail addresses", url:'http://cornucopia-en.cornubot.se/2013/12/flash-disqus-cracked-security-flaw.html')
Post.create(user_id:user.id, title:"The origin of zero-based array indexing", url:'http://exple.tive.org/blarg/2013/10/22/citation-needed/')
Post.create(user_id:user.id, title:"Show HN: Minecraft clone in 2500 lines of C - even supports multiplayer online", url:'https://github.com/fogleman/Craft')
Post.create(user_id:user.id, title:"Reddit's empire is founded on a flawed algorithm", url:'http://technotes.iangreenleaf.com/posts/2013-12-09-reddits-empire-is-built-on-a-flawed-algorithm.html')
Post.create(user_id:user.id, title:"Why Johnny Can't Write Multithreaded Programs", url:'http://blog.smartbear.com/programming/why-johnny-cant-write-multithreaded-programs/')
Post.create(user_id:user.id, title:"Facebook's AI lab", url:'https://www.facebook.com/yann.lecun/posts/10151728212367143')
Post.create(user_id:user.id, title:"The main trick in machine learning", url:'http://edinburghhacklab.com/2013/12/the-main-trick-in-machine-learning/')

