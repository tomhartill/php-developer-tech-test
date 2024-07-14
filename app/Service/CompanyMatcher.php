<?php

namespace App\Service;

class CompanyMatcher
{
    private $db;
    private $matches = [];

    public function __construct(\PDO $db) 
    {
        $this->db = $db;
    }

    // We pass the service as a filter parameter
    // @param array $filters - an array of filters to match against
    // @return bool - true if the query was successful
    public function match($filters = []): bool
    {

        $query = $this->db->prepare(
'SELECT companies.* 
FROM company_matching_settings 
JOIN companies ON company_matching_settings.company_id = companies.id
WHERE credits >= 0 
AND service = :service
AND type = :type
AND postcodes LIKE "%[\":postcode\"]%" 
AND bedrooms LIKE "%[\":bedrooms\"]%"
GROUP BY company_id
ORDER BY credits DESC'
        );
        $result = $query->execute($filters);
        $this->matches = $query->fetchAll();
        return $result;
        
    }

    public function pick(int $count)
    {
        
    }

    public function results(): array
    {
        return $this->matches;
    }

    public function deductCredits($company_id, $credits)
    {

    }
}
