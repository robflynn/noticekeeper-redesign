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

  static getNotice(case_id, notice_id) {
    return Noticekeeper.get_court_case_notice(case_id, notice_id)
  }

  static getDocuments(case_id, notice_id) {
    return Noticekeeper.get_court_case_notice_documents(case_id, notice_id)
  }

  static getDocument(case_id, notice_id, document_id) {
    return Noticekeeper.get_court_case_notice_document(case_id, notice_id, document_id)
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

  static get_court_case_notice(case_id, notice_id) {
    var promise = new Promise( (resolve, reject) => {
      fetch(`/api/cases/${case_id}/notices/${notice_id}`).then((response) => {
        return response.json()
      }).then( (court_case) => {
        resolve(court_case["notice"])
      })
    })

    return promise
  }

  static get_court_case_notice_documents(case_id, notice_id) {
    var promise = new Promise( (resolve, reject) => {
      fetch(`/api/cases/${case_id}/notices/${notice_id}/documents`).then((response) => {
        return response.json()
      }).then( (notices) => {
        resolve(notices["documents"])
      })
    })

    return promise
  }

  static get_court_case_notice_document(case_id, notice_id, document_id) {
    var promise = new Promise( (resolve, reject) => {
      fetch(`/api/cases/${case_id}/notices/${notice_id}/documents/${document_id}`).then((response) => {
        return response.json()
      }).then( (document) => {
        resolve(document["document"])
      })
    })

    return promise
  }
}

export default Noticekeeper
