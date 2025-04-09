Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DDEC369A2
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 02:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kblOBgep6gQ5/QGu8qfiBTUh3VUI/YUVbJDl1VsbaF8=; b=kebpPIYY/Wf9Xvq6LHBxaFvWSn
	106SS8TCcm9CgoKysdJrPdSe5bm/4VOHrwh/Y+G+1C0+NE/80JYwGjwWPHZb1CCsBYZSE+QpNlS4y
	FCCJFFMJ315R+mK3hlygbc2VhOsBzZULkP9zrhFYTzFO3YC8JJ0t0Ed/Mk0ziWVdpJvPR2on0A4Je
	zpiXvu+NbVyznU1LL5XidI4PPI8WigChUV/Mm0QPbjbG3EzQSuPlw0bV9bgV79jpvZjhLBr7RalAM
	+GJpuIw8IDi2CEha+eVPe/BSOD8dOFgMuEiYzsOBgWRuqtbnoSoy2mI7RAomaXK7pmO+YD48ROpaB
	YB2dnDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LA9-00000005vYJ-1XOJ
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 02:27:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LA6-00000005vWE-2SMh
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 02:27:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYuC1002276;
	Wed, 9 Apr 2025 02:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kblOBgep6gQ5/QGu8qfiBTUh3VUI/YUVbJDl1VsbaF8=; b=NUPHQ1cVt6cOqski
	BiDzH2Mw5rxRSCAx4eJPGS41LEZoOxrRFzzhh8SHG9UC+aFGXCg5XIsXdtlV8j9C
	7q0rlrr/5alnZwClxyv122ECRuqdfLWWdwJjFkt+7rl+IdLWDJgesuUdnlv/ahUQ
	4wayPA/Czqsmk6nCMRYKVjYt8e8BbbaL6q0R9POicQ/3nCk5uz/E+rLu78MhIUEa
	p2HT3rm8J3GlARjKYy+p2wSBCvVHkbNg7GEy3KH4lSJM+mQNoqhat/q7e67m7N6z
	v5OGY5RkE8Kx68tZ8P0qliAuCmisLUQRHq+amHc0iuypt8vNegpffdn5jsStxwZp
	A+KJIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1hp8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 02:27:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5392RTLV024671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 02:27:29 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 19:27:27 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Wed, 9 Apr 2025 10:26:42 +0800
Subject: [PATCH ath-next v2 9/9] wifi: ath12k: support 2 channels for
 single pdev device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250409-ath12k-wcn7850-mlo-support-v2-9-3801132ca2c3@quicinc.com>
References: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
In-Reply-To: <20250409-ath12k-wcn7850-mlo-support-v2-0-3801132ca2c3@quicinc.com>
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
X-Proofpoint-ORIG-GUID: auX4VBG--qoT2tspE2mw4xa-Iyx4fb-q
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f5db12 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TnHeXv7htJ03pNrsuFYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: auX4VBG--qoT2tspE2mw4xa-Iyx4fb-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=857 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_192734_751451_CD860E69 
X-CRM114-Status: GOOD (  14.07  )
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

For single pdev device, radio number of a device is forced as 1 in
ath12k_wmi_ext_soc_hal_reg_caps_parse(). This leads to ah->num_radio == 1
and then in ath12k_mac_setup_iface_combinations() we report to
mac/cfg80211 that only 1 channel is supported. In MLO case, it finally
results in failing to bring up the second link as it is in another
channel.

Change num_different_channels to 2 to allow a second link. Since DFS on
multiple channels are not supported yet, remove radar_detect_widths.

For now WCN7850 is the only single pdev device, so others should not be
affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 699772a471f5f81c42009b529e756fa75bca0779..ac15527571dda60c69c898488ee06a21aa635163 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11082,13 +11082,18 @@ ath12k_mac_setup_radio_iface_comb(struct ath12k *ar,
 	comb[0].limits = limits;
 	comb[0].n_limits = n_limits;
 	comb[0].max_interfaces = max_interfaces;
-	comb[0].num_different_channels = 1;
 	comb[0].beacon_int_infra_match = true;
 	comb[0].beacon_int_min_gcd = 100;
-	comb[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
-					BIT(NL80211_CHAN_WIDTH_20) |
-					BIT(NL80211_CHAN_WIDTH_40) |
-					BIT(NL80211_CHAN_WIDTH_80);
+
+	if (ar->ab->hw_params->single_pdev_only) {
+		comb[0].num_different_channels = 2;
+	} else {
+		comb[0].num_different_channels = 1;
+		comb[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+						BIT(NL80211_CHAN_WIDTH_20) |
+						BIT(NL80211_CHAN_WIDTH_40) |
+						BIT(NL80211_CHAN_WIDTH_80);
+	}
 
 	return 0;
 }

-- 
2.25.1


