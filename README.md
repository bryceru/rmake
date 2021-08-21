Run make from child folders
---------------------------

If you use the Makefile to run commands (which is a bad way, but nobody cares), 
this script makes it possible to run from child folders.

Commands
--------
* `rmake rule` — run rule from nearest Makefile
* `rmake --dot rule` — run rule from nearest Makefile with .rootmake file in the same folder

Example
-------
Structure:
* :root
  * Makefile
  * .rootmake
  * alpha
    * Makefile
      * delta
  * beta
    * gamma

* `cd :root`
* `rmake rule` — run rule from `/Makefile`
* `cd alpha/delta`
* `rmake rule` – run rule from `/alpha/Makefile`
* `rmake --dot rule` – run rule from `/Makefile`
* `cd :root`
* `cd beta` 
* `rmake rule` – run rule from `/Makefile`
* `cd gamma`
* `rmake rule` – run rule from `/Makefile`
