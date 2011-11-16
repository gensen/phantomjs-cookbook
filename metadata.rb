maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs and phantomjs 1.3"
version           "1.3"

recipe "phantomjs", "Installs phantomjs from source"

%w{ ubuntu debian }.each do |os|
  supports os
end

depends "apt"
