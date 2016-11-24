Sample Game App
===

## Description

Sample game Rails server.

Using Lua as game logic, to share with Client.

## API

### Show Map

```
$ curl -X GET http://localhost:3000/map
[[0,0,0],[1,1,0],[0,1,0]]
```

### Show character

```
$ curl -X GET http://localhost:3000/user
{"id":1,"point":3,"x":0,"y":0,"created_at":"2016-11-23T06:55:51.000Z","updated_at":"2016-11-23T08:57:27.000Z"}
```

### Move character

```
curl -X PUT http://localhost:3000/user -d 'commands[]=up' -d 'commands[]=down' -d 'commands[]=right' -d 'commands[]=left'
{"x":0,"y":0,"point":3,"id":1,"created_at":"2016-11-23T06:55:51.000Z","updated_at":"2016-11-23T08:57:27.000Z"}
```

### Reset character

```
$ curl -X DELETE http://localhost:3000/user
```
