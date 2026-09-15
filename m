Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB4AC88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 05:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mbOqZAw6wTOw63b1G2ExHd4hbkezHdD6QRCAfQhtp2o=; b=mmZuMAZtiDAvpwICZwZcYRgdQt
	yFhrPmCVsVtEwx+nNfX1olz4inJNYXxOxdiWjsig5BukJH2sG2wZk8jmD/+uoK+gRVpEZuzRPm+BR
	xSVkNw0B48H0uQ+Gt2atGoURgu8gV+lpAKsRz+hg1typMzxta0XwrwtxiLfuLAlPCcufPzh/yzO1l
	zR5znhU11QAz+M1oTpnAc2vhjCF/F6VaYBRon6q5fwK2UbcZROIgCskQzILlAiHexkbmUX1iP+GNM
	Pz3eirETehG9O6G4RbWx27gNYf+fRMwUQhwnhXCDrG8t2sRSfM7iEhKZURu5sv8ZfAOTdO8OYXHro
	RqQmnCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ljf-00000005FKb-07fr;
	Tue, 15 Sep 2026 05:29:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ljb-00000005FKF-3a5M
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 05:29:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4u19Y2031345
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 05:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mbOqZAw6wTOw63b1G2ExHd4hbkezHdD6QRC
	AfQhtp2o=; b=pHSR2nYtMIC9SwquqTU2J2jPRgVww8itq+ZCa7vVKOyYlvUH15a
	eQBxhNS3bv5eHlCbjRf8z47Cd7YUp+JlOcDh/No+7LGmnep3Sv2RBC+A9p9s25p1
	qOWElfqxvrVc1QsEmt9bCljanUmVv+yYvMCVC5TAVtTsWBGzFGuqYC+2LGEpoCDz
	20cyNoUUxIWIfXVQRsg9/LRhKqmP4wZqax0L1kN8ZZfZH1PwTmrDUzCbAoZfq0zf
	k5XibhRGRMThhbHW6Dpl7+RTy3SQIsK2LDQR1iWBzqdgy1JMuMOsv6wTFJFT3lXt
	tP5mAaczMmS0Z231Z5E7yWcUgaMxWG467lQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye703dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 05:29:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7234685a91.0
        for <ath12k@lists.infradead.org>; Mon, 14 Sep 2026 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789450173; x=1790054973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbOqZAw6wTOw63b1G2ExHd4hbkezHdD6QRCAfQhtp2o=;
        b=ao9+a562XNnhzKDihRdlmfqqIChjmhO2NdTfAOGDvqEjJaz3Hfrp9e0ZmfAjJ/9LR0
         keOJQTMZwXCsg4Vy1QP3DLqk8F0gT53kYYzPtTdQVqVToIyp7RHjrvwENvbbASrUwkB9
         39OnK3qsiALcUWC4rjpeFDePkK1Jhatb8WaMoWOs38LBTWtDfB/gNhsy1bKpEragcrwk
         xa+XeusIoArjK+ZSlvmU+3QHsGg0ldxs5PFVxX2vv02Dk83ATPttdQ3vymC1PJhig2BB
         Bdj5t+nMpjl6Azliy8WeQh3TgB6MiyNJZJwWrutoChAfhiA8LCRxavbg27ir+VPZqL1q
         38yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450173; x=1790054973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbOqZAw6wTOw63b1G2ExHd4hbkezHdD6QRCAfQhtp2o=;
        b=IhcyJtEG0EkbDhtG8eEI6LzzSFNC9BR4wbnOTpGzESwChd5IWDa4XxEmAxyp7Cn9CL
         Ukm/erxIZZ89zSXyfH/dR7mnB8E11m9sL+h7BCgWMIgLOudIoLpz/wmZ4Hs6EyQQS+hc
         RtFYDt16dPh6zQUwloOU3QkR+hQYpPG3NVGY1NVfg01do7JIZSQp7ydwAq37h67xdQXC
         o9iWWA51jKnH15Yo9yofCO5eHXAr9JNZVhAreOOHHfranNOWPTk+VAOya1yAn62tBI0u
         bgblHObAB+R/9etlIlRnqLeoB1Vx9kl4xopzwSou6hWBKfl8J9j4COh9Y7FQgpjUkKJh
         PBsA==
X-Gm-Message-State: AFuF++nn0HMVqUcnqkw9tzoBjsCknuJzW/G36m2aa3Wf3VDIQYnjdwm/
	+j9QYpizadw4xaMuNfLb2qPK+FvDDB21IU5DCol53wkW2Yezr3yQhV/PaS5gCuY3/MmsRWG46LB
	QikFnGhV9U/xiED9yDeF/IGgpipIRQFpkmCCJmrllW0SVNScpauVvQTBYFgOFd1FJCZt747gu
X-Gm-Gg: AYBFou0nm/Nxmf6jydfpJHl5/IHrCAZCxYAuBEL3WJbFQL0q03KZfqeTUCWFqaQdCUq
	yg5O9tDKSHeUkNS8QfeVsTx3ELoJCnxwvq3+JEEqPnp3yr3D2/6RsqWLqSBk2tVgtbB1h3B2UUZ
	zaGP9N3NVsMVXL6agFW3YOqF/vQ2J2cIfDzLCBZrCr2Xb1nrK6pxMk0B9MeIHUxtrGWxX4iEu8N
	QfG5Z8+Al4TvkG3QqODIz71JufTwOPt8YCbBPWrSREU7R/12R94g5xfIkWvKgek4T3mZGIFI68s
	8jkuCmuX32JLq2RqfheJiDvxFcHqGaIQYsoq2z1jeM+/AJhUuGHdzUJLp7P60D4Jrfb5QOvE6Gs
	W6wJPpRPyLg5Vx1zcQDTqD7ImOzednPtzd9agL4/6Sel+3QLbd/R6W7QyLYugWLj9htnbuLpvpI
	oyGdTfUqIPJ4hmImTIUd/i+T0=
X-Received: by 2002:a17:90b:17c8:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39dec04f9d9mr10779426a91.14.1789450173445;
        Mon, 14 Sep 2026 22:29:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17c8:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39dec04f9d9mr10779379a91.14.1789450172943;
        Mon, 14 Sep 2026 22:29:32 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm30314339eec.11.2026.09.14.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:29:32 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
Subject: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS parameters for AP_VLAN
Date: Tue, 15 Sep 2026 10:59:23 +0530
Message-Id: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3NiBTYWx0ZWRfX+TCipi4k6/SF
 DzJpUdyjCsnjJ7UZbhlrevVphN8L8XSKadVYFn0+pXasf2br2zh9+T1jV9vVVudj6bs/oVZRIgZ
 UQrGEbZ+FK4r0M61AAetFQ6rJeUi5yMoTCRkikV4Hkw2ToFSpE9ZFgoi2BYgzQ4G7SkUnwv14z+
 AaE25OBR7BW/1JwZelPCWIBuxPQgn+TrL1cievK4nwprX8HK5Jn03HCmGtWLXaRyh2JYieiH9Yd
 Yl96NFhzQyMfkty4B9t89CEJ/gx4M5BPvKlwJ3DwyKOFmiNzC7VPhLNKfhQAg+xW/cE062VrygQ
 JR1H17tx+5QtbfnGEnRrp17k22urxP2Ej6O0OncN6X8KS3/uPObFBloxJYdl4i9ArRtGzb3GSwv
 Jg0Ghi1TMTpI3uA/DlBQ4D2ZrjIAMCAHxcVAwxxJ9NYfvu2jANbvElcM2Urh/GFHFWmVw6JfbL7
 l0rtuSLQaOljryGWOOw==
X-Proofpoint-GUID: 30zZfoPYNtxDqM_adGv4JGPlVpsghcRS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3NiBTYWx0ZWRfX16TZibwfnEIj
 LdvTo5tQx5r+hpn/OU9e2tKS2ymeJ2PJ/1Ce1NK1IKXjvtSQtz2OE3utIt9b39Vuk/aFEw6E6+i
 Absgq08KeOMCmO+Wq2b1qXWPloeD0+4=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8d7be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=IfjyXQZqvconvXi0t-4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 30zZfoPYNtxDqM_adGv4JGPlVpsghcRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_222936_031132_D47196BD 
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
v2:
  -Remove unnecessary sdata->bss NULL check.
---
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/sta_info.c    | 50 ++++++++++++++++++++++++--------------
 net/mac80211/util.c        | 17 +++++++++++++
 3 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 65311340db40..96978a4a7e2a 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2985,6 +2985,8 @@ ieee80211_uhr_cap_ie_to_sta_uhr_cap(struct ieee80211_sub_if_data *sdata,
 				    const struct ieee80211_uhr_cap *uhr_cap,
 				    u8 uhr_cap_len,
 				    struct link_sta_info *link_sta);
+struct ieee80211_bss_conf *
+ieee80211_get_sdata_bss_conf(struct ieee80211_sub_if_data *sdata, int link_id);
 
 #if IS_ENABLED(CONFIG_MAC80211_KUNIT_TEST)
 #define EXPORT_SYMBOL_IF_MAC80211_KUNIT(sym) EXPORT_SYMBOL_IF_KUNIT(sym)
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index fdf00cbf49d8..26c8b41042f8 100644
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
index a96078a6bfa2..3f24862ba713 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -4752,3 +4752,20 @@ bool ieee80211_vif_nan_started(struct ieee80211_vif *vif)
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
+	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
+		bss_sdata = get_bss_sdata(sdata);
+
+	if (link_id >= 0)
+		return sdata_dereference(bss_sdata->vif.link_conf[link_id],
+					 bss_sdata);
+
+	return &bss_sdata->vif.bss_conf;
+}

base-commit: 27b084bdd009c5c82346d39d7773bab3191dd299
-- 
2.34.1


