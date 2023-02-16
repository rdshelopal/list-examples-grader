CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then
    echo "ListExamples Found"
else 
    echo "need file ListExamples.java"
    exit 1
fi

cd ../
cp TestListExamples.java student-submission
cd student-submission

set +e

javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java 2>output.txt

if [[ $? -eq 0 ]]
then
    echo "Compile suceeded"
else
    echo "There is a compile errror!"
fi

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples 2>output2.txt


