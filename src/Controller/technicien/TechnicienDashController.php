<?php

namespace App\Controller\technicien;

use App\Entity\Ticket;
use App\Form\MarquerAvancementType;
use App\Repository\TicketRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @Route("espace_technicien")
 */
class TechnicienDashController extends AbstractController
{
    /**
     * @Route("/dash", name="technicien_dash")
     */

    public function index(TicketRepository $ticketRepository, UserInterface $technicien): Response
    {
        $this->denyAccessUnlessGranted('ROLE_TECHNICIEN');

        return $this->render('technicien/index.html.twig', [
            'tickets' => $ticketRepository->findTicketByTechnicien($technicien),
        ]);
    }

    /**
     * @Route("/marquer/{id}", name="marquer_avancement", methods={"GET","POST"})
     */
    public function  marquerAvancement(Request $request, Ticket $ticket): Response
    {
        $this->denyAccessUnlessGranted('ROLE_TECHNICIEN');

        $form = $this->createForm(MarquerAvancementType::class, $ticket);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('technicien_dash');
        }

        return $this->render('technicien/marquer_avancement.html.twig', [
            'ticket' => $ticket,
            'form' => $form->createView(),
        ]);
    }
}
