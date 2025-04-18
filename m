Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79265C369CF
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6q+KVc/+rhJjnVbQsQtWC7AwbUoA91VgMjOAhsGG4f0=; b=rYB+2Q//WTNeF4WpI5UjvHXIOb
	pPPpmrItOmKZ8jvvrxImrt8L4hOVBteRv3LVlFrC988M1ueo6OL2S3meSy+hkPVp/Rz1TsxOPAuZQ
	PSwBSSRIT4jLKg2YQdVePWbXEZIqFGzCbGFedjadAFKhHH3uDYLd4ZpaMLYdJyjto34ak2X2Ws3dU
	rCgSCGf804vXyv3iPEfTRInMgamR2AgluwA82xVtTmmehEQHU+nEyUrX44HL/HAcuVC23ja8q1FYV
	oEhkeCbp0zPZ6uxuk4biVqbvUcKvfvu31U8NlfpDOiYPFAajoRpS7LDYBESqxp4rVsk2jcPC/5+7c
	enWXkDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bu1-0000000Eut4-0yce;
	Fri, 18 Apr 2025 02:56:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bty-0000000Euph-2gU8
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2cLDY005239;
	Fri, 18 Apr 2025 02:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6q+KVc/+rhJjnVbQsQtWC7AwbUoA91VgMjOAhsGG4f0=; b=NBgevNYwdgwouddc
	T0zQDYFNzQ/8/wvBrSPc/2Mm7lBFoPK8YWNfWiaOCNVy3lFvj14gk52EmOjyzEiy
	i06hXTxiwYsZCeCp9yvpAWZjni/T2oG5i/roC2NKADkOGjrGEzn5pdXoWi5Z8VcR
	SI4mVJkSB0kCEyj78wgZ/qXWMWlXcqln8Y+8Dgh4byFmEidXcKOKoyZozckyKFW0
	YeYlVJF5IuMGGbXsaMnlNkakdmNYXBNiPO37JynbYAZk22lmN6qVlg0KVwaM15vk
	RaJxTwLac6t1OO6hLSm5Xaj/QJpef3mcBD9rQnepKPk1151UKzDoss9259tefpuO
	VaBy6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a0tqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2uMus001611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:22 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:21 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:48 +0800
Subject: [PATCH ath-next 15/15] wifi: ath12k: use
 WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-15-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fP3YFMUjg6wSTIvvgRLi5sHuOwQnL4DW
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6801bf57 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=M5L6X800NHTnsvtFUu4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fP3YFMUjg6wSTIvvgRLi5sHuOwQnL4DW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195626_807650_C2472532 
X-CRM114-Status: GOOD (  13.03  )
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

When station is connected to a 6 GHz AP, there are 2 ways to configure the
power limit to firmware. The first way is to send 2 WMI commands
WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to firmware,
the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to firmware which
includes more parameters for power control.

When firmware advertises WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, it supports
WMI_VDEV_SET_TPC_POWER_CMDID, ath12k uses it to send more parameters to
firmware. As chanctx is needed to extract necessary info for this command,
save it beforehand in ath12k_mac_op_assign_vif_chanctx().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 21 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54495a88c6ee0ba15e58964428d4c5851f3d7404..2f69f12af36013dc0a2b8448736026190560077a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3732,6 +3732,18 @@ static void ath12k_mac_vif_setup_ps(struct ath12k_link_vif *arvif)
 			    psmode, arvif->vdev_id, ret);
 }
 
+static bool ath12k_mac_supports_station_tpc(struct ath12k *ar,
+					    struct ath12k_vif *ahvif,
+					    const struct cfg80211_chan_def *chandef)
+{
+	return ath12k_wmi_supports_6ghz_cc_ext(ar) &&
+		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
+		ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+		ahvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
+		chandef->chan &&
+		chandef->chan->band == NL80211_BAND_6GHZ;
+}
+
 static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					struct ath12k_link_vif *arvif,
 					struct ieee80211_bss_conf *info,
@@ -9350,6 +9362,15 @@ ath12k_mac_vdev_start_restart(struct ath12k_link_vif *arvif,
 		return ret;
 	}
 
+	/* TODO: For now we only set TPC power here. However when
+	 * channel changes, say CSA, it should be updated again.
+	 */
+	if (ath12k_mac_supports_station_tpc(ar, ahvif, chandef)) {
+		ath12k_mac_fill_reg_tpc_info(ar, arvif, ctx);
+		ath12k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
+						   &arvif->reg_tpc_info);
+	}
+
 	ar->num_started_vdevs++;
 	ath12k_dbg(ab, ATH12K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   ahvif->vif->addr, arvif->vdev_id);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 9d4ea4f359a7b12f80701baf422183fae6a55efe..d0a79a907dc752e65e3da852b66e1eda17b705c6 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2220,6 +2220,8 @@ enum wmi_tlv_service {
 
 	WMI_MAX_EXT_SERVICE = 256,
 
+	WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT = 280,
+
 	WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT = 281,
 
 	WMI_TLV_SERVICE_11BE = 289,

-- 
2.34.1


