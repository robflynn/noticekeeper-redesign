const all_court_cases = [
  {
    id: 1,
    attorney: "AB",
    name: "Bob Client",
    case_number: "SC-19-1234",
    state: "SC",
    status: "open",
    notices: 21,
    total_claims: "123.45",
    last_activity: "yesterday"
  },
  {
    id: 2,
    attorney: "AB",
    name: "Billy Client",
    case_number: "SC-19-1234",
    state: "SC",
    status: "open",
    notices: 21,
    total_claims: "123.45",
    last_activity: "yesterday"
  }
]

const court_cases_index = {
  pages: {
    count: 3,
    page: 1,
    per_page: 25,
    self: '/court_cases?page=1',    
    next: "/court_cases?page=2"
  },
  data: {
    ...all_court_cases    
  },
  status: "success",
}

export default {
  all_court_cases: all_court_cases,
  court_cases_index: court_cases_index,
}