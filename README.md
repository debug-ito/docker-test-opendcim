
# Docker image for testing OpenDCIM

OpenDCIM: http://www.opendcim.org/

Run this image with TTY attached, e.g.

    $ sudo docker run --rm -i -t --name opendcim0 -p 80:80 debug-ito/opendcim

When you access the page for the first time, installation procedure
runs. After it completes, **you must remove install.php** to start
normal operation. 


