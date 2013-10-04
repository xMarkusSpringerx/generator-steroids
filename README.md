# Steroids generator

A [Yeoman](http://yeoman.io) generator for [Steroids](https://github.com/appgyver/steroids).

### Available generators

* `steroids:ng-resource` – generates an AngularJS-based resource using local data.

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

Create a new Steroids project with [Steroids npm](https://github.com/appgyver/steroids) and go to the folder. Type

```
yo steroids:ng-resource
```

and give your resource a name. The resource files will be created and Bower will install all required dependencies.

## Known issues

The current Steroids project structure places `bower.json` in `config/bower.json`. For the installed dependencies to be saved into the Bower config file, you need to have `bower.json` in your project root. A future version of Steroids npm will have the `bower.json` in the correct location.

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
