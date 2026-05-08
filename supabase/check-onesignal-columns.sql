-- Check columns of onesignal_subscriptions table
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'onesignal_subscriptions'
ORDER BY ordinal_position;
