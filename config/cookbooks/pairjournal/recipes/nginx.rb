# Installs and runs nginx

package 'nginx'

# Get config file from pairjournal repo
link '/etc/nginx/nginx.conf' do
  to '/opt/pairjournal/config/nginx.conf'
end

service 'nginx' do
  supports :restart => true
  # Need restart in order to recognize config file
  action [:enable, :start, :restart]
end
