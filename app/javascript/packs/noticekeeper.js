import Mock from '../mock'

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.get_court_cases()
  }

  static getCourtCase(case_id) {
    return Noticekeeper.get_court_case(case_id)
  }

  static getCourtCaseNotices(case_id) {
    return Noticekeeper.get_court_case_notices(case_id)
  }

  static mock(response, delay = 50) {
    var promise = new Promise(function (resolve, reject) {
      setTimeout(function () {
        resolve(response);
      }, delay)
    });

    return promise;
  }

  static get_court_cases() {
    var promise = new Promise( (resolve, reject) => {
      fetch('/api/cases').then((response) => {
        return response.json()
      }).then( (cases) => {
        resolve(cases["court_cases"])
      })
    })

    return promise
  }

  static get_court_case(case_id) {
    var promise = new Promise( (resolve, reject) => {
      fetch(`/api/cases/${case_id}`).then((response) => {
        return response.json()
      }).then( (court_case) => {
        resolve(court_case["court_case"])
      })
    })

    return promise
  }

  static get_court_case_notices(case_id) {
    var promise = new Promise( (resolve, reject) => {
      fetch(`/api/cases/${case_id}/notices`).then((response) => {
        return response.json()
      }).then( (notices) => {
        resolve(notices["notices"])
      })
    })

    return promise
  }
}

export default Noticekeeper