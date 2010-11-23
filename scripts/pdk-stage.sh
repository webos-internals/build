#mkdir -p ../../../doctors
#curl -L -o ../../../doctors/Palm-PDK.dmg https://cdn.downloads.palm.com/sdkdownloads/PDK/Palm-PDK.dmg
cp ../../../doctors/Palm-PDK.dmg ./
7z x Palm-PDK.dmg
mkdir hfsmount
echo "mounting hfs partition..."
sudo mount -o loop 4.hfs hfsmount/
sudo chown -R $USER hfsmount/
echo "copying archive files outside of partition..."
cp hfsmount/PalmPDK.pkg/Contents/Packages/palmpdk.pkg/Contents/Archive.pax.gz ./
echo "unmounting hfs partition..."
sudo umount hfsmount
echo "gunzipping archive file..."
gunzip --verbose Archive.pax.gz
echo "extracting files from pax archive..."
pax -r -f Archive.pax ./opt/PalmPDK/device/lib/libpdl.so
pax -r -f Archive.pax ./opt/PalmPDK/include/PDL.h
pax -r -f Archive.pax ./opt/PalmPDK/include/PDL_Mojo.h
pax -r -f Archive.pax ./opt/PalmPDK/include/PDL_Services.h
pax -r -f Archive.pax ./opt/PalmPDK/include/PDL_types.h
echo "staging extracted files for armv7..."
cp ./opt/PalmPDK/device/lib/libpdl.so ../../../staging/armv7/usr/lib/
cp ./opt/PalmPDK/include/PDL.h ../../../staging/armv7/usr/include/
cp ./opt/PalmPDK/include/PDL_Mojo.h ../../../staging/armv7/usr/include/
cp ./opt/PalmPDK/include/PDL_Services.h ../../../staging/armv7/usr/include/
cp ./opt/PalmPDK/include/PDL_types.h ../../../staging/armv7/usr/include/
