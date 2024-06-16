<script setup>
import getCoreUrl from '@/utils/getCoreUrl';

    const props = defineProps({
        type : String,
        date : Date,
        image_path : String,
        title : String,
        desc : String,
    })
</script>

<template>
    <div class="container border-1 rounded-xl ">
        <div class="flex mb-3">
            <div class="text-slate-500">{{ type }}</div>
            <div class="ml-auto mr-0 text-slate-500">{{ date.toLocaleDateString('ru-RU')}}</div>
        </div>
        <img :src="getCoreUrl() + '/images/' + image_path" alt="" class="w-80 h-56 mb-3">
        <div class="text-2xl font-medium mb-3">{{ title }}</div>
        <div class="text-lg text-slate-700 font-normal overflow-ellipsis line-clamp-4">{{ desc }}</div>
    </div>
</template>

<style scoped>
    .container{
        padding: 24px;
        width: 370px;
        height: 600px;
    }
    .border-1{
        border-width: 1px;
        border: solid;
        border-color: rgb(166, 166, 166);
    }
</style>