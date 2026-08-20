Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A5BC5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FomK4b+Z6EE0AuWvd+hS/XzhCyVhhrMuKN8vsjrrKOs=; b=qi6MYp9+KJdMWw1+b9bWS0X/Bh
	O1CcHT85dSF+cukwRg0x/dvtz0XFAi9OV35vqC+MoVoEqhj5gWdXVlVsX+R+1S/HRhJWQOLwHV2PJ
	KT75f9kC9qR6NVY73lh4ln7PI1TSh5IEiZl3PJi5Vd192FTZT/nrNLTFCUPvAzzjPVimBsB5ZZumS
	Uek1DHGALSS2B+3ADfTB4AzIZmHAhf9e7tmSN7E/W83LNAlDXslbSLsq2HPKRBOfdwEeW2kYJb3Ur
	q1y1kBhl4nJCwCxZIrT8a7I4jJJK2jMWcxOzUW2O0BXK9wyavIXfN/QbBWpmXwVAjpAX9dm2DgEkQ
	IipMqKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvGX-0000000AqSk-0gO9;
	Thu, 20 Aug 2026 05:24:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvGU-0000000AqSI-2s7q
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:24:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL86uM939331
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FomK4b+Z6EE0AuWvd+hS/XzhCyVhhrMuKN8
	vsjrrKOs=; b=i0eTCwpnlYYbUMJqdD4fGf5ofM250rMaPCYj5cRVbn238nlOk7b
	iK2Ns+I0Cc+ZG7/AcideeUBBznEbB/o8J/TKmM3OG5C2einmKP7N2RlY7V+rPCi4
	d5dGBh+vQHYldL0Z/yGma29WxUXhwRkW6fjfBfrNKewGC9PJQA5IxMU/zTEsX3TO
	JLrTs/5/ImJ+J/oypWJmp7fLD9B2tBONognFb0L3/EZfjLDogIwkKCXYn7IhorvL
	Lg/melMGIjlNX53BGLHVlUu/Evf/i2/iODHzkAteaxff+lAfW0WVeZtiMeLW7oXA
	u5iNZNAUMQKPvxYJ2w9W0avwaEvjr4nYx+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d3fba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:24:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so34765565ad.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787203473; x=1787808273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FomK4b+Z6EE0AuWvd+hS/XzhCyVhhrMuKN8vsjrrKOs=;
        b=Vg3A8y69RFdvRG/Mc5S8uGsScG3nX0nQXjeeUOXSJ6dTQkGroCrW+XaJ5l1st2zerg
         A1OJaxS1uE7yl9G+B59jsuucES19DEjMtEHEo4zpFV8xKVtuSiy7vcucO5djrQltnDXx
         EHlZg0LMwLLGciY6/jaPt0V0FvsSPP2va7xJyuZFFD4KI9SnAjoVJpDB3P8gvXLz1oG3
         aLWNWczVPVT/1K3xL28c/vyQNDjWhZbFvRzjfTwRi4qNadFP/XGTO3Yxv+nPmMtM1QN0
         pq+WGVfDhww4R+9odWOHA0jV5Tfq11xysRsuvVH1jH59ZEkAolcUe+1zXJhsQ/Piq1xl
         5bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787203473; x=1787808273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FomK4b+Z6EE0AuWvd+hS/XzhCyVhhrMuKN8vsjrrKOs=;
        b=eRUVq4JVzI5rCBp24WIcNhk8zOKZS1Fl63FMob4muYLOkX8LQ3bsaUXVEdjx2TioEl
         IFa3m1w/cBsjT9hXfqWyDbz18l6JpKd6No1k6pLQK+tO6vKrhcTT4B2wpL+uFDnIGrk2
         KUHMz89xoA7XGK4rf1eD7RkSp1p1QfacUD1jCzw31IM3omIPkM9EJd+JwepW0CC8y9iS
         qA3LcuxpFwErkS2EwShOG4ch93Gl1AdkwUp5aCwPL4CBg8Aq/dTY1XxKmSC1b8N2gz83
         dXnktPnIPIFUyK1NFTuuXFi0gESCNomMc9OYPqee+AE9jFxlBImkLfL8T+LxOvLtzVm/
         NHeA==
X-Gm-Message-State: AFuF++nEo342WL510aMr9ACDViRclIRzArVyEMWojt8XuoMCfOcegPTb
	8T0xp2Qud48NljFgRlmS3abnmfruOOAogky27UmjWIDyUNE7UcC0/l7HjD3k5xdha/vUU5oBCQy
	lQLEtg/jMNfARsuc0n/mw6dgaSKJLPUmxOnmqdb+dXteawWQ+Kpd2HRBcfyakN05mzLgjZ9Yt
X-Gm-Gg: AR+sD11Z4DFmuIMsy4+HyrbwIN8l2CJUYNFNOZxFU1lGRjXLEHsRj/Ad/mG/Q15InGC
	jZRKf+ZSInyKI7AxhsS45BEuiR4pCg/yIH3vN2zpiZPTrcdl6a4t8F0zIq1CcqUYzyR+wb++4Bb
	02vcTGDbHxfjVYcBCCsAxX3TSnH4utYIp86R+gU1fn/BDcmPCKLkuFxen33Bv32ayjjxvhZgLwC
	3J3iYx9fyHL+R4o6kxkRKmlT7whPmhCc+K65RjISaHFJxqXubOqhXbxki2af7kSbtCC9tzKcuMc
	lZS7urmrWSoHUiPZfLSsM1UpEfT7WpzR6dG2dSy0bghSUCs6F1VDhIorOooCHAlWqMPBDt+00tD
	9LlouoX3VFesJrfZu2eWztaF829OSEuCGWei5KsxA4rAprMbNqjXwnAl/7+zCcpF+zDlBxVEmxG
	3pN1VohGRpq+aMnJJnc2ij4Cg=
X-Received: by 2002:a17:902:ef43:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d5fd62ae4fmr195489375ad.5.1787203473343;
        Wed, 19 Aug 2026 22:24:33 -0700 (PDT)
X-Received: by 2002:a17:902:ef43:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d5fd62ae4fmr195488625ad.5.1787203472853;
        Wed, 19 Aug 2026 22:24:32 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3cb9f8sm2120665ad.73.2026.08.19.22.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:24:32 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
Subject: [PATCH wireless-next] wifi: mac80211: Report parent AP BSS parameters for AP_VLAN
Date: Thu, 20 Aug 2026 10:54:26 +0530
Message-Id: <20260820052426.3177309-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzNiBTYWx0ZWRfX6S9U/a6MQ00P
 ln22sXO9YN7gsKr+OgKQGebe5fCIcm+KFUC20QJp+rL06SZ4jwtDXGUROuN51Wex34qgDke76sF
 L2XAXHJf/2L9xe8A1E0qycGe7wsvoFp4Uv/osKtQd8P6DlB46cn/GVVGMaDGRYyzUtj15qRsi2w
 H5QDlhb/2FqPU+FGItv5nFa6Ms1jItTC8Vrm6J+kW42OLFdHY2ZHClv928gV3mailMlEfhr9UJW
 remWhgbQ16HbNHtnPU7P1m+QeJjc9Eb/eKvppZZIrhzYfl1/Ap5AIRhqqowElA8EHQ1noOpEMKA
 FDF1HytCrS6i8mwIcPFLZ9b47WJiYF8huiTfnEps0DQDTO6pMUHwajeMfcqbGSI71tEssBjiJhq
 OhnfukS70a9oh+w/EHMxl9/xf5KQInu1sGzSngSjuYexVkY1r6joO7BISC5+ElSRd+BqTZrXObD
 SF+sYJqcs/3G8z/WyGQ==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a868f92 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=IfjyXQZqvconvXi0t-4A:9 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6BBPN8v9ClYh7Ov6NCYHppyQsiBiHORv
X-Proofpoint-GUID: 6BBPN8v9ClYh7Ov6NCYHppyQsiBiHORv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzNiBTYWx0ZWRfX5gp28EMyHs1a
 cEB8z+fYc71D1199w+f6psyzDs6Qv2Lm/NB/hKfJ/U2DjtFVJ4VWfu5b7OPjohTYNF4+UtoZ5BH
 9AUWfeoFdPzjTL8Lkvy+J7L61m81fUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_222434_788201_2DC2E55D 
X-CRM114-Status: GOOD (  16.93  )
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

AP_VLAN interfaces do not maintain independent BSS configuration.
When station information is reported for a 4-address station, BSS
parameters are read from the AP_VLAN interface, causing beacon interval,
DTIM period and BSS capability flags to be reported incorrectly.

Read the BSS configuration from the parent AP when populating station
information for AP_VLAN interfaces. This ensures that beacon interval,
DTIM period, CTS protection, short preamble and short slot time reflect
the parent AP configuration for both legacy and MLO station dumps.

For MLO, the per-link BSS configuration is used so that CTS protection,
short preamble and short slot time reflect the configuration of the
corresponding parent AP link.

Only advertise NL80211_STA_INFO_BSS_PARAM when a valid BSS
configuration is available. This avoids reporting zero-valued BSS
parameters when corresponding BSS configuration is unavailable.

Co-developed-by: Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
Signed-off-by: Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/sta_info.c    | 50 ++++++++++++++++++++++++--------------
 net/mac80211/util.c        | 21 ++++++++++++++++
 3 files changed, 55 insertions(+), 18 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 5761e9621491..f3e49d980a26 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2982,6 +2982,8 @@ ieee80211_uhr_cap_ie_to_sta_uhr_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_uhr_cap *uhr_cap,
 				    u8 uhr_cap_len,
 				    struct link_sta_info *link_sta);
+struct ieee80211_bss_conf *
+ieee80211_get_sdata_bss_conf(struct ieee80211_sub_if_data *sdata, int link_id);
 
 #if IS_ENABLED(CONFIG_MAC80211_KUNIT_TEST)
 #define EXPORT_SYMBOL_IF_MAC80211_KUNIT(sym) EXPORT_SYMBOL_IF_KUNIT(sym)
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index fdf00cbf49d8..7635e600d1df 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -2843,6 +2843,7 @@ static void sta_set_link_sinfo(struct sta_info *sta,
 	struct ieee80211_sta_rx_stats *last_rxstats;
 	int i, ac, cpu, link_id = link->link_id;
 	struct link_sta_info *link_sta_info;
+	struct ieee80211_bss_conf *bss_conf;
 	u32 thr = 0;
 
 	last_rxstats = sta_get_last_rx_stats(sta, link_id);
@@ -2864,7 +2865,6 @@ static void sta_set_link_sinfo(struct sta_info *sta,
 				link_sinfo);
 
 	link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_INACTIVE_TIME) |
-			 BIT_ULL(NL80211_STA_INFO_BSS_PARAM) |
 			 BIT_ULL(NL80211_STA_INFO_RX_DROP_MISC);
 
 	if (sdata->vif.type == NL80211_IFTYPE_STATION) {
@@ -3038,14 +3038,21 @@ static void sta_set_link_sinfo(struct sta_info *sta,
 	}
 
 	link_sinfo->bss_param.flags = 0;
-	if (sdata->vif.bss_conf.use_cts_prot)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
-	if (sdata->vif.bss_conf.use_short_preamble)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_PREAMBLE;
-	if (sdata->vif.bss_conf.use_short_slot)
-		link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
-	link_sinfo->bss_param.dtim_period = link->conf->dtim_period;
-	link_sinfo->bss_param.beacon_interval = link->conf->beacon_int;
+
+	bss_conf = ieee80211_get_sdata_bss_conf(sdata, link_id);
+	if (bss_conf) {
+		if (bss_conf->use_cts_prot)
+			link_sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
+		if (bss_conf->use_short_preamble)
+			link_sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_PREAMBLE;
+		if (bss_conf->use_short_slot)
+			link_sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
+		link_sinfo->bss_param.dtim_period = bss_conf->dtim_period;
+		link_sinfo->bss_param.beacon_interval = bss_conf->beacon_int;
+		link_sinfo->filled |= BIT_ULL(NL80211_STA_INFO_BSS_PARAM);
+	}
 
 	thr = sta_get_expected_throughput(sta);
 	if (!thr && (link_sinfo->filled & BIT_ULL(NL80211_STA_INFO_TX_BITRATE)))
@@ -3081,6 +3088,7 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 {
 	struct ieee80211_sub_if_data *sdata = sta->sdata;
 	struct ieee80211_local *local = sdata->local;
+	struct ieee80211_bss_conf *bss_conf;
 	u32 thr = 0;
 	int i, ac, cpu;
 	struct ieee80211_sta_rx_stats *last_rxstats;
@@ -3099,7 +3107,6 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 	drv_sta_statistics(local, sdata, &sta->sta, sinfo);
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_INACTIVE_TIME) |
 			 BIT_ULL(NL80211_STA_INFO_STA_FLAGS) |
-			 BIT_ULL(NL80211_STA_INFO_BSS_PARAM) |
 			 BIT_ULL(NL80211_STA_INFO_CONNECTED_TIME) |
 			 BIT_ULL(NL80211_STA_INFO_ASSOC_AT_BOOTTIME) |
 			 BIT_ULL(NL80211_STA_INFO_RX_DROP_MISC);
@@ -3268,14 +3275,21 @@ void sta_set_sinfo(struct sta_info *sta, struct station_info *sinfo,
 #endif
 
 	sinfo->bss_param.flags = 0;
-	if (sdata->vif.bss_conf.use_cts_prot)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
-	if (sdata->vif.bss_conf.use_short_preamble)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_PREAMBLE;
-	if (sdata->vif.bss_conf.use_short_slot)
-		sinfo->bss_param.flags |= BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
-	sinfo->bss_param.dtim_period = sdata->vif.bss_conf.dtim_period;
-	sinfo->bss_param.beacon_interval = sdata->vif.bss_conf.beacon_int;
+
+	bss_conf = ieee80211_get_sdata_bss_conf(sdata, -1);
+	if (bss_conf) {
+		if (bss_conf->use_cts_prot)
+			sinfo->bss_param.flags |= BSS_PARAM_FLAGS_CTS_PROT;
+		if (bss_conf->use_short_preamble)
+			sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_PREAMBLE;
+		if (bss_conf->use_short_slot)
+			sinfo->bss_param.flags |=
+				BSS_PARAM_FLAGS_SHORT_SLOT_TIME;
+		sinfo->bss_param.dtim_period = bss_conf->dtim_period;
+		sinfo->bss_param.beacon_interval = bss_conf->beacon_int;
+		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_BSS_PARAM);
+	}
 
 	sinfo->sta_flags.set = 0;
 	sinfo->sta_flags.mask = BIT(NL80211_STA_FLAG_AUTHORIZED) |
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index a96078a6bfa2..edef61d061ae 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -4752,3 +4752,24 @@ bool ieee80211_vif_nan_started(struct ieee80211_vif *vif)
 	return vif->type == NL80211_IFTYPE_NAN && sdata->u.nan.started;
 }
 EXPORT_SYMBOL_GPL(ieee80211_vif_nan_started);
+
+struct ieee80211_bss_conf *
+ieee80211_get_sdata_bss_conf(struct ieee80211_sub_if_data *sdata, int link_id)
+{
+	struct ieee80211_sub_if_data *bss_sdata = sdata;
+
+	lockdep_assert_wiphy(sdata->local->hw.wiphy);
+
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
+		if (!sdata->bss)
+			return NULL;
+
+		bss_sdata = get_bss_sdata(sdata);
+	}
+
+	if (link_id >= 0)
+		return sdata_dereference(bss_sdata->vif.link_conf[link_id],
+					 bss_sdata);
+
+	return &bss_sdata->vif.bss_conf;
+}

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.34.1


