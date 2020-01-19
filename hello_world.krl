ruleset hello_world {
  meta {
    name "Hello World"
    description <<
A first ruleset for the Quickstart
>>
    author "Michael Black"
    logging on
    shares hello
  }
   
  global {
    hello = function(obj) {
      msg = "Hello " + obj;
      msg
    }
  }
   
  rule hello_world {
    select when echo hello
    send_directive("say", {"something": "Hello World"})
  }
  
  rule hello_monkey {
    select when echo monkey
    pre {
      attr = event:attr("name");
      name = attr.defaultsTo("Monkey");
      name_t = (attr == null || attr == "") => "Monkey" | attr;
    }
    send_directive("say", {"something": <<Hello #{name}>>})
  }
}
