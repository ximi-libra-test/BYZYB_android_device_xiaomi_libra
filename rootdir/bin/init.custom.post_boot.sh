#!/vendor/bin/sh
PATH=/vendor/bin:$PATH

# Memory Tuning
# no need to reserve memory for these
echo 0 > /proc/sys/vm/admin_reserve_kbytes
echo 0 > /proc/sys/vm/user_reserve_kbytes

# make sure zram is enabled
# sometimes it fails especially on crdroid?
if ! grep "zram" /proc/swaps > /dev/null 2>&1; then 
	mkswap /dev/block/zram0 > /dev/null 2>&1
	swapon /dev/block/zram0 > /dev/null 2>&1
fi

# tune if zram is up
if grep "zram" /proc/swaps > /dev/null 2>&1; then 
	# zram tweak
	echo 200 > /proc/sys/vm/swappiness
	echo 0 > /proc/sys/vm/page-cluster

	# le9ec
	echo 131072 > /proc/sys/vm/anon_min_kbytes
	echo 0 > /proc/sys/vm/clean_min_kbytes
	echo 131072 > /proc/sys/vm/clean_low_kbytes

fi

# EOF
