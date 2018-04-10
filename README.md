# RTC control in a multicontainer resin.io project

This is an example project to control a real-time clock (RTC) attached to the
system, from within service in a multicontainer environment on resin.io

The example is adding an RTC to a Raspberry Pi, e.g. a DS1307 module.

The hardware can be enabled by setting `dtoverlay=i2c-rtc,ds1307` in `config.txt`,
or remotely by setting a `RESIN_HOST_CONFIG_dtoverlay` device configuration to
`i2c-rtc,ds1307`. See more in the docs regarding [customising `config.txt`](https://docs.resin.io/learn/develop/hardware/i2c-and-spi/#customising-config-txt).

The RTC control is done in the container by checking whether the RTC time is
ahead of the system time, and if it is, then restore the time there.

In the multicontainer, unprivileged environment this requires:

*   access to `/dev/rtc`
*   the system capability to set time

These are set up in `docker-compose.yml`, as the example shows, and would enable
time control with minimal privileges.

Note: this is an example project, and depending on your requirements and on the
base images used in your services, you might need to modify the setup.

This project can be adapted for non-multicontainer resin.io environments,
where basically just `rtc/start.sh`, and the RTC-to-system-time logic within
that script is required.

## License

Copyright 2018 Resinio Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
