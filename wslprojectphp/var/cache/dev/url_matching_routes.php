<?php

/**
 * This file has been auto-generated
 * by the Symfony Routing Component.
 */

return [
    false, // $matchHost
    [ // $staticRoutes
        '/posts' => [[['_route' => 'app_hello_getallposts', '_controller' => 'App\\Controller\\HelloController::getAllPosts'], null, ['GET' => 0], null, false, false, null]],
    ],
    [ // $regexpList
        0 => '{^(?'
                .'|/_error/(\\d+)(?:\\.([^/]++))?(*:35)'
                .'|/posts/(?'
                    .'|([^/]++)(*:60)'
                    .'|new(*:70)'
                    .'|update/([^/]++)(*:92)'
                    .'|delete/([^/]++)(*:114)'
                .')'
            .')/?$}sDu',
    ],
    [ // $dynamicRoutes
        35 => [[['_route' => '_preview_error', '_controller' => 'error_controller::preview', '_format' => 'html'], ['code', '_format'], null, null, false, true, null]],
        60 => [[['_route' => 'app_hello_getpostsfiltered', '_controller' => 'App\\Controller\\HelloController::getPostsFiltered'], ['type'], ['GET' => 0], null, false, true, null]],
        70 => [[['_route' => 'app_hello_addnewpost', '_controller' => 'App\\Controller\\HelloController::addNewPost'], [], ['POST' => 0], null, false, false, null]],
        92 => [[['_route' => 'app_hello_updatepost', '_controller' => 'App\\Controller\\HelloController::updatePost'], ['id'], ['PUT' => 0, 'PATCH' => 1], null, false, true, null]],
        114 => [
            [['_route' => 'app_hello_deletepost', '_controller' => 'App\\Controller\\HelloController::deletePost'], ['id'], ['DELETE' => 0], null, false, true, null],
            [null, null, null, null, false, false, 0],
        ],
    ],
    null, // $checkCondition
];
