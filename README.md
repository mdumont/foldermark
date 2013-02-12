# Folder mark

A simple tool for quickly navigating between distant locations in a large and unfamiliar directory tree (source base).

Once you've located a "location of interest", you can quickly mark it for future reference and recall.  The tool should be 

## Installation and Requirements
The utilities are defined as bash functions, so installation involves sourcing the foldermark.sh file into your environment.

All of the subcommands related to mark-set's require the git package to be installed.

Persistant storage is used in ~/.folder-mark

## Usage 
The tool comes as a command, "fmark" which contains the following subcommands.

* mark <name> to instantiate a mark at this location with the given name.
* jump <name> will immediately cd you back to that location.
* unmark <name> will delete the location from your mark list.
* list will state the set of marks in your current markset.
* create-set <name> will create a new markset with the given name, and switch to it.
* change-set <name> will switch to the named markset.
* delete-set <name> will delete the named markset, and all included marks.  This is currently unimplemented.
