
# JPEG B.atch R.esize, R.ename, and EXIF R.emoval script

**BRRER-me! A tale of pixels and metadata.**

![Banner Image](/img/photo_booth.jpg "A banner image depicting a kodak photo booth (Source Flickr).")
*60s Kodak Fotomat drive through.*

### Genesis

> When I print pictures online or in shops, I'd sometime rather prefer keeping the original files for myself than seeing them released into the third-parties jungle. This script is basically a combination of commands I use and it will help you (partially) anonymize your pictures and also reduce their carbon footprint.

## Table of contents

- [JPEG B.atch R.esize, R.ename, and EXIF R.emoval script](#jpeg-batch-resize-rename-and-exif-removal-script)
    - [Genesis](#genesis)
  - [Table of contents](#table-of-contents)
  - [Features](#features)
  - [Dependencies](#dependencies)
    - [Installation of the dependencies](#installation-of-the-dependencies)
  - [Usage](#usage)
  - [Warning](#warning)
  - [Limitations](#limitations)
  - [License](#license)
    - [Limitation of liability](#limitation-of-liability)

## Features

1. **Resize JPEG files**: Resizes all JPEG files in the current directory to 55% *(by default)* of their original size.
2. **Rename JPEG files**: The script renames all JPEG files in the current directory to a sequential numbering (e.g., 1.jpg, 2.jpg, 3.jpg, etc.).
3. **Remove EXIF metadata**: The script removes all EXIF metadata from the JPEG files in the current directory, **overwriting** the original files.

>[!NOTE]
> The script is case insensitive towards file extensions and will consider .jpeg or .jpg files equivalently.

## Dependencies

The following dependencies are required to be installed:

* ImageMagick (for image resizing), included in most distros.
* exiftool (for EXIF metadata removal)

### Installation of the dependencies

To install the dependencies on Debian/Ubuntu, run the following commands:

* `sudo apt update && sudo apt install imagemagick libimage-exiftool-perl`

## Usage

1. Save or download this script as a file.
2. Navigate to the script folder and make it executable by running `chmod +x BRRER.sh` or run `chmod +x /path/to/file/BRRER.sh`.
3. Navigate to the directory containing the JPEG files you want to process.
4. Run the script by executing `./path/to/file/BRRER.sh` in the terminal.
5. Confirm that you are in the correct directory and want to proceed with the processing.

## Warning

>[!WARNING]
> The script will **overwrite** the original files. Make sure to backup your all your files before running it!

## Limitations

* For security reasons, the script uses `find` with a `maxdepth` value of **1** to search for JPEG files within the current directory, so it will **only process files in the current directory** and not the ones located in subdirectories.

## License

The source code is provided under a Creative Commons CC0 license. See the [LICENSE](/LICENSE) file for details.

### Limitation of liability

By using this script, you acknowledge that the author shall not be held liable for any lost profits, lost revenues or opportunities, downtime, or any consequential damages or costs, resulting from the use of this script.
