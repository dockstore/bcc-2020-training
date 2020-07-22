#!/usr/bin/env nextflow

////////////////////////////////////////////////////////////////////////////////////////////////
// launch locally
//   first move to directory:
//      cd /root/bcc2020-training/nextflow-training/exercise3/hello_examples/HelloGoodbye
// run workflow:
//   nextflow run HelloGoodbye.nf
////////////////////////////////////////////////////////////////////////////////////////////////

myName = file(params.myName)
greeting = file(params.greeting)

process hello_world {
    input:
    file myName from myName

    output:
    file "Hello.txt" into hello_ch

    """
    echo Hello World! > Hello.txt
    cat ${myName} >> Hello.txt
    """
}

 process goodbye_world {
     input:
     file greeting from greeting

     output:
     file "Goodbye.txt" into goodbye_ch

     """
     cat ${greeting} > Goodbye.txt
     echo See you later! >> Goodbye.txt
     """
 }