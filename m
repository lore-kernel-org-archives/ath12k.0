Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4078C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHIIahfKFhzjcat/h30ruUc9MTCPLWnaQZOICHYEG1U=; b=nSm2tnL6kRx3xgXuV2SN7wQnEz
	BalQwx+Vs3uv7KSqo8i2/XIeQMbEDI8W6FysoRvz3M8/6SrZkaYTLp4AqM5pfZL5cjBNGC/Y8zmnv
	Nq4CKvYExIsoZPRKy1xPVWxJ1OxWWqfTQWXYuVPARlykTGqP0Ei9RevD7Pr/HHqJ4C9ZAzx2lUvGy
	JSFqXzeWuNtzhybje18E4PUzhRRisQZBJWJhGekWbkHHNI5gxO0v9uXBrnmprlqn4Z+SUbohfn9GU
	oXhQp8NoUsXQ+ZmPYl7UG8VhzqmpRxmag2w2SpzHI9GoJRcbiyRdxOz95d9ihJi5u+hS2a+SBOEIn
	aaGtEoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzueG-00000007SbI-1tx0
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 08:40:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzueD-00000007SYv-0z3N
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 08:40:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P6aFET004208;
	Thu, 25 Apr 2024 08:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=hHIIahfKFhzjcat/h30r
	uUc9MTCPLWnaQZOICHYEG1U=; b=MdEiqFbSoIdv/fwy4aXOl6Kzt1TRWtLXJbop
	zH5L3NdT3I46hBhgUVvp33aPZd0Gz2ewwEEO6mLfAoxvHQQEG9MhFTfg5JwaHC9c
	lKPHyCfKnvL6bsJffHkQIfjaxDZZfDsi6yutXN4CCMIdWQ+7iCH2d5/Wv3TTzlNc
	vPWPhntS8NyxcnWM00JddbGDoWSiexv2hP2tRyxTWno2xfheA1au3u8tTaZG9Cbi
	Mk9iWdXtjt3wSbN2G/4ppv4O5PWH2iFY7pfbWDc6IgAPbhgLThc4G2DtyiS/9oG0
	eWhER5VTsfWZBRAu/uIxOxdahQGJpPWdXIT/1eFbPnzJrg25Jw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenghbef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 08:40:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P8e09X013158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 08:40:00 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 01:39:59 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix the problem that down grade phy mode operation
Date: Thu, 25 Apr 2024 16:38:37 +0800
Message-ID: <20240425083837.5340-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _XR6Iosifn4s3VJGoGkx30r_259KMPeR
X-Proofpoint-ORIG-GUID: _XR6Iosifn4s3VJGoGkx30r_259KMPeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_07,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_014005_426778_8358185C 
X-CRM114-Status: GOOD (  18.69  )
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

Currently, when using WCN7850 or QCN9274 as AP, ath12k always performs down
grade phy mode operation regardless of whether the firmware supports EHT
capability or not and then vdev will start in HE mode. When stations that
support EHT capability try to connect to the AP, the AP will set phy mode
to EHT after receiving the association request packet, and then send
WMI_PEER_ASSOC_CMDID command to firmware, AP’s firmware will crash.

This is because when the ath12k_mac_copy_sband_iftype_data() function
handles EHT capability, it does not copy the EHT capability into the
iftype[band][type] array according to the interface type. So, interface
type should not be used as an index to get eht_cap in
ath12k_mac_check_down_grade_phy_mode() function.

To address this issue, use types_mask to select the eht_cap in
ath12k_mac_check_down_grade_phy_mode() function.

This patch affects QCN9274 and WCN7850 because they have the same issue.

Hostapd log:
wlo1: STA 02:03:7f:37:12:34 IEEE 802.11: Could not set STA to kernel driver

Kernel log:
[270894.816076] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_SET_PARAM cmd
[270894.816111] ath12k_pci 0000:03:00.0: failed to setup peer SMPS for vdev 0: -108
[270894.816122] ath12k_pci 0000:03:00.0: Failed to associate station: 02:03:7f:37:12:34
[270894.843389] ieee80211 phy5: Hardware restart was requested
[270894.843517] ath12k_pci 0000:03:00.0: failed to lookup peer 02:03:7f:37:12:34 on vdev 0
[270894.843616] ath12k_pci 0000:03:00.0: failed to send WMI_PEER_DELETE cmd
[270894.843650] ath12k_pci 0000:03:00.0: failed to delete peer vdev_id 0 addr 02:03:7f:37:12:34 ret -108
[270894.843663] ath12k_pci 0000:03:00.0: Failed to delete peer: 02:03:7f:37:12:34 for VDEV: 0

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 56b1f8b6844e..805cb084484a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6754,14 +6754,24 @@ ath12k_mac_check_down_grade_phy_mode(struct ath12k *ar,
 				     enum nl80211_band band,
 				     enum nl80211_iftype type)
 {
-	struct ieee80211_sta_eht_cap *eht_cap;
+	struct ieee80211_sta_eht_cap *eht_cap = NULL;
 	enum wmi_phy_mode down_mode;
+	int n = ar->mac.sbands[band].n_iftype_data;
+	int i;
+	struct ieee80211_sband_iftype_data *data;
 
 	if (mode < MODE_11BE_EHT20)
 		return mode;
 
-	eht_cap = &ar->mac.iftype[band][type].eht_cap;
-	if (eht_cap->has_eht)
+	data = ar->mac.iftype[band];
+	for (i = 0; i < n; i++) {
+		if (data[i].types_mask & BIT(type)) {
+			eht_cap = &data[i].eht_cap;
+			break;
+		}
+	}
+
+	if (eht_cap && eht_cap->has_eht)
 		return mode;
 
 	switch (mode) {

base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717
-- 
2.34.1


