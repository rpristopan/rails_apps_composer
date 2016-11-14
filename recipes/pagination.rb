# custom recipe for pagination

prefs[:pagination] = multiple_choice "Install pagination?", [["None", "none"],
  ["Kaminari", "kaminari"],
  ["Will paginate", "will_paginate"]] unless prefs.has_key? :pagination

if prefer :pagination, 'kaminari'
  say_wizard "installing gems for kaminari"
  add_gem 'kaminari'
end

if prefer :pagination, 'will_paginate'
  say_wizard "installing gems for will_paginate"
  add_gem 'will_paginate'

stage_three do
  ### GIT ###
  git :add => '-A' if prefer :git, true
  git :commit => '-qm "Added pagination"' if prefer :git, true
end

__END__

name: pagination
description: "Add pagination"
author: RailsApps

requires: [setup, gems]
run_after: [setup, gems]
category: mvc
