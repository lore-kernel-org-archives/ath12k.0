Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC0EB64DD
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wrb8tvtHWPIrVIKNv84q9B29OtN4DfDJU4H+eTk7tW4=; b=g8ySxcAZ3WX5uf
	18u0kIRR9DOVbd2Uu9/w4zzDMTNITKAG1ub0RR6DxIaY0DB3LcqxZ5QPreOU6ZJFOmSe1hOpEy2GR
	rtp7MSMaJFU722yP33pM/FvqKuNz/Fhbd/mvjb+bnYRvf5ikJ2eYFs9QWlDmHcYOPsEmjJs9qrzJn
	2JfBisITnGgqoA9fjf625Ghr6YgdcRuMlktSCGvTDXi34YpeOzWP+vkZo+0nxebZe69Nv3S6pmt6a
	2wdXpy2BVO60KnIzUs34gp/6RIm5c70ugVKXTmR9vZjK0y1B3LV3lPshFo8qJWmxzXOT+rn0sT5oG
	j77q7YvyAk3pSrzpng9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTg0h-004USl-05
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 10:01:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTg0c-004URq-2n
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 10:01:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37990WSO019997;
	Wed, 9 Aug 2023 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=vI1aY3JzQww22/wS+uU5xHrAvFK1ei7tQ9BLwzT2GZg=;
 b=nH6kp7HUL/GwQnTz6j0i5V3iWTX+qXhGy356T8qS+MRzzqLb0BbmcTalzB7GVbYq7q5R
 xd/msWdgswk6kjrnmWeV8cKjm+lb9V2qTQBOOfUY9vX6ZeUrApHJUB/UbevwpxLkSBBh
 GBlIwXQ0ybE4wQffrm86edSRaI4YltgYxIpBsR8Z5XfP2KS+QZifXwxR4S7bPPYORpad
 DstXms1ZSptfPbpJsrMe9KobyZtbDdbULE6ahHCYG5kwyU91IWX3QENvNAlojVfR67YU
 4W6w4FgSmVUnc5ND/CkOhTahoBVDhYLGjMfEfGoMYF9F1BOiuMOao2oapsCPI9aL9Suy aA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbpqs27rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 10:01:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379A1c4u029319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 10:01:38 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 9 Aug 2023 03:01:37 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band in EHT PHY capbility for WCN7850
Date: Wed, 9 Aug 2023 06:01:24 -0400
Message-ID: <20230809100124.14732-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1prMQt1mh-ejlcCsvoXczmPBm6LMUkP8
X-Proofpoint-ORIG-GUID: 1prMQt1mh-ejlcCsvoXczmPBm6LMUkP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_09,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=932 malwarescore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_030142_921370_3CF7CD16 
X-CRM114-Status: GOOD (  20.11  )
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

320 MHz bandwidth is reported only for single PHY mode for WCN7850, get it
from WMI_HOST_HW_MODE_SINGLE ath12k_wmi_caps_ext_params and report it for
6 GHz band.

After this patch, "iw list" show 320MHz support for WCN7850:
EHT Iftypes: managed
        EHT PHY Capabilities: (0xe26f090010768800):
                320MHz in 6GHz Supported
        EHT bw=320 MHz, max NSS for MCS 8-9: Rx=0, Tx=0
        EHT bw=320 MHz, max NSS for MCS 10-11: Rx=0, Tx=0
        EHT bw=320 MHz, max NSS for MCS 12-13: Rx=0, Tx=0

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 9ed33e2d6da0..8b6f11fce884 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4148,7 +4148,11 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 				       __le32 cap_info_internal)
 {
 	struct ath12k_band_cap *cap_band = &pdev->cap.band[band];
-	u8 i;
+	u8 i, support_320mhz;
+
+	if (band == NL80211_BAND_6GHZ)
+		support_320mhz = cap_band->eht_cap_phy_info[0] &
+					IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
 
 	for (i = 0; i < WMI_MAX_EHTCAP_MAC_SIZE; i++)
 		cap_band->eht_cap_mac_info[i] = le32_to_cpu(cap_mac_info[i]);
@@ -4156,6 +4160,9 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	for (i = 0; i < WMI_MAX_EHTCAP_PHY_SIZE; i++)
 		cap_band->eht_cap_phy_info[i] = le32_to_cpu(cap_phy_info[i]);
 
+	if (band == NL80211_BAND_6GHZ)
+		cap_band->eht_cap_phy_info[0] |= support_320mhz;
+
 	cap_band->eht_mcs_20_only = le32_to_cpu(supp_mcs[0]);
 	cap_band->eht_mcs_80 = le32_to_cpu(supp_mcs[1]);
 	if (band != NL80211_BAND_2GHZ) {
@@ -4177,10 +4184,20 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
+	struct ath12k_band_cap *cap_band;
 	u32 bands;
 	int i;
+	u8 support_320mhz;
 
 	if (ab->hw_params->single_pdev_only) {
+		if (caps->hw_mode_id == WMI_HOST_HW_MODE_SINGLE) {
+			support_320mhz = caps->eht_cap_phy_info_5G[0] &
+				IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
+			cap_band = &pdev->cap.band[NL80211_BAND_6GHZ];
+			cap_band->eht_cap_phy_info[0] |= support_320mhz;
+			return 0;
+		}
+
 		for (i = 0; i < ab->fw_pdev_count; i++) {
 			struct ath12k_fw_pdev *fw_pdev = &ab->fw_pdev[i];
 
@@ -4236,7 +4253,8 @@ static int ath12k_wmi_tlv_mac_phy_caps_ext(struct ath12k_base *ab, u16 tag,
 		return -EPROTO;
 
 	if (ab->hw_params->single_pdev_only) {
-		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id))
+		if (ab->wmi_ab.preferred_hw_mode != le32_to_cpu(caps->hw_mode_id) &&
+		    caps->hw_mode_id != WMI_HOST_HW_MODE_SINGLE)
 			return 0;
 	} else {
 		for (i = 0; i < ab->num_radios; i++) {

base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
