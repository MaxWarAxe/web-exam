<script setup>
    import { RouterLink, RouterView } from 'vue-router'
    import SidePanel from './views/SidePanel.vue';
    import Main from './views/Main.vue';
    import {ref} from 'vue'
    
    let searchTextValue = ref('')

    function changeSearchValue(searchText){
        searchTextValue.value = searchText;
    }
</script>

<template>
  <div class="h-svh w-svw flex">
    <SidePanel  @emit-search="changeSearchValue" class=""></SidePanel>
    <Main :search-text="searchTextValue" class=""></Main>
    <!-- <RouterView :search-text="searchTextValue"></RouterView> -->
  </div>
  
</template>

<style scoped>

</style>
