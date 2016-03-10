include_recipe 'python'

# create pairjournal virtualenv
python_virtualenv "/opt/pairjournal_env" do
  owner "ubuntu"
  group "ubuntu"
  action :create
end

# install requirements to virtualenv
python_pip "-r /opt/pairjournal/requirements.txt" do
  virtualenv "/opt/pairjournal_env"
end

# Get gunicorn upstart config file from pairjournal repo
link '/etc/init/pairjournal.conf' do
  to '/opt/pairjournal/config/upstart/pairjournal.conf'
end

# Reload Upstart config so pairjournal is recognized
execute 'initctl reload-configuration'

# Start gunicorn
service 'pairjournal' do
  action [:enable, :start]
end
