#!/vendor/bin/sh
PATH=/vendor/bin:$PATH

# Memory Tuning

# make sure zram is enabled
# sometimes it fails especially on crdroid?
if ! grep "zram" /proc/swaps > /dev/null 2>&1; then 
	mkswap /dev/block/zram0 > /dev/null 2>&1
	swapon /dev/block/zram0 > /dev/null 2>&1
fi

# le9ec
echo "65535" > /proc/sys/vm/clean_min_kbytes
echo "131072" > /proc/sys/vm/anon_min_kbytes                                                                                                                                                       
echo "262144" > /proc/sys/vm/clean_low_kbytes

# raise swappiness after le9 is set
echo "150" > /proc/sys/vm/swappiness

# EOF
