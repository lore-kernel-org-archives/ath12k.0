Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A211C5516D
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1l1Ml/0NGtBw0kU7ylAMOOErlLCMwQ5fVYVbOOBxXB8=; b=QBlVbtFim+UaFfxLwKGy4Hu2Jp
	mzp1PZEjT0wpTb+AAYkY0XF7JBuky0Fqm+vP+JUWr1pyrjzmMXs34H+7e+YHUDvv6fHZIgIELH7Pe
	t+I88cmdSnJ/62vAt40XNT0RTKO0El4PzLzUf4bW6w2Xa0vTCjNEHxYYopOpIJLoN3ufB9Lp82R/y
	jPw4RSpWN0wlyblA/Fxeg5Chzqu/K90ClcWYNtdsv/m4aiRTSv+22F/Naz1Fs4DZfOCnur9qmmoRA
	5wRDrO8wVObb3pHPnmWm7MlRwBE/JO6H6Tnvk5pPGUqQS3I+O+c3efhaPsU/YsXmawmgc5PIvIST9
	G8KGu1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpn4V-0000000CaSl-355V;
	Fri, 31 Jul 2026 13:14:43 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpn4R-0000000CaO3-1Mqu
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 13:14:42 +0000
X-UUID: c0ff22c08ce111f1aa26b74ffac11d73-20260731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:aded6b5c-3c22-4da9-8893-f958090b16e4,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:4dd9054b96298054b1243f29e359b11a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c0ff22c08ce111f1aa26b74ffac11d73-20260731
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1253282149; Fri, 31 Jul 2026 21:14:25 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH ath-next] wifi: ath12k: shut down RootPD after ready timeout
Date: Fri, 31 Jul 2026 21:14:21 +0800
Message-Id: <20260731131421.3764136-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_061440_052881_35E1E73E 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

rproc_boot() takes a power reference when it succeeds. If the RootPD
fails to signal that it is ready, ath12k returns without balancing that
reference. The remote processor can remain powered after probe fails,
and later boot and shutdown calls operate with an unbalanced power count.

Call rproc_shutdown() before returning the timeout error to balance the
successful rproc_boot().

This unwind is only safe once RootPD boot is serialized across UserPDs.
Before commit c6ab3b1dfa3e ("wifi: ath12k: Share RootPD state across
UserPDs to avoid duplicate operations"), another UserPD could observe a
running RootPD and skip rproc_boot(), so it held no matching power
reference, and shutting down from a timing-out probe could power off a
RootPD that UserPD still needed. Older trees therefore need more than
this one-line change.

Fixes: 10a355ba6238 ("wifi: ath12k: Power up root PD")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
Not tested on hardware; no IPQ5332 AHB device was available.  The change
was verified by code inspection and a W=1 build of the affected object.

 drivers/net/wireless/ath/ath12k/ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 0fc55c9169e1a..39956a97fe915 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -955,6 +955,7 @@ static int ath12k_ahb_boot_root_pd(struct ath12k_base *ab)
 						ATH12K_ROOTPD_READY_TIMEOUT);
 	if (!time_left) {
 		ath12k_err(ab, "RootPD ready wait timed out\n");
+		rproc_shutdown(g_rproc_info->tgt_rproc);
 		return -ETIMEDOUT;
 	}
 

base-commit: 8b8202b2e31367434a5079a6faee31588e5b4aa4
-- 
2.25.1


