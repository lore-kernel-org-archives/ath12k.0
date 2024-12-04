Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE391E77170
	for <ath12k@archiver.kernel.org>; Wed,  4 Dec 2024 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9eyYsXsjhxtFeSDi9eb1z5ZJNwhWhbs0TIt6dkTLwU=; b=nJ/teaCUi0/mm40M7NmwUwBzTy
	ssH2tMjFxBJD82I8dpK3YwgWzczzNP9o5UrfHLv8TWkJfmJjMsVxG3X8+OEwQ8mhk4dyNqsih72ys
	Agnu7/aZ8jDBnHAAgoNDHgkYRRS8NTsQ+utszI+/OljeH6gMM5ALUO6a+EHT8fwcjzLLRVFbwPAkp
	HIUT70bhXnKTiv0MT1VHSpMq4uhVe95rphVw2Hy6CwQKshLORLD+3c5mhV8EtXnJFq22Ah/kRYqDP
	kxNRrBXZKATBEb0uuZ8EYSIMM6Vc93crcI1d/hkGg+IqWJe0HtRBTF+/9NkF6xAm5FjOskGjmJjwI
	RDbV0PXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItPu-0000000DPeJ-22Wj
	for ath12k@archiver.kernel.org;
	Wed, 04 Dec 2024 17:44:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsIY-0000000DCRu-2TUy
	for ath12k@lists.infradead.org;
	Wed, 04 Dec 2024 16:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D7555C6F6F
	for <ath12k@lists.infradead.org>; Wed,  4 Dec 2024 16:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEF6C4CEDD;
	Wed,  4 Dec 2024 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329941;
	bh=1KYYy0zChNWRS9t83bRH1vuBONCPFVUq/ubaS1cNmg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NX/2GEibDlwpXchzlM/bFTyGQSvHxtkrO2Pu1L2QnFMdPb1v3FaBYdR05vLVK6UOj
	 1nwNCtQ2cTvGU4nw0JTJ851fuOpPNEdSgXY4CYuPHrBmyaW80RUBcEhtpN5xR2wgwc
	 vO9b+BZQAVfphTHAjvikN4hDKumcty6dlnwdAqrVlaCIKoPikK9gYwZKrB8KWxwSHv
	 9yPzglSSRJj1ZLZKSTWQcAKjF8tz89cb6LX5jJy97s2UeL6kWmgDzWWK/uWoIqf979
	 6VyTrsWHJCF130bSrYbB/A0Z9ATYsLcBC9ACxakHuVrPHY//8IdmZV8eNQAGAC0EQ4
	 9Wcpj1MP17+lw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 2/7] wifi: ath12k: rename mlo_capable_flags to single_chip_mlo_supp
Date: Wed,  4 Dec 2024 18:32:11 +0200
Message-Id: <20241204163216.433795-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204163216.433795-1-kvalo@kernel.org>
References: <20241204163216.433795-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_083222_717190_C0D2FD9D 
X-CRM114-Status: GOOD (  20.41  )
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

At present, the mlo_capable_flags in ath12k_base is used to indicate whether
the chip supports inter (QCN9274) or intra (WCN7850) chip MLO. However, it’s
possible that the chip supports neither, especially with older firmware
versions. Additionally, if intra chip MLO is not supported, inter chip MLO will
also be non-functional. Therefore, having two separate flags for this is
unnecessary.

Therefore, rename this flag to single_chip_mlo_supp. At the same time convert
it into a bool data type. Also, get rid of the enums defined earlier.

For the QCN9274 family of chipsets, this will be set only when firmware
advertises the support during the QMI exchange.

For the WCN7850 family of chipsets, since the event is not supported,
assumption is made that single chip MLO is supported.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h | 23 ++---------------------
 drivers/net/wireless/ath/ath12k/qmi.c  | 13 +++++--------
 3 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 4da147f7bfac..568c9b6e2c1c 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1325,7 +1325,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
 	ab->dev = dev;
 	ab->hif.bus = bus;
 	ab->qmi.num_radios = U8_MAX;
-	ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
+	ab->single_chip_mlo_supp = false;
 
 	/* Device index used to identify the devices in a group.
 	 *
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 9ddced140056..d93ba844f61d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -816,21 +816,6 @@ struct ath12k_soc_dp_stats {
 	struct ath12k_soc_dp_tx_err_stats tx_err;
 };
 
-/**
- * enum ath12k_link_capable_flags - link capable flags
- *
- * Single/Multi link capability information
- *
- * @ATH12K_INTRA_DEVICE_MLO_SUPPORT: SLO/MLO form between the radio, where all
- *	the links (radios) present within a device.
- * @ATH12K_INTER_DEVICE_MLO_SUPPORT: SLO/MLO form between the radio, where all
- *	the links (radios) present across the devices.
- */
-enum ath12k_link_capable_flags {
-	ATH12K_INTRA_DEVICE_MLO_SUPPORT	= BIT(0),
-	ATH12K_INTER_DEVICE_MLO_SUPPORT	= BIT(1),
-};
-
 /* Master structure to hold the hw data which may be used in core module */
 struct ath12k_base {
 	enum ath12k_hw_rev hw_rev;
@@ -996,12 +981,8 @@ struct ath12k_base {
 
 	const struct hal_rx_ops *hal_rx_ops;
 
-	/* mlo_capable_flags denotes the single/multi link operation
-	 * capabilities of the Device.
-	 *
-	 * See enum ath12k_link_capable_flags
-	 */
-	u8 mlo_capable_flags;
+	/* Denotes the whether MLO is possible within the chip */
+	bool single_chip_mlo_supp;
 
 	struct completion restart_completed;
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 20382b751829..efcf2dfac4ac 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2023,14 +2023,14 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	u8 hw_link_id = 0;
 	int i;
 
-	if (!(ab->mlo_capable_flags & ATH12K_INTRA_DEVICE_MLO_SUPPORT)) {
+	if (!ab->single_chip_mlo_supp) {
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "intra device MLO is disabled hence skip QMI MLO cap");
 		return;
 	}
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
-		ab->mlo_capable_flags = 0;
+		ab->single_chip_mlo_supp = false;
 
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "skip QMI MLO cap due to invalid num_radio %d\n",
@@ -2176,12 +2176,9 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
 		goto out;
 	}
 
-	if (resp.single_chip_mlo_support_valid) {
-		if (resp.single_chip_mlo_support)
-			ab->mlo_capable_flags |= ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-		else
-			ab->mlo_capable_flags &= ~ATH12K_INTRA_DEVICE_MLO_SUPPORT;
-	}
+	if (resp.single_chip_mlo_support_valid &&
+	    resp.single_chip_mlo_support)
+		ab->single_chip_mlo_supp = true;
 
 	if (!resp.num_phy_valid) {
 		ret = -ENODATA;
-- 
2.39.5


