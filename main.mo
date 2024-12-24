import Map "mo:base/HashMap";
import Text "mo:base/Text";

actor{

  type Name = Text;
  type Phone = Text; 

  type Entry = {
    desc: Text;
    phone: Phone;
  };

  type Message = {
    receiver: Text;
    mess: Text;
  };

  let phoneBook = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);

  let MessageHistory = Map.HashMap<Phone, Message>(0, Text.equal, Text.hash);

  public func insert(name: Name, entry: Entry): async() {  // ilki parametre ismi sonraki veri tipidir.
    phoneBook.put(name, entry);
  };
senderPhone: Phone, message: Message): async() {
    MessageHistory.put(senderPhone, message);
  };

  public func getPhone(name: Name): async ?Entry { // ?:herhangi bir değer dönmeyebilir 
    return phoneBook.get(name);
  };

  public func getMessage(senderPhone: Phone): async ?Message {
    return MessageHistory.get(senderPhone);
  };

}
