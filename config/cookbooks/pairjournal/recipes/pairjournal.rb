include_recipe 'python'

# create pairjournal virtualenv
python_virtualenv "/opt/pairjournal/pj_env" do
  owner "ubuntu"
  group "ubuntu"
  action :create
end

# install requirements to virtualenv
python_pip "/opt/pairjournal/requirements.txt" do
  virtualenv "/opt/pairjournal/pj_env"
end

# Get gunicorn upstart config file from pairjournal repo
link '/etc/init/pairjournal.conf' do
  to '/opt/pairjournal/config/upstart/pairjournal.conf'
end

# Start gunicorn
service 'pairjournal' do
  action [:enable, :start]
end
