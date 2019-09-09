<template>
  <nav class="navbar">
    <div class="navbar__brand">
      NK
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

  background: var(--nk-navbar-color);

  height: $navbarHeight;
  display: flex;
  flex-direction: row;
  justify-content: space-between;

  padding-left: 35px;
  padding-right: 35px;

  &__brand {
    background: white;
    width: 40px;
    height: 40px;
    margin: 4px;
    line-height: 40px;
    text-align: center;
    color: blue;
    font-weight: bold;
  }

  &__menu {
    $menuPadding: 10px;
    align-content: right;

    display: flex;
    flex-direction: row;

    li {
      line-height: $navbarHeight - ($menuPadding * 2);
      margin: $menuPadding;
      color: var(--nk-navbar-text-color);

      a {
        color: var(--nk-navbar-text-color);
        text-decoration: none;
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