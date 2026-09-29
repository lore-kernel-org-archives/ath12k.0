Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333CCA5FA1
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 02:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjnvcjGV1fxpLT6EIE5odbTgRtwNmnowIubP3qX9FiY=; b=135FLJ20toZqyy51BYkqdkLRib
	ffLbiItR3+jt4S2Jx5p0Y6I9NJXMjVRDKnsjuFsM4ROG50fAUEuHCuaS7Z6tiWAVdDR/g62IpS6hC
	8xD65ILBh+cZagUV0/Qo02GHtR2VdKJkw0NIby+EJ1VevGG4o/4GBatzeG/C5XTleoGwNbR0unoJE
	KRnarxup2449PrONeAP0s5elktrQYC5XReJL69dCweVJ3Tolgn3Apphbxpbdo+B6Hp4ckkrsAKLmV
	1VHQKl4aEqTspsnPbItbP9cn/8dsksbm2BiDy0XdnPSE1owZCFNkoVCABEDH3usd+kLzrwvYaRhOd
	ADniHXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBO3f-00000002A61-17K1;
	Tue, 29 Sep 2026 02:59:07 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBO3d-00000002A5G-0DMV
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 02:59:06 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-3396cec93b6so4335272eec.3
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790650744; x=1791255544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjnvcjGV1fxpLT6EIE5odbTgRtwNmnowIubP3qX9FiY=;
        b=LFFMXsKiBcvJWUnROK3qVU930eTaxjeJu9ZhrHjrJuUlXsqIFVRIw6wEKuRaq2b8Yg
         mkhfFOlvCwA1moQdboRNBD05L3hzw4aicxt71HTJuh3UvtYqdvvbyTIZP9oG3Z2IhRTA
         zxie3xiBiveFXV5vbLCKFonNmqNrDAFwtOxrGd3cnLMCfHBCP900qijVB5SvhbSRO7cA
         aMqm7/j69oTysCAM4L3e700+smoT9U3Uv1lyZH71QeYSNlilFTrYFBZx2/ks27c1vlOU
         hnDeSdgCTQ4nleGigl/0pWCRZhVCfnO4vJHroFR8ChEp9IAbYUteHjeiFHxifwcQVfUh
         BQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790650744; x=1791255544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjnvcjGV1fxpLT6EIE5odbTgRtwNmnowIubP3qX9FiY=;
        b=bEo+uEWu1S61eQPsppt6jeALkEsVNH26ssNQJhNsJC+B5t5Mn4HtHfYLstLtjCHOYj
         gG9OdOQFD7BvHRKI51FljW3C6KEEmFEOToZ17ba+JaIuIYZFmX6/49z7M5Ne180iQxul
         YaYzaWD7ue5BPyvViuKGxIVL5fs2NkUjKrjngBuKZu8Sx8/h9jhcELzUlee1Dqc9dxnE
         V2Q9PgXi6MB+bpXeWcqkalLR7qOhGwUh4j6x20o4Bb3+XTzqYsZokahXU76hZh5y9Sp0
         jirz4oAsgIdz8M2LGt8Y+0Pc+zYRj0XL4VpeBFLmSHA5eK5L6D68DhIMS7StRcHn3rbe
         1srA==
X-Forwarded-Encrypted: i=1; AKwUvBwQUqLpRuJrDYsz/OFpXgGuvC/LmV5K7KDjVTkE6eR2llH0bnjeiY0u4pZX93reIGSZ2kQRRS4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLprZ5Z+1e8oKyFYHj6O77ETMl5Cy4dyJBv4JLXmt9i70nSAy97
	8cXNwTdolWEhM7BhjwDIdLe9kd5mjIrFdizo6Pw7UouD3KD09YfH9UiF4y6E8pKykbQ=
X-Gm-Gg: AYBFou3IFJWj8WGUQDI8I3CS+X3gXrkeoLLpGrk1042cEwGME9hJdwaLYFIPVHnVUQS
	87D6CcH4FIYAjFjYpEsMr9pCRuUyR+2HboDusMlSP9i5+xymoDm1z+gD5erz6HvHPcI5p/t1kdw
	SN+Bs8sSZHqsTUPcvKqlEMgLIm3mmOPG1V//sN1xBtPrsmcWBtR7i3hvvklhMsoU0gvSKuqnWIU
	zwMOOmSsb2GiwxDdOUDqSOSNd63tyAHgafe49vvNi7t5gLNWTJPIT/owAKA/tNBc7a4n6hB/QeL
	5HZ9bV5dufgO86x+qa74MJwXxP2DNmZOV7Xyt0Voi2srnN/T1w8rMtVisFPHiR9dNYp9RgPxm/b
	cX5yfsyDfRpPJuSovHk2DwDAk2T7BcC+EFQsDvWof9s2TJ4QnWRdr4/nkuRAf1HcLIGamL2hw/R
	KFyhERI8SZ77xtgDXaI9uQj6MRcLUIf9g+XInfUG2hCY+849GHRlWkNj2qFBEb6kIA9ZQJkdiIg
	33mR7ibpWAiXBpuuN0Z6fNJcOOPrq+2MG9UMOrirMpziaU6iM8/ZKByIJwETPBxdb0DHNk=
X-Received: by 2002:a05:7300:e11c:b0:33e:633c:7f70 with SMTP id 5a478bee46e88-34272b3bbb7mr13637894eec.35.1790650744286;
        Mon, 28 Sep 2026 19:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34571658054sm13111683eec.8.2026.09.28.19.59.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 19:59:03 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_jjohnson@quicinc.com,
	Kalle Valo <quic_kvalo@quicinc.com>
Subject: [PATCH 6.6.y 2/2] wifi: ath12k: check M3 buffer size as well whey trying to reuse it
Date: Mon, 28 Sep 2026 22:58:54 -0400
Message-ID: <20260929025856.85683-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929025856.85683-1-artem@trailofbits.com>
References: <20260929025856.85683-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_195905_094397_61E78AD1 
X-CRM114-Status: GOOD (  19.11  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 05090ae82f44570fefddb4e1be1d7e5770d6de40 ]

Currently in recovery/resume cases, we do not free M3 buffer but
instead will reuse it. This is done by checking m3_mem->vaddr: if it
is not NULL we believe M3 buffer is ready and go ahead to reuse it.

Note that m3_mem->size is not checked. This is safe for now because
currently M3 reuse logic only gets executed in recovery/resume cases
and the size keeps unchanged in either of them.

However ideally the size should be checked as well, to make the code
safer. So add the check there. Now if that check fails, free old M3
buffer and reallocate a new one.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

[ Backport to 6.6.y: mapped the M3 size validation onto the target's
  older QMI allocation layout. ]

Fixes: 303c017821d8 ("wifi: ath12k: fix kernel crash during resume")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240425021740.29221-1-quic_bqiang@quicinc.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and wifi ath12k maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-40979. It also validates the reusable M3 buffer
size and reallocates an undersized buffer.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.6.y?

CVE: CVE-2024-40979
Upstream: 05090ae82f44570fefddb4e1be1d7e5770d6de40

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/net/wireless/ath/ath12k/qmi.c | 39 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7a9868dbab02d7..48d0043fcee93b 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2511,6 +2511,19 @@ static int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 	return ret;
 }
 
+static void ath12k_qmi_m3_free(struct ath12k_base *ab)
+{
+	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
+
+	if (!m3_mem->vaddr)
+		return;
+
+	dma_free_coherent(ab->dev, m3_mem->size,
+			  m3_mem->vaddr, m3_mem->paddr);
+	m3_mem->vaddr = NULL;
+	m3_mem->size = 0;
+}
+
 static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
@@ -2518,9 +2531,6 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 	char path[100];
 	int ret;
 
-	if (m3_mem->vaddr || m3_mem->size)
-		return 0;
-
 	fw = ath12k_core_firmware_request(ab, ATH12K_M3_FILE);
 	if (IS_ERR(fw)) {
 		ret = PTR_ERR(fw);
@@ -2530,6 +2540,17 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 		return ret;
 	}
 
+	/* In recovery/resume cases, M3 buffer is not freed, try to reuse that */
+	if (m3_mem->vaddr) {
+		if (m3_mem->size >= fw->size) {
+			release_firmware(fw);
+			return 0;
+		}
+
+		/* Old buffer is too small, free and reallocate */
+		ath12k_qmi_m3_free(ab);
+	}
+
 	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
 					   fw->size, &m3_mem->paddr,
 					   GFP_KERNEL);
@@ -2547,18 +2568,6 @@ static int ath12k_qmi_m3_load(struct ath12k_base *ab)
 	return 0;
 }
 
-static void ath12k_qmi_m3_free(struct ath12k_base *ab)
-{
-	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
-
-	if (!m3_mem->vaddr)
-		return;
-
-	dma_free_coherent(ab->dev, m3_mem->size,
-			  m3_mem->vaddr, m3_mem->paddr);
-	m3_mem->vaddr = NULL;
-}
-
 static int ath12k_qmi_wlanfw_m3_info_send(struct ath12k_base *ab)
 {
 	struct m3_mem_region *m3_mem = &ab->qmi.m3_mem;
-- 
2.39.5


