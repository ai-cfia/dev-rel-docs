# Environment variables

_This page will serve as a knowledge base with the purpose of developing our
understanding of core programming concepts._

Environment variables are key-value pairs that are external to the application,
and they can be used to configure and manage settings and behaviors without
altering the application code. They are often used to store sensitive
information, such as API keys and passwords, or to define settings that can vary
between development, testing, and production environments.

## Accessing and Setting Environment Variables

* **In Code**: Programming languages provide mechanisms to access environment
variables. For example, in Python, the OS module is commonly used:

```python
import os
value = os.environ.get('VARIABLE_NAME')
```

* **In Shell**: They can be accessed and set directly in the shell. In Unix or
Linux based systems, you can use commands like:

```sh
export VARIABLE_NAME=value
echo $VARIABLE_NAME
```

* **Environment Files**: Alternatively, environment variables can be declared in
environment files (e.g., .env), which can be loaded into the application at
runtime (using the `python-dotenv` library for instance).

* **In Dockerfile**: You can set environment variables in your Dockerfile using
the `ENV` instruction. This sets the variable for the container and any
applications running within it.

```Dockerfile
FROM python:3.11

ENV MY_VARIABLE=my_value

CMD ["my_application"]
```

## Summary

Environment variables are akin to the settings and configurations of an
operating system, providing a mechanism to store data that influences the
behavior of applications and the system. Much like how an OS retains user
preferences and system configurations even after a reboot, environment variables
allow applications to remember configurations and settings, eliminating the need
to set them up every time the application runs. They serve as persistent storage
for configurations, ensuring that applications can access the required settings
and operate correctly in different environments without manual intervention each
time.
