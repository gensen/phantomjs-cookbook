apt_repository "kubuntu_backports" do
  uri "http://ppa.launchpad.net/kubuntu-ppa/backports/ubuntu"
  keyserver "keyserver.ubuntu.com"
  key "8AC93F7A"
  action :add
end

package "xvfb"
package "x11vnc"
package "libqt4-dev"
package "libqtwebkit-dev"
package "qt4-qmake"

# Ensuring phantomjs is checked out
#
bash "Ensuring phantomjs is checked out" do
  cwd "/usr/local/src"
  code %{
    git clone #{node[:phantomjs][:repository]}
    cd phantomjs
    git checkout #{node[:phantomjs][:version]}
  }
  not_if "[ -d /usr/local/src/phantomjs ]"
end

# Building phantomjs if missing from PATH
#
bash "Building phantomjs" do
  cwd "/usr/local/src/phantomjs"
  code %{
    qmake-qt4 && make
    cp bin/phantomjs /usr/local/bin/
  }
  not_if "[ $(xvfb-run phantomjs --version) == '#{node[:phantomjs][:version]}' ]"
end
