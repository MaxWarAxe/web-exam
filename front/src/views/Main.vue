<script setup>
import Card from '@/components/Card.vue';
import { ref,watch,toRaw } from 'vue'
import { useRoute } from 'vue-router';
import { useCloned } from '@vueuse/core'
import axios from 'axios';
import getCoreUrl from '@/utils/getCoreUrl.js'

const props = defineProps({
    searchText : String
})
let items = ref([])
let itemsResult = ref([])
let searchRef = ref('')
let route = useRoute()

watch(()=>props.searchText,() => {
    searchRef.value = props.searchText
    console.log([...toRaw(items.value)])
    itemsResult.value = filterBySearch([...toRaw(items.value)],searchRef.value)
})

watch(route,()=>{
    console.log(route.path)
    getData(route.path)
})

const defaultCard = {
    type : "Тест",
    date : new Date(),
    img : 0,
    title: "Тест",  
    desc : "Тест2"
}

function getData(param){
    axios({
            method: 'get',
            url: getCoreUrl() + '/posts' + param,
            headers: {
                "Content-Type": "application/json",
            }
        })
    .then((response)=>{
        items.value = response.data
        for(let i = 0; i < items.value.length ;i++){
            items.value[i].date = new Date(items.value[i].date)  
        }
        itemsResult.value = [...items.value]
        console.log(response.data)
    })
}
getData('')
let sortValue = ref("default")
function applySort(){
    if(sortValue.value == "old"){
        itemsResult.value = items.value.sort(function(a,b){return a.date-b.date})
        return
    }
    if(sortValue.value == "new"){
        itemsResult.value = items.value.sort(function(a,b){return -(a.date-b.date)})
        return
    }
    if(sortValue.value == "default"){
        itemsResult.value = items.value
        return
    }
        
}




function filterBySearch(itemsToFilter,filterString){
    //console.log(itemsToFilter[0].title.search(filterString))
    return itemsToFilter.filter((item)=>filterFunc(item.title,filterString))
}
function filterFunc(item,string){
    if(item.search(string) == -1)
        return false;
    else
        return true;
}
</script>

<template>
    <div class="w-full">
        <header class="flex items-center">
            <div class="text-2xl font-bold">
                Все контакты
            </div>
            <div class="ml-auto mr-8 ">
                <select v-model="sortValue" @change="applySort" class="border-solid border-gray-500 border-1 rounded-md bg-white p-1" placeholder="По умолчанию">
                    <option value="default">По умолчанию</option>
                    <option value="new">Сначала новые</option>
                    <option value="old">Сначала старые</option>
                </select>
            </div>
        </header>
        <main class="grid gap-5 grid-cols-4 adapt3cols content-start pl-8">
            <Card v-if="items.length != 0" v-for="item in itemsResult" :type="item.type" :title="item.title" :desc="item.description" :image_path="item.imagePath" :date="item.date" :key="item"></Card>
        </main>
    </div>
    
</template>

<style scoped>
    header{
        height: 96px;
        width: 100%;
        padding: 32px;
        border: 1px;
    }
    .border-1{
        border-width: 1px;
    }
    @media (max-width:1800px) {
        .adapt3cols{
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
        
    }
    @media (max-width:1800px) {
        .adapt3cols{
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }
        
    }
    @media (max-width:1400px) {
        .adapt3cols{
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
        
    }
</style>