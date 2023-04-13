Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D8FC77B6E
	for <ath12k@archiver.kernel.org>; Thu, 13 Apr 2023 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsJy/yqixvAIKooruOxU/D3zokaKHS0xoT/UMzX+usg=; b=WvfA5ZWV9SuwjU
	7YZliJWgmAnViktbvPJGgaZ3YHLXdSBwArxn7aPRdFleXZyf6pxJ1HVjXaFMaRN1AIe6717Or5Agi
	F6o2DSBYy+ldDEKYtWR56Fh3oD6/hKuO0ksJNRf/eTxtTe10QUCRw5qZHGQnGLmUrb6DyBLmuSByf
	cUha8xbTBnXEhis2JB6mYkF7oAEVNgW3rwC4+QUb6fv8hFLw8LxsrybSlbjEFFDgMzuz6ViKw6kYw
	qcSek/87iqfyM/lXg6FrmA9/CcYsZw1giacBGaDCbRmnQGvtHSQWz5qEzssQSUkiFqoN/S0qQgYH1
	GVSLvP5wxYouu0IBVUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rY-007Ds6-29
	for ath12k@archiver.kernel.org;
	Thu, 13 Apr 2023 21:52:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn4rU-007Doo-0b
	for ath12k@lists.infradead.org;
	Thu, 13 Apr 2023 21:52:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DLiOZe029208;
	Thu, 13 Apr 2023 21:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=13iIKRTS5b54Najj66TgBwUZthlla38qA4EUqQn0nAs=;
 b=j39FvKHp3GAgGewykPogUVb8UYqhuGyVqttxGrA2gT1Zurl2YiAeo+hyg3fCMftBG/tN
 sm3iuEmPOuMOuu2eI53V5vDrb/s1EVv5svEyhwaNJyGHuEv3EqHrLrVCXWkmVFZg12ag
 RJWNjz4TsxmMQeWX5pYcTx9NFCFU843HL1oqIVeXvWa+GVQRo/Aso4cMhqobzOtQ/Moy
 aApJytymmvTMcorhCxWMHHTVRmcO4NCvFGzFhQRkpLV31c1TKBIMi1frCpeNqdnnHN8S
 WPJfkDJ63QQqHAqQXImKlXOzG+/37Mp2wkK9aljFS9hz47co5ByxI2xX6rSqvOb+4Bry Zw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pxbx5swjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33DLq81X008596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 21:52:08 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 13 Apr 2023 14:52:07 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v3 01/11] wifi: ath12k: rename HE capabilities setup/copy functions
Date: Thu, 13 Apr 2023 14:51:46 -0700
Message-ID: <20230413215156.2649-2-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230413215156.2649-1-quic_alokad@quicinc.com>
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NIIPu9SYf2I8gD-Nl4lz_iJaH_Wvgsd0
X-Proofpoint-GUID: NIIPu9SYf2I8gD-Nl4lz_iJaH_Wvgsd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_16,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_145212_354485_A4BF5E79 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Functions ath12k_mac_setup_he_cap() and ath12k_mac_copy_he_cap()
propagate HE and 6GHz capabilities to the userspace using an instance
of struct ieee80211_sband_iftype_data. This structure now has a new
member 'eht_cap' to include EHT capabilities as well.
Rename the above mentioned functions to indicate that their use is not
limited to HE.

Also, replace the local variable 'band' with 'sband' and reuse
'band' for the type enum nl80211_band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v3: No change from v2.
v2: No change from v1.

 drivers/net/wireless/ath/ath12k/mac.c | 58 ++++++++++++++-------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index ee792822b411..ab718585411e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4206,10 +4206,10 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
 	return cpu_to_le16(bcap->he_6ghz_capa);
 }
 
-static int ath12k_mac_copy_he_cap(struct ath12k *ar,
-				  struct ath12k_pdev_cap *cap,
-				  struct ieee80211_sband_iftype_data *data,
-				  int band)
+static int ath12k_mac_copy_sband_iftype_data(struct ath12k *ar,
+					     struct ath12k_pdev_cap *cap,
+					     struct ieee80211_sband_iftype_data *data,
+					     int band)
 {
 	int i, idx = 0;
 
@@ -4294,38 +4294,42 @@ static int ath12k_mac_copy_he_cap(struct ath12k *ar,
 	return idx;
 }
 
-static void ath12k_mac_setup_he_cap(struct ath12k *ar,
-				    struct ath12k_pdev_cap *cap)
+static void ath12k_mac_setup_sband_iftype_data(struct ath12k *ar,
+					       struct ath12k_pdev_cap *cap)
 {
-	struct ieee80211_supported_band *band;
+	struct ieee80211_supported_band *sband;
+	enum nl80211_band band;
 	int count;
 
 	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
-		count = ath12k_mac_copy_he_cap(ar, cap,
-					       ar->mac.iftype[NL80211_BAND_2GHZ],
-					       NL80211_BAND_2GHZ);
-		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
-		band->iftype_data = ar->mac.iftype[NL80211_BAND_2GHZ];
-		band->n_iftype_data = count;
+		band = NL80211_BAND_2GHZ;
+		count = ath12k_mac_copy_sband_iftype_data(ar, cap,
+							  ar->mac.iftype[band],
+							  band);
+		sband = &ar->mac.sbands[band];
+		sband->iftype_data = ar->mac.iftype[band];
+		sband->n_iftype_data = count;
 	}
 
 	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP) {
-		count = ath12k_mac_copy_he_cap(ar, cap,
-					       ar->mac.iftype[NL80211_BAND_5GHZ],
-					       NL80211_BAND_5GHZ);
-		band = &ar->mac.sbands[NL80211_BAND_5GHZ];
-		band->iftype_data = ar->mac.iftype[NL80211_BAND_5GHZ];
-		band->n_iftype_data = count;
+		band = NL80211_BAND_5GHZ;
+		count = ath12k_mac_copy_sband_iftype_data(ar, cap,
+							  ar->mac.iftype[band],
+							  band);
+		sband = &ar->mac.sbands[band];
+		sband->iftype_data = ar->mac.iftype[band];
+		sband->n_iftype_data = count;
 	}
 
 	if (cap->supported_bands & WMI_HOST_WLAN_5G_CAP &&
 	    ar->supports_6ghz) {
-		count = ath12k_mac_copy_he_cap(ar, cap,
-					       ar->mac.iftype[NL80211_BAND_6GHZ],
-					       NL80211_BAND_6GHZ);
-		band = &ar->mac.sbands[NL80211_BAND_6GHZ];
-		band->iftype_data = ar->mac.iftype[NL80211_BAND_6GHZ];
-		band->n_iftype_data = count;
+		band = NL80211_BAND_6GHZ;
+		count = ath12k_mac_copy_sband_iftype_data(ar, cap,
+							  ar->mac.iftype[band],
+							  band);
+		sband = &ar->mac.sbands[band];
+		sband->iftype_data = ar->mac.iftype[band];
+		sband->n_iftype_data = count;
 	}
 }
 
@@ -4370,7 +4374,7 @@ static int __ath12k_set_antenna(struct ath12k *ar, u32 tx_ant, u32 rx_ant)
 
 	/* Reload HT/VHT/HE capability */
 	ath12k_mac_setup_ht_vht_cap(ar, &ar->pdev->cap, NULL);
-	ath12k_mac_setup_he_cap(ar, &ar->pdev->cap);
+	ath12k_mac_setup_sband_iftype_data(ar, &ar->pdev->cap);
 
 	return 0;
 }
@@ -6830,7 +6834,7 @@ static int __ath12k_mac_register(struct ath12k *ar)
 		goto err;
 
 	ath12k_mac_setup_ht_vht_cap(ar, cap, &ht_cap);
-	ath12k_mac_setup_he_cap(ar, cap);
+	ath12k_mac_setup_sband_iftype_data(ar, cap);
 
 	ret = ath12k_mac_setup_iface_combinations(ar);
 	if (ret) {

base-commit: 177555b57ca0a0519c12a2bdb64309ddbb363e11
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
