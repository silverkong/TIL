// object shorthand assignment
let name = "eunbeen"
let age = 26

let person = {
    name,
    age
}

console.log(person)

// Destructuring
let person2 = {
    name : "eunbeen",
    age : 20
}

// let name = person.name
// let age = person['age']

let {name2, age2} = person2

console.log(name2, age2)

let array = [1, 2, 3, 4]
let [a, b, ... rest] = array

console.log(a, b)
console.log(rest)

//spread
let person3 = {name : "eunbeen", age : 20}
let person4 = {... person3, name : "jimin"}
let person5 = person3

console.log(person4)
console.log(person5)

console.log(person3 == person4) // false
console.log(person3 == person5) // true


let arrA = [1, 2]
let arrB = [...arrA, 3]
console.log(arrB)

let arrC = [...arrA, ...arrB]
console.log(arrC)

// 삼항연산자
let person6 = {name : "eunbeen", age : 20}

if(person6) {
    console.log(person6.name)
}else{
    console.log("there is no person")
}

console.log(person6 ? person6.age : "there is no person")