import CasesView from './components/cases_view.vue'
import CourtCaseView from './components/court_case_view.vue'
import NoticeView from './components/notice_view.vue'
import DocumentView from './components/document_view.vue'
import NoticesView from './components/notices_view.vue'

const routes = [
  { path: '/', component: CasesView, name: 'court_cases_index' },
  { path: '/notices', component: NoticesView, name: 'notices_index' },
  { path: '/cases/:slug', component: CourtCaseView, name: 'court_case_show' },
  { path: '/cases/:case_id/notices/:id', component: NoticeView, name: 'court_case_notice_show' },
  { path: '/cases/:case_id/notices/:notice_id/documents/:id', component: DocumentView, name: 'court_case_notice_document_show' },
]

export default routes
