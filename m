Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876B606A327
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xbKZYWws;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=logWVONR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RjDK88l9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=; b=xbKZYWwsfao+ef
	flmgiML8pIaFU1uaM6W6pw+MxjVgbkCYKjewX0T6LqVYFiibD7Re29AUthy7IfRZR3SijaM+Vk0gt
	DZxnD7QZPPhn6+kgYfGTlMwKY8mQ6X0cOq1ENvp8sXuS3CtiqS0sOfUbDDEGlGM9Dxerrufni1vVP
	zG7y0hK7ZCMZHCyCNloZxXeKHExPP/Ka3J189mU4ZNIoNgaP8LtbhK4555XGkaw8sGF01RTrDZaSx
	57Yc/0Y4Jkm+353wqj3grUYlWUS1zgLr1ODF2Z33aWFcJ8Vwm8aF9JUDmbmqz+S8pIrxd9C9CmOg5
	NihpLJUE+Uxv6J3UQmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtt-0000000BrAb-3eN4;
	Thu, 26 Nov 2026 02:07:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtk-0000000Br4B-1GJN
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJghDG1138083
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CCPrWCw3D5F
	fBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=; b=logWVONRMkvqAHyFQd9tVH4HHfg
	xxxSF4yZTjbWJZ3VFH0L6/YuKKlIyiZyz8HWfHB1KtAij1MhmetLmWUuXa0fzUJs
	0kNDzYSvUgARxV8qbJKGsEW4M9E7OsHhx5niHOy1zYWoeVY42Y8VwPtlWZAviSXZ
	ZJJQlVVLoKeSLmfhSBWsrvH+RjepOWrpzCpfKpCwWYwh6unU0sFcTRdRPA7UIuj1
	aVb5h3rZ0iKtPWJEQAbQQMAZtwTPpQuXpfACekaTkOXHjihwPr+xGkiSzPMEPF50
	omrFNgXafvDjpx1cldtQE8BDNUJdoUnnEDWsw4pZOOUu9X0r5FlVjGLbLTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s8yw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5442379a91.2
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658863; x=1796263663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=;
        b=RjDK88l9OmhYanJuVb7DcOk/ObqPUX1bn8iZoCKe1RXK1/odOv1isQP1sYvhf8+g2B
         qNr8RBEzFvBd9m36699r9toVbd3oVdKLov5lzJBbxQjJRwEOZxeCbpVbwCl57raSPq7m
         +pouqdPSW/gkvc82nhT4M+m/8k/1TMo7dtcRhdP/1Nll7/zqG8EyJNyT+zvT8qxStSLJ
         8Rm9HkT7b2Gtze2D71sENLIPvtVtWg6BW/Mcxx+0TmFTrMNOy2wuuYqc+JXpMLEep50w
         SrulYO/4FlBz8rv2sgLvEf80R1UPGT41QToxI2eZT7YrEvUOcAjLwQr9QdndbPMcJClS
         k/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658863; x=1796263663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CCPrWCw3D5FfBPyq8VVeUvJdBhpOt/nigU/LskY0y7M=;
        b=2UBHvFRPElq5jNlbEZAZXhLBB4mz16g+Fy9vAB6jjdLxkBE7ZLaSnAhNw/2dczm4GO
         ftvkg2XK5/hj9p+Ie2vqvmjFdIGGnQTWZYKvuxVLWfBU08zPC/9fheHMF3v7LkMC24tU
         HWg9j02p3i0wnRN06KmVBbeGa55CVqrvZ2X90urxc5HguG1uY5HxPylgfdRPqcgASnFV
         057e0VboszOiFy/d31sNspfoaP1Jq7fBcuM9HIqvJN7oaELJKlbODfqMMp5NJWnIXlEh
         b5URI8AfkR0PNQ5nf3SoPs+TG1m2XpkI/6K2e11lHWnMVKoQA6zBnT/0o+SpbbA/BGND
         dkxQ==
X-Gm-Message-State: APuU4Z+BmNOeNuqCor6PsY7eTxfxUieIoP4BmY2BPX7igZ93l2qS0GY8
	BDGpsJq2HfMS+6/HGv9UB8awH/T7HeNlx7hNl6FzIzXeUAbj8lgEfcTaFx8GnqePwOqR9kRgb3q
	+XnO/i8cnO4pK/F0EEMMwcp93LwCH1ckY1ocS0QRsavA1LCah9MQRy0l4us7aS7Ok
X-Gm-Gg: AZFdTZdSJ+v/U8NGfpDZFDIWKtAqCSLPofpoQPlTF5PLjfzU7RtOvYDY4FVcRr68wJh
	PlMdjQnqSYnIM0XRhoRcgBScpgNaEAgVVAqxvifmtfgcxKjDOiCltVV028PgwAUzHUP9w5JYIQq
	sQBwpMza3JqJz4aXk+H1yciAkR3Dp4mbp+OTg5jMCpFIwMQ722s3S97sdZiZ1jaKczLWYGOeU87
	k5fqJZIB9ncrwL0aEq6C5u4/dif8w6T/aT6tNHiKh8nC05ELF8GscK4ww36Lu7TOyLykku4F4ZE
	/ku1E/1AUuKXj1zoy6yl94ViJ+HkIvyadhYJuW5Iu9Z+u8Br9QtnabLkeFyQTT5me88Tz/JxLSV
	xI18SU9CoUq5LxpS8hOXSs5v9ahLM0dW31LZq6B7muzbHQXNE6YXLvuf6doXzMUs0EvvO7upReq
	3M8T78dtPFLWtL4ceYFO0bX+VJ6mskCuqKhdxe
X-Received: by 2002:a17:90b:4f8f:b0:3b4:f260:72de with SMTP id 98e67ed59e1d1-3b4f2607685mr4061030a91.64.1795658862909;
        Wed, 25 Nov 2026 18:07:42 -0800 (PST)
X-Received: by 2002:a17:90b:4f8f:b0:3b4:f260:72de with SMTP id 98e67ed59e1d1-3b4f2607685mr4060999a91.64.1795658862187;
        Wed, 25 Nov 2026 18:07:42 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:41 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 4/6] wifi: ath12k: fill MLO simultaneous-link fields in peer assoc WMI
Date: Thu, 26 Nov 2026 10:07:25 +0800
Message-Id: <20261126020727.3273337-5-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07946f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UVoeoLa06s1F6bhou8kA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: aPTV_mydusifJY0A0UR6WDzMctCJrSKV
X-Proofpoint-ORIG-GUID: aPTV_mydusifJY0A0UR6WDzMctCJrSKV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX6W/VSeLbYPoY
 JQxRhHGqCYa0krRGNQlh/ZXKDGSefXSlTvNGulbqDtG4fpGloZBs0dAmTohLoZ+3knoSpH0/UZp
 W8kLas0i2HeES6FHgPkVN9/hKuq7iUw6xh7YJ7XIB19nVUgqkUJ0+9UtPOWRevAIqLa97reeRxB
 i/2Ec+13ngz0PoMZEuuD9UEXarbXAWG+W+/46YJRLKALcGkHsgJL9u6OsqYUKMO5frvtpgFMZ42
 ioN7V+XuGo1jsUW6MT5vVLplLZfczp+t52MRYwlyFRFCJHQX2T44iFITy99qRw7g4yu4nlHDgtg
 NDU5ktZvU7OEIFVAAL2aVSAUuNDHVU7zIROw6OJm1n77hciTevkfiLJHRuuispMwe+12djThnFY
 Jou74kCWu56MbNM/Wpy63A5jJlw7gUfDNvvM/Yy0v6AUytyrw3O26T0gIZ4uHTYGPJuJLZx3kGR
 RZr0MkHJpxSOg47Ihag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX5s+MgbaqzFQl
 BObNFl7EgkQz3Z09SMXrDnDRM2vyNXID0XSIW0lysA6WgwEGM1H7GNWBYKO80SBZgCMMMziBRzZ
 szRc6W342yoEgMA/GbKjbKfFCLUV/2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180745_440144_722BC848 
X-CRM114-Status: GOOD (  15.27  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Populate max_num_simultaneous_links and
recommended_max_num_simultaneous_links for MLO station-mode peer
association and pass raw counts to firmware in the WMI peer-assoc
command.

Derive the local maximum from the station iftype's advertised MLD
capabilities and operations instead of caching another copy in
ath12k_hw. Convert its IEEE 802.11be N-1 encoding to raw N when
preparing the peer-association argument.

Read the AP recommendation from sta->ext_mld_capa_ops, which mac80211
already tracks before the station enters IEEE80211_STA_ASSOC. The
recommendation is a raw count; use the local maximum when it is zero,
reserved (one), or exceeds that maximum.

Leave the new fields zero in AP mode: the current station API does not
provide the non-AP peer's maximum simultaneous-link capability, and
the AP's own capability is not a valid substitute.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c |  4 ++++
 drivers/net/wireless/ath/ath12k/wmi.h |  9 +++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e78c711b7832..2d7ee2ab9d6d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3529,13 +3529,17 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 				    struct ath12k_wmi_peer_assoc_arg *arg)
 {
+	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arsta->arvif->ahvif);
 	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(arsta->ahsta);
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
 	struct peer_assoc_mlo_params *ml = &arg->ml;
 	struct ath12k_sta *ahsta = arsta->ahsta;
 	struct ath12k_link_sta *arsta_p;
 	struct ath12k_link_vif *arvif;
 	struct ath12k_hw *ah = arsta->arvif->ar->ah;
 	unsigned long links;
+	u8 rec_max_links;
+	u8 max_links;
 	u8 link_id;
 	int i;
 
@@ -3573,6 +3577,31 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;
+
+	if (vif->type == NL80211_IFTYPE_STATION) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       vif->type);
+		/*
+		 * MLD Capabilities and Operations uses N-1 encoding
+		 * (IEEE 802.11be Table 9-417n); firmware peer assoc uses raw N.
+		 */
+		max_links = u16_get_bits(iftype_ext_capa->mld_capa_and_ops,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS) + 1;
+		rec_max_links =
+		    u16_get_bits(sta->ext_mld_capa_ops,
+				 IEEE80211_EHT_ML_EXT_MLD_CAPA_OP_RECO_MAX_LINKS_MASK);
+		/*
+		 * Figure 9-1074t / Table 9-417o define Recommended Max
+		 * Simultaneous Links as raw count L (0 no recommendation,
+		 * 1 reserved).
+		 */
+		if (rec_max_links <= 1 || rec_max_links > max_links)
+			rec_max_links = max_links;
+
+		ml->max_num_simultaneous_links = max_links;
+		ml->recommended_max_num_simultaneous_links = rec_max_links;
+	}
+
 	links = ahsta->links_map;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 5cf104536dbf..443d29fdd763 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2473,6 +2473,10 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	ml_params->logical_link_idx = cpu_to_le32(arg->ml.logical_link_idx);
 	ml_params->ml_peer_id = cpu_to_le32(arg->ml.ml_peer_id);
 	ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
+	ml_params->max_num_simultaneous_links =
+		cpu_to_le32(arg->ml.max_num_simultaneous_links);
+	ml_params->recommended_max_num_simultaneous_links =
+		cpu_to_le32(arg->ml.recommended_max_num_simultaneous_links);
 
 	eml_cap = arg->ml.eml_cap;
 	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 843f1d11f9c8..204eebb1d0c7 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3926,6 +3926,8 @@ struct peer_assoc_mlo_params {
 	u8 num_partner_links;
 	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
 	u16 eml_cap;
+	u8 max_num_simultaneous_links;
+	u8 recommended_max_num_simultaneous_links;
 };
 
 struct wmi_rate_set_arg {
@@ -4031,6 +4033,13 @@ struct wmi_peer_assoc_mlo_params {
 	__le32 emlsr_trans_timeout_us;
 	__le32 emlsr_trans_delay_us;
 	__le32 emlsr_padding_delay_us;
+	__le32 msd_dur_subfield;
+	__le32 msd_ofdm_ed_thr;
+	__le32 msd_max_num_txops;
+	__le32 max_num_simultaneous_links;
+	__le32 nstr_indication_bitmap;
+	__le32 recommended_max_num_simultaneous_links;
+	__le32 ml_reconfig;
 } __packed;
 
 struct wmi_peer_assoc_complete_cmd {
-- 
2.25.1


