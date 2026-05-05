Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE281CD3439
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRjGmSXnfyqa5TGEncOZBsbYdyG6uICmkKgL4DXNmjQ=; b=LJqyZoDFn5gRH+daZ8ykEOPdMb
	sqLAJKPK1FTZJY0c4uuT3JiJd8vdlvs15Urc3qKVKqREqHoX9W/Q11Flt1iRqyLOIudDzI1t9Bk98
	iomwIq6ocON49oJ1L0vK9uXTvTBCuolanrUg2JO6whD/N3Iv1l+Fev2Vv/pFEYPufY+hL5wvCGRJi
	bA3fRYBRvjKEc/1JPhlIgLGCowrzzRJvxsssimHGKi4EhX2VgnKTZ3czGXY5Bn54Lk4QmYq/oySQb
	ndL3hNY70eH73jMTNr0UbMFHASj9LgB6YJmv4oJdbaIIzF8wf48WB6XbrKHoBWLli5pfviw7bl3RR
	pDKfYGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJVk-0000000H32S-1xBG;
	Tue, 05 May 2026 17:24:44 +0000
Received: from mail.mokrynskyi.com ([65.109.39.229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJVh-0000000H30u-3hk2
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 17:24:43 +0000
From: Nazar Mokrynskyi <nazar@mokrynskyi.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mokrynskyi.com;
	s=dkim; t=1778001876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRjGmSXnfyqa5TGEncOZBsbYdyG6uICmkKgL4DXNmjQ=;
	b=L3ZfOOA1PdmLNse/2N0fpZS1uFo00roq2A4Vn2ExFte1N21poMOMyl2I03pPakUydzpi1O
	7zJG+/cW4KRDxhu3EGlA6Gt7tSHC16ed9CBo+uC0UTTaJdsBl9oRj916I/dA4WcJZ2YWY+
	g1pN9zGDJhwzka3wVZNL2M37LLjaf2DELWHrivyRSjw3ejft57xHp/1H3tbcyFdvOfAHbN
	DpzDXfPbjfq+Y/v3KF+j1sxwjJhLSu76cTR5LOKC6F/7bA/7NWQ3WyM40Zz9X7vA9FV31m
	rpI9Vk75BJhstcvG2TF3KBKk9wJhRxW1GeX39byh6IbeStA/+cuw+Ga5hm7t9w==
Authentication-Results: mail.mokrynskyi.com;
	auth=pass smtp.mailfrom=nazar@mokrynskyi.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	jeff.johnson@oss.qualcomm.com,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Tue,  5 May 2026 20:24:15 +0300
Message-ID: <20260505172415.566328-3-nazar@mokrynskyi.com>
In-Reply-To: <20260505172415.566328-1-nazar@mokrynskyi.com>
References: <20260505172415.566328-1-nazar@mokrynskyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: -----
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_102442_358676_FFCE7588 
X-CRM114-Status: GOOD (  11.35  )
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

The firmware may advertise direct buffer ring capabilities for module
IDs beyond what the driver currently knows about (WMI_DIRECT_BUF_MAX).
This happens with newer firmware versions that support additional ring
types not yet implemented in the driver.

The current code treats an unknown module_id as a fatal error, returning
-EINVAL and tearing down the entire driver initialization. This is
incorrect: the driver only needs to set up rings for types it uses
(SPECTRAL=0, CFR=1) and can safely ignore capability advertisements for
unknown types.

Change the unknown module_id handling to skip the entry with a debug
message rather than failing, allowing initialization to proceed.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nazar Mokrynskyi <nazar@mokrynskyi.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 484fdd3b1..0e776a8d8 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4814,10 +4814,10 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
 		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "Skipping unknown direct buf ring module id %d\n",
+				   le32_to_cpu(dma_caps[i].module_id));
+			continue;
 		}
 
 		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
@@ -4829,10 +4829,6 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	}
 
 	return 0;
-
-free_dir_buff:
-	ath12k_wmi_free_dbring_caps(ab);
-	return ret;
 }
 
 static void
-- 
2.43.0


