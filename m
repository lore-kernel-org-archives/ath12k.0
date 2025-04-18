Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A6C369D0
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gxvAnWTzpsWutrl/BJWacVovmWzVj4D9N8YLZhtDXw=; b=gKNT5dgqy1R7ziOxmRH5QSoMoL
	Sd6I3rxKnspWgSnMHNBr7GNs+seXv+EKpxWrxkFe12qlKiuV81V17PqfsSUBNVjzAme8oL+jqJQNs
	jO4x9H6NHRYSLOvfl/gBFOeaeQF2F3epM2n1R1ebwXIwyYIaAM/aln2tW5Di6/vvpGzcO49XvrQxj
	YrFNSa5979T0ceek/Ig2sY33wyK80dWyQ8cxR1EGEPEUOUjODgyZ53u/W0xMntxiBualrczcR3FD3
	zIi+mX6C/4XD6w4YUuvXcHLB/LFePCW74ljUMwIVsmpV85kbuOSD5FuD0pX3RsuDhFS5w6iiFU39S
	BWoTGoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bts-0000000EukW-1L9U;
	Fri, 18 Apr 2025 02:56:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btp-0000000Euhe-1OqJ
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2UFWG015469;
	Fri, 18 Apr 2025 02:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gxvAnWTzpsWutrl/BJWacVovmWzVj4D9N8YLZhtDXw=; b=AJRY1/xBOkcRi3Sn
	TWqGoc/ksvEIZ0se3Kn/2680I0U4g1N+3miXkxonI2vuITRXQhoYSlCHj9GK9X/3
	EAgnSPWP+zkObnJfgxbVTClzucrHprElUClcWBGC0fnTb+y398TailP4N5vmdPoS
	jwD76iLXg5UNbekvD1rMWYqZuDhtQpbH4aPFuk5sZgiOTuYMhr/XV0ihMUqx4STx
	n+jfJf6cOFVjrF52Cmzi5Gq0qpUAUWMCxE4ErSSMANHWFRP5pHsfNKQ7qyidEEsZ
	wNzGooLazTh2tMLKhMlNxwZbmfqIAsS/vKzod+CPNldBy1fxwHHCn3KH0eWNnGZ0
	RR1LNQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqh1jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2uDrX021544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:13 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:11 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:43 +0800
Subject: [PATCH ath-next 10/15] wifi: ath12k: save power spectral
 density(PSD) of regulatory rule
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-10-c869c86cad60@quicinc.com>
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
X-Proofpoint-ORIG-GUID: wz3JtuIyYwhkBtQ0CT_GjVcfRzMeJ8kV
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6801bf4e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Azt8dOlshguyWGzRvw0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wz3JtuIyYwhkBtQ0CT_GjVcfRzMeJ8kV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195617_498885_7B72B01D 
X-CRM114-Status: GOOD (  13.12  )
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

Currently the power spectral density (PSD) report from firmware is ignored.
Since it is needed by cfg80211, report it in struct ieee80211_reg_rule such
that cfg80211 can use it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index dbd7d956dd52ad91cf1c0bae0a243afd3bd26a61..62936d518b1d767a198958150a13bb9ac8b73009 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -516,6 +516,11 @@ static void ath12k_reg_intersect_rules(struct ieee80211_reg_rule *rule1,
 	/* Use the flags of both the rules */
 	new_rule->flags = rule1->flags | rule2->flags;
 
+	if ((rule1->flags & NL80211_RRF_PSD) && (rule2->flags & NL80211_RRF_PSD))
+		new_rule->psd = min_t(s8, rule1->psd, rule2->psd);
+	else
+		new_rule->flags &= ~NL80211_RRF_PSD;
+
 	/* To be safe, lts use the max cac timeout of both rules */
 	new_rule->dfs_cac_ms = max_t(u32, rule1->dfs_cac_ms,
 				     rule2->dfs_cac_ms);
@@ -613,13 +618,14 @@ ath12k_reg_adjust_bw(u16 start_freq, u16 end_freq, u16 max_bw)
 static void
 ath12k_reg_update_rule(struct ieee80211_reg_rule *reg_rule, u32 start_freq,
 		       u32 end_freq, u32 bw, u32 ant_gain, u32 reg_pwr,
-		       u32 reg_flags)
+		       s8 psd, u32 reg_flags)
 {
 	reg_rule->freq_range.start_freq_khz = MHZ_TO_KHZ(start_freq);
 	reg_rule->freq_range.end_freq_khz = MHZ_TO_KHZ(end_freq);
 	reg_rule->freq_range.max_bandwidth_khz = MHZ_TO_KHZ(bw);
 	reg_rule->power_rule.max_antenna_gain = DBI_TO_MBI(ant_gain);
 	reg_rule->power_rule.max_eirp = DBM_TO_MBM(reg_pwr);
+	reg_rule->psd = psd;
 	reg_rule->flags = reg_flags;
 }
 
@@ -641,7 +647,7 @@ ath12k_reg_update_weather_radar_band(struct ath12k_base *ab,
 	ath12k_reg_update_rule(regd->reg_rules + i, reg_rule->start_freq,
 			       ETSI_WEATHER_RADAR_BAND_LOW, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	ath12k_dbg(ab, ATH12K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -663,7 +669,7 @@ ath12k_reg_update_weather_radar_band(struct ath12k_base *ab,
 	ath12k_reg_update_rule(regd->reg_rules + i,
 			       ETSI_WEATHER_RADAR_BAND_LOW, end_freq, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	regd->reg_rules[i].dfs_cac_ms = ETSI_WEATHER_RADAR_BAND_CAC_TIMEOUT;
 
@@ -688,7 +694,7 @@ ath12k_reg_update_weather_radar_band(struct ath12k_base *ab,
 	ath12k_reg_update_rule(regd->reg_rules + i, ETSI_WEATHER_RADAR_BAND_HIGH,
 			       reg_rule->end_freq, bw,
 			       reg_rule->ant_gain, reg_rule->reg_power,
-			       flags);
+			       reg_rule->psd_eirp, flags);
 
 	ath12k_dbg(ab, ATH12K_DBG_REG,
 		   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
@@ -840,6 +846,8 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			reg_rule = reg_rule_6ghz + k++;
 			max_bw = min_t(u16, reg_rule->max_bw, max_bw_6ghz);
 			flags = NL80211_RRF_AUTO_BW;
+			if (reg_rule->psd_flag)
+				flags |= NL80211_RRF_PSD;
 			ath12k_reg_update_freq_range(&ab->reg_freq_6ghz, reg_rule);
 		} else {
 			break;
@@ -852,7 +860,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 				       reg_rule->start_freq,
 				       reg_rule->end_freq, max_bw,
 				       reg_rule->ant_gain, reg_rule->reg_power,
-				       flags);
+				       reg_rule->psd_eirp, flags);
 
 		/* Update dfs cac timeout if the dfs domain is ETSI and the
 		 * new rule covers weather radar band.

-- 
2.34.1


