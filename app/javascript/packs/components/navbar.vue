<template>
  <nav class="navbar">
    <div class="navbar__brand">
      NK
    </div>

    <ul class="navbar__menu">
      <li>
        <router-link to="/">
          <svgicon icon="court_case" width="35" height="35" color="var(--nk-sidebar-text-color)"></svgicon>

          <span>Cases</span>
        </router-link>

        <a>
          <svgicon icon="events" width="35" height="35" color="var(--nk-sidebar-text-color)"></svgicon>

          <span>Events</span>
        </a>
      </li>
    </ul>
  </nav>
</template>

<style scoped lang="scss">
.navbar {
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

    color: var(--nk-sidebar-background);;
    font-weight: bold;
    font-size: 1.4em;
  }

  &__menu {
    $menuPadding: 10px;
    $iconSize: 35px;

    li {
      display: block;

      color: var(--nk-sidebar-text-color);

      font-family: 'helvetica', sans-serif;
      font-weight: 100;
      font-size: 0.8em;
      text-align: center;

      a {
        padding: $menuPadding;
        color: var(--nk-sidebar-text-color);
        text-decoration: none;
        width: 100%;
        height: 100%;
        display: block;

        span {
          display: block;
          margin-top: 8px;
        }

        &.router-link-active {
          color: #fff;
        }
      }
    }
  }
}
</style>

<script>
import '../../svg/court_case';
import '../../svg/events';

export default {
  name: "NavBar"
};
</script>