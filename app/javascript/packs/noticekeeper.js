import Mock from '../mock'
import './../stylesheets/noticekeeper.scss'

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.mock(Mock.court_cases_index)
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
}

export default Noticekeeper