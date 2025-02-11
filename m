Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB9BC02198
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 02:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Oa3Pz0t//cYNB/fGGI06gp+EWCDBZUXPJXgdkIf+Tpw=; b=pRhCv1JN+sYbKV0i3LC76yPlXK
	CAHkJdHovaDEtEjhzT1pqo5fuP+sde2uQJvL9JpwK+IzDxpahhA3TnpHC9l9uaSKzxLxZgN3kdJjA
	mM9rVUJ5Ob3/71zkNL3rjPLEARPP/olxJax/XZ4NMcuiiahMN+Gbk2oHLV5+GkiAt1R/EDkgq81fq
	vWEsMH5ME0msQO19tu030zc1TRfyr7o3OG2A/VeUoAcj8EZLogya2LZ9l4zAV9KWV89l9PrNUdM7P
	Xlsi06PyyRJX8Vp7XfYJxeDqQ861gMBfyTyL2fbXyw3os1Gq86t0kOkuZ55CHgDFhKLawvrNDmvRz
	7mhZF/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgLd-00000002Jt0-3wIZ
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 02:50:05 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgLR-00000002JpY-1qev
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 02:50:01 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YsQs61655z9swL;
	Tue, 11 Feb 2025 03:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739242186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Oa3Pz0t//cYNB/fGGI06gp+EWCDBZUXPJXgdkIf+Tpw=;
	b=b/CNz26pl/GmePFdgwcj+YTYk24EYTSjuR3dXDElCbweQaHZ3xSZSy2JcTx+Xubs3obY3K
	DziZutfThgZGF8vmLbnblorGubqAdQh+N+NEJGxLGRhofPhlc0h2657YGxxsUhZEdGTaXe
	aPhrCBmQ4/l8xE4GokM4Dl8E0zY9ZoLE6A8UamCQ/dE6VC9JZj28LTZlMiEyYCQUx9loPE
	94LLrVGDTbJbshPKba4eDPMTxhVKzTDY94l42ouT1cIbsc0iITHyEm1iPVGbePZ0FPrfw7
	XtDrKCDnlZvisMjVTWsTF7N06fYxM6AUBpNCz7Clk3Ho+81rchvRpajRmbv0wQ==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Mon, 10 Feb 2025 21:49:41 -0500
Subject: [PATCH v2] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAMS6qmcC/3WOQQ7CIBBFr9LMWsxArG1deQ/TBcIgEyNtAFHT9
 O5i9y7fS/7LXyBRZEpwahaIVDjxFCqoXQPG63AjwbYyKFQtKhyEzl6qu3gGDpyF7NsjOjtIgx3
 UzRzJ8XvrXcbKnlOe4mfLF/mz/0pFCim0Mz1i2x+6K50p1wOG7EtHm/ZmesC4rusXVHLVLbIAA
 AA=
X-Change-ID: 20250209-ath12k-uninit-18560fd91c07
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Harshitha Prem <quic_hprem@quicinc.com>, 
 Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=Rgy25EVL0wRf2teD4M9Ky3kJgd9pojM13fv9uCJKvCY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBLL2FkZlJmM3JKdHF6MTNMMXltdGJHODFNZEZiTnVxCjNPeGJseWFZQ0V6U1hNZjdv
 Zmw1UnlrTGd4Z1hnNnlZSXN2L0hPVzBoNW96RkhiK2RXbUNtY1BLQkRLRWdZdFQKQUNiQ0xzSHc
 zOUZ6cjZqT0pvR0dJTjV0WHhnYU90NHNFbTJVSzU5K1IzRkdndjZCQTNtcDVvd00wLy9kOXpsNw
 pNYmx6NnUvbTNJa09rZHFuN0pkdFc1ZlZjR1AzMWdNYlphUzltUUVwQ1U1Ygo9MjZRMQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4YsQs61655z9swL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_184954_818452_1A7C458C 
X-CRM114-Status: UNSURE (   8.53  )
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

There is a possibility for an uninitialized *ret* variable to be
returned in some code paths.

This explicitly returns 0 without an error. Also removes goto that
returned *ret* and simply returns in place.

Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1642337
Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
Changes in v2:
- Rewrite commit subject to include function
- put int ret; back at top of function declaration
- minor changes to description
- Link to v1: https://lore.kernel.org/r/20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com
---
 drivers/net/wireless/ath/ath12k/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0606116d6b9c491b6ede401b2e1aedfb619339a8..276f2ee553f4e3529abff14f2b9238ee0a78f45e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -920,12 +920,11 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
 			ar = &ah->radio[j];
 			ret = __ath12k_mac_mlo_ready(ar);
 			if (ret)
-				goto out;
+				return ret;
 		}
 	}
 
-out:
-	return ret;
+	return 0;
 }
 
 static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-ath12k-uninit-18560fd91c07

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


