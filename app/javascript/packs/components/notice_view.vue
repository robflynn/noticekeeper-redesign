<template>
  <div>
    <section class="box">
      <h1>$$Notice Title$$ | Notification</h1>

      <div>

        <!-- metadata table -->
        <!-- TODO: Make me a component -->
        <table class="metadata">
          <tbody>
            <tr>
              <th scope="col">
                Case Name
              </th>
              <td>$$case_name$$</td>
            </tr>
            <tr>
              <th scope="col">
                Case Number
              </th>
              <td>$$case_number$$</td>
            </tr>
            <tr>
              <th scope="col">
                State
              </th>
              <td>$$state$$</td>
            </tr>
            <tr>
              <th scope="col">
                Document Number
              </th>
              <td>$$document_number$$</td>
            </tr>
            <tr>
              <th scope="col">
                Attorney
              </th>
              <td>$$attorney$$</td>
            </tr>
            <tr class="full">
              <td colspan="2">
                $$body$$
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <section class="box">
      <h1>Documents | Upload</h1>

      <div>
        <DocumentList>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
          <div class="col document">
            <img style="width: 140px; height: 175px;"/>

            <button>Download</button>
          </div>
        </DocumentList>
      </div>
    </section>

  </div>
</template>

<script>
  export default {}
</script>