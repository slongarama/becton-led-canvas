# CPSC334 Module 1 - Generative Art
Artist: Sabrina Long

### Concept

This past Friday (September 13th 2019) was the Mid-Autumn Festival, a harvest festival celebrated by hundreds of millions of people around the world each year. The festival is a time for friends and family to come together, eat food, and share in each other's company.

Growing up, Mid-Autumn was always an exciting time of year because it meant special trips to the Chinese grocery store and many delicious varieties of mooncakes. However, since coming to college, I have celebrated the Mid-Autumn festival with less and less intensity each year. This year, it slipped my mind completely. I woke up the following morning thinking about it, only to realize it had just passed.

![Becton Center Entrance](https://github.com/slongarama/cpsc334-generative-art/blob/master/images/becton_entrance)

![Becton Cafe Full Screen](https://github.com/slongarama/cpsc334-generative-art/blob/master/images/full_display)

![Small LED Panel Closeup](https://github.com/slongarama/cpsc334-generative-art/blob/master/images/small_closeup)

This generative art piece is a reflection on my emotions that morning, as I realized that many of the childhood traditions my family once held dear had fallen apart in the face of our collective Americanization. Through images on the Becton Cafe LED display, I hope to invoke in the viewer the same feelings of thoughtful sadness I felt that day. The piece depicts a small child surrounding by Chinese text and pulsating circles meant to emulate mooncakes.

Video: https://youtu.be/bkPSsAsL59k

### Reproducibility

The following instructions explain how to run a Processing sketch (such as this project) on boot. The instructions assume the reader has the ability to SSH into a Raspberry Pi 3b+.

1. Clone this repo into your chosen location on the Raspberry Pi
2. Edit the second line of ```myScript.h``` to include the path to your new repository instead of ```/home/pi/path_to_processing_sketch_folder```
3. Access your autostart file by running ```sudo vim /etc/xdg/lxsession/LXDE-pi/autostart```
4. Add the line ```@bash /home/pi/myScript.sh``` to this file
5. Reboot your Raspberry Pi with ```sudo reboot```
