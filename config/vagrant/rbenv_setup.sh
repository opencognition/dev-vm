#!/usr/bin/env bash
echo "=== Begin Vagrant Provisioning using 'config/vagrant/rbenv_setup.sh'"

cd # Start in the home directory

RUBY_VERSION='2.3.0'
GEMS_VERSION='2.5.1'
RAILS_VERSION='5.0.0.beta1'

# Setup Ruby using rbenv
# echo "===== Installing Ruby $RUBY_VERSION"

# git clone -q git://github.com/sstephenson/rbenv.git .rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(rbenv init -)"' >> ~/.zshrc

# git clone -q git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init - )"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

#rbenv install $RUBY_VERSION
#rbenv global $RUBY_VERSION


# Setup Ruby using rvm
echo "===== Installing RVM"
# Import key
sudo -u vagrant -H bash -l -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
sudo -u vagrant -H bash -l -c 'curl -L https://get.rvm.io | bash -s stable'

# Install Ruby
echo "===== Installing Ruby $RUBY_VERSION"
sudo -u vagrant -H bash -l -c '/home/vagrant/.rvm/bin/rvm install ruby-${RUBY_VERSION} --autolibs=enabled && rvm alias create default ruby-${RUBY_VERSION}'

#sudo -u vagrant -H bash -l -c '/home/vagrant/.rvm/bin/rvm install ruby-2.3.0 --autolibs=enabled && rvm alias create default ruby-2.3.0'


echo "===== Installing Rubygems $GEMS_VERSION"
wget -q http://production.cf.rubygems.org/rubygems/rubygems-${GEMS_VERSION}.tgz
tar xzf rubygems-${GEMS_VERSION}.tgz
cd rubygems-$GEMS_VERSION
ruby setup.rb
cd ..
rm -rf rubygems-${GEMS_VERSION}*

sudo -u vagrant -H bash -l -c 'gem install bundler --no-rdoc --no-ri -q'
sudo -u vagrant -H bash -l -c 'gem install rails --no-rdoc --no-ri -q -v ${RAILS_VERSION}'
sudo -u vagrant -H bash -l -c 'gem install foreman --no-rdoc --no-ri -q'

echo "=== End Vagrant Provisioning using 'config/vagrant/rbenv_setup.sh'"
