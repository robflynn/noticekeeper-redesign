import Mock from '../mock'
import '../stylesheets/noticekeeper.scss'

class Noticekeeper {
  static getCourtCases() {
    return Noticekeeper.mock(Mock.all_court_cases)
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