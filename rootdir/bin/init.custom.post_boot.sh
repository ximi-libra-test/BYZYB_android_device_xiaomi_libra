#!/vendor/bin/sh

# selinux: Allow enforcing mode spoofing
if [ "$(cat /sys/fs/selinux/enforce)" = 0 ]; then 
	echo 2 > /sys/fs/selinux/enforce
fi

# EOF

