<template>
  <nav class="navbar">
    <div class="navbar__brand">
      NK
    </div>

    <div>
      {{ $mq }}
      </div>

    <ul class="navbar__menu">
      <li>
        <router-link to="/">Cases</router-link>
      </li>
      <li>Events</li>
      <li>Account</li>
    </ul>
  </nav>
</template>

<style scoped lang="scss">
.navbar {
  $navbarHeight: 50px;

  height: $navbarHeight;
  display: flex;
  flex-direction: column;
  justify-content: space-between;

  &__brand {
    background: white;
    width: 40px;
    height: 40px;
    margin: 0 auto;

    margin-top: 10px;
    margin-bottom: 10px;

    line-height: 40px;
    text-align: center;

    color: blue;
    font-weight: bold;
  }

  &__menu {
    $menuPadding: 10px;
    $iconSize: 35px;
    align-content: right;

    display: flex;
    flex-direction: column;


    li {
      display: block;
      height: $iconSize;
      margin: $menuPadding;
      color: var(--nk-sidebar-text-color);
      font-family: 'helvetica', sans-serif;
      font-weight: 100;
      font-size: 0.8em;
      text-align: center;

      a {
        color: var(--nk-sidebar-text-color);
        text-decoration: none;

        &.router-link-active {
          color: red;
        }
      }
    }
  }
}
</style>

<script>
export default {
  name: "NavBar"
};
</script>