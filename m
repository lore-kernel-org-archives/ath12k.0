Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF13C4167B
	for <ath12k@archiver.kernel.org>; Wed,  6 Dec 2023 03:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzrO/boPUG4pOEYl4jPoR67XLEtwBngVvECwHVGs4Yk=; b=gefxi7SYPBbDc2GKmklfCP0PUd
	2G/MWdix2Ysdg8dPD7uyvPMYVZ6YHX7xxmrGzf+8ldQiiaSx5YdIyZ8q57cPfgA8JMET/b+F0zwHi
	lEy6kX+gvM5NpovBFxdDp+QmxWVzQZ/fPYR0pM80jW1P75t9uxuuQfuN6bNLTLGSVfNCVSzC9/Myh
	pPgaZAtbHP9cBJ6mYSWCZ/DJOx2kJwYE9SoO1BwD3QqNZJSBZmE+Urkhsi81ubA+j+3feTa6OSIS0
	SXFuVIvg6YADOyjeam0Z+EY4cU2mX2stPLHpBcO5aeUrLlMCUSRIMFALTR0Rj+w9zKyMYaw/IwmtB
	7DlwW0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiv2-008zbJ-0M
	for ath12k@archiver.kernel.org;
	Wed, 06 Dec 2023 03:49:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiuy-008zZh-1k
	for ath12k@lists.infradead.org;
	Wed, 06 Dec 2023 03:49:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B63YxKR015921;
	Wed, 6 Dec 2023 03:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=EzrO/boPUG4pOEYl4jPoR67XLEtwBngVvECwHVGs4Yk=;
 b=BL9TxwshPVO+wzf5Qah/No8KnsHwtSXmhjVZX276ampVFiXi+K8+Zo9KF2y+IPuEAx4a
 zfuAojr7Y4cFJGqZeS1bhrmIS0eHlnuUHvZLMpgxhsRCB41kseqQSCXQhD1EeNIA+ts4
 +98V1wCa1O0jBIoXTBlphPg3lo2yK1HDd67lVCF6HG6F8ZMdDcl7P4X4dyHa5Ad5dXhc
 Gz5qtW5psDP+crftOQMgYwz5R0N5wkOsHnsV5jyqYGLbtNd/lL3H7/id06eVeP/pZ93S
 cf6NU+xWmgRc9eMxL1JIDfv8eP7T6KXm+hU1P5V68rSFdTbIq5ee9vkwnqvANEtMG8ag wQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd1wgff9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 03:49:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B63nkEd001379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 03:49:46 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 19:49:44 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 3/4] wifi: ath12k: Refactor MAC setup channel helper function
Date: Wed, 6 Dec 2023 09:19:19 +0530
Message-ID: <20231206034920.1037449-4-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
References: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s_Mdv6sNQNUOV0lVx21eMEna8lxLLAqH
X-Proofpoint-ORIG-GUID: s_Mdv6sNQNUOV0lVx21eMEna8lxLLAqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxlogscore=646 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_194948_701630_44465EB0 
X-CRM114-Status: GOOD (  17.34  )
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

Currently, the MAC setup helper function is accessing the mac80211 hw
data. In the future, to support single/multi link operation, need to
decouple the mac80211 hw data from this helper function so that it can be
easy to scale these functions to support single/multi link operations. So
remove the mac80211 hw access from the ath12k_mac_setup_channels_rates()
helper function.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a110119ad701..be3ef388e9aa 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7158,9 +7158,9 @@ static u32 ath12k_get_phy_id(struct ath12k *ar, u32 band)
 }
 
 static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
-					   u32 supported_bands)
+					   u32 supported_bands,
+					   struct ieee80211_supported_band *bands[])
 {
-	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_supported_band *band;
 	struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
 	void *channels;
@@ -7186,7 +7186,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 		band->channels = channels;
 		band->n_bitrates = ath12k_g_rates_size;
 		band->bitrates = ath12k_g_rates;
-		hw->wiphy->bands[NL80211_BAND_2GHZ] = band;
+		bands[NL80211_BAND_2GHZ] = band;
 
 		if (ar->ab->hw_params->single_pdev_only) {
 			phy_id = ath12k_get_phy_id(ar, WMI_HOST_WLAN_2G_CAP);
@@ -7213,7 +7213,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			band->channels = channels;
 			band->n_bitrates = ath12k_a_rates_size;
 			band->bitrates = ath12k_a_rates;
-			hw->wiphy->bands[NL80211_BAND_6GHZ] = band;
+			bands[NL80211_BAND_6GHZ] = band;
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
 						  reg_cap->high_5ghz_chan);
@@ -7235,7 +7235,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			band->channels = channels;
 			band->n_bitrates = ath12k_a_rates_size;
 			band->bitrates = ath12k_a_rates;
-			hw->wiphy->bands[NL80211_BAND_5GHZ] = band;
+			bands[NL80211_BAND_5GHZ] = band;
 
 			if (ar->ab->hw_params->single_pdev_only) {
 				phy_id = ath12k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
@@ -7414,7 +7414,8 @@ static int __ath12k_mac_register(struct ath12k *ar)
 	SET_IEEE80211_DEV(hw, ab->dev);
 
 	ret = ath12k_mac_setup_channels_rates(ar,
-					      cap->supported_bands);
+					      cap->supported_bands,
+					      hw->wiphy->bands);
 	if (ret)
 		goto err;
 
-- 
2.34.1


