# Beantest

Beantest tests your specs every time you save. If your machine has growl (Mac OS X) or notify-send (Ubuntu), beantest will also send an alert on test complete containing the tests passed, the tests total, and if any tests failed.

Beantest assumes you are using jasmine-node for your tests.

## How to use

    $ npm install -g beantest
    $ cd your_repo/
    $ beantest

## How it works

Run `beantest` on the command-line, and it will search for a folder called `spec` on the current directory. It will run jasmine-node on the contents of that folder.

If any `.js` or `.coffee` file in your project is modified, the tests will re-run. `.js` files will not trigger if there is a `.coffee` version of that file.
