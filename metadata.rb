maintainer        "General Sensing LTD"
maintainer_email  "dev@generalsensing.com"
license           "Apache 2.0"
description       "Installs and phantomjs 1.6.1"
version           "1.6.1"

recipe "phantomjs", "Installs phantomjs from source"

%w{ ubuntu debian }.each do |os|
  supports os
end

depends "apt"
