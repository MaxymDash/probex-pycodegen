# gs-sw-codegen-sip

In the beginning, there was an openapi specification.

And somewhere else, there was a thing spewing out events (json messages),
and those events were structured almost the same as the resources in the
openapi schema.

By "spewing out", I mean sending HTTP `POST {event} /some-callback`,
where some-callback is a Flask API that is getting these json events
posted to it. And by "structured almost the same", I mean the json
objects getting posted have one field that is absent from the various
resources in the openapi schema, and that extra field indicates what
kind of message it is.

The Flask API pop's the extra off the message it recieves, and uses it
to determine what kind of message it has. In other words, it uses it to
determine which resource the message coresponds to.

At that point (when we know what type of resource the message is
supposed to resemble), we would like to use a marshmallow schema to
validate the payload that was posted to the flask API.

**TASK #1: generate marshmallow schema from openapi spec**

What we expect the Flask API to do is load the apprporiate marshmallow
schema for rthe message type, and validate the payload. If the payload
is valid, we would like to deserialise the message into an instance of
an event class, and "do interesting stuff with it".

Our interesting stuff is really quite interesting, so we will need to
test it. We are going to need some kind of "plausible garbage generator"
to create lots of synthetic messages, to help us test this interesting
stuff.

**TASK #2: generate factoryboy factory classes from openapi spec**

We are going to use these factoryboy classes in our unittests for the
Flask API, and we are also going to use them to generate *simulated
output* from the API. In other words, we are going to use the
factoryboy generators to create lots of  "plausible garbage" that
looks as though it was recieved and validated by the API. We are going
to shove this plausible garbage into message queues and so-on, so we
can pretend that our callback API is getting lots of traffic. 


## Working on this

If you are looking at this repository, there is a good chance that you
were invited to it as part of an UpWork recruitment process. Please feel
free to raise tickets with questions, comments, issues or suggestions
(etc). Even if you have not been hired to this project yet, please feel
free to raise tickets/questions/etc.

My intention is to hire from 1-3 people to work on this (short term
contract). While this is a competitive process to access long term work,
one of the things I will be assessing is your ability to collaborate
with other developers to achieve a good solution together. So play
nice, engage and help each other!

This repository will use a "fork and pull-request" workflow; apart from
my initial setup, please don't try and push directly to it.


## technical approach

swagger-codegen has the ability to use 3rd party templates, using the
`-t` option and a local filesystem refernce to moustache templates.

This repo should contain whatever scripts it needs, to use
swagger-codegen from within a docker container, and take a local
directory of templates as a command line option.
