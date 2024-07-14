<?php

namespace App\Controller;

use App\Service\CompanyMatcher;

class FormController extends Controller
{

    // Default service is property
    private $service = 'property';
    private $creditCost = 1;
    private $data = false;

    public function __construct()
    {
        //parent::__construct();
        if (isset($_REQUEST['service'])) {

            $this->setService($_REQUEST['service']);
        }
    }

    private function setService($service)
    {
        // explicitly check the service value in case of XSS
        // also set the credit cost based on the service
        switch ($_REQUEST['service']) {
            case 'conveyancing':
                $this->service = 'conveyancing';
                $this->creditCost = 2;
                break;
            default:
                $this->service = 'property';
                $this->creditCost = 1;
                break;
        }
    }

    public function index()
    {
        $this->render('home.twig');
    }

    // We call this method from a different route if we want a completely different form, for conveyancing for example.
    public function conveyancing()
    {
        $this->setService('conveyancing');
        $this->render('conveyancing.twig', [
            'service' => $this->service,
        ]);
    }

    public function property()
    {
        $this->setService('property');
        $this->render('property.twig', [
            'service' => $this->service,
        ]);
    }

    // we can use this method to submit the form for both routes, assuming the business logic stays the same
    // use a hidden input to determine the type of form
    public function submit()
    {

        if (isset($_POST[$this->service])) {
            $this->data = $_POST[$this->service];
        } else {
            header("Location: /{$this->service}");
            exit;
        }

        $matcher = new CompanyMatcher($this->db());

        $result = $matcher->match([
            "service"   => $this->service,
            "postcode"  => $this->data['postcode'],
            "bedrooms"  => $this->data['bedrooms'],
            "type"      => $this->data['type']
        ]);

        if ($result) {

            foreach ($matcher->results() as $company) {
                $matcher->deductCredits($company['id'], $this->creditCost);
            }
            $this->render('results.twig', [
                'matchedCompanies'  => $matcher->results(),
                'service' => $this->service
            ]);

        } else {
            // handle the error
            $this->render('error.twig', [
                //'error' => $matcher->error,
                'service' => $this->service,
            ]);
        }
    }
}