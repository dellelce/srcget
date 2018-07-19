# Tool to download latest *stable* source

[![Join the chat at https://gitter.im/srcget/Lobby](https://badges.gitter.im/srcget/Lobby.svg)](https://gitter.im/srcget/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://travis-ci.org/dellelce/srcget.svg?branch=master)](https://travis-ci.org/dellelce/srcget)
Usage:

    ./srcget.sh <name>

i.e.:

    ./srcget.sh zlib

## Depends on:

  - wget
  - GNU awk

## Configuration:

  - profile in profiles dir
  - awk filter

## Todo:

  - Support for downloading a specific version
  - Groups/tags/categories
  - Dependency support: weak & strong dependencies
  - Improve version checking, most of the filters rely on very simple checks
  - Python migration: not to be done, but instead a new fork (srcgetpy) to happen
  - Signal handling: control-c is to be improved
  - Support for: Content-Disposition header 

## Todo Build:

  - dependency work is needed for 

## Options:

|Option|Description                         |
|------|------------------------------------|
| `-h` | Display this help message          |
| `-A` | Download all packages              |
| `-L` | List all 'packages'                |
| `-I` | Information about package          |
| `-x` | Turn on debug mode                 |
| `-n` | Quiet mode: show filename only     |
| `-q` | Quiet mode: don't show anything    |
| `-H` | Debug: return server HTTP headers  |
| `-D` | Testing: download remote url only  |

