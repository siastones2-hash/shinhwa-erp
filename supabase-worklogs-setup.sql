-- 신화 ERP — 업무관리(WorkLog) 클라우드 테이블
-- Supabase Dashboard → SQL Editor 에서 이 파일 전체 실행 (1회)

CREATE TABLE IF NOT EXISTS public.erp_worklogs (
  id BIGINT PRIMARY KEY,
  module TEXT NOT NULL,
  data JSONB NOT NULL DEFAULT '{}'::jsonb
);

CREATE INDEX IF NOT EXISTS erp_worklogs_module_idx ON public.erp_worklogs (module);

ALTER TABLE public.erp_worklogs ENABLE ROW LEVEL SECURITY;

-- 기존 ERP 테이블과 동일하게 anon 키로 읽기/쓰기 허용 (운영 보안은 추후 강화)
DROP POLICY IF EXISTS "erp_worklogs_all" ON public.erp_worklogs;
CREATE POLICY "erp_worklogs_all" ON public.erp_worklogs
  FOR ALL USING (true) WITH CHECK (true);

COMMENT ON TABLE public.erp_worklogs IS '신화 ERP 업무관리: meeting/prod/order/monthly/grant';
