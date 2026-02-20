#!/vendor/bin/sh
PATH=/vendor/bin:$PATH

# Memory Tuning

# make sure zram is enabled
# sometimes it fails especially on crdroid?
if ! grep "zram" /proc/swaps > /dev/null 2>&1; then 
	mkswap /dev/block/zram0 > /dev/null 2>&1
	swapon /dev/block/zram0 > /dev/null 2>&1
fi

# EOF
