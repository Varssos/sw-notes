Cron
====

A crontab file contains instructions for the cron(8) daemon in the following simplified manner: "run this command at this time on this date"

Edit cron configuration
~~~~~~~~~~~~~~~~~~~~~~~
::

    crontab -e

Edit cron configuration for user
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    crontab -u sshroot -e

Crontab example
~~~~~~~~~~~~~~~

Everyday at 4:00 run ``/home/user/command.sh``::

    0 4 * * * /home/user/command.sh

Show configuration
~~~~~~~~~~~~~~~~~~
::

    crontab -l

Apply changes
~~~~~~~~~~~~~
::

    service cron restart