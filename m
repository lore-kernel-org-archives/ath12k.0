Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A3E77180
	for <ath12k@archiver.kernel.org>; Wed, 11 Dec 2024 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYdyRPCsyRsF60IkhvQfZ3+q4JsVYTIPwCtwvyP/sUg=; b=E/QDs3jJWM43zJv7KFnH5Mn4ys
	0loXKNbWln3Y2bX0mMbow9kKqenlEOi8uo45qc3uvFvu+rfoyfleRP2Yhs8Qe5RR2lJyopjSypemm
	ry5nbyaLicQOXxNvXmNb5R86aPPHvmfOQ7PmllVsCHdI+Tm2efbcTru5A/SfA9jo2Rnir5Pfuv2Cn
	fRxjzuJKAm+HQQphshBYoJUX51fS4vB82SLDtaik67VcgDFnXa/0ZKBzvaDcmRcZWTqWIQ4p2lb0H
	R2OCQssgQ5VyB6wK/H5avUvvHd0Qq6x2JREnC4d8cNHemA+s6Utesfxl3SrRQiX7ZrHk+pOVfhGVh
	tBiiOkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOja-0000000FGvG-3LJw
	for ath12k@archiver.kernel.org;
	Wed, 11 Dec 2024 15:34:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOjY-0000000FGsU-2XzE
	for ath12k@lists.infradead.org;
	Wed, 11 Dec 2024 15:34:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A97145C6287
	for <ath12k@lists.infradead.org>; Wed, 11 Dec 2024 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1218C4CEDD;
	Wed, 11 Dec 2024 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931279;
	bh=ovfxJKKuAKObm63Zu7VlrOl+EmqKnRC/02p0uoNmAPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H3PBRCfdJ4ef17E+QolZQaLXf5Xaskkuv1D/BQRzTg0qly5/B8YWRoL45L2U1q8X0
	 MzDUuBJONAefhQxxB0MHoHCb2cduCNf0x9agvk4Ud4oqxoP8UDyXcvBF4cAmD8xBFj
	 cuijVDjsEKySUwtORPk383TijEk/PyPF1FGI3u7jkDue4ewJ6c72mKl1VsmTfoRogB
	 oK4HGusG/MCiD02eYhXrsE3TEtsUnLmlDKeJ10ygKdY9MnHmRrLeD0G7a3ahOy0nNP
	 CMnDcrinWKhKxQnTQI+EyzXWpvL+nu4r8zens3ZEOyL+c4JYtPMnXDHwjSAsKHi6KK
	 9WOqGXvv47gTg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] wifi: ath12k: send partner device details in QMI MLO capability
Date: Wed, 11 Dec 2024 17:34:27 +0200
Message-Id: <20241211153432.775335-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211153432.775335-1-kvalo@kernel.org>
References: <20241211153432.775335-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_073440_742470_E5E70CC3 
X-CRM114-Status: GOOD (  16.77  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, QMI MLO host capability is sent with the details of local links and
hw_link id only for particular device. But in the case of multi device group
abstraction, it has to include the details of hw_link_id, num_local_links of
every partner device that is involved in the group during QMI MLO capability
exchange. Add changes to send partner device details to the firmware in QMI MLO
capability exchange.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 88 ++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index ba3cd2342465..2f10c83ef54a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2016,17 +2016,19 @@ static const struct qmi_elem_info qmi_wlanfw_wlan_ini_resp_msg_v01_ei[] = {
 	},
 };
 
-static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
-				      struct qmi_wlanfw_host_cap_req_msg_v01 *req)
+static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
+				     struct qmi_wlanfw_host_cap_req_msg_v01 *req)
 {
 	struct wlfw_host_mlo_chip_info_s_v01 *info;
+	struct ath12k_hw_group *ag = ab->ag;
+	struct ath12k_base *partner_ab;
 	u8 hw_link_id = 0;
-	int i;
+	int i, j, ret;
 
-	if (!ab->ag->mlo_capable) {
+	if (!ag->mlo_capable) {
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "MLO is disabled hence skip QMI MLO cap");
-		return;
+		return 0;
 	}
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
@@ -2035,7 +2037,12 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "skip QMI MLO cap due to invalid num_radio %d\n",
 			   ab->qmi.num_radios);
-		return;
+		return 0;
+	}
+
+	if (ab->device_id == ATH12K_INVALID_DEVICE_ID) {
+		ath12k_err(ab, "failed to send MLO cap due to invalid device id\n");
+		return -EINVAL;
 	}
 
 	req->mlo_capable_valid = 1;
@@ -2043,27 +2050,74 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_chip_id_valid = 1;
 	req->mlo_chip_id = ab->device_id;
 	req->mlo_group_id_valid = 1;
-	req->mlo_group_id = 0;
+	req->mlo_group_id = ag->id;
 	req->max_mlo_peer_valid = 1;
 	/* Max peer number generally won't change for the same device
 	 * but needs to be synced with host driver.
 	 */
 	req->max_mlo_peer = ab->hw_params->max_mlo_peer;
 	req->mlo_num_chips_valid = 1;
-	req->mlo_num_chips = 1;
+	req->mlo_num_chips = ag->num_devices;
 
-	info = &req->mlo_chip_info[0];
-	info->chip_id = ab->device_id;
-	info->num_local_links = ab->qmi.num_radios;
+	mutex_lock(&ag->mutex);
 
-	for (i = 0; i < info->num_local_links; i++) {
-		info->hw_link_id[i] = hw_link_id;
-		info->valid_mlo_link_id[i] = 1;
+	for (i = 0; i < ag->num_devices; i++) {
+		info = &req->mlo_chip_info[i];
+		partner_ab = ag->ab[i];
 
-		hw_link_id++;
+		if (partner_ab->device_id == ATH12K_INVALID_DEVICE_ID) {
+			ath12k_err(ab, "failed to send MLO cap due to invalid partner device id\n");
+			ret = -EINVAL;
+			goto device_cleanup;
+		}
+
+		info->chip_id = partner_ab->device_id;
+		info->num_local_links = partner_ab->qmi.num_radios;
+
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "mlo device id %d num_link %d\n",
+			   info->chip_id, info->num_local_links);
+
+		for (j = 0; j < info->num_local_links; j++) {
+			info->hw_link_id[j] = hw_link_id;
+			info->valid_mlo_link_id[j] = 1;
+
+			hw_link_id++;
+		}
 	}
 
+	if (hw_link_id <= 0)
+		ag->mlo_capable = false;
+
 	req->mlo_chip_info_valid = 1;
+
+	mutex_unlock(&ag->mutex);
+
+	return 0;
+
+device_cleanup:
+	for (i = i - 1; i >= 0; i--) {
+		info = &req->mlo_chip_info[i];
+
+		memset(info, 0, sizeof(*info));
+	}
+
+	req->mlo_num_chips = 0;
+	req->mlo_num_chips_valid = 0;
+
+	req->max_mlo_peer = 0;
+	req->max_mlo_peer_valid = 0;
+	req->mlo_group_id = 0;
+	req->mlo_group_id_valid = 0;
+	req->mlo_chip_id = 0;
+	req->mlo_chip_id_valid = 0;
+	req->mlo_capable = 0;
+	req->mlo_capable_valid = 0;
+
+	ag->mlo_capable = false;
+
+	mutex_unlock(&ag->mutex);
+
+	return ret;
 }
 
 /* clang stack usage explodes if this is inlined */
@@ -2113,7 +2167,9 @@ int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
 		req.nm_modem |= PLATFORM_CAP_PCIE_GLOBAL_RESET;
 	}
 
-	ath12k_host_cap_parse_mlo(ab, &req);
+	ret = ath12k_host_cap_parse_mlo(ab, &req);
+	if (ret < 0)
+		goto out;
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,
 			   qmi_wlanfw_host_cap_resp_msg_v01_ei, &resp);
-- 
2.39.5


