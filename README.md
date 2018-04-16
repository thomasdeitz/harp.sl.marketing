# harp.sl.marketing

### Project Setup

##### Install Harp
```
$ npm install -g harp
```

##### Clone Repo
```
$ git clone https://github.com/thomasdeitz/harp.sl.marketing.git
```
The projects source code is now on your local machine in a directory named harp.sl.marketing.

##### Run Project
```
$ cd harp.sl.marketing
$ harp server
```
The project should now be running and  accessible at ```localhost:9000```.


### Project Structure
##### Code
```
 myapp/                         <-- root of your application
   |- harp.json                 <-- configuration, globals goes here.
   +- public/                   <-- your application assets belong in the public dir
       |- index.jade            <-- will be served
       |- another-page.jade     <-- will be served at "/another-page"
       |- _some-partial.jade    <-- won't be served
       +- _shared-partials/     <-- won't be served
           +- nav.jade          <-- a partial for navigation
       +- articles/             <-- pages in here will have "/articles/" in URL
          |- _data.json         <-- articles metadata goes here
          +- hello-world.jade   <-- should have at least one .html, .jade, .md or .ejs file.
```
##### Branches

```
$ git branch
* dev        <-- initial feature development & changes done here - merge to staging when "ok"
  master     <-- build & auto deploys to socialeads.com
  staging    <-- build & auto deploys to staging.socialeads.com - merge to master when "ok"
```

### Libraries & Technology

[harpjs](harpjs.com)

[Jade/Pug](https://pugjs.org/api/getting-started.html)

[Sass](sass-lang.com)

[Travis CI](travis-ci.org)

[GitHub](github.com)

