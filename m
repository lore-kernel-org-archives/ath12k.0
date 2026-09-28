Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1198BC9833F
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KFBzfMUObrB6oJurf3VePte6bIEXkN56PtE7y8y904o=; b=YTbCdFH9jvl24yMAZfTnhRpDih
	ydkfnUFbBEcneukxoGCSrVtkCBjwymoyvdmuu+Igzif4Drx8kkRuHmvGygCH/H4uKyxlx7VgtAYZU
	EbtNOAlOlBNm4kv3PnSZ+dmjxDO77uxm+e7cXVPAP7xi36wzi+rA+aAQDKDzOiXxmMQMKfD1fZVI2
	PnZkWravjaE4gJQG+dPvpm7QyHfasvdLfzI7xxYkt4bP8GzWURIbq9iOXF6Rga/kT/ZPleZRCGvRB
	FFrR4IivM+2hjq5t7WYQB0MApRblXb1qVRkdQZo1tWLJ+pMIj2lS8XBhkleCC0HfPBAyWxiVUPU6F
	Ikv9j/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8OF-00000000KC5-3mmg;
	Mon, 28 Sep 2026 10:15:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8OC-00000000KBl-3Akh
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 10:15:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MMqe954631
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 10:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KFBzfMUObrB6oJurf3VePte6bIEXkN56PtE
	7y8y904o=; b=a+1Unh/1ToyahMiQwT/pIGlxLRLcz21zBFl7wWfd10I4KSuMPD3
	a4ZSQ9WnLNIe1hdBSbEsiOF5Mcr/Jspt/Df3rkTM5BdW/7HtU6fRaeWrMzzGK9en
	suy7vwf6zvL9brCAbm4RU35YnQtTqsFC1XMgaWK6ImdBsOJ2N/i4JL57KS6IC8TH
	asjqaWlimaoC+NDYzAegeHmIQsQR+9NQXX5C+yyZjCyYBo3kJoBthjKkcWBOoeYV
	NNZ4Wbd3e+fxpptrTcB/xgsmcIlz+LCkC5Gro6IqHu+wL+XCkFFhzw2z8dway+6/
	4eQrsRG/oFmd/oYOv0NT1icOdTUbz0lO4uw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc086g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 10:15:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3069010a91.1
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590514; x=1791195314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFBzfMUObrB6oJurf3VePte6bIEXkN56PtE7y8y904o=;
        b=d7cWE935rh8lXbfNxIBRcUAzdZVbNpQ9rP0EdEyGOuhUKnd8OdbuQR6teqjk5YVPKf
         oI9UahPPfZomMXoUnRaKlSBHG6i0D914vv72x3L3kl/kA2UuPejHI9rIzvtIHiNPwHr1
         4UycHyEafl7lr0whUrPR/wYOGlxyT0bZZrKuO3WKs2K38e02oXK0EX9eggnYCbI1/R0t
         a9EhUIM5lnzTIcZWetaz9rgyCOEUDOc/UQeqb+lJ6oaYlKpFriaI95qnPxjpt8LB8n/W
         xbjSFgtJaPUAJcoUxhRtlsKER1+VsDUhGKvTRJdtmOOO7IYMh1aUbi6UY5rbXwN0s7Gi
         TfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590514; x=1791195314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFBzfMUObrB6oJurf3VePte6bIEXkN56PtE7y8y904o=;
        b=K6Rh9EWO9er5/n/8h1906gGmaUOgz0i3KlYeWasBc6P2o7NnZgjIwoSOT6OTkAy2MJ
         fXfzndb9RHR01lNAaVsWneZw7Xhmx0PKVoOH7jsRwJooKvw79AzytqZSKl567lYIcuQh
         qWv864Vwe63GRyp/1UhJ0uq0Fagv2mmjnbemCgOzqOTedmICMUc8zQGfURmKVoxC3ClH
         fp4Xb1Mo30eFRXqsyF9/1bgWAT7dyRYwpONMYhPbVvYw6YZiO/ZssD4ypOnotfN1SRKK
         0cgyACKsZeJADVT4AhD4EoNXt6Lw6M2HiTSlGdUgXkU+2T+fI76k0wafaKw8UbleyceS
         ZtVg==
X-Gm-Message-State: AFq9FYIdQn3sWO1roMk1xy+RQxTJoMJbpnpNeXo8X+Hl1t+NG+zrdPhc
	DaBnRhrH2Ci69YDLsho028JiU2wUWB41wQd23v9YH/EX/I1dkeObMXMcWUqxln0jcxmjOsMjb93
	FwyMr5BMuo3ou/eDSMbbvUA2LrnyKnlo7bX7NRkoamh8Oz9wxg9RqnpbQFfqB97Bo3eeRwVou
X-Gm-Gg: AYBFou3nTolTPVWND7XR0Y7ZsQp0Wf+HbkgToBXx2Wq20DPKxJ/KnZYIOgjXtG+J+Wi
	fSLTSfkmA1ohKKVxJJqFa9ud0xgUUXPWYxlAMXFJLn+UbSsZwTReayCvjayqBnWP/C4DRhoB+dE
	nwUX1q0SvBU0A4MDWOxgbEPL/49xpomI/1NI74CWaocx27jKhkpgcKRIrFJR2wZ94OTfFLotywD
	YJ6wD1uQH+Px+EG82awlz6zYEpgC28qdmGmNyVJaV+qdJniRZxs5HPB9WOYf41YdYdqESNOkVQU
	bBevBtUFZXqhKVZdIv2xBxP+FPL1ode0/m1I/rAF/JFkLPF3CZeLZv1rbBm7jWPY0tuD62Vi4yT
	S3goWSyHqffsO2RDghUkLi+VraDF+EclLLwZwHJ34cUYE6Jcgck9Cgjiyg9hJHqzElp4qZYhFMW
	CL59WFVjjf/YeIaQIBFOwAFO8OIK/uKvE6
X-Received: by 2002:a17:90b:5110:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a098ac9ea1mr7280782a91.24.1790590514302;
        Mon, 28 Sep 2026 03:15:14 -0700 (PDT)
X-Received: by 2002:a17:90b:5110:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a098ac9ea1mr7280753a91.24.1790590513769;
        Mon, 28 Sep 2026 03:15:13 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99917besm19741641a91.14.2026.09.28.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:15:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH wireless-next v3] wifi: mac80211: Do not report BSS parameters in AP station info
Date: Mon, 28 Sep 2026 15:45:06 +0530
Message-Id: <20260928101506.726663-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba3e33 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=4KmYPXT4PAyNf4F9tV8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vz0sYR8UqkFgEY-82L5GpA7ACq_LpC2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX3g6wU0cfkr7A
 9eGkgSapAQlXRigg0kjfcTkwHU6i/Oxb8sehDOmWbGaiOyqJnHvsYXDwcd0mTL1m5q8hEeDVxsj
 qM0OQv6uX+00OgC0nWBmHq6J6hAMqdm5cbkF1JvTPRYMzjwioPorUAEm5I+i9Geh5smrPIUKdtm
 Cvliic0ge2mIj/KXbgCcYL1cDLtv8Eo3kvQVSW4BxYrlfVK4ujJyt5Z7IARL7USOrmvXt5J88LX
 /scFCN3TPVoRmKxkRdIWe62ReWHDQaEi80RWvX1YR8M/VLlFn+4N+uL9OXdZFFDFtg3HxjVCSrf
 /73AJoV+Ky4da5BNs+/yIGBwOSsADN1BoWbCXl3HJr3jxcUAfjJAhQWZy4lcEFuJHowatiFrtyR
 K1dNlRWabTRZjVc5ZjVtsO2xHs47Nr7L0PSYYXawSHM0FT4t3bbaIkUL7HCs40aqr98sMJu3wln
 C6yulaX7Uu20DG8vzwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MCBTYWx0ZWRfX1ZCFzf1GDfED
 zY6uHnV2auwKfHx4NQW5CkpFbAZQaOAWq9YmuZnC3iOufzBh1w82tVXnlqbgtfxPtttefRFyWwZ
 laILhbptAFMmfAyaaBIyzw1LlIcYd0k=
X-Proofpoint-ORIG-GUID: vz0sYR8UqkFgEY-82L5GpA7ACq_LpC2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_031516_928937_37F036D4 
X-CRM114-Status: GOOD (  12.68  )
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

Do not report NL80211_STA_INFO_BSS_PARAM for station information
generated on AP interfaces, as beacon interval, DTIM period, CTS
protection, short preamble and short slot time are AP BSS configuration
parameters already managed by userspace.

Retain BSS parameter reporting for STA interfaces, where these
parameters describe the BSS to which the station is associated.

Use the per-link BSS configuration when populating BSS parameters for
STA link station information.

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
v3:
  -Change the subject and commit message from
   "wifi: mac80211: Report parent AP BSS parameters for AP_VLAN"
  -Stop reporting BSS parameters in station information for AP interfaces.
  -Remove the BSS configuration lookup
v2:
  -Remove unnecessary sdata->bss NULL check.
---
 net/mac80211/sta_info.c | 49 ++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index fdf00cbf49d8..cc6dbfc9cad1 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -2864,7 +2864,6 @@ static void sta_set_link_sinfo(struct sta_info *sta,
 				link_sinfo);
 
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_INACTIVE_TIME) |
-			 BIT_ULL(NL80211_STA_INFO_BSS_PARAM) |
 			 BIT_ULL(NL80211_STA_INFO_RX_DROP_MISC);
 
 	if (sdata->vif.type == NL80211_IFTYPE_STATION) {
@@ -3037,15 +3036,20 @@ static void sta_set_link_sinfo(struct sta_info *sta,
 					 link_id);
 	}
 
-	link_sinfo->bss_param.flags = 0;
-	if (sdata->vif.bss_conf.use_cts_prot)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
-	if (sdata->vif.bss_conf.use_short_preamble)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_PREAMBLE;
-	if (sdata->vif.bss_conf.use_short_slot)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
-	link_sinfo->bss_param.dtim_period = link->conf->dtim_period;
-	link_sinfo->bss_param.beacon_interval = link->conf->beacon_int;
+	if (sdata->vif.type == NL80211_IFTYPE_STATION) {
+		link_sinfo->bss_param.flags = 0;
+		if (link->conf->use_cts_prot)
+			link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
+		if (link->conf->use_short_preamble)
+			link_sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_PREAMBLE;
+		if (link->conf->use_short_slot)
+			link_sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
+		link_sinfo->bss_param.dtim_period = link->conf->dtim_period;
+		link_sinfo->bss_param.beacon_interval = link->conf->beacon_int;
+		link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_BSS_PARAM);
+	}
 
 	thr = sta_get_expected_throughput(sta);
 	if (!thr && (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_BITRATE)))
@@ -3099,7 +3103,6 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 	drv_sta_statistics(local, sdata, &sta->sta, sinfo);
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_INACTIVE_TIME) |
 			 BIT_ULL(NL80211_STA_INFO_STA_FLAGS) |
-			 BIT_ULL(NL80211_STA_INFO_BSS_PARAM) |
 			 BIT_ULL(NL80211_STA_INFO_CONNECTED_TIME) |
 			 BIT_ULL(NL80211_STA_INFO_ASSOC_AT_BOOTTIME) |
 			 BIT_ULL(NL80211_STA_INFO_RX_DROP_MISC);
@@ -3267,15 +3270,21 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 		sta_set_mesh_sinfo(sta, sinfo);
 #endif
 
-	sinfo->bss_param.flags = 0;
-	if (sdata->vif.bss_conf.use_cts_prot)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
-	if (sdata->vif.bss_conf.use_short_preamble)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_PREAMBLE;
-	if (sdata->vif.bss_conf.use_short_slot)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
-	sinfo->bss_param.dtim_period = sdata->vif.bss_conf.dtim_period;
-	sinfo->bss_param.beacon_interval = sdata->vif.bss_conf.beacon_int;
+	if (sdata->vif.type == NL80211_IFTYPE_STATION) {
+		sinfo->bss_param.flags = 0;
+		if (sdata->vif.bss_conf.use_cts_prot)
+			sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
+		if (sdata->vif.bss_conf.use_short_preamble)
+			sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_PREAMBLE;
+		if (sdata->vif.bss_conf.use_short_slot)
+			sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
+		sinfo->bss_param.dtim_period = sdata->vif.bss_conf.dtim_period;
+		sinfo->bss_param.beacon_interval =
+			sdata->vif.bss_conf.beacon_int;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_BSS_PARAM);
+	}
 
 	sinfo->sta_flags.set = 0;
 	sinfo->sta_flags.mask = BIT(NL80211_STA_FLAG_AUTHORIZED) |

base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
-- 
2.34.1


