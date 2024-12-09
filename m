Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959DE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il8B8eEoqVzSZ0g/VPFEGRUoxc3CcK6bPyqPlXtNvNQ=; b=GKD3vuCVY1EO3yn0J5x/7M2ftF
	hMlASWLQJplD/czz3ilH3ABVkRJWuDPwPJuhWm1YF1rCyw53udCU2VNibtyMHbDY4t+HV0WxgmyaD
	d4m77cK6shtwdC8p/e9Ffp2sU0VUZVcfqVPhuxj9osapR9hM2+VRLefIU5ku7Q+C1qfxqx9fq6m6p
	68iiM+mR9IANkIPD8Hjo2XrdQg6gcaZwRezSrpsxV0tKEZnUOhAZDcEcfLD/jOmxyQbAhQohUj9Rq
	q7UusSCtyOrV9fOkN+XK5JqOvW6S/yaBMtqq0FqHQFwTZLYWSpv143/kZ1+/fjRVyz/vvCuYxTZHy
	kthlJIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitv-00000008wGY-24vW
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 18:54:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKitr-00000008w92-1bmD
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 18:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A759F5C5FE9
	for <ath12k@lists.infradead.org>; Mon,  9 Dec 2024 18:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5948FC4CED1;
	Mon,  9 Dec 2024 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733770470;
	bh=xdzKbQAIakc5HvAhWpI0VR56QcfIfSr18ufmz5t3vSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jf3BO13e8fF30QuNSQH6ld3qJxrsDlno7ng883RDpihxT3M4LQaN8JvuYlGQpv1Zz
	 fvm31VpAQjvDvxfcLbdU0EVN8MKRIWZQ0N6Ux7xtN6gxDA8PYbKOSKhp9YDe7I/DQI
	 pdXRcL/P3Wbrn6JmNXjhuYf1clMv5/JGWaf3ZcsQTy0l4GbmTHwE7rKbyHchUklGth
	 GgEJJnWN4H/Nx3GTBFvklHdFGGoei4+yYUpPajerR1PXDxIkmlozof23ygUxs8avB8
	 jvVUbm/Y2+448ukZ++7vBMfV1ilHDCCR2HIEp+T/3XdZXX4+aHrUiY1limymI7ktcp
	 lrSQGkooSHlJg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 7/9] wifi: ath12k: fix ath12k_qmi_alloc_chunk() to handle too large allocations
Date: Mon,  9 Dec 2024 20:54:19 +0200
Message-Id: <20241209185421.376381-8-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209185421.376381-1-kvalo@kernel.org>
References: <20241209185421.376381-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_105431_476563_2C8CBCF1 
X-CRM114-Status: GOOD (  12.41  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

If the requested memory chunk is too large, an error message is logged, but the
request continues to be processed. However, no actual memory is allocated to
the firmware from this request. Instead, the firmware sends another request
with smaller chunks, where memory will be allocated accordingly. Therefore, it
is pointless to proceed with parsing the request if at least one of the
requests cannot be fulfilled.

Hence, return -EAGAIN immediately and proceed to process the new request.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index e7846aaca10a..964d350be748 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2497,7 +2497,7 @@ static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 				    chunk->size,
 				    chunk->type);
 			ath12k_qmi_free_target_mem_chunk(ab);
-			return 0;
+			return -EAGAIN;
 		}
 		ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
 			    chunk->type, chunk->size);
@@ -2600,6 +2600,14 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 
 	mutex_unlock(&ag->mutex);
 
+	/* The firmware will attempt to request memory in smaller chunks
+	 * on the next try. However, the current caller should be notified
+	 * that this instance of request parsing was successful.
+	 * Therefore, return 0 only.
+	 */
+	if (ret == -EAGAIN)
+		ret = 0;
+
 	return ret;
 }
 
-- 
2.39.5


