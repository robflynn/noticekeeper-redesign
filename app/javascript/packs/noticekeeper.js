import Mock from '../mock'
import '../stylesheets/noticekeeper.scss'

console.log(Mock.court_cases_index)

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.mock(Mock.court_cases_index)
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