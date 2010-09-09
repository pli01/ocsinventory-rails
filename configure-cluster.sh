#! /bin/sh

mode="development"
port=9000
nombre=1
host="localhost"
path="/home/philippe/work/rails/xen_inventory"
fconfig="./config/mongrel_srv_development.yml"


mongrel_rails cluster::configure -e $mode -p $port -a $host -N $nombre  -c $path -C $fconfig

