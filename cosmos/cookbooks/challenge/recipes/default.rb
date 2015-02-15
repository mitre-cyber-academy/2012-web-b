package "openjdk-6-jre-headless" do
  action :install
end

bash "challenge" do
  user "ubuntu"
  code <<-EOH
    
    # permissions
    chmod 755 $HOME
    
    # configure tomcat
    cp $HOME/chef-solo/cookbooks/challenge/aux/apache-tomcat-7.0.28.tar.gz $HOME
    tar xzf $HOME/apache-tomcat-7.0.28.tar.gz
    mv $HOME/apache-tomcat-7.0.28 $HOME/tomcat
    rm -rf $HOME/tomcat/webapps/*
    rm -rf $HOME/tomcat.tar.gz
    
    # move webapp
    cp $HOME/chef-solo/cookbooks/challenge/aux/COSMOS.war $HOME/tomcat/webapps/
    
  EOH
end

bash "init_d" do
  user "root"
  code <<-EOH
    
    # setup script
    cp /home/ubuntu/chef-solo/cookbooks/challenge/aux/init_d_script /etc/init.d/tomcat
    chmod 755 /etc/init.d/tomcat
    
    # register it with boot sequence
    update-rc.d tomcat defaults 98 02
    
    # nginx
    /etc/init.d/tomcat start
    
  EOH
end
