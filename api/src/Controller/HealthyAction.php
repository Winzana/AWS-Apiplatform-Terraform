<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

final class HealthyAction
{
    /**
     * @Route("/healthy", name="health-check")
     *
     * @return Response
     */
    public function __invoke(): Response
    {
        $response = new Response('200 OK');
        $response->headers->set('Content-Type', 'text/plain');

        return $response;
    }
}
