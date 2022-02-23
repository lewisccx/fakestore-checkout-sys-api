%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "title": "item1, item2, item3",
  "price": "321321",
  "purchased_date": "2020-10-10",
  "created_by": "Henry Soh",
  "_id": {
    "\$oid": "6215e4ac60edb256ac803e4e"
  }
})