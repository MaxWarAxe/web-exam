import { createRouter, createWebHistory } from 'vue-router'
import Main from '@/views/Main.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {path:"/all",component: Main},
    {path:"/sport",component: Main},
    {path:"/social",component: Main},
    {path:"/economy",component: Main},
    
  ]
})

export default router
