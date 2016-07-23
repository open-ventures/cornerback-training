# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# workout pages
["cornerback-training-workouts",  
 "6d_week1", "6d_week2", "6d_week3", "6d_week4", "6d_week5", "6d_week6",
 "4d_week1", "4d_week2", "4d_week3", "4d_week4", "4d_week5", "4d_week6",
 "3d_week1", "3d_week2", "3d_week3", "3d_week4", "3d_week5", "3d_week6",
 
 # program guide pages
 "cornerback-training-program-guide", "cornerback-training-find-a-field", "cornerback-training-find-a-gym", "cornerback-training-find-a-track",
 "cornerback-training-incline-training", "cornerback-training-equipment-guide",
 
 # strength training pages
 "ab-wheel", "back-extensions", "ball-crunches", "db-press", "db-shoulder-circuit", "heidi-circuit", "hip-abductors-machine",
 "hip-adductors-machine", "hip-extensions", "incline-db-press", "lunge-circuit", "planks", "pull-ups", "seated-pull-downs",
 "seated-rows", "seated-torso-twists", "side-planks", "single-leg-calf-raises", "single-leg-glute-bridges", "single-leg-press",
 "single-leg-raises", "single-leg-squats", "stability-ball-curls", "standing-hamstring-curl", "torso-twists-cable",
 
 # dynamic warm-up pages
 "knee-grabs", "whirl-kicks", "sumo-stretch", "high-kicks", "walking-hamstring", "walking-lunges",

 # cornerback drills
 "long-weave", "long-speed-turns", "long-slow-turns", "long-hip-flips", "hitch-n-go-breaks", "whip-route-breaks",
 "out-n-in-breaks", "box-drill", "open-hitch-breaks", "dig-breaks", "post-corner-speed-turns", "post-corner-slow-turns",
 "hip-flips-with-45-degree-break", "hip-flips-with-315-degree-break",

 # footwork & agility
 "high-knees", "ladder-drills-lateral", "ladder-drills-lateral-with-hop", "ladder-drills-sidestep", "ladder-drills-backwards-step",
 "ladder-drills-backwards-lateral", "ladder-drills-ins-and-outs", "short-shuttle-drill", "l-drill",

  # speed training
 "high-knees", "turnover-strikes", "turnover-kicks", "ab-skips", "arm-swings", "strides-walk-turns", "strides-jog-turns",
 "20-yd-burst", "40-yd-dash-with-parachute", "power-sled", "stadiums", "hill-sprints", "broad-jumps", "tuck-jumps", 
 "single-leg-bounds"

 ].each do |slug|
   unless Page.exists?(slug: slug)
     Page.create(slug: slug, access: "public")
   end
 end

["6d_week1", "6d_week2", "6d_week3", "6d_week4", "6d_week5", "6d_week6",
 "6d_week7", "6d_week8", "6d_week9", "6d_week10", "6d_week11", "6d_week12",
 "6d_week13", "6d_week14", "6d_week15", "6d_week16", "6d_week17", "6d_week18",
 "3d_week7", "3d_week8", "3d_week9", "3d_week10", "3d_week11", "3d_week12",
 "3d_week13", "3d_week14", "3d_week15", "3d_week16", "3d_week17", "3d_week18",
 "4d_week7", "4d_week8", "4d_week9", "4d_week10", "4d_week11", "4d_week12",
 "4d_week13", "4d_week14", "4d_week15", "4d_week16", "4d_week17", "4d_week18",
 "cornerback-training-maximized", "cornerback-training-nutrition", "cornerback-training-injury-free",
 "cornerback-training-ball-skills", "cornerback-training-IQ", "cornerback-training-recruiting",
 "cornerback-training-returning", "cornerback-training-tackling", "cornerback-experience-level",
 "cornerback-strength-training-level", "cornerback-training-alternatives", "cornerback-injuries",
 "cornerback-training-drills", "cornerback-stretching", "cornerback-dynamic-warmup", "cornerback-speed-training",
 "cornerback-footwork", "cornerback-drills", "cornerback-strength-training"].each do |slug|
   unless Page.exists?(slug: slug)
     Page.create(slug: slug, access: "restricted")
   end
 end

 unless Admin.exists?(email: "cornerbacktraining@gmail.com")
   Admin.create(email: "cornerbacktraining@gmail.com", password: "admin2828", password_confirmation: "admin2828")
 end
