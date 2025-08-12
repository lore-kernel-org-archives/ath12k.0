Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE21CA0ED1
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 03:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TwS3E846J+ZWd6EEJLtLHDZ+AD/jB2y+dq00R3oQ9mQ=; b=lzjprKDScUhtqLcB4VMuY4iOdM
	RVzImVBD9KzQDhX4XYx8Y2skFyIjldTTbQOWGNwGZyl4TgjnXZuaMR4fzx8i5uj1wjWzMNNZhvQSV
	CNlbEo3Puz45VBfioiaF5HziArQ1u+BQMnzxCCUBnSziApp2/4vVGAHjNW9/l1WpXF32V/HXhGhVJ
	iAEMExhD9/0fMuju4H3Vu8dYnLOONPwZzk4BAf0mq4zgKogxHWI70AsCdKfJle6MB52/w7cxFE04N
	2pjbGi+Zu2D5DYClEguDs2iSQhoXNOCm/B7la2GEKxC2e6NYOr1sSS0ZO+lnUQW7wMpq3hltL4031
	0K65N72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfK8-00000009fk3-48Gu;
	Tue, 12 Aug 2025 03:05:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfFu-00000009ey2-3mP6
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 03:00:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJuMcf008171
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 03:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TwS3E846J+ZWd6EEJLtLHD
	Z+AD/jB2y+dq00R3oQ9mQ=; b=hlAx1eoAld4TjL+bkWlIhQclgnlSteItffwC/G
	Vm3jCzLxFYozZFalilITeCZPDe0ikpuP2ofefAqpie3iu032bR0vIzo4A3/vrc5i
	9n4tEtOq0fYkARLtUvSjg5DFSxZQsyDkVD7NkHCDmg8R0kCXPNh7uZFtjXNEIqPm
	CzPPqWI/6r9hbqyNxsQ3pzYKGAoIAEeiMb2RFGaLbHNwZ17AqgidjvpAUoeC4pul
	Eoy7gKUC8jAlGDTQrfskw+0+eBTHFiPvSscYPFUgCYxE6YFXn0AmW+i+/AyD3f/T
	nA2zzCUb7dYj6qiKCYtWIBa3WdlFS/atpwBVk8W14pdVoO9w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjd14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 03:00:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-321ab4e0619so1919800a91.1
        for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 20:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754967652; x=1755572452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwS3E846J+ZWd6EEJLtLHDZ+AD/jB2y+dq00R3oQ9mQ=;
        b=JXomQGaNh3OseK0Job73JvRuuH8MsoyrqL5k7/fW57+6YBJtEBthPxi5O/YIJPj0dT
         3pCxyW68+6k7RJopmp3UOYAsuIDJlXU6okGZ9BTZ2gaYStcCvf8CgA0rRQM8QWPUv2ut
         eeKhLNE6Fkpwtc2U881LJ1FPDu7usPbwc9TNluyOxi8JA01FlH0bpDk1wfgXHwblG6Q7
         I5Jpy8xRObzzx4BopG8ZRQnbJrdr2Mh/baWkDP5e/alXfiPbl6uEEoBy7c20vvHQ8+wC
         OeQn/SvW3KOZ5JotM05lVt6VHEZOkwdQEwHyNrEcpLn10h95ZNg/z2xMTA0OmhBD61FR
         SE9g==
X-Gm-Message-State: AOJu0YxeNjHZKtBk32QsxKWHfyR0y0YltiTTILy2i2mQdwS+DSfTF2nI
	YS1UvcWyuTu5wPuSCU0cfJs1rAdYDr8rXCs9SPzOXUJDqzYmSQTxYKtJXzTxp8lPzJpJi6kU3NO
	3eaEadcYEyDW4Fgxefw/fSk3bkf9zxqpL7iqk1J409cpTLcAFI3XWpjwqiVVom1B5V6K2wSDZ
X-Gm-Gg: ASbGncubRXOcBVo1OcNbEhXbTlsiJdvyr7pCVB8S46p7DJRxCP+LIQzblBfujWrp0gb
	Osm6upBF4OUKJ1sTTuPRThJJGhtoWAQzzslZxiAdFBq9eeHTy+PkPcvgIQ/prmu83dQyY0wy/Uo
	xWdQzrPaf+SvrkXn47YScbD6hISxeiqFGMSxyO+mGfADDTNc6gVT0g8vKBb9GETX6XskI6bdmuz
	sF+cm6qg5l1CoDWYcQu+A0vbvAS7JYxJGLdgM/jTanU8FhqWyIHgK4sr3hUJcqzaVDIrC3WnWIj
	eEs6OyKog6N0pPd2oRumWLi5J8VU9aLSGZexWgUaYuCfoR4czW2OX+4w3BMPb0lv6EMNbqKfbVu
	kN8TAaSDMc+xHfBuCd5dGVuFFej9dJkW9zmPYV3nU
X-Received: by 2002:a17:90b:3510:b0:31f:2bbb:e6a8 with SMTP id 98e67ed59e1d1-321c0a78a7bmr2506901a91.12.1754967652120;
        Mon, 11 Aug 2025 20:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/nFvQwwuAod9+PjBVbnswS09eknXDWQCTQ5Z9MtqtZmVyuvHWJsFo4SDydd26m8M2JHjO0A==
X-Received: by 2002:a17:90b:3510:b0:31f:2bbb:e6a8 with SMTP id 98e67ed59e1d1-321c0a78a7bmr2506850a91.12.1754967651436;
        Mon, 11 Aug 2025 20:00:51 -0700 (PDT)
Received: from lingbok.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129d6b9sm16376074a91.35.2025.08.11.20.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:00:50 -0700 (PDT)
From: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
X-Google-Original-From: Lingbo Kong <quic_lingbok@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, lingbo.kong@oss.qualcomm.com
Subject: [PATCH ath-next V4] wifi: ath12k: report station mode per-chain signal strength
Date: Tue, 12 Aug 2025 11:00:36 +0800
Message-ID: <20250812030044.688-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX7CcGkYKH459h
 WZcoGkEJ3Jvc8SVZ8GJ3orpi7n4zqdaTKjfw5189YOJ6xXjwHotk0cK1s0aJbuv6daBmKgn4biL
 1ved2n5cOZW/4S5sWNRcPsCi0HhML3EaPi9023f3IafVIDIklfR+5P7g0XmJzNoYkYlLvAs0+xP
 5aSSjKzjSJx31chER6QnOHzDVtMZga86qB8/zaYswQZQFxnW9at29ga1VRTKkYfuEd1vlqG5fOp
 7i7AoE3PihZ3oZ2KJS5ffEty+B7TJOamFTwQYnrQ45sCk0xmKahLT3u+jR/ak1b8nJ2Ba0NhxJ9
 o8daOjIalPI5thTwpGgp/8WELib4WSdu2qCVQHbjyyma3zqZV1ixRm6n50FeKPN9Z51w7NSLGtu
 kLyO7LQp
X-Proofpoint-GUID: 99h_Y8tk9LGdn7eCDSm29tKuh_CKVjGV
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689aae65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=k1aAsksJOUkTdZsVf0wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 99h_Y8tk9LGdn7eCDSm29tKuh_CKVjGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_200055_067490_DED6A6DF 
X-CRM114-Status: GOOD (  24.22  )
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

From: Lingbo Kong <lingbo.kong@oss.qualcomm.com>

Currently, command “iw wlan0 station dump” does not show per-chain signal
strength.

This is because ath12k does not handle the num_per_chain_rssi and
rssi_avg_beacon reported by firmware to ath12k.

To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
handle num_per_chain_rssi and rssi_avg_beacon in the
ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
strength to the chain_signal of struct station_info.

After that, "iw dev xxx station dump" shows the correct per-chain signal
strength.
Such as:

Station AA:BB:CC:DD:EE:FF (on wlan0)
        inactive time:  212 ms
        rx bytes:       10398
        rx packets:     64
        tx bytes:       4362
        tx packets:     33
        tx retries:     49
        tx failed:      0
        beacon loss:    0
        beacon rx:      14
        rx drop misc:   16
        signal:         -45 [-51, -46] dBm
        beacon signal avg:      -44 dBm

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219751
Signed-off-by: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
---
v4:
1.use another email

v3:
1.rebase to d9104cec3e8f

v2:
1.add break to avoid warning

 drivers/net/wireless/ath/ath12k/core.h |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 27 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c  | 98 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  | 18 ++++-
 4 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 519f826f56c8..3c1996400512 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -72,6 +72,9 @@
 #define ATH12K_MAX_MLO_PEERS            256
 #define ATH12K_MLO_PEER_ID_INVALID      0xFFFF
 
+#define ATH12K_INVALID_RSSI_FULL -1
+#define ATH12K_INVALID_RSSI_EMPTY -128
+
 enum ath12k_bdf_search {
 	ATH12K_BDF_SEARCH_DEFAULT,
 	ATH12K_BDF_SEARCH_BUS_AND_BOARD,
@@ -560,6 +563,7 @@ struct ath12k_link_sta {
 	u32 bw_prev;
 	u32 peer_nss;
 	s8 rssi_beacon;
+	s8 chain_signal[IEEE80211_MAX_CHAINS];
 
 	/* For now the assoc link will be considered primary */
 	bool is_assoc_link;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bd1ec3b2c084..e02617e8ee7b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12598,6 +12598,27 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
+static void ath12k_mac_put_chain_rssi(struct station_info *sinfo,
+				      struct ath12k_link_sta *arsta)
+{
+	s8 rssi;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sinfo->chain_signal); i++) {
+		sinfo->chains &= ~BIT(i);
+		rssi = arsta->chain_signal[i];
+
+		if (rssi != ATH12K_DEFAULT_NOISE_FLOOR &&
+		    rssi != ATH12K_INVALID_RSSI_FULL &&
+		    rssi != ATH12K_INVALID_RSSI_EMPTY &&
+		    rssi != 0) {
+			sinfo->chain_signal[i] = rssi;
+			sinfo->chains |= BIT(i);
+			sinfo->filled |= BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL);
+		}
+	}
+}
+
 static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 					 struct ieee80211_vif *vif,
 					 struct ieee80211_sta *sta,
@@ -12655,6 +12676,12 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath12k_mac_get_fw_stats(ar, &params)))
 		signal = arsta->rssi_beacon;
 
+	params.stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
+	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
+	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    !(ath12k_mac_get_fw_stats(ar, &params)))
+		ath12k_mac_put_chain_rssi(sinfo, arsta);
+
 	spin_lock_bh(&ar->data_lock);
 	noise_floor = ath12k_pdev_get_noise_floor(ar);
 	spin_unlock_bh(&ar->data_lock);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index da85c28ec355..12eb72fc4713 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -30,6 +30,9 @@ struct ath12k_wmi_svc_ready_parse {
 struct wmi_tlv_fw_stats_parse {
 	const struct wmi_stats_event *ev;
 	struct ath12k_fw_stats *stats;
+	const struct wmi_per_chain_rssi_stat_params *rssi;
+	int rssi_num;
+	bool chain_rssi_done;
 };
 
 struct ath12k_wmi_dma_ring_caps_parse {
@@ -185,6 +188,8 @@ static const struct ath12k_wmi_tlv_policy ath12k_wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
 	[WMI_TAG_11D_NEW_COUNTRY_EVENT] = {
 		.min_len = sizeof(struct wmi_11d_new_cc_event) },
+	[WMI_TAG_PER_CHAIN_RSSI_STATS] = {
+		.min_len = sizeof(struct wmi_per_chain_rssi_stat_params) },
 };
 
 __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len)
@@ -8218,6 +8223,77 @@ static int ath12k_wmi_tlv_fw_stats_data_parse(struct ath12k_base *ab,
 	return ret;
 }
 
+static int ath12k_wmi_tlv_rssi_chain_parse(struct ath12k_base *ab,
+					   u16 tag, u16 len,
+					   const void *ptr, void *data)
+{
+	const struct wmi_rssi_stat_params *stats_rssi = ptr;
+	struct wmi_tlv_fw_stats_parse *parse = data;
+	const struct wmi_stats_event *ev = parse->ev;
+	struct ath12k_fw_stats *stats = parse->stats;
+	struct ath12k_link_vif *arvif;
+	struct ath12k_link_sta *arsta;
+	struct ieee80211_sta *sta;
+	struct ath12k_sta *ahsta;
+	struct ath12k *ar;
+	int vdev_id;
+	int j;
+
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch update stats ev");
+		return -EPROTO;
+	}
+
+	if (tag != WMI_TAG_RSSI_STATS)
+		return -EPROTO;
+
+	if (!stats)
+		return -EINVAL;
+
+	stats->pdev_id = le32_to_cpu(ev->pdev_id);
+	vdev_id = le32_to_cpu(stats_rssi->vdev_id);
+	guard(rcu)();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, stats->pdev_id);
+	if (!ar) {
+		ath12k_warn(ab, "invalid pdev id %d in rssi chain parse\n",
+			    stats->pdev_id);
+		return -EPROTO;
+	}
+
+	arvif = ath12k_mac_get_arvif(ar, vdev_id);
+	if (!arvif) {
+		ath12k_warn(ab, "not found vif for vdev id %d\n", vdev_id);
+		return -EPROTO;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "stats bssid %pM vif %p\n",
+		   arvif->bssid, arvif->ahvif->vif);
+
+	sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
+					   arvif->bssid,
+					   NULL);
+	if (!sta) {
+		ath12k_dbg(ab, ATH12K_DBG_WMI,
+			   "not found station of bssid %pM for rssi chain\n",
+			   arvif->bssid);
+		return -EPROTO;
+	}
+
+	ahsta = ath12k_sta_to_ahsta(sta);
+	arsta = &ahsta->deflink;
+
+	BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
+		     ARRAY_SIZE(stats_rssi->rssi_avg_beacon));
+
+	for (j = 0; j < ARRAY_SIZE(arsta->chain_signal); j++)
+		arsta->chain_signal[j] = le32_to_cpu(stats_rssi->rssi_avg_beacon[j]);
+
+	stats->stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
+
+	return 0;
+}
+
 static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
 					 u16 tag, u16 len,
 					 const void *ptr, void *data)
@@ -8232,6 +8308,22 @@ static int ath12k_wmi_tlv_fw_stats_parse(struct ath12k_base *ab,
 	case WMI_TAG_ARRAY_BYTE:
 		ret = ath12k_wmi_tlv_fw_stats_data_parse(ab, parse, ptr, len);
 		break;
+	case WMI_TAG_PER_CHAIN_RSSI_STATS:
+		parse->rssi = ptr;
+		if (le32_to_cpu(parse->ev->stats_id) & WMI_REQUEST_RSSI_PER_CHAIN_STAT)
+			parse->rssi_num = le32_to_cpu(parse->rssi->num_per_chain_rssi);
+		break;
+	case WMI_TAG_ARRAY_STRUCT:
+		if (parse->rssi_num && !parse->chain_rssi_done) {
+			ret = ath12k_wmi_tlv_iter(ab, ptr, len,
+						  ath12k_wmi_tlv_rssi_chain_parse,
+						  parse);
+			if (ret)
+				return ret;
+
+			parse->chain_rssi_done = true;
+		}
+		break;
 	default:
 		break;
 	}
@@ -8345,6 +8437,12 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
 		goto complete;
 	}
 
+	/* Handle WMI_REQUEST_RSSI_PER_CHAIN_STAT status update */
+	if (stats.stats_id == WMI_REQUEST_RSSI_PER_CHAIN_STAT) {
+		complete(&ar->fw_stats_done);
+		goto complete;
+	}
+
 	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
 	ath12k_wmi_fw_stats_process(ar, &stats);
 
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f3b0a6f57ec2..4ae9a58f944a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -5875,9 +5875,10 @@ struct wmi_stats_event {
 } __packed;
 
 enum wmi_stats_id {
-	WMI_REQUEST_PDEV_STAT	= BIT(2),
-	WMI_REQUEST_VDEV_STAT	= BIT(3),
-	WMI_REQUEST_BCN_STAT	= BIT(11),
+	WMI_REQUEST_PDEV_STAT		= BIT(2),
+	WMI_REQUEST_VDEV_STAT		= BIT(3),
+	WMI_REQUEST_RSSI_PER_CHAIN_STAT	= BIT(8),
+	WMI_REQUEST_BCN_STAT		= BIT(11),
 };
 
 struct wmi_request_stats_cmd {
@@ -5888,6 +5889,17 @@ struct wmi_request_stats_cmd {
 	__le32 pdev_id;
 } __packed;
 
+struct wmi_rssi_stat_params {
+	__le32 vdev_id;
+	__le32 rssi_avg_beacon[WMI_MAX_CHAINS];
+	__le32 rssi_avg_data[WMI_MAX_CHAINS];
+	struct ath12k_wmi_mac_addr_params peer_macaddr;
+} __packed;
+
+struct wmi_per_chain_rssi_stat_params {
+	__le32 num_per_chain_rssi;
+} __packed;
+
 #define WLAN_MAX_AC 4
 #define MAX_TX_RATE_VALUES 10
 

base-commit: d9104cec3e8fe4b458b74709853231385779001f
-- 
2.34.1


