// --------------------
// DBS311 - Week 10 - Intro to MongoDB
// Name: Saetbyeol Lim
// Student No: 149814212
// Nov 24, 2022
// --------------------

//Q1. 
db.student.insertOne ({
    "first_name" : "Sarah",
    "last_name" : "Stone",
    "email" : "s_stone@email.com",
    "city": "Markham",
    "status" : "full-time",
    "gpa": "3.2",
    "program" : "CPA"
    });

//Q2.
8
yes
_id

//Q3.
//command
db.student.remove({"first_name" : "Sarah", "last_name": "Stone"});

//output
WriteResult({ "nRemoved" : 1 })


//Q4.
	
//command
db.student.find({"first_name" : "Sarah", "last_name": "Stone"});
//output
[]

//Q5.
//array definition
starray  = [
    {first_name: "Sarah", last_name: "Stone", email: "s_stone@email.com", city: "Toronto",status: "full-time", gpa: 3.4, program: "CPA" },
    {first_name: "Jack", last_name: "Adam", email: "j_adam@email.com", city: "North York", status: "part-time", gpa: 3.6, program: "CPA"}
];

//the statement to insert the array into the collection
db.student.insertMany(starray);

//output message
BulkWriteResult({
    "writeErrors" : [ ],
    "writeConcernErrors" : [ ],
    "nInserted" : 2,
    "nUpserted" : 0,
    "nMatched" : 0,
    "nModified" : 0,
    "nRemoved" : 0,
    "upserted" : [ ]
})

//Q6.
//command
db.student.find();
//output
{"_id":1001,"first_name":"Sarah","last_name":"Stone","email":"s_stone@email.com","city":"Toronto","status":"full-time","gpa":"3.4","program":"CPA"}
{"_id":1002,"first_name":"Jack","last_name":"Adam","email":"j_adam@email.com","city":"North York","status":"full-time","gpa":"3.6","program":"CPA"}

//Q7.
db.student.remove({});

//Q8.
use senecaLab07
db.student.drop();







