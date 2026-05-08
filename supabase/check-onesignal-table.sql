-- Check if onesignal_subscriptions table exists
SELECT 
  CASE 
    WHEN EXISTS (
      SELECT 1 FROM information_schema.tables 
      WHERE table_schema = 'public' 
      AND table_name = 'onesignal_subscriptions'
    ) THEN '✅ TABLE EXISTS'
    ELSE '❌ TABLE DOES NOT EXIST - Run RUN_THIS_ONESIGNAL_MIGRATION.sql'
  END AS status;

-- If exists, check RLS policies
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies
WHERE tablename = 'onesignal_subscriptions'
ORDER BY policyname;

-- If exists, check row count
SELECT 
  'onesignal_subscriptions' AS table_name,
  COUNT(*) AS row_count
FROM onesignal_subscriptions;
