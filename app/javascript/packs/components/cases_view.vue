<template>
  <div>
    <table class="cases-list">
      <thead>
        <tr>
          <th></th>
          <th></th>
          <th>Name</th>
          <th>Case Number</th>
          <th>State</th>
          <th>Notices</th>
          <th>Claims</th>
          <th>Last Activity</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="(court_case, index) in court_cases" :key="court_case.id" :data-case-id="court_case.id">
          <td></td>
          <td></td>
          <td>{{ court_case.name }}</td>
          <td>{{ court_case.case_number }}</td>
          <td>{{ court_case.state }}</td>
          <td>{{ court_case.notices }}</td>
          <td>${{ court_case.total_claims }}</td>
          <td>{{ court_case.last_activity }}</td>
        </tr>
      </tbody>

      <tfoot>
        <tr>
          <th>Footer</th>
        </tr>
      </tfoot>
    </table>
  </div>
</template>

<script>
  import { mapState } from 'vuex'
  import Mock from '../../mock'

  export default {
    props: {},
    methods: {},
    computed: {
      ...mapState([
        'court_cases'
      ])
    },
  }
</script>