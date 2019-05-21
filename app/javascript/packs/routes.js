import CasesView from './components/cases_view.vue'
import CourtCaseView from './components/court_case_view.vue'

const routes = [  
  { path: '/', component: CasesView, name: 'court_cases_index' },
  { path: '/court_cases/:slug', component: CourtCaseView, name: 'court_cases_show' },
]

export default routes