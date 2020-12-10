# Overview

This is my rough process for onboading juniors, as long with the steps we take along the way. 

# 0 - Start

So you've hired a junior! Congratulations. You will need to feed and care for your new junior team asset. This person will
be your next round of employees to continue their quest internally to existential dread. Or being fired.

At this stage, the things we should expect a junior to really just be getting a feel for what it is that we do. Generally,
I try to have a junior just repeat findings and explain them back to me.

1. Find something.
1. Show the junior staff.
1. Have them repeat the steps to reproduce of the finding. 
1. Have them explain the finding to you in their own words.

Repeat this for a few assessments or findings, until they are clearly able to reproduce findings without issue.

# 1 - No More Monkey See Monkey Do

So your junior now can flawlessly explain a finding that you find. Congratulations! At this stage, we really want to 
make sure people are starting to understand the process, and so we want to remove some of the guide rails. Remember,
they're still juniors, and they may need more of Stage 0, even tho you worked with them on that. You should have decent
guidelines as to what you think their experience should be, and know how long the on boarding should be expected to take.

1. Find something in the system/applicaiton.
1. Show the junior staff where it _generally_ is.
1. Have them find it, and write their steps to reproduce.
1. critique those steps; remember, they may have to explain things more long winded, help them learn to pare down words.
1. Have them practice walking through the steps, providing a proof of concept, and understanding exactly what the issue is.

Repeat this for a few findings or assessments, until they can generally find a certain class or classes of bugs. You should
be helping them to understand two things:

- a few different types of bugs
- general notions of scoping, to a route, a file, whatever 

# 2 - The General Region We're Looking For, like a LT on LandNav

Excellent, we now have a junior who can explain some basic things about what we want them to do. At this stage, we want
to see if they can start to find things without us prompting them. By Stage 2, they should understand a few different
vulnerabilities, and should understand some rough scoping within the application. At this level, they should roughly
be able to find things on their lonesome, even if what they find isn't super complex. Here, we want to let them ramble
a little bit more, roam the wilds a bit, live this cult of danger, like an LT on LandNav

1. Assign the junior some section of the application.
1. At fixed intervals (I like every 2-4 hours, depending on skills), have a quick check in. Have them explain:
  1. what they're working on
  1. what they're seeing in the app
  1. what exploits they're trying to land
1. Course correct them with a deep breathe and a "sir..." it's all about humility, we've all been here.
1. Each day, check in on their findings, and see if you agree with their progress; you'll have a good feel for what sorts of vulns you should be seeing, and help them course correct a bit.

Remember, they're still getting their feet underneat them, but they should be a bit more confident with what they're doing now.
Help them grow that confidence; encourage them on what they got, help them on what they missed. 

# 3 - The Dawn of the Final ~~Day~~ Junior

This should be the last stage; your junior is almost a person! They grow up so fast! Sadly, they're still in their gawky
teenager phase; work with them to continue their growth. Here, you can repeat Stage 2, but for a focused control family
of an application. For example, assign your ugly duckling to check Input Validation and Output Encoding across the app, 
or within a specific area that makes sense. Basically, task them out like a normal team resource, and check in on them
a bit more frequently than you would otherwise. 
  
Once you've gotten them to this stage, you can ease back on the checkins; do twice a day for a while, then every day, 
then every other day... allow them the sense that you're placing trust in them, but watch what they're doing on reports
and in a more passive fashion. You'll know when it's right to stop watching what they're doing, and when they can become
a full team member.
