Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6D0C369C2
	for <ath12k@archiver.kernel.org>; Mon,  5 May 2025 03:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+9aKZBVM2r868mKyITPWnznP2XUglYrdK0fzRTsWR4=; b=AIwmcFZesV/ByqFPLf3lB8sRo4
	4bPkIhWbCVVU18zz1ntVBdRKv+GSedh2tWJYCCQhMocs8fEm+XXMKwEM0fpTVYb+4/qvdRcoj7BG5
	45T4UTLOCgdavtu9Bf27CkigowejwxSZZ2pLNGNh0kpmVVisXCyeiFJb5XQElaonN+rH7l4oWJLDH
	XalzIV+f+Ugv6OBiVf4P2vFkEEc44SxqQ1JSD4QlEf15MTSYs1KlUXNenEH2pFHKTsUym9JgvFV4f
	ZDuigmPopesmqN01tIFsQjL80N5lQsJJ6f/DpNZCaCcdo0VhkNWJA5g2bDVRWd1FwN5My1jDkpXor
	UUCTT90Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBmkf-00000006LX3-3pTQ;
	Mon, 05 May 2025 03:44:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBmkc-00000006LWf-1W80
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 03:44:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Lkase025837;
	Mon, 5 May 2025 03:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y+9aKZBVM2r868mKyITPWn
	znP2XUglYrdK0fzRTsWR4=; b=L01k72q2odCIMqTd/ftgttzDIaxa1qwrRcNk35
	VtpdNeIXaHKgY8amJBT+W1uiyst2JpoabUB9GFe67yC7oKNM8uCRsKEtqcuhzB4z
	VtawA5JNiH9laHZVYe3Q7Uw/627E8t4aHoXc0dsJE5r1pgTaECmDxqszQo/OuIXu
	lKBbZYeHBstI7EpMXMLJnhTf6HoxGzz6XgFomB45XRGHCZlPhKcatH99BThhHh3I
	W/ctkxU4WKzKCCp90ryaq/4/3cbyhhbTiPuHCusz7NQNSY2+6ajOTEX+Z/Ynk3B8
	qaayolAz92RQgwOXWcXecMTT5Jss0qVSbq7vtyZ/u5tflk1Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nktye6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 03:44:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5453iFCL015523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 03:44:15 GMT
Received: from hu-rajson-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 4 May 2025 20:44:13 -0700
From: Rajat Soni <quic_rajson@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Aishwarya R <quic_aisr@quicinc.com>,
        Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH ath-pending v2] wifi: ath12k: remove redundant regulatory rules intersection logic in host
Date: Mon, 5 May 2025 09:13:51 +0530
Message-ID: <20250505034351.1365914-1-quic_rajson@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAzMyBTYWx0ZWRfX5rzBSFuWwMGC
 +VamvAVxCGHOmpIccBQ6PzdS2QGnZb1nbTb+ipC2LluldNc9noAp1oEnGcidOUHcGuNbqCPyPlC
 6w5wP25fXOzXu/Bi8mMd3SBmY4eiNigGO5zaX7Mce3Sox2GEQVwng5+oyJH3iSlj3lmTOYFsGmE
 +yUrfJ9i3Oz4Iw1dwpcUrGEvnjBxgFcRJk3Xha73EQfX1mhGhyVFUhhymt9Bw0JaOAv/R5uJw79
 bIT4IULbgo/CgihpEltUCkg0jUY6NfGIPq29x0m5dV8MQE8PRY47/sfwzuOBp7zBcprGy9EAgGr
 8HVl879frErRJ1YPoNwZm+a/0iHFBW/3DTd9uNzEofzY1oWOhOzfikgtDu31ne7jC9HL3VIC4dO
 ggIz8wLakykm9Tnp5NuWT+Wk1ZG2RJqQAKyKePuR1MbTFxbr2BhPXixYtdzoTn3ykawdmGAp
X-Proofpoint-GUID: vPfCL09_xyX12GO7RlHtCvM7pW7_KeiQ
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68183410 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=igJP8ltQK_XOvVwkCrQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vPfCL09_xyX12GO7RlHtCvM7pW7_KeiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_204418_505348_F763DD52 
X-CRM114-Status: GOOD (  24.89  )
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

From: Aishwarya R <quic_aisr@quicinc.com>

Whenever there is a change in the country code settings from the
user, driver does an intersection of the regulatory rules for this
new country with the original regulatory rules which were reported
during initialization time.

There is also similar logic running in firmware with a difference
that the intersection in firmware is only done when the country code
is configuration during boot up time (BDF/OTP). Firmware logic does
not kick in when no country code is configured during device bring
up time as the device is always expected to have the country code
configured properly in the deployment.

There is a debug/test use case that requires absolute regulatory
rules to be used for a user configured country code when the device
is not configured with a particular country code during boot up time.

To support the above test use case, remove the redundant regulatory
rules intersection logic in the host driver. Depend on the
intersection logic in firmware when the device comes up with
pre-configured country code.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Aishwarya R <quic_aisr@quicinc.com>
Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
---
v2:
  - Rebased on top of ath-pending branch.
---
 drivers/net/wireless/ath/ath12k/reg.c | 178 ++------------------------
 1 file changed, 11 insertions(+), 167 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index a1f4fa536b89..386af2f80387 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -467,134 +467,6 @@ static u32 ath12k_map_fw_phy_flags(u32 phy_flags)
 	return flags;
 }
 
-static bool
-ath12k_reg_can_intersect(struct ieee80211_reg_rule *rule1,
-			 struct ieee80211_reg_rule *rule2)
-{
-	u32 start_freq1, end_freq1;
-	u32 start_freq2, end_freq2;
-
-	start_freq1 = rule1->freq_range.start_freq_khz;
-	start_freq2 = rule2->freq_range.start_freq_khz;
-
-	end_freq1 = rule1->freq_range.end_freq_khz;
-	end_freq2 = rule2->freq_range.end_freq_khz;
-
-	if ((start_freq1 >= start_freq2 &&
-	     start_freq1 < end_freq2) ||
-	    (start_freq2 > start_freq1 &&
-	     start_freq2 < end_freq1))
-		return true;
-
-	/* TODO: Should we restrict intersection feasibility
-	 *  based on min bandwidth of the intersected region also,
-	 *  say the intersected rule should have a  min bandwidth
-	 * of 20MHz?
-	 */
-
-	return false;
-}
-
-static void ath12k_reg_intersect_rules(struct ieee80211_reg_rule *rule1,
-				       struct ieee80211_reg_rule *rule2,
-				       struct ieee80211_reg_rule *new_rule)
-{
-	u32 start_freq1, end_freq1;
-	u32 start_freq2, end_freq2;
-	u32 freq_diff, max_bw;
-
-	start_freq1 = rule1->freq_range.start_freq_khz;
-	start_freq2 = rule2->freq_range.start_freq_khz;
-
-	end_freq1 = rule1->freq_range.end_freq_khz;
-	end_freq2 = rule2->freq_range.end_freq_khz;
-
-	new_rule->freq_range.start_freq_khz = max_t(u32, start_freq1,
-						    start_freq2);
-	new_rule->freq_range.end_freq_khz = min_t(u32, end_freq1, end_freq2);
-
-	freq_diff = new_rule->freq_range.end_freq_khz -
-			new_rule->freq_range.start_freq_khz;
-	max_bw = min_t(u32, rule1->freq_range.max_bandwidth_khz,
-		       rule2->freq_range.max_bandwidth_khz);
-	new_rule->freq_range.max_bandwidth_khz = min_t(u32, max_bw, freq_diff);
-
-	new_rule->power_rule.max_antenna_gain =
-		min_t(u32, rule1->power_rule.max_antenna_gain,
-		      rule2->power_rule.max_antenna_gain);
-
-	new_rule->power_rule.max_eirp = min_t(u32, rule1->power_rule.max_eirp,
-					      rule2->power_rule.max_eirp);
-
-	/* Use the flags of both the rules */
-	new_rule->flags = rule1->flags | rule2->flags;
-
-	if ((rule1->flags & NL80211_RRF_PSD) && (rule2->flags & NL80211_RRF_PSD))
-		new_rule->psd = min_t(s8, rule1->psd, rule2->psd);
-	else
-		new_rule->flags &= ~NL80211_RRF_PSD;
-
-	/* To be safe, lts use the max cac timeout of both rules */
-	new_rule->dfs_cac_ms = max_t(u32, rule1->dfs_cac_ms,
-				     rule2->dfs_cac_ms);
-}
-
-static struct ieee80211_regdomain *
-ath12k_regd_intersect(struct ieee80211_regdomain *default_regd,
-		      struct ieee80211_regdomain *curr_regd)
-{
-	u8 num_old_regd_rules, num_curr_regd_rules, num_new_regd_rules;
-	struct ieee80211_reg_rule *old_rule, *curr_rule, *new_rule;
-	struct ieee80211_regdomain *new_regd = NULL;
-	u8 i, j, k;
-
-	num_old_regd_rules = default_regd->n_reg_rules;
-	num_curr_regd_rules = curr_regd->n_reg_rules;
-	num_new_regd_rules = 0;
-
-	/* Find the number of intersecting rules to allocate new regd memory */
-	for (i = 0; i < num_old_regd_rules; i++) {
-		old_rule = default_regd->reg_rules + i;
-		for (j = 0; j < num_curr_regd_rules; j++) {
-			curr_rule = curr_regd->reg_rules + j;
-
-			if (ath12k_reg_can_intersect(old_rule, curr_rule))
-				num_new_regd_rules++;
-		}
-	}
-
-	if (!num_new_regd_rules)
-		return NULL;
-
-	new_regd = kzalloc(sizeof(*new_regd) + (num_new_regd_rules *
-			sizeof(struct ieee80211_reg_rule)),
-			GFP_ATOMIC);
-
-	if (!new_regd)
-		return NULL;
-
-	/* We set the new country and dfs region directly and only trim
-	 * the freq, power, antenna gain by intersecting with the
-	 * default regdomain. Also MAX of the dfs cac timeout is selected.
-	 */
-	new_regd->n_reg_rules = num_new_regd_rules;
-	memcpy(new_regd->alpha2, curr_regd->alpha2, sizeof(new_regd->alpha2));
-	new_regd->dfs_region = curr_regd->dfs_region;
-	new_rule = new_regd->reg_rules;
-
-	for (i = 0, k = 0; i < num_old_regd_rules; i++) {
-		old_rule = default_regd->reg_rules + i;
-		for (j = 0; j < num_curr_regd_rules; j++) {
-			curr_rule = curr_regd->reg_rules + j;
-
-			if (ath12k_reg_can_intersect(old_rule, curr_rule))
-				ath12k_reg_intersect_rules(old_rule, curr_rule,
-							   (new_rule + k++));
-		}
-	}
-	return new_regd;
-}
-
 static const char *
 ath12k_reg_get_regdom_str(enum nl80211_dfs_regions dfs_region)
 {
@@ -729,12 +601,6 @@ static void ath12k_reg_update_freq_range(struct ath12k_reg_freq *reg_freq,
 		reg_freq->end_freq = reg_rule->end_freq;
 }
 
-static bool ath12k_reg_is_world_alpha(char *alpha)
-{
-	return (alpha[0] == '0' && alpha[1] == '0') ||
-	       (alpha[0] == 'n' && alpha[1] == 'a');
-}
-
 enum wmi_reg_6g_ap_type
 ath12k_reg_ap_pwr_convert(enum ieee80211_ap_reg_power power_type)
 {
@@ -756,7 +622,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 		      enum wmi_vdev_type vdev_type,
 		      enum ieee80211_ap_reg_power power_type)
 {
-	struct ieee80211_regdomain *tmp_regd, *default_regd, *new_regd = NULL;
+	struct ieee80211_regdomain *new_regd = NULL;
 	struct ath12k_reg_rule *reg_rule, *reg_rule_6ghz;
 	u32 flags, reg_6ghz_number, max_bw_6ghz;
 	u8 i = 0, j = 0, k = 0;
@@ -804,20 +670,20 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 	if (reg_info->dfs_region == ATH12K_DFS_REG_ETSI)
 		num_rules += 2;
 
-	tmp_regd = kzalloc(sizeof(*tmp_regd) +
+	new_regd = kzalloc(sizeof(*new_regd) +
 			   (num_rules * sizeof(struct ieee80211_reg_rule)),
 			   GFP_ATOMIC);
-	if (!tmp_regd)
+	if (!new_regd)
 		goto ret;
 
-	memcpy(tmp_regd->alpha2, reg_info->alpha2, REG_ALPHA2_LEN + 1);
+	memcpy(new_regd->alpha2, reg_info->alpha2, REG_ALPHA2_LEN + 1);
 	memcpy(alpha2, reg_info->alpha2, REG_ALPHA2_LEN + 1);
 	alpha2[2] = '\0';
-	tmp_regd->dfs_region = ath12k_map_fw_dfs_region(reg_info->dfs_region);
+	new_regd->dfs_region = ath12k_map_fw_dfs_region(reg_info->dfs_region);
 
 	ath12k_dbg(ab, ATH12K_DBG_REG,
 		   "\r\nCountry %s, CFG Regdomain %s FW Regdomain %d, num_reg_rules %d\n",
-		   alpha2, ath12k_reg_get_regdom_str(tmp_regd->dfs_region),
+		   alpha2, ath12k_reg_get_regdom_str(new_regd->dfs_region),
 		   reg_info->dfs_region, num_rules);
 
 	/* Reset start and end frequency for each band
@@ -869,7 +735,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 		flags |= ath12k_map_fw_reg_flags(reg_rule->flags);
 		flags |= ath12k_map_fw_phy_flags(reg_info->phybitmap);
 
-		ath12k_reg_update_rule(tmp_regd->reg_rules + i,
+		ath12k_reg_update_rule(new_regd->reg_rules + i,
 				       reg_rule->start_freq,
 				       reg_rule->end_freq, max_bw,
 				       reg_rule->ant_gain, reg_rule->reg_power,
@@ -884,7 +750,7 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 		    reg_info->dfs_region == ATH12K_DFS_REG_ETSI &&
 		    (reg_rule->end_freq > ETSI_WEATHER_RADAR_BAND_LOW &&
 		    reg_rule->start_freq < ETSI_WEATHER_RADAR_BAND_HIGH)){
-			ath12k_reg_update_weather_radar_band(ab, tmp_regd,
+			ath12k_reg_update_weather_radar_band(ab, new_regd,
 							     reg_rule, &i,
 							     flags, max_bw);
 			continue;
@@ -894,41 +760,19 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 			ath12k_dbg(ab, ATH12K_DBG_REG, "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d) (%d, %d)\n",
 				   i + 1, reg_rule->start_freq, reg_rule->end_freq,
 				   max_bw, reg_rule->ant_gain, reg_rule->reg_power,
-				   tmp_regd->reg_rules[i].dfs_cac_ms,
+				   new_regd->reg_rules[i].dfs_cac_ms,
 				   flags, reg_rule->psd_flag, reg_rule->psd_eirp);
 		} else {
 			ath12k_dbg(ab, ATH12K_DBG_REG,
 				   "\t%d. (%d - %d @ %d) (%d, %d) (%d ms) (FLAGS %d)\n",
 				   i + 1, reg_rule->start_freq, reg_rule->end_freq,
 				   max_bw, reg_rule->ant_gain, reg_rule->reg_power,
-				   tmp_regd->reg_rules[i].dfs_cac_ms,
+				   new_regd->reg_rules[i].dfs_cac_ms,
 				   flags);
 		}
 	}
 
-	tmp_regd->n_reg_rules = i;
-
-	/* Intersect new rules with default regd if a new country setting was
-	 * requested, i.e a default regd was already set during initialization
-	 * and the regd coming from this event has a valid country info.
-	 */
-	default_regd = ab->default_regd[reg_info->phy_id];
-	if (default_regd &&
-	    !ath12k_reg_is_world_alpha((char *)default_regd->alpha2) &&
-	    !ath12k_reg_is_world_alpha((char *)reg_info->alpha2)) {
-		/* Get a new regd by intersecting the received regd with
-		 * our default regd.
-		 */
-		new_regd = ath12k_regd_intersect(default_regd, tmp_regd);
-		kfree(tmp_regd);
-		if (!new_regd) {
-			ath12k_warn(ab, "Unable to create intersected regdomain\n");
-			goto ret;
-		}
-	} else {
-		new_regd = tmp_regd;
-	}
-
+	new_regd->n_reg_rules = i;
 ret:
 	return new_regd;
 }

base-commit: cbd170d5df79f023caaf71e8a55850060f9e7bc6
-- 
2.34.1


