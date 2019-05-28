import Mock from '../mock'

console.log(Mock.court_cases_index)

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.mock(Mock.court_cases_index)
  }

  static getCourtCase(case_id) {
    return Noticekeeper.mock(Mock.court_case_get)
  }

  static mock(response, delay = 200) {
    var promise = new Promise(function (resolve, reject) {
      setTimeout(function () {
        resolve(response);
      }, delay)
    });

    return promise;
  }
}

export default Noticekeeper