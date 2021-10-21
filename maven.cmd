# show super-pom + pom.xml redefination results
mvn help:effective-pom

# created project from archetype
mvn archetype:create-from-project

# cleans and installs all dependencies
mvn clean install

# show all dependencies of the project
mvn dependency: tree
