/* ============================================================
   DONE – SupplyChain Schema Fully Populated
   ============================================================ */

/* ============================================================
   CREATE VIEWS
   ============================================================ */

-- Create a SQL view named SupplyChain.vw_SupplierRiskInsights
-- The view should join Suppliers and SupplierPerformance tables
-- Include SupplierName, OnTimeDeliveryRate, QualityScore, RiskScore
-- Add a computed column RiskCategory:
--   High Risk if RiskScore >= 40
--   Medium Risk if RiskScore between 20 and 39
--   Low Risk otherwise
-- Ensure proper joins using SupplierID
CREATE VIEW SupplyChain.vw_SupplierRiskInsights AS
SELECT 
    s.SupplierName,
    sp.OnTimeDeliveryRate,
    sp.QualityScore,
    sp.RiskScore,
    CASE 
        WHEN sp.RiskScore >= 40 THEN 'High Risk'
        WHEN sp.RiskScore BETWEEN 20 AND 39 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskCategory
FROM SupplyChain.Suppliers s
INNER JOIN SupplyChain.SupplierPerformance sp ON s.SupplierID = sp.SupplierID;

GO

