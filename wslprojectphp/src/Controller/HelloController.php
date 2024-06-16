<?php

namespace App\Controller;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Post;
use Doctrine\ORM\Mapping\Entity;
use LDAP\Result;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;

class HelloController extends AbstractController
{
    private EntityManagerInterface $manager;
    private SerializerInterface $serializer;

    public function __construct(EntityManagerInterface $manager,SerializerInterface $serializer)
    {
        $this->manager = $manager;
        $this->serializer = $serializer;
    }

    #[Route('/posts',methods: ['get'])]
    public function getAllPosts(): Response
    {
        $posts = $this->manager->getRepository(Post::class)->findAll();

        #$response = $this->serializer->serialize($posts,'json');
      
        return $this->json($posts);
    }
    
    #[Route('/posts/{type}',methods: ['get'])]
    public function getPostsFiltered(string $type): Response
    {
        if($type == 'all')
            $posts = $this->manager->getRepository(Post::class)->findAll();

        if($type == 'sport')
            $posts = $this->manager->getRepository(Post::class)->findBy(['type'=>'Спорт']);

        if($type == 'social')
            $posts = $this->manager->getRepository(Post::class)->findBy(['type'=>'Общество']);

        if($type == 'economy')
            $posts = $this->manager->getRepository(Post::class)->findBy(['type'=>'Экономика']);

        #$response = $this->serializer->serialize($posts,'json');
      
        return $this->json($posts);
    }
    
    #[Route('/posts/new',methods: ['post'])]
    public function addNewPost(Request $request): Response
    {
        #var_dump($request);
        $request = $this->serializer->deserialize($request->getContent(),Post::class,'json');
        #var_dump($request);
        $this->manager->persist($request);
        $this->manager->flush();

        $response = new Response();
        $response->setStatusCode(201);

        return $response;
    }

    #[Route('/posts/update/{id}',methods: ['put','patch'])]
    public function updatePost(Request $request,int $id): Response
    {
        #var_dump($post);
        $request = $this->serializer->deserialize($request->getContent(),Post::class,'json');

        #var_dump($request);
        $post = $this->manager->getRepository(Post::class)->findOneBy(['id'=>$id]);
        
        $post->setTitle($request->getTitle());
        $post->setDescription($request->getDescription());
        $post->setDate($request->getDate());
        $post->setType($request->getType());
        $post->setImagePath($request->getImagePath());
        
        $this->manager->persist($post);
        $this->manager->flush();

        $response = new Response();
        $response->setStatusCode(204);

        return $response;
    }

    #[Route('/posts/delete/{id}',methods: ['delete'])]
    public function deletePost(int $id): Response
    {
        $post = $this->manager->getRepository(Post::class)->findOneBy(['id'=>$id]);
        
        $this->manager->remove($post);
        $this->manager->flush();

        $response = new Response();
        $response->setStatusCode(204);

        return $response;
    }
}
