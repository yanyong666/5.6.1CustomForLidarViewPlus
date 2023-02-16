<!--
This template is for tracking a release of ParaView. Please replace the
following strings with the associated values:

  - `VERSION`
  - `MAJOR`
  - `MINOR`

Please remove this comment.
-->

# Preparatory steps

  - Update ParaView guides
    - [ ] User manual
      - [ ] Rename to ParaViewGuide-VERSION.pdf
      - [ ] Upload to www.paraview.org/files/vMAJOR.MINOR
    - [ ] Catalyst Guide
      - [ ] Rename to ParaViewCatalystGuide-VERSION.pdf
      - [ ] Upload to www.paraview.org/files/vMAJOR.MINOR
    - [ ] Getting Started Guide
      - [ ] Rename to ParaViewGettingStarted-VERSION.pdf
      - [ ] Upload to www.paraview.org/files/vMAJOR.MINOR
    - [ ] Assemble release notes into Documentation/release/ParaView-VERSION.
      - [ ] Get positive review and merge.

# Update ParaView

<!--
Keep the relevant items for the kind of release this is.

If making a first release candidate from master, i.e., `vMAJOR.MINOR.0-RC1`:

  - [ ] Update `master` branch for **paraview**
```
git fetch origin
git checkout master
git merge --ff-only origin/master
```
  - [ ] Update `version.txt` and tag the commit
```
git checkout -b update-to-vVERSION
echo VERSION > version.txt
git commit -m 'Update version number to VERSION' version.txt
git tag -a -m 'ParaView VERSION' vVERSION HEAD
```
  - Integrate changes to `master` branch
    - [ ] Create a merge request targeting `master` (do *not* add `Backport: release`)
    - [ ] Get positive review
    - [ ] `Do: merge`
  - Integrate changes to `release` branch
    - [ ] `git push origin update-to-vVERSION:release vVERSION`
    - [ ] Update kwrobot with the new `release` branch rules

If making a release from the `release` branch, e.g., `vMAJOR.MINOR.0-RC2 or above`:

  - [ ] Update `release` branch for **paraview**
```
git fetch origin
git checkout release
git merge --ff-only origin/release
```
  - [ ] Update `version.txt` and tag the commit
```
git checkout -b update-to-vVERSION
echo VERSION > version.txt
git commit -m 'Update version number to VERSION' version.txt
git tag -a -m 'ParaView VERSION' vVERSION HEAD
```
  - Integrate changes to `master` branch
    - [ ] Create a merge request targeting `master` (do *not* add `Backport: release`)
    - [ ] Get positive review
    - [ ] `Do: merge`
  - Integrate changes to `release` branch
    - [ ] `git push origin update-to-vVERSION:release vVERSION`
-->

  - Create tarballs
    - [ ] ParaView (`Utilities/Maintenance/create_tarballs.bash --txz --zip -v vVERSION`)
    - [ ] Catalyst (`Catalyst/generate-tarballs.sh vVERSION`)
  - Upload tarballs to `paraview.org`
    - [ ] `rsync -rptv $tarballs paraview.release:ParaView_Release/vMAJOR.MINOR/`

# Update ParaView-Superbuild

<!--
Keep the relevant items for the kind of release this is.

If making a first release candidate from master, i.e., `vMAJOR.MINOR.0-RC1`:

  - [ ] Update `master` branch for **paraview/paraview-superbuild**
```
git fetch origin
git checkout master
git merge --ff-only origin/master
```
  - Update `versions.cmake` and `CMakeLists.txt`
    - [ ] `git checkout -b update-to-vVERSION`
    - [ ] Set ParaView source selections in `CMakeLists.txt` and force explicit
      version in `CMakeLists.txt`:
```
# Force source selection setting here.
set(paraview_SOURCE_SELECTION "VERSION" CACHE STRING "Force version to VERSION" FORCE)
set(paraview_FROM_SOURCE_DIR OFF CACHE BOOL "Force source dir off" FORCE)
```
    - [ ] Guide selections in `versions.cmake`
    - [ ] `git add versions.cmake CMakeLists.txt`
    - [ ] `git commit -m "Update the default version to VERSION"`
  - Integrate changes to `master` branch
    - [ ] Create a merge request targeting `master`, title beginning with WIP
    - [ ] Build binaries (`Do: test`)
    - [ ] Download the binaries that have been generated in the dashboard results. They will be deleted within 24 hours.
    - [ ] Remove explicit version forcing added in CMakeLists.txt and force push
```
git add CMakeLists.txt
git commit --amend
git gitlab-push -f
```
    - [ ] Remove WIP from merge request title
    - [ ] Get positive review
    - [ ] `Do: merge`
    - [ ] `git tag -a -m 'ParaView superbuild VERSION' vVERSION HEAD`
  - Integrate changes to `release` branch
    - [ ] `git push origin update-to-vVERSION:release vVERSION`
    - [ ] Update kwrobot with the new `release` branch rules

If making a release from the `release` branch, e.g., `vMAJOR.MINOR.0-RC2 or above`:

  - Update `release` branch for **paraview/paraview-superbuild**
```
git fetch origin
git checkout release
git merge --ff-only origin/release
```
  - Update `versions.cmake` and `CMakeLists.txt`
    - [ ] Set ParaView source selections in `CMakeLists.txt` and force explicit
      version in `CMakeLists.txt`:
```
# Force source selection setting here.
set(paraview_SOURCE_SELECTION "VERSION" CACHE STRING "Force version to VERSION" FORCE)
set(paraview_FROM_SOURCE_DIR OFF CACHE BOOL "Force source dir off" FORCE)
```
    - [ ] Guide selections in `versions.cmake`
    - [ ] `git add versions.cmake CMakeLists.txt`
    - [ ] `git commit -m "Update the default version to VERSION"`
  - Integrate changes to `master` branch
    - [ ] Create a merge request targeting `master`, title beginning with WIP
    - [ ] Build binaries (`Do: test`)
    - [ ] Download the binaries that have been generated in the dashboard results. They will be deleted within 24 hours.
    - [ ] Remove explicit version forcing added in CMakeLists.txt and force push
```
git add CMakeLists.txt
git commit --amend
git gitlab-push -f
```
    - [ ] Remove WIP from merge request title
    - [ ] Get positive review
    - [ ] `Do: merge`
    - [ ] `git tag -a -m 'ParaView superbuild VERSION' vVERSION HEAD`
  - Integrate changes to `release` branch
    - [ ] `git push origin update-to-vVERSION:release vVERSION`
-->

# Validating binaries

  - For each binary, check
    - [ ] Getting started guide opens
    - [ ] Examples load and match thumbnails in dialog
    - [ ] Python
    - [ ] `import compiler, numpy`
    - [ ] Plugins are present and load properly
    - [ ] Text source LaTeX `$A^2$`
    - [ ] OSPRay
    - [ ] IndeX runs
    - [ ] AutoMPI

  - Binary checklist
    - [ ] macOS
    - [ ] Linux
    - [ ] Windows MPI (.exe)
    - [ ] Windows MPI (.zip)
    - [ ] Windows no-MPI (.exe)
    - [ ] Windows no-MPI (.zip)

# Upload binaries

  - Upload binaries to `paraview.org`
    - [ ] `rsync -rptv $binaries paraview.release:ParaView_Release/vMAJOR.MINOR/`
  - [ ] Ask @chuck.atkins to sign macOS binary
  - [ ] Ask @utkarsh.ayachit to regenerate `https://www.paraview.org/files/listing.txt` and `md5sum.txt`
```
buildListing.sh
updateMD5sum.sh vMAJOR.MINOR
```
  - [ ] Test download links

# Post-release

  - [ ] Notify `paraview@paraview.org` and `paraview-developers@paraview.org`
        that the release is available.
  - [ ] Post an announcement in the Announcements category on
        [discourse.paraview.org](https://discourse.paraview.org/).
  - [ ]  Write and publish blog post with release notes.
<!--
These items only apply to non-RC releases.

  - [ ] Update release notes
    (https://www.paraview.org/Wiki/ParaView_Release_Notes)
-->

/cc @ben.boeckel
/cc @cory.quammen
/cc @utkarsh.ayachit
/label ~"priority:required"
