%w{ build-essential git }.each do |cb|
  include_recipe("#{cb}::default")
end

%w{ libssl-dev libfontconfig1-dev }.each do |pkg|
  package pkg
end

deploy_revision "/usr/local/src/phantomjs" do
  repository node[:phantomjs][:repository]
  revision node[:phantomjs][:version]
  before_migrate do
    execute "build" do
      command "./build.sh"
      cwd release_path
      action :run
    end
  end
end

