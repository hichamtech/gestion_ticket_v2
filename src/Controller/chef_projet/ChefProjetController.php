<?php

namespace App\Controller\chef_projet;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

use App\Entity\Ticket;
use App\Form\AssignerTechnicienType;
use App\Form\ValiderTicketType;
use App\Repository\TicketRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * @Route("espace_chef_projet")
 */
class ChefProjetController extends AbstractController
{

    /**
     * @Route("/dash", name="dash_chef_projet")
     */
    public function index(TicketRepository $ticketRepository): Response
    {
        $this->denyAccessUnlessGranted('ROLE_CHEF_PROJET');

        return $this->render('chef_projet/index.html.twig', [
            'tickets' => $ticketRepository->findAll(),
        ]);
    }


    /**
     * @Route("assigner/{id}", name="assigner_technicien", methods={"GET","POST"})
     */
    public function  assigner(Request $request, Ticket $ticket): Response
    {
        $this->denyAccessUnlessGranted('ROLE_CHEF_PROJET');

        $form = $this->createForm(AssignerTechnicienType::class, $ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('dash_chef_projet');
        }

        return $this->render('chef_projet/assigner.html.twig', [
            'ticket' => $ticket,
            'form' => $form->createView(),
        ]);
    }
    /**
     * @Route("valider/{id}", name="valider_ticket", methods={"GET","POST"})
     */
    public function  valider(Request $request, Ticket $ticket): Response
    {
        $this->denyAccessUnlessGranted('ROLE_CHEF_PROJET');

        $form = $this->createForm(ValiderTicketType::class, $ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('dash_chef_projet');
        }

        return $this->render('chef_projet/valider.html.twig', [
            'ticket' => $ticket,
            'form' => $form->createView(),
        ]);
    }
}
