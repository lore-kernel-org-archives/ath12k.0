Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F82C44520
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UUCJTt3ezeE2ZttoyqQyymeOt5Cs9ru1e0vTNlAdMs=; b=EZNZLEcoAilNKmTdd5rOP/xn+z
	PT3FBjt00JUoad+Tmf5WM51ZAmFzoWW1i+B3M45BRLxaQWaZn8x07VBAmslqWBONpbzjZhF79Btc+
	dJ3xZoWDiB0JvBFuaSLlAxrymFYl20jFfWyMhNLyT7+acUmY5fErIY2IyFgVcPMMz03qBzJbLEQ3P
	0EXzQrqf+l1BidrhznzbWhDrW7d4QhbSrWOAjOmLNl1TyutvJMvHVEc6ccR6vuQvJopuoPo7AF69b
	Wx8plLQWai2jyWEGSDUUKMsrx8YNy4GO9uBoihX0vRjmb0aW5GSHsaGjo0sWmuSB6dYfmp12yXf69
	51Au0X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmv9-00000006fvl-2Hh1;
	Mon, 20 Jul 2026 12:16:31 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmv6-00000006fv6-1UkL
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 12:16:29 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <stian@pokerfj.es>)
	id 1wlmuw-00GPpW-Ac; Mon, 20 Jul 2026 14:16:18 +0200
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <stian@pokerfj.es>)
	id 1wlmuv-0006wl-TN; Mon, 20 Jul 2026 14:16:18 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1471791)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wlmuT-00FXfm-JJ;
	Mon, 20 Jul 2026 14:15:49 +0200
From: Stian Knudsen <stian@pokerfj.es>
To: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Stian Knudsen <stian@pokerfj.es>
Subject: [PATCH v2] wifi: ath12k: restore country code during resume
Date: Mon, 20 Jul 2026 14:09:13 +0200
Message-ID: <20260720120913.100604-1-stian@pokerfj.es>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
References: <df37460e-f8ba-4e11-b412-4aa8b17cd32e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_051628_415505_E0C772B6 
X-CRM114-Status: GOOD (  13.25  )
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

The country code configured before suspend is lost after resume:
the device is powered down in suspend_late and powered back up in
resume_early, so firmware reboots with its default regulatory
settings and the previously set country code is no longer applied.

On WCN7850 the firmware comes back in the world regulatory domain
(country 00) and takes ~7 seconds to rediscover the country code
from AP beacons, part of a ~16 second total delay before wifi
reconnects after resume.

Restore it by resending WMI_SET_CURRENT_COUNTRY_CMDID during resume
if a country code was set before suspend, i.e. when ar->alpha2 is
valid. This follows the same approach as ath11k commit 7f0343b7b871
("wifi: ath11k: restore country code during resume").

Note that only single_pdev_only devices support suspend/resume (see
ath12k_core_continue_suspend_resume()), so handling the first and
only pdev is sufficient.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Link: https://lore.kernel.org/r/-_iDJ_M5RrqACWB0qmtleg@pokerfj.es
Signed-off-by: Stian Knudsen <stian@pokerfj.es>
---
v2:
- Add Fixes tag, per Baochen's review comment.
- Link to v1: https://lore.kernel.org/r/20260717130254.36732-1-stian@pokerfj.es
---
 drivers/net/wireless/ath/ath12k/core.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -197,6 +197,7 @@ EXPORT_SYMBOL(ath12k_core_resume_early);

 int ath12k_core_resume(struct ath12k_base *ab)
 {
+	struct ath12k *ar;
 	long time_left;
 	int ret;

@@ -211,6 +212,26 @@ int ath12k_core_resume(struct ath12k_base *ab)
 		return -ETIMEDOUT;
 	}

+	/* So far only single_pdev_only devices can reach here,
+	 * so it is valid to handle the first, and the only, pdev.
+	 */
+	ar = ab->pdevs[0].ar;
+	if (ab->hw_params->current_cc_support &&
+	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
+		struct wmi_set_current_country_arg arg = {};
+
+		memcpy(&arg.alpha2, ar->alpha2, 2);
+
+		reinit_completion(&ar->regd_update_completed);
+
+		ret = ath12k_wmi_send_set_current_country_cmd(ar, &arg);
+		if (ret) {
+			ath12k_warn(ab, "failed to set country code during resume: %d\n",
+				    ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(ath12k_core_resume);
--
2.50.0

