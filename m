Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7459C27C55
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 04:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bMJRPpvb0ZG+XcwI0xXpHHmUIF2KFoFfwzWBG5BP1Yg=; b=A9pOt0akVicSwKrwm2hCegO4Rf
	t+1iPj1CUb1zoKL2YVA+dPL4eIrXjmCOw90sM6fQr+LzUAm1iYXM0VUwJQS5a1s8ujwNSgTqUxThn
	lWs1brS3ct7EVBNzZOL7VtkGY810rTScK8i82/ViQL3v7D/YNkNOCGRpWqaeejZ32XQK0GO09fk3G
	39j197cg73FrH7FkjeXQB8ZPkPFNgDKqljoDIxRI7cWAXpOtkS6JR6HFLA8ebZ/9VoUpsQl1rJA+x
	pWWKjgqBUz6wo9tSnXvoxmMmF1SRjl5MfWTIBo+lufo0rQk3hFcGc61NK3Uq17cEZUonqPk9ADrF/
	Yy6SWa5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtDV-00000007Mhn-1Zs2
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 04:34:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtDS-00000007MgG-3J6B
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 04:34:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2A2ag024513;
	Tue, 11 Jun 2024 04:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bMJRPpvb0ZG+XcwI0xXpHHmUIF2KFoFfwzW
	BG5BP1Yg=; b=dsWV7vpdBPcpeta9X308Wy3QRxR/gYxRA+XFj6VxuCPd26YH4+r
	ei8GNjwLsLb0/2UlfRsddP+PImHbS+DiuZag0VhmoH7owNUDj+Cl+EIBIpD9IhiM
	Wa+LCj5AFSaA0V/OOP8OB/OnqT0MIrg9MOsUd06vS1rk6crBJLx55sB6ubqoGY+h
	xhUwU2Thxz89H9PzjzD4dtB89RwbffgQbl3upQSoZgJig4wbgC3AQE5tIAUmWBJ8
	2a/XYzammzQyFUxf6dZD2gxr+wIPuwHUPBHyCFrC9YAtXQkAvrEUml2/Ulip+2e8
	Zvc2Qa399Daba2K3n7PA7I2jnSJJU+6aBZA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh361jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:34:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45B4YWv3031408;
	Tue, 11 Jun 2024 04:34:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3yn2gy7ne3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:34:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45B4YVxl031403;
	Tue, 11 Jun 2024 04:34:31 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-rgnanase-blr.qualcomm.com [10.190.106.79])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45B4YVCo031402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:34:31 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 2378837)
	id C00BE4116C; Tue, 11 Jun 2024 10:04:30 +0530 (+0530)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Lingbo Kong <quic_lingbok@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single phy devices
Date: Tue, 11 Jun 2024 10:03:42 +0530
Message-Id: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BGPZcfLUsAnbzgvukYoWJsZE37npn3xz
X-Proofpoint-GUID: BGPZcfLUsAnbzgvukYoWJsZE37npn3xz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_213438_862161_267A42D9 
X-CRM114-Status: GOOD (  14.14  )
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

From: Lingbo Kong <quic_lingbok@quicinc.com>

Pdev id from mac phy capabilities will be sent as a part of
HTT/WMI command to firmware. This causes issue with single pdev
devices where firmware does not respond to the WMI/HTT request
sent from host.

For single pdev devices firmware expects pdev id as 1 for 5 GHz/6 GHz
phy and 2 for 2 GHz band. Add wrapper ath12k_mac_get_target_pdev_id()
to help fetch right pdev for single pdev devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 59 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/mac.h |  3 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 784964ae03ec..31a66ade7852 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -670,6 +670,65 @@ static struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
 	return NULL;
 }
 
+struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
+{
+	struct ath12k_vif *arvif;
+
+	lockdep_assert_held(&ar->conf_mutex);
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		if (arvif->is_up)
+			return arvif;
+	}
+
+	return NULL;
+}
+
+static bool ath12k_mac_band_match(enum nl80211_band band1, enum WMI_HOST_WLAN_BAND band2)
+{
+	return (((band1 == NL80211_BAND_2GHZ) && (band2 & WMI_HOST_WLAN_2G_CAP)) ||
+		(((band1 == NL80211_BAND_5GHZ) || (band1 == NL80211_BAND_6GHZ)) &&
+		   (band2 & WMI_HOST_WLAN_5G_CAP)));
+}
+
+u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_vif *arvif)
+{
+	struct ath12k *ar = arvif->ar;
+	struct ath12k_base *ab = ar->ab;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct cfg80211_chan_def def;
+	enum nl80211_band band;
+	u8 pdev_id = ab->fw_pdev[0].pdev_id;
+	int i;
+
+	if (WARN_ON(ath12k_mac_vif_chan(vif, &def)))
+		return pdev_id;
+
+	band = def.chan->band;
+
+	for (i = 0; i < ab->fw_pdev_count; i++) {
+		if (ath12k_mac_band_match(band, ab->fw_pdev[i].supported_bands))
+			return ab->fw_pdev[i].pdev_id;
+	}
+
+	return pdev_id;
+}
+
+u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar)
+{
+	struct ath12k_vif *arvif;
+	struct ath12k_base *ab = ar->ab;
+
+	if (!ab->hw_params->single_pdev_only)
+		return ar->pdev->pdev_id;
+
+	arvif = ath12k_mac_get_vif_up(ar);
+
+	if (arvif)
+		return ath12k_mac_get_target_pdev_id_from_vif(arvif);
+	else
+		return ar->ab->fw_pdev[0].pdev_id;
+}
+
 static void ath12k_pdev_caps_update(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 69fd282b9dd3..877005b56a7c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -81,5 +81,8 @@ int ath12k_mac_rfkill_config(struct ath12k *ar);
 int ath12k_mac_wait_tx_complete(struct ath12k *ar);
 void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
 void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
+u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar);
+u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_vif *arvif);
+struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k *ar);
 
 #endif
-- 
2.34.1


