# Beantest

Beantest tests your specs every time you save. If your machine has growl (Mac OS X) or notify-send (Ubuntu), beantest will also send an alert on test complete containing the tests passed, the tests total, and if any tests failed.

Beantest assumes you are using jasmine-node for your tests.

## How to use

    $ npm install -g beantest
    $ cd your_repo/
    $ beantest
