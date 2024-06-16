<script setup>
    import {ref} from 'vue'
    
    const emits = defineEmits(["emitSearch","event2"])
 

    function emitSearch(event){
        //alert(event.target.value);
        emits('emitSearch',event.target.value);
    }

</script>

<template>
    <div>
        <header class="p-6 h-full">
            <div class="flex mb-5">
                <img src="@/assets/icons/logo.svg" class="mr-4" alt="">
                <div class="mt-1 text-base font-bold text-gray-700 ">Вариант</div>
            </div>
            <input @input="emitSearch" @click="function1" class="border-1 mb-5 border-solid border-gray-300 rounded-md p-1" type="text" placeholder="Поиск..">
            <ul>
                <li><RouterLink class="act"  to="all">Все новости</RouterLink></li>
                <li><RouterLink class="act" to="sport">Спорт</RouterLink></li>
                <li><RouterLink class="act" to="social">Общество</RouterLink></li>
                <li><RouterLink class="act" to="economy">Экономика</RouterLink></li>
            </ul>
        </header>
    </div>
   
</template>

<style scoped>
    header{
        width: 280px;
    }
    .border-1{
        border-width: 1px;
    }
    .li:active{
        font:bold;
    }
    .act:focus{
        font-size: large;
        font-weight: bold;
    }
</style>