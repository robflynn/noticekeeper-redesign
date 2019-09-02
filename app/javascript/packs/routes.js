import CasesView from './components/cases_view.vue'
import CourtCaseView from './components/court_case_view.vue'
import NoticeView from './components/notice_view.vue'

const routes = [
  { path: '/', component: CasesView, name: 'court_cases_index' },
  { path: '/court_cases/:slug', component: CourtCaseView, name: 'court_case_show' },
  { path: '/court_cases/:case_id/notices/:id', component: NoticeView, name: 'court_case_notice_show' },
  { path: '/court_cases/:case_id/notices/:notice_id/documents/:id', component: NoticeView, name: 'court_case_notice_document_show' },
]

export default routes