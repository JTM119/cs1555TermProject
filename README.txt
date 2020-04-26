Joshua Martin
Jtm119
Because the file ojdbc7.jar was unmodified since phase 2 it is still listed as phase 2 submission, but it is required in order to compile the java files!

In order to compile the Olympic file you must use
	javac -cp ojdbc7.jar Olympic.java
And to run the program use
     java -cp ojdbc7.jar:. Olympic



In order to compile the Driver File
	javac -cp ojdbc7.jar Olympic.java Driver.java
In order to run the Driver File
	 java -cp ojdbc7.jar:. Driver
	
