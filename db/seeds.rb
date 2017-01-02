home = Location.create({
  id: 1,
  street1: "123 Factoria BLVD",
  city: "Bellevue",
  state: "WA",
  zip: "98005"
})

work = Location.create({
  id: 2,
  street1: "123 Main st",
  city: "Seattle",
  state: "WA",
  zip: "98005"
})

Person.create({
  id: 1,
  first: "John",
  last: "Smith",
  phone: "206-555-1212",
  home_address: home,
  work_address: work,
})
