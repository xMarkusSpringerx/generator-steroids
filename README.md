# Steroids generator

A [Yeoman](http://yeoman.io) generator for [Steroids](https://github.com/appgyver/steroids).

### Available generators

* `steroids:ng-resource` – generates an AngularJS-based resource using local data.
* `steroids:ng-scaffold` – generates an Angular.js CRUD scaffold to work with a REST-API.
* `steroids:example:<exampleName>` – Generates an example demonstrating a Steroids feature.

## Installation

Make sure you have [yo](https://github.com/yeoman/yo) installed:

```
$ npm install yo -g
```

Then, install the Steroids generator with

```
$ npm install generator-steroids -g
```

## Usage

Create a new Steroids project with [Steroids npm](https://github.com/appgyver/steroids) and go to the folder. 

For an AngularJS-based resource:

```
yo steroids:ng-resource
```

and give your resource a name. The resource files will be created and Bower will install all required dependencies.

For an Angular.js CRUD scaffold:

```
yo steroids:ng-scaffold
````

and give your resource a name. The resource files will be created and Bower will install all required dependencies.

For an example resource:

```
yo steroids:example:<exampleName>
```

Options:
__exampleName__: name of the example to generate.

Available examples:
* accelerometer -- Access the device's accelerometer.
* animation -- Using native animations without moving to another document (iOS-only).
* audio -- Play back audio files through Cordova's Media API.
* camera -- Access the device's camera and photo library.
* compass -- Access the device's compass.
* device -- Access the device properties.
* drawer -- Using the native Facebook-style drawer (iOS-only).
* drumMachine -- Demonstrate Steroids Audio API via a kickin' drum machine.
* geolocation -- Access the device's geolocation data.
* layerStack -- Native navigation, page transitions and backstack handling.
* modal -- Using the modal window.
* navigationBar -- Using the native navigation bar.
* notification -- Access native notifications.
* photoGallery -- Use Cordova's Camera and File APIs and Steroids native windowing to create a one-picture photo gallery.
* preload -- Preload WebViews to have them available immediately.
* s3upload -- Uploading photos to s3
* storage -- Access Cordova's SQL Storage API.

## Known issues

The current Steroids project structure places `bower.json` in `config/bower.json`. For the installed dependencies to be saved into the Bower config file, you need to have `bower.json` in your project root. A future version of Steroids npm will have the `bower.json` in the correct location.

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
