Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6327DC61CE8
	for <ath12k@archiver.kernel.org>; Mon,  9 Jun 2025 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1EmRpD2npRNqGpUwjI27WjLXqjYKB6qqybJcEPpnv4=; b=c7Ovi7nkm4kqmTmtKhCT/9e5tu
	ppGE2IMGWsYxOzSjhqr3fnTZcaGXq1M5SoObEFLcDCDXLrg2KWJO7rxC5iI/eHa+ipoqdaJ/9e/s6
	8MgSm3WbaNfLwjhMW3ewd3adeJEJQJ3Boxp39yo8riZCocXgbcfh0r3jmD3RUq1SnKuPWDwCpD1Pc
	EwBy9HCX+nfPJkbJdo27LF03UkfsTOsrz90tKrDvOD7NpggYeC6ijA8Ob5UR2Ih2+c50cISuDv9wH
	9kFGDXCBQE+f7NTX7wxbYohOYd1WcNHT2pYdKYf0dCLe4QbaahXFzYVIbtLvwAZvPPoFGkGbKqzNG
	8qJM5Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQFm-00000003BFr-0abI;
	Mon, 09 Jun 2025 00:20:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ6O-00000003AnA-30xR
	for ath12k@lists.infradead.org;
	Mon, 09 Jun 2025 00:11:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558L7Ijd010229
	for <ath12k@lists.infradead.org>; Mon, 9 Jun 2025 00:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1EmRpD2npRNqGpUwjI27WjLXqjYKB6qqybJcEPpnv4=; b=MicA5wEgEWoj6jet
	rs/iHA5F3I4fE4UPGxhnPYNslhghWl6ebhjqJOaY7RlfTf8VOgVrbpqXPffStkiB
	d5cm5eL6pKMlZmw7GVVYGdKPITv6bayOWS/6YokSI10JVSKp6EBbRv3KQ9fwgPfk
	nrh4a97l45JZoGpcDOmzWLA438q2DjlzVc6cA5cVRozB8zesYIWbf9xxE6JFvKKV
	qZl8c6Y+7J9IHAmirWFd+h5OCAygEOrB9FkhI/AXVkvp4c3nbMcjlfI/81SgOG7D
	2slarpdCc9cINAlL6KbGeevibIaIFDfvfDvxVNYYp7GA029Nxl9oPlTq5UmtTjKM
	wLTUnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv45m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 00:10:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso3294472a91.1
        for <ath12k@lists.infradead.org>; Sun, 08 Jun 2025 17:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749427859; x=1750032659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1EmRpD2npRNqGpUwjI27WjLXqjYKB6qqybJcEPpnv4=;
        b=aTJwL1oD3J51UYtgg8p9TM+wIRfJhvGr9yN2ww0zC2jWOZ3rssVQjAcTJ8QHdBQs9g
         7+RuqNyxUgIURpLgHvHrkat18QQmE79ZkeOo5wXjoBLfPpxiBUzFEV7SNQ5E/U1Bx7ld
         NrZj6KwX8rwf8JsvbCvjzYISutMq8JLVbXXURSNIRUVp3CgdcOhYkPHhLu7Y1YOqybAY
         E5qoV3MU0b33M8aDiRXrGPSNmFjhS8J3ipLRiiY9L4QpiAdCWet9xdwnyK2N65wcLtcE
         O+oME93jjCoNidIz5vEa4gIKJiqf+0mFCa4PaXZ+jxestnH7po+VQc5wwbiWBUaOtAJe
         COoA==
X-Forwarded-Encrypted: i=1; AJvYcCXFtXmP5KmNzyt+RUmsLt6u2ejIE07PDSK5bjBKsfXwV9lgsep1vyqkIKaNtb9e3UcznxYpe8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1V3GaWXxQuNyqlGUZIw9MmMkS2wKfLYYuM0hMeF59n47E9mNG
	QdlzL05hwuVNMgd7/9/Fb0tQErG5IeydVmXgN1iHOihQkXCt1aK3NBGmqy2m3MGy/eEeGHhmZyr
	7+cbnVJ0q/b+OfKpO8+6502YX414/m4ACWD9N2XZ4CgT13/cCZvr1ZfxFbc46yFH+
X-Gm-Gg: ASbGncvU2ENuEKzrx5iwIT0A/rtVdDB8nii1809YGB5NIxGlnSF/CHgczDu8ygfBekY
	Y4Qtm4qfyqhbxW4GJL8BBCoQJQqg2KhtfXjpgEjg1WYHgJVnMAaVqcwHi0zT94MWCY2HHiPCxxV
	CCMYVwTbMshvg279ZO/cvSBm/KuNWWEtFLI0uMHJEgLRjha+5qWbqOAKQEUP39hUSEQxZAfKZIJ
	TeknX2O7jw+N8GyWxB5d4op9y3oNsWYAr1SSwaC4yYABgIZaP7zLqk1EJAGvWbhCv+oS/dRZfi3
	vY32ZOhf3r01Uu9Z52buwNIpo1/ZdP4e9mOCSDyjtdwJxo/dumCB91m8B99scp+5FmZnJPLrYrn
	NHhUgN9MzGuiYWA8EPnOVDAecDp0v4JdlM4ZWiqw9
X-Received: by 2002:a17:90b:2f8b:b0:311:9c1f:8524 with SMTP id 98e67ed59e1d1-31347308561mr17256530a91.15.1749427858783;
        Sun, 08 Jun 2025 17:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf/r0Krf3hPhdgF4Y9krR6qZUl1T8YlKxxhKcWEiMCI81N7H20/OqAQvrHMKwi13aN0C8YlQ==
X-Received: by 2002:a17:90b:2f8b:b0:311:9c1f:8524 with SMTP id 98e67ed59e1d1-31347308561mr17256495a91.15.1749427858248;
        Sun, 08 Jun 2025 17:10:58 -0700 (PDT)
Received: from hu-rkaliapp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059cbsm43731235ad.165.2025.06.08.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 17:10:57 -0700 (PDT)
From: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
To: johannes@sipsolutions.net, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
Subject: [PATCH wireless-next 2/3] wifi: mac80211: Add preamble puncturing support for mesh
Date: Mon,  9 Jun 2025 05:40:47 +0530
Message-Id: <20250609001048.2263586-3-ramasamy.kaliappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BMkF3rb0_6hH3LvYEIr9csiQg6rg8vH5
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68462694 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=guqm4oZRX9gV8awLTVoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: BMkF3rb0_6hH3LvYEIr9csiQg6rg8vH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAwMCBTYWx0ZWRfX3ElKz/lnW4f3
 PlXMPNa8JLdn5qpcAUGbbIxsQ06OXeYf37rxa18k9ZYPc87oV016WkKdaZz0Ef1JquqzLkYqRlX
 /HmaVqL6KE5hp58waohqro2RXFtY/+oNoeNp+zZa31znB9qM5wG0c16m3/FcNas6mX/q99yGxdN
 P4mxoAVv3RnosgycuYag3nJmV6/xGRQ3ZcoXjQmgJvsgR6t3La/SFLRL9JB/ku/ItDquMjiBRnw
 1Fn88xK7Nc1XHHe4VOUqjeuPWwyJ8PVtKUB+Ztgp52qLr8nAn1qP7uxR6oB4aqGHqzRrSvCwoWZ
 Lm1EJZ833WYYR6e6FQdkPGQOrBbggjfvuvUCAnJkqj8G9rBK8AE5q4INSMoJK50H7Alwyyk4DCK
 gErLe3xiJgSgAkwP7cqcugvDXMlpoJh2pS8mD8krm22Sccop/iB2CImB87ggbLNl/7UYFhUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_171100_768240_8B2CAA4E 
X-CRM114-Status: GOOD (  23.98  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Preamble puncturing(“Punctured 242-tone RU") refers to the
transmission of a PPDU in which no signal is present in at
least one of the 20 MHz subchannels within the PPDU bandwidth.
Puncturing might be the result of the unavailability of 20 MHz
subchannel(s) within the PPDU bandwidth, such as a busy channel
indicated by the CCA or the setting of the disabled subchannel
bitmap field (16 bit field) in the EHT Operations element.

EHT disabled sub channel bitmap is a 16 bit field where
each bit corresponds to a 20 MHz channel in the given bandwidth.
Bit 0 corresponding to the channel with lowest frequency.
Bit set to 1 indicates that the channel is punctured, otherwise active.

Userspace may send the EHT disabled sub channel bitmap via attribute
NL80211_ATTR_PUNCT_BITMAP in frequency params as a part of join mesh
(NL80211_CMD_JOIN_MESH) command. Validate the received puncturing bitmap
and copy it to chandef’s punctured bitmap for the mesh interface data.

Build the mesh beacon's EHT Operation element, including
disable_sub_chan_bitmap_present and disable_subchannel_bitmap
based on chandef's puncture.

Validate and update peer mesh stations puncturing bitmap
in local structures while adding new mesh station
(parsed from peer mesh station's EHT Operation element)

Add changes to allow mesh peering with stations that advertise
different puncturing pattern than the local station, and determine
the bandwidth for each peer mesh.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Signed-off-by: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>
---
 include/net/mac80211.h    |  5 ++++-
 net/mac80211/cfg.c        | 19 ++++++++++++++++++-
 net/mac80211/mesh.c       |  9 +++++++++
 net/mac80211/mesh_plink.c | 38 ++++++++++++++++++++++++++++++++++++++
 net/mac80211/util.c       | 15 +++++++++++++--
 5 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 82617579d910..fc3fcd3c3ec8 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2435,7 +2435,9 @@ struct ieee80211_sta_aggregates {
  *	notifications and capabilities. The value is only valid after
  *	the station moves to associated state.
  * @txpwr: the station tx power configuration
- *
+ * @punctured: Preamble puncturing bitmap. Each bit represents
+ *	a 20 MHz channel, lowest bit corresponding to the lowest channel.
+ *	Bit set to 1 indicates that the channel is punctured.
  */
 struct ieee80211_link_sta {
 	struct ieee80211_sta *sta;
@@ -2456,6 +2458,7 @@ struct ieee80211_link_sta {
 	u8 rx_nss;
 	enum ieee80211_sta_rx_bandwidth bandwidth;
 	struct ieee80211_sta_txpwr txpwr;
+	u16 punctured;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index d9d88f2f2831..8caedd353796 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1948,13 +1948,30 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 						  (void *)params->he_6ghz_capa,
 						  link_sta);
 
-	if (params->he_capa && params->eht_capa)
+	if (params->he_capa && params->eht_capa) {
 		ieee80211_eht_cap_ie_to_sta_eht_cap(sdata, sband,
 						    (u8 *)params->he_capa,
 						    params->he_capa_len,
 						    params->eht_capa,
 						    params->eht_capa_len,
 						    link_sta);
+		/* 802.11s mesh STA may have different eht puncturing pattern,
+		 * update it here so that drivers can use if needed.
+		 */
+		if (ieee80211_vif_is_mesh(&sdata->vif) && params->punctured) {
+			struct cfg80211_chan_def chandef;
+			struct ieee80211_channel *chan = link->conf->chanreq.oper.chan;
+
+			cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_NO_HT);
+			chandef.punctured = params->punctured;
+			chandef.width = link->conf->chanreq.oper.width;
+			chandef.width = link->conf->chanreq.oper.width;
+			chandef.center_freq1 = link->conf->chanreq.oper.center_freq1;
+
+			if (cfg80211_chandef_valid(&chandef))
+				link_sta->pub->punctured = params->punctured;
+		}
+	}
 
 	ieee80211_sta_init_nss(link_sta);
 
diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index 5cc56d578048..1edb4bc9d635 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -112,6 +112,12 @@ bool mesh_matches_local(struct ieee80211_sub_if_data *sdata,
 				       ie->eht_operation,
 				       &sta_chan_def);
 
+	/* In order to allow mesh peering when peer advertising different
+	 * puncturing bitmaps, update the local mesh punctured bitmap
+	 * with the new mesh peer punctured bitmap to ensure compatibility.
+	 */
+	sta_chan_def.punctured = sdata->vif.bss_conf.chanreq.oper.punctured;
+
 	if (!cfg80211_chandef_compatible(&sdata->vif.bss_conf.chanreq.oper,
 					 &sta_chan_def))
 		return false;
@@ -672,6 +678,9 @@ int mesh_add_eht_oper_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *sk
 	len = 2 + 1 + offsetof(struct ieee80211_eht_operation, optional) +
 		      offsetof(struct ieee80211_eht_operation_info, optional);
 
+	if (sdata->vif.bss_conf.chanreq.oper.punctured)
+		len += sizeof(sdata->vif.bss_conf.chanreq.oper.punctured);
+
 	if (skb_tailroom(skb) < len)
 		return -ENOMEM;
 
diff --git a/net/mac80211/mesh_plink.c b/net/mac80211/mesh_plink.c
index 9c6a2b342170..5fde9d6ec1f1 100644
--- a/net/mac80211/mesh_plink.c
+++ b/net/mac80211/mesh_plink.c
@@ -430,11 +430,49 @@ static void mesh_sta_info_init(struct ieee80211_sub_if_data *sdata,
 	struct ieee80211_supported_band *sband;
 	u32 rates, changed = 0;
 	enum ieee80211_sta_rx_bandwidth bw = sta->sta.deflink.bandwidth;
+	struct cfg80211_chan_def eht_chandef;
 
 	sband = ieee80211_get_sband(sdata);
 	if (!sband)
 		return;
 
+	/* 802.11s mesh peer may have different eht puncturing pattern,
+	 * update it here so that drivers can use if needed.
+	 */
+	if (elems->eht_operation &&
+	    (elems->eht_operation->params & IEEE80211_EHT_OPER_INFO_PRESENT) &&
+	    (u8_get_bits(elems->eht_operation->optional[0],
+			 IEEE80211_EHT_OPER_CHAN_WIDTH) >=
+	     IEEE80211_EHT_OPER_CHAN_WIDTH_80MHZ) &&
+	    (elems->eht_operation->params &
+	     IEEE80211_EHT_OPER_DISABLED_SUBCHANNEL_BITMAP_PRESENT)) {
+		struct ieee80211_channel *chan = sdata->vif.bss_conf.chanreq.oper.chan;
+
+		cfg80211_chandef_create(&eht_chandef, chan, NL80211_CHAN_NO_HT);
+		eht_chandef.punctured = (elems->eht_operation->optional[4] << 8) |
+					 elems->eht_operation->optional[3];
+		/* Validate Peer's Puncturing Bitmap and reset if invalid */
+		switch (u8_get_bits(elems->eht_operation->optional[0],
+				    IEEE80211_EHT_OPER_CHAN_WIDTH)) {
+		case IEEE80211_EHT_OPER_CHAN_WIDTH_80MHZ:
+			eht_chandef.width = NL80211_CHAN_WIDTH_80;
+			break;
+		case IEEE80211_EHT_OPER_CHAN_WIDTH_160MHZ:
+			eht_chandef.width = NL80211_CHAN_WIDTH_160;
+			break;
+		case IEEE80211_EHT_OPER_CHAN_WIDTH_320MHZ:
+			eht_chandef.width = NL80211_CHAN_WIDTH_320;
+			break;
+		default:
+			eht_chandef.width = NL80211_CHAN_WIDTH_20;
+		}
+		eht_chandef.center_freq1 =
+			ieee80211_channel_to_frequency(elems->eht_operation->optional[1],
+						       chan->band);
+		if (cfg80211_chandef_valid(&eht_chandef))
+			sta->sta.deflink.punctured = eht_chandef.punctured;
+	}
+
 	rates = ieee80211_sta_get_rates(sdata, elems, sband->band, NULL);
 
 	spin_lock_bh(&sta->mesh->plink_lock);
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 27d414efa3fd..442def202cad 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -2850,9 +2850,13 @@ u8 *ieee80211_ie_build_eht_oper(u8 *pos, const struct cfg80211_chan_def *chandef
 	u8 eht_oper_info_len =
 		offsetof(struct ieee80211_eht_operation_info, optional);
 	u8 chan_width = 0;
+	u8 ie_len = 0;
+
+	if (chandef->punctured)
+		ie_len += sizeof(chandef->punctured);
 
 	*pos++ = WLAN_EID_EXTENSION;
-	*pos++ = 1 + eht_oper_len + eht_oper_info_len;
+	*pos++ = 1 + eht_oper_len + eht_oper_info_len + ie_len;
 	*pos++ = WLAN_EID_EXT_EHT_OPERATION;
 
 	eht_oper = (struct ieee80211_eht_operation *)pos;
@@ -2904,7 +2908,14 @@ u8 *ieee80211_ie_build_eht_oper(u8 *pos, const struct cfg80211_chan_def *chandef
 	eht_oper_info->control = chan_width;
 	pos += eht_oper_info_len;
 
-	/* TODO: eht_oper_info->optional */
+	if (chandef->punctured) {
+		eht_oper->params |=
+			IEEE80211_EHT_OPER_DISABLED_SUBCHANNEL_BITMAP_PRESENT;
+
+		eht_oper_info->optional[0] = chandef->punctured & 0x00FF;
+		eht_oper_info->optional[1] = chandef->punctured >> 8;
+		pos += sizeof(chandef->punctured);
+	}
 
 	return pos;
 }
-- 
2.34.1


