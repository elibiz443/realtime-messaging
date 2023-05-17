# REAL-TIME-MESSAGING

This is a web app that implements realtime messaging utilizing, WebSocket communication using Action Cable. The authentication proces will be implemented using omniauth, for faster authentication coz the focus is on messaging.

____
Requirements:
* Ruby
* Rails
* actioncable
___

Steps:
1. Add Models:
```
rails g model User provider uid name email image password_digest role && rails g model Notification title message:text
```
