
# paths
dirname=$(dirname $0)
lib="/usr/local/lib/dots"
bin="/usr/local/bin"

# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Copy the path
sudo cp -R $dirname "$lib/"

# remove existing bin if it exists
if [ -e "$bin/dots" ]; then
	rm "$bin/dots"
fi

# symlink dots
ln -s "$lib/dots.sh" "$bin/dots"
