# Things

### Intro

This repository contains collections of 3D models (mostly in [STL](https://en.wikipedia.org/wiki/STL_(file_format)) and [OBJ](https://en.wikipedia.org/wiki/Wavefront_.obj_file) format) to be used for 3D printing. The repository is intended to be used in combination with [Polymorph](https://github.com/jgphilpott/polymorph) as a way to host your own models and designs without polluting the software.

### Setup

After cloning both Polymorph and your own things repository to the same location on your device you can create a symlink so that the things appear as a sub directory in the Polymorph repository. To do this navivate into the Polymorph app directory with the command `cd polymorph/app` then create the symlink with the command `ln -s ../../things things`. You should now see all your things available in the directory `polymorph/app/things`. Although this directory is ignored by git you can add and update files and the changes will also update in the things repository.

### Usage

In general higher level directories represent categories and the lowest level directory represents a thing. Thing directories contain a 3D model or set of models, possibly images, a README and other relevant pieces of data as well. If the thing was designed with Polymorph it should also contain a polygen function that can be used to create/view the thing. Polygen functions can be in [JavaScript](https://en.wikipedia.org/wiki/JavaScript), [CoffeeScript](https://en.wikipedia.org/wiki/CoffeeScript) or [TypeScript](https://en.wikipedia.org/wiki/TypeScript) and should be copied into the corresponding root file in the [scripts directory](https://github.com/jgphilpott/polymorph/tree/master/app/scripts). You can also view and download these things on several different websites listed here:

### <img align="left" width="25" height="25" src="https://www.thingiverse.com/favicon.ico"> [Thingiverse](https://www.thingiverse.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://pinshape.com/favicon.ico"> [Pinshape](https://pinshape.com/users/964002)
### <img align="left" width="25" height="25" src="https://www.myminifactory.com/favicon.ico"> [MyMiniFactory](https://www.myminifactory.com/users/jgphilpott)
### <img align="left" width="25" height="25" src="https://grabcad.com/favicon.ico"> [GrabCAD](https://grabcad.com/jacob.philpott-1)
### <img align="left" width="25" height="25" src="https://www.youmagine.com/favicon.ico"> [YouMagine](https://www.youmagine.com/jgphilpott)
### <img align="left" width="25" height="25" src="https://cults3d.com/favicon.ico"> [Cults](https://cults3d.com/en/users/jgphilpott)
