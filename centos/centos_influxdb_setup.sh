# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-11-26 13:54:47
 # @LastEditTime: 2021-12-06 11:35:27
 # @LastEditors: Gabriel Feng
 # @Description: 
 # @FilePath: \NRI\apps\nri_scripts\centos\centos_influxdb_setup.sh
 # -------------------------------------------------------------------------------
### 

# Download InfluxDB v2.0 for Linux.
wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.9-linux-amd64.tar.gz

# Unpackage contents to the current working directory
tar xvzf influxdb2-2.0.9-linux-amd64.tar.gz

# Copy the influx and influxd binary to your $PATH
cp influxdb2-2.0.9-linux-amd64/{influx,influxd} /usr/local/bin/


# Install InfluxDB as a service with systemd
# wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.1.1-linux-amd64.tar.gz
# tar xvfz influxdb2-2.1.1-linux-amd64.tar.gz
# sudo yum localinstall influxdb2_2.x.x_xxx.deb.rpm

sudo service influxdb start