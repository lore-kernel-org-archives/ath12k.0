Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D004CD1299
	for <ath12k@archiver.kernel.org>; Tue,  9 Apr 2024 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6s9K6QsEck2nQm9qkipPNtzVHEZ8qy8/W+wJH0yI+bE=; b=W5/kj7pFC/Wdoq+VpuMT7j0mzN
	pCojjNKMX+s4FlBvk9MDFXegsBuxXX21IQgnzBmXRseAEedrDPdrOQ1Y1gfcvBUWVsla9Ug0S90KQ
	ImA/KhrrloeDARprpM3wuhTFNQRGmY1Tk76yl5ba4KuaUDaTUn0KQf0yb+JPwlLYNAQ2SGI2hnWlE
	7CHs3Tg64rcT1R1oPnaWAPd8i85sNeT78Mpftz7yMlUU4oQZs+GGd1r9QV6k8v2ONncgt2qgqwhFI
	U8pbYWJvt6ljmQjF5MMT/1nhrm1Q2/O/8v1NoB0zyqgl6DPt0WSnYvp0XY1D/gRHWOr6vNJwPuPG0
	MWAz7gcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFiD-00000003Eto-278B
	for ath12k@archiver.kernel.org;
	Tue, 09 Apr 2024 17:56:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFhx-00000003EfB-1Acy
	for ath12k@bombadil.infradead.org;
	Tue, 09 Apr 2024 17:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6s9K6QsEck2nQm9qkipPNtzVHEZ8qy8/W+wJH0yI+bE=; b=gf6t2GTQWkROhZGVkNjebjHelJ
	UpIBQoe2KrCJ/CwBS50L3QMWOfZE+C7GkMhcnZX13/xlZiiBBWiPVisMu97g0pUVLXhj/pu/7Xp6g
	xGPaUQ3YmG9VPMOJui4HHIxViq+hj1FJNtGfr8qjTGEXd+4j5Tks77QjFGWQFgCuk8JBk+It/n1tz
	zSHLWo8oF1Va8QapC8pHvQqjqtfbHzAlYZ0WbOzxfcU9EHBMRvELKjwWeWgaH2Em8WJ1Dqf8NYKST
	ZGqDM4+oHTi0qWkCi2Sedt47mnmq02mfBkK4E1o/ZKz6PgzgzoOtrELvsvwGLTrAWBH2dKmVov+hz
	aUF/03MQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFht-00000007iOV-1QG3
	for ath12k@lists.infradead.org;
	Tue, 09 Apr 2024 17:56:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439DcJFl019256;
	Tue, 9 Apr 2024 17:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=6s9K6Qs
	Eck2nQm9qkipPNtzVHEZ8qy8/W+wJH0yI+bE=; b=gAEEQ1vK2WDoiCe7TmbLPSN
	GIJ4MFvfP3Tm7ik3zuoSO2CbofL8VjtxAAzm40RX2FqfHHF5KYH6wRc5bZhBKOEy
	fSABLGpTsMTFaTY2bY3yccNKXjfIrzK5MsVSZCYijvBQVPIUyugofz9fRp619K4G
	OAEib/tL5sZQMHoD74cWSTw8Ywci1b1alOwdBesTSiNHlvqsueRy+ePBvNjXLg/6
	uFRZ6dcuMq5YkbO8EVOMYnfj48p0oYABD+XsoiuMYzw50SLh3RyWuUws975ftKGq
	7jMCLEO7YkTB3lp5rMHpv2Gbdyy1nZcQHmLn6WNdC56snnSh3dbS+XEDaR63IRg=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcv3khuw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 17:56:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 439HuLYs007942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Apr 2024 17:56:21 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 9 Apr 2024 10:56:19 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH] wifi: ath12k: enable service flag for survey dump stats
Date: Tue, 9 Apr 2024 23:26:04 +0530
Message-ID: <20240409175604.3299752-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tDZY6GAuSjWKNnckQqed8npaojvoxt6A
X-Proofpoint-GUID: tDZY6GAuSjWKNnckQqed8npaojvoxt6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_185629_709997_8386205A 
X-CRM114-Status: GOOD (  12.74  )
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

From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

The survey dump statistics does not display channel RX and TX time
properly because the survey flag is not enabled in the firmware service
flag.

If firmware supports enable the service flag "bss_chan_info" in
wmi_resource_config to fetch and print the stats for specific pdev.

Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
on WCN7850 since this bit is not utilized by the WCN7850 firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index a5575ce9eed4..16504786735a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3324,7 +3324,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
 	wmi_cfg->bpf_instruction_size = cpu_to_le32(tg_cfg->bpf_instruction_size);
 	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
 	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
-	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config);
+	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config) |
+				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
 	wmi_cfg->peer_map_unmap_version = cpu_to_le32(tg_cfg->peer_map_unmap_version);
 	wmi_cfg->sched_params = cpu_to_le32(tg_cfg->sched_params);
 	wmi_cfg->twt_ap_pdev_count = cpu_to_le32(tg_cfg->twt_ap_pdev_count);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 78afc94a815d..1283d25b5cc4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2400,6 +2400,7 @@ struct wmi_init_cmd {
 
 #define WMI_RSRC_CFG_HOST_SVC_FLAG_REG_CC_EXT_SUPPORT_BIT 4
 #define WMI_RSRC_CFG_FLAGS2_RX_PEER_METADATA_VERSION		GENMASK(5, 4)
+#define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64	BIT(5)
 
 struct ath12k_wmi_resource_config_params {
 	__le32 tlv_header;

base-commit: b36766befd306a606f287b0c0f0e53d994516acb
-- 
2.34.1


