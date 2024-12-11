Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CAEE7717D
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwxRWUD3lKRK8APNwB1qj2dNsY79jkuW0CkQvp4UL3Y=; b=hkFhTgjrDRy6hqrbha1Qs+saKn
	+KFUChaUCtkjYQJieeTLh7Er7ZqMt2BoGpKpo7ko6y6XswjaH0mgnbuoqidBa4V8vUcRMBTzqD4Kk
	54UuOa/8XHRf7r/wl5vw4Jf5osUwByRa0vaM/UHND83lJQX0r2IxVYhM4G33qZW1n96z8NeJv9d1E
	2JMuA/2GwRcNUaXxxq+zKd4RvTuwJj/ZoQ5rikrfoLfNFWZb676BPFMNmmnyApzeirY8kKYCi7HZM
	d8bfOtf8QO3gI3rVK44J52TbgbYwK0HwH5CJX6LnFQQ90bJK4FkBXQuoqD2wfE/lV7Ys0S0YLGYEn
	4nE1JDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsj-0000000FJ2A-3reU
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:44:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOsg-0000000FIyX-46lY
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:44:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10B985C5846
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20E4C4CED4;
	Wed, 11 Dec 2024 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931846;
	bh=7mKNlD/JX6tFo+pUM3mK0HTaLKCi/W316Selsy7IXGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbiU8mACVVCnsAl9vrxjdbZRgm11ISXKZscoIwm+0sANU6DJf6qpHb5AHVtz2vclV
	 iH2kRidbSszQovCFdd1QYr8K+9UTv0dWYCm1fwDxyKniaaFETOW8zmfTayj3XhusCG
	 o2jE97RARQzLnZ/VnuIinG7Q8RP7w+RH2XRR6BwdZdTtgfJ+s38tGxW8HhGhRBh49P
	 e3JFBZbjwriUIudMnlHEpj4IBD1NK5dvFCfVEep3I55JaJHx8nU0o16O3bMGVY3G95
	 VDtsuAxos8zU+Cn4DpuosX/dIAfpO+K5oyWnjATVZL9aE30a8UYFZ6Zk720jFAIzkQ
	 w0HD4JXg/mxEw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 5/7] wifi: ath12k: add ATH12K_FW_FEATURE_MLO capability firmware feature
Date: Wed, 11 Dec 2024 17:43:56 +0200
Message-Id: <20241211154358.776279-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074407_102965_407FEB49 
X-CRM114-Status: GOOD (  15.77  )
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

To maintain backward compatibility with older firmware versions, introduce a
new feature bit, ATH12K_FW_FEATURE_MLO, to identify whether the firmware
supports MLO. If the firmware-X.bin does not have this bit advertised in the
feature, then MLO capability in the host will be disabled.

This applies only for QCN9274 chipsets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 34 +++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/fw.h   |  3 +++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ff79cb910523..0c6b35aac96e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1782,6 +1782,9 @@ static int ath12k_core_hw_group_create(struct ath12k_hw_group *ag)
 
 void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 {
+	struct ath12k_base *ab;
+	int i;
+
 	lockdep_assert_held(&ag->mutex);
 
 	/* If more than one devices are grouped, then inter MLO
@@ -1790,10 +1793,35 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 	 * Only when there is one device, then it depends whether the
 	 * device can support intra chip MLO or not
 	 */
-	if (ag->num_devices > 1)
+	if (ag->num_devices > 1) {
 		ag->mlo_capable = true;
-	else
-		ag->mlo_capable = ag->ab[0]->single_chip_mlo_supp;
+	} else {
+		ab = ag->ab[0];
+		ag->mlo_capable = ab->single_chip_mlo_supp;
+
+		/* WCN chipsets does not advertise in firmware features
+		 * hence skip checking
+		 */
+		if (ab->hw_params->def_num_link)
+			return;
+	}
+
+	if (!ag->mlo_capable)
+		return;
+
+	for (i = 0; i < ag->num_devices; i++) {
+		ab = ag->ab[i];
+		if (!ab)
+			continue;
+
+		/* even if 1 device's firmware feature indicates MLO
+		 * unsupported, make MLO unsupported for the whole group
+		 */
+		if (!test_bit(ATH12K_FW_FEATURE_MLO, ab->fw.fw_features)) {
+			ag->mlo_capable = false;
+			return;
+		}
+	}
 }
 
 int ath12k_core_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/fw.h b/drivers/net/wireless/ath/ath12k/fw.h
index 3ff041f15fa0..273c003eff3b 100644
--- a/drivers/net/wireless/ath/ath12k/fw.h
+++ b/drivers/net/wireless/ath/ath12k/fw.h
@@ -23,6 +23,9 @@ enum ath12k_fw_features {
 	 */
 	ATH12K_FW_FEATURE_MULTI_QRTR_ID = 0,
 
+	/* The firmware supports MLO capability */
+	ATH12K_FW_FEATURE_MLO,
+
 	/* keep last */
 	ATH12K_FW_FEATURE_COUNT,
 };
-- 
2.39.5


