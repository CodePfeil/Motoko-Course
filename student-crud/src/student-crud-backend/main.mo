import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Text "mo:base/Text";

actor Students {
  type Student = {
    id : Text;
    firstName : Text;
    lastName : Text;
    age : Nat;
    active : Bool;
  };

  
let students = HashMap.HashMap<Text, Student>(10, Text.equal, Text.hash);

  let Fabian : Student = {
    id = "1";
    firstName = "Fabian";
    lastName = "Herrera";
    age = 20;
    active = true;
  };

  students.put(Fabian.id, Fabian);

  let Hermar : Student = {
    id = "1";
    firstName = "Fabian";
    lastName = "Martinez";
    age = 20;
    active = true;
  };

  students.put(Hermar.id, Hermar);

  public query func getStudent(id : Text) : async ?Student {
    return students.get(id);
  };

public func setStudent(id : Text, firstName : Text, lastName : Text, age : Nat, active : Bool) : async () {
    let newStudent : Student = {
      id = id;
      firstName = firstName;

      lastName = lastName;
      age = age;
      active = active;
    };
    students.put(id, newStudent);
  };

  public func deleteStudent(id : Text) : async ?Student {
    return students.remove(id);
  };

  public query func getAllStudents() : async [(Text, Student)] {
    let iter = students.entries();
    return Iter.toArray(iter);
  };
};


