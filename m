Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9EDC7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgnGXO5mVXv4W41CoK3qPyYC7jj18Qv5JpQI/3D5uMw=; b=vi0RmcYFB7YPrddcsF/R4BvSnZ
	QtFV3mAsUtCgh4dUqlcCJE7Bh1WXS2PHZeLQgA8BM86e0Fj5Qxe4HbU9QCUD06rF/e1m3A8xC8qQG
	YCzCbx7Ngi9/NAfcCXeIzqB1UCdwQnDebWcYrmjRyqBMqNOhGnmiEPQzPDwPXKUGPNY/rfUJAEZfn
	SMAasqISCgWTSXHAW2cP22Ig+Oh4wdBEKx79xlGBt3JBjaURzYMXUUoNnbWBRxQoVJ6pSHa6XxqEA
	8DcKZud5DSWgRHhVAGbzMWeDw9PsSLtJhSKXwvnTVHQqsf6pM6Ji9SpVOsSYX1W2FzgiylF0/9coA
	Mof8GCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdBc-00000005vqc-2L5N;
	Tue, 01 Jul 2025 15:46:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbW8-00000005cG3-0T4s
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 13:59:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qTn5024791;
	Tue, 1 Jul 2025 13:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tgnGXO5mVXv4W41CoK3qPy
	YC7jj18Qv5JpQI/3D5uMw=; b=L6c1rOrv02uvzwiBDJEnaa4EV1JKKrUGg0OqKm
	jOGuCuMxNpBM7USNXe10U2DztNQFUGRWE6GAWQH/EnEMom36lZJiIW67etlOJf0p
	D654aU3oUavO1qGnE8SWOYIlMErpEqMvwV62d2d5bpxzhk94xzdiXrsLudxbFIk2
	d+YsgtRJYVmc12MLvOQJsiZiNk7kF6NB5CD1X19zwKT6sicV2ZtjMTNp5tQapqSb
	Y0qTB4774Sc923QQW73HzJUB4Ej0+Tl7KiiQ+MPEPXBGdJ1mqPEBRKKLJ1To43F+
	P31f5f9TO9off/5tLkLKROWL4emoQ1L5qrepyNoClmDT4lzw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9h45m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:59:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561DxKFF011230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 13:59:20 GMT
Received: from hu-amitajit-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 06:59:18 -0700
From: Amith A <quic_amitajit@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_amitajit@quicinc.com>,
        "Harshitha
 Prem" <quic_hprem@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: update unsupported bandwidth flags in reg rules
Date: Tue, 1 Jul 2025 19:29:02 +0530
Message-ID: <20250701135902.722851-1-quic_amitajit@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863e9b9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=JJRAa57BN1ypBt8jVJsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MwO1rAJHIIzGSBxJSTFe1ExT-F-pNJ3t
X-Proofpoint-GUID: MwO1rAJHIIzGSBxJSTFe1ExT-F-pNJ3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA5MCBTYWx0ZWRfX0Ynemoq62M/x
 dM9LluZv1Lo0y8tyDhEY2A1K2BXphEFns6MV8rdDb9oxvA//+xds9w/Hc2NCtPTZgdDbOoY6pj3
 jDqIZEF3yuL6wD2q+T0ZDqrxEZRLAxdTG6OefFulMeu8hudofRcnzcgg/8HdaC9f61Hg/xeNbx0
 uGcYd1Blc2JJl8rRdVEtZkoFAxCH2TMW7iF7pQfJZH39kacURB/AacMyPDkD1AYK4PWngJVtZTS
 LWFR+ckr9otxyA3k9ARggBtp7+Rpb9ufYbo20mQjOTYklrXMvShLRNaXYbq8cw54QRBQuZ8Kt2L
 TfjbanK2FP/PwkBpA3LTw5UklKbueLDoUzNOtcMG0DjUXIBzV6ny+wEwTD97myeeWyGOaPiE+D7
 oaRzgvrBweBaJGwKuUzdz5sUEgs1RHMeSUnfKak8UXghn4VoE08lt+LPDKLUvLyCZYAXdOhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065924_271440_E78C2BCF 
X-CRM114-Status: GOOD (  15.60  )
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

From: Harshitha Prem <quic_hprem@quicinc.com>

The maximum bandwidth an interface can operate in is defined by the
configured country. However, currently, it is able to operate in
bandwidths greater than the allowed bandwidth. For example,
the Central African Republic (CF) supports a maximum bandwidth of 40 MHz
in both the 2 GHz and 5 GHz bands, but an interface is still able to
operate in bandwidths higher than 40 MHz. This issue arises because the
regulatory rules in the regd are not updated with these restrictions
received from firmware on the maximum bandwidth.

Hence, update the regulatory rules with unsupported bandwidth flags based
on the maximum bandwidth to ensure compliance with country-specific
regulations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Signed-off-by: Amith A <quic_amitajit@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 31 ++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 96254d6fc675..7898f6981e5a 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -426,6 +426,29 @@ ath12k_map_fw_dfs_region(enum ath12k_dfs_region dfs_region)
 	}
 }
 
+static u32 ath12k_get_bw_reg_flags(u16 max_bw)
+{
+	switch (max_bw) {
+	case 20:
+		return NL80211_RRF_NO_HT40 |
+			NL80211_RRF_NO_80MHZ |
+			NL80211_RRF_NO_160MHZ |
+			NL80211_RRF_NO_320MHZ;
+	case 40:
+		return NL80211_RRF_NO_80MHZ |
+			NL80211_RRF_NO_160MHZ |
+			NL80211_RRF_NO_320MHZ;
+	case 80:
+		return NL80211_RRF_NO_160MHZ |
+			NL80211_RRF_NO_320MHZ;
+	case 160:
+		return NL80211_RRF_NO_320MHZ;
+	case 320:
+	default:
+		return 0;
+	}
+}
+
 static u32 ath12k_map_fw_reg_flags(u16 reg_flags)
 {
 	u32 flags = 0;
@@ -704,7 +727,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			reg_rule = reg_info->reg_rules_2g_ptr + i;
 			max_bw = min_t(u16, reg_rule->max_bw,
 				       reg_info->max_bw_2g);
-			flags = 0;
+			flags = ath12k_get_bw_reg_flags(reg_info->max_bw_2g);
 			ath12k_reg_update_freq_range(&ab->reg_freq_2ghz, reg_rule);
 		} else if (reg_info->num_5g_reg_rules &&
 			   (j < reg_info->num_5g_reg_rules)) {
@@ -718,13 +741,15 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			 * BW correction if required and applies flags as
 			 * per other BW rule flags we pass from here
 			 */
-			flags = NL80211_RRF_AUTO_BW;
+			flags = NL80211_RRF_AUTO_BW |
+				ath12k_get_bw_reg_flags(reg_info->max_bw_5g);
 			ath12k_reg_update_freq_range(&ab->reg_freq_5ghz, reg_rule);
 		} else if (reg_info->is_ext_reg_event && reg_6ghz_number &&
 			   (k < reg_6ghz_number)) {
 			reg_rule = reg_rule_6ghz + k++;
 			max_bw = min_t(u16, reg_rule->max_bw, max_bw_6ghz);
-			flags = NL80211_RRF_AUTO_BW;
+			flags = NL80211_RRF_AUTO_BW |
+				ath12k_get_bw_reg_flags(max_bw_6ghz);
 			if (reg_rule->psd_flag)
 				flags |= NL80211_RRF_PSD;
 			ath12k_reg_update_freq_range(&ab->reg_freq_6ghz, reg_rule);

base-commit: 6e17bbb5a86e6c68d65e38dfc850699e7a0706cb
-- 
2.34.1


