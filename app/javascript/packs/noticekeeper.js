import Mock from '../mock'

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.get_court_cases()
  }

  static getCourtCase(case_id) {
    return Noticekeeper.mock(Mock.court_case_get(case_id))
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
        resolve(cases)
      })
    })

    return promise
  }
}

export default Noticekeeper