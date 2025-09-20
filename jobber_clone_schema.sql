-- jobber_clone_schema.sql

-- ==========================================
-- 1. List all tables in the public schema
-- ==========================================
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- ==========================================
-- 2. Check that totals in quotes/invoices
--    are defined as numeric(12,2)
-- ==========================================
SELECT table_name, column_name, data_type, numeric_precision, numeric_scale
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('quotes', 'invoices')
  AND column_name = 'total';

-- ==========================================
-- 3. Confirm updated_at triggers exist
-- ==========================================
SELECT event_object_table AS table_name, trigger_name
FROM information_schema.triggers
WHERE trigger_name LIKE '%_set_updated_at'
ORDER BY table_name;
