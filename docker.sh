# build image
# -t tag name
docker build -t my-apps-tag .

# start image
# -dp INTERNAL_PORT:EXTERNAL_PORT
docker run -dp 3000:3000 my-apps-tag
