if [[ -z $1 || -z $2 ]]; then
    echo 'Usage: add_lib_to_system.sh <libPath> <confFileName>'
    exit
fi

TEXT_TO_LIB_CONF_FILE=$1
CONF_FILE_NAME=$2

# Add the Boost libraries path to the default Ubuntu library search path
sudo /bin/bash -c "echo \"$TEXT_TO_LIB_CONF_FILE\" > /etc/ld.so.conf.d/$CONF_FILE_NAME"
 
# Update the default Ubuntu library search paths
sudo ldconfig