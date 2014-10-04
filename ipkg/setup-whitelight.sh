feed=http://ipkg.nslu2-linux.org/feeds/optware/cs08q1armel/cross/unstable
ipk_name=$(wget -qO- $feed/Packages | awk '/^Filename: ipkg-opt/ {print $2}')
wget $feed/$ipk_name
tar -xOvzf $ipk_name ./data.tar.gz | tar -C / -xzvf -
mkdir -p /opt/etc/ipkg
echo "src armel http://ipkg.nslu2-linux.org/feeds/optware/cs08q1armel/cross/unstable" > /opt/etc/ipkg/armel-feed.conf
wget http://mybookworld.wikidot.com/local--files/optware/sort_dirname.tar.gz
tar xvfz sort_dirname.tar.gz -C /