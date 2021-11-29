# copy
cp -a ~/spring-cloud-gcp-guestbook/1-bootstrap/guestbook-frontend \
  ~/guestbook-frontend

# request JSON. Use jq to parse the JSON return text.
curl -s http://localhost:8081/guestbookMessages \
  | jq -r '._embedded.guestbookMessages[] | {name: .name, message: .message}'

FROM DATA EXAMPLE:
{
  "_embedded" : {
    "guestbookMessages" : [ {
      "name" : "Ray",
      "message" : "Hello",
      "imageUri" : null,
      "_links" : {
        "self" : {
          "href" : "http://localhost:8081/guestbookMessages/1"
        },
        "guestbookMessage" : {
          "href" : "http://localhost:8081/guestbookMessages/1"
        }
      }
    }, {
      "name" : "����",
      "message" : "������",
      "imageUri" : null,
      "_links" : {
        "self" : {
          "href" : "http://localhost:8081/guestbookMessages/2"
        },
        "guestbookMessage" : {
          "href" : "http://localhost:8081/guestbookMessages/2"
        }
      }
    } ]
  },
  "_links" : {
    "self" : {
      "href" : "http://localhost:8081/guestbookMessages{?page,size,sort}",
      "templated" : true
    },
    "profile" : {
      "href" : "http://localhost:8081/profile/guestbookMessages"
    }
  },
  "page" : {
    "size" : 20,
    "totalElements" : 2,
    "totalPages" : 1,
    "number" : 0
  }


# list all variables
printenv

# set env variable
export VAR_NAME="VAR_VALUE"

# read file content
cat filename
less filename

# remove file
rm filename

# rename file\folder
mv oldfile.txt newfiel.txt

# copy file
cp file1 destination

# create dir
mkdir -p "path/sdfp"


# change to root user
sudo -i


# show all processes
# A : Select all processes
# u : Select all processes on a terminal, including those of other users
# x : Select processes without controlling ttys
ps -aux | less


# view all processes on real time 
top

# killing a process by PID
kill PID

# list jobs
jobs

# bring a process to foreground
fg %JOB_NUMBER


# grep - search data
grep "searching test" file.txt

# find in the end of something
tail file.txt 
# track live
tail -f | grep "error" file.txt
taif -f # last 10 rows plus new lines

# CURL
curl --location --request GET 'http://domain.kz/products' --header 'Authorization: Basic ADFJSDKFHDFOS'

# http request
curl http://localhost:8081/guestbookMessages
curl -s http://localhost:8081/guestbookMessages

# POST request
curl -XPOST -H "content-type: application/json" -d '{"name": "Ray", "message": "Hello"}' http://localhost:8081/guestbookMessages
