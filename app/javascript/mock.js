const all_court_cases = [
  {
    id: 0,
    attorney: "AB",
    case_name: "Bob Client",
    case_number: "SC-19-1234",
    state: "SC",
    status: "open",
    notices: 21,
    total_claims: "123.45",
    last_activity: "yesterday"
  },
  {
    id: 1,
    attorney: "AB",
    case_name: "Billy Client",
    case_number: "SC-19-1234",
    state: "SC",
    status: "open",
    notices: 21,
    total_claims: "123.45",
    last_activity: "yesterday"
  },
  {
    id: 2,
    attorney: "QQ",
    case_name: "Herbert Herbertson",
    case_number: "SC-19-9534",
    state: "SC",
    status: "open",
    notices: 2,
    total_claims: "943.22",
    last_activity: "1 week ago"
  },
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

const court_case_get = (case_id) => {
  return {
    ...all_court_cases[case_id]
  }
}

export default {
  all_court_cases: all_court_cases,
  court_cases_index: court_cases_index,
  court_case_get: court_case_get,
}