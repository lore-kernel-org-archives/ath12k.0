Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE902C7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 05:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdTye510OYDYG62A1JsNtJ9LFBEkO+WKF1r4hc3opg0=; b=EC9K/NzDuksRDuI90opM9wDz8j
	QiiBdcsH+SOzIujk6U4zKH4oaJ/mvkFCggHWTE38Yc+a3HT2lrWNglVjVyvyDRfZRIE/n1N3dPaQf
	I1/E3iJGb4x8ZbDeTcm9TGm0pn1eHSaU5n2M/N6OM82WrvDaOLrnKI7pq0/hIZlLbw9UUcrOB5EIb
	nt7VCNHzQvt9hD0W77drpY2eJGo+MRjZ6dnx4cmJoyU+DEm7Zt3nM0nXLdA8o73G+wRaZ4PJ0FOR7
	x27X5anAmLWwDpv7IiSEBRthh5+Q5OnoFfLvJonzH0wgGxnA7sRFkMnrw2efpScNZdz8uiP4O2pGL
	gp+ojX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6wb-00000001FpM-32CE;
	Mon, 30 Jun 2025 05:20:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5vg-00000001BGy-1Pxh
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 04:15:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNodqG013525
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdTye510OYDYG62A1JsNtJ9LFBEkO+WKF1r4hc3opg0=; b=P7fj5ShUWJgFqBXy
	DgGTo17iR+d6NhJrBlx99DEI25Zd6h0Vrfheqbgkc/YqkCtsXV2SJf0jkdiCLRam
	V6NYPtVEYge2UnfWHBP7ThZzPrej7HuhH8fceFToBn62UOgeasMeRCAaprUlmWkv
	/BD6iSmJp7Zkt08hWkAarBNwus5KnqScnOOu6EtN26Ue9g9AhCJAm7LE0S+9OFT4
	oPdFFJ348mKY4HZEQBI2aVH4jEMcllmzVL6e3L0p44B8Pne6yx1rVGVjXgh7sURN
	o/DLVhGem3f7AwRM5rO0j9tJ0EDPLBHN1grN5WknzhQRePUUtHq+e5/JaqZeV0LG
	8ckh9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hu8hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 04:15:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23827190886so19056315ad.3
        for <ath12k@lists.infradead.org>; Sun, 29 Jun 2025 21:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256939; x=1751861739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdTye510OYDYG62A1JsNtJ9LFBEkO+WKF1r4hc3opg0=;
        b=OcdpRscE4/X8w3lESXp9kVbnvIUHb+XsGfp4/8j1fdG5GEWXKuS3GZEIY2Gmr5ymKq
         dhUtpVJfvfsxuln72mt0DNfYGYvPlHgQ+tE/O1dKWg+Dcu+9I7LNo7ktsFWf8RxE3WSj
         eeLq37Yltashz62QtGHzu1yug+EhlIltOhcNMup2K40nd/QYebwaQ7jCLIENo7OY0S8f
         IBqKK74sQR8I6+hgtNdm1SuC3j1Nyl8EKNs3ukx4hPHV8ng6HHuIJiizj5vHIghAgRt9
         ONEfaeJPdjzRmAWhuC7g03XlOS2LOXopFS23gYbvoxNXnY7MVgbOpW8fGmgFPGK2bnm2
         JRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQDE55fmeaKPSnLNsYmpuhaUOYdKSmxEL8su5U/71RNN1C2VapqCPETgdphOSz3/XF+ByG608=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFzqmdEuZ+7BAkAuDpkTuh1VCvV+WslxGJdpFUU5FrO2sb1URB
	T/LlzZTIdbA5dzJowoqXYVCVXx8LxdGnKCh74qXkpT/sc1lcsKt2x3GH/ngQDgsijZ4dimiEFSR
	S1AN44cDpwXQ3JYrCzBm1wlV3ItTBxA+2KboGELX9aKdEG1qOgjMhpf8/n9yvkUJRcJQ9BsY4
X-Gm-Gg: ASbGncvxauFp2FFZ4NNJGm6ihfq5aHcughFcnRFElXO1R569uoO0A0qgw10+qysU5Ib
	qIfHHQlODNbzP19vWYjHNrJzng47pMH4s+oMxS43Ukw2inxIV6tfqv0L2DTBz8AmjYxb3VTxsZj
	TYJmMPaSF23abRwyl0ZWzlsf09ZuW3H7TqM3LQ/cxBsDALhqY9+le8WBVPsYz69PHl8IXghuNLD
	FLvqkQmnS9SKCRGYEcByk8AFIi5LsP2d7h7R6nGPQCrzduim8aAZWiYahRjR8wDw4zgGmYhGu54
	/mu5J7ZSBwR/JNXCfEBlVi0ljNDVRLtOP/xxCuuKkB3IV3RIdkDa3Zi61rBjDdpdngVZRmx3QgH
	uQ7GoVTtRF5IkLfqLJzS7gQQnhb8Gijg9k1uIfNbT73NQ/2g=
X-Received: by 2002:a17:902:ea0e:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-23ac46580damr170504935ad.46.1751256938715;
        Sun, 29 Jun 2025 21:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9G96ApR0eBbaENnYeG1mS8KI5XaYp1Xqu3Vniu/Rg1UqzEY9srtAkAlTndfRFWKHOFEgZNA==
X-Received: by 2002:a17:902:ea0e:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-23ac46580damr170504535ad.46.1751256938319;
        Sun, 29 Jun 2025 21:15:38 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm69366955ad.59.2025.06.29.21.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:15:38 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:45:15 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: add support for Tx Power
 insertion in RRM action frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-support-for-tx-power-insertion-v1-1-77f45484d5bb@oss.qualcomm.com>
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzMiBTYWx0ZWRfX1jUcXeDmwySb
 vMuazgPxNV4bMKsCvlEt0TWynKuu1Q2tr0i27w4eR96r4rxgkHhUHu2OKfXB/+nrh6G/A/mo55I
 gIc3MCBe6dI5YrxksDzj972xNuSGHxSqSNZjB4Rzc3HZ0YUl2idp9ecxn7Ns0uPAfCqF6RgPHVw
 koBjBTIJuN618ftVOJN6W3epxv38mIJ5Pt17VaszgZCxCqyDn6Ndi9rF4Gpyvdm2oi/HXPZRsOD
 hucDKHgYNMnx9a20cvPLUy3jQjkRkZg48z6+cp71mCaIx1/Fu08M24Kv8izqeYhZDkAlkkRLiWF
 79T2w6SUALGjKLe6DfyvNbMwHL6g0nw0usfJwP/jUYYp+yy3Xb80Xf1X3NYoKfHwDkJCdinu7AA
 3ZZkI79YZ7M4EZCaoCdHtOgRXqBLb+fyjXJlOEh413FKMXgJhX79KLIjApd6MllMICLv/A22
X-Proofpoint-ORIG-GUID: 9ELBRmxig0UGSuXSPycQ9jsgRhZkFMGC
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68620f6b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U2OQ5zEU71Qse62bi5cA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9ELBRmxig0UGSuXSPycQ9jsgRhZkFMGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_211540_387142_596ADE23 
X-CRM114-Status: GOOD (  22.74  )
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

For certain action frames like the TPC Report IE in the spectrum management
TPC Report action frame, and in the Radio Measurement Link Measurement
Report action frame there is a requirement to fill in the current
and max Tx power of the device in the packet.

Add support to populate these fields in the relevant packets.

In software-encrypted cases such as PMF, skip insertion since the packets
are already encrypted and cannot be modified.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 182 ++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 71e07c546a2dfce62101770ea54948df5db35060..241f11bd8c4051db4873d1109acbafa1aa9815c2 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7807,6 +7807,174 @@ static void ath12k_mgmt_over_wmi_tx_purge(struct ath12k *ar)
 		ath12k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
+static int ath12k_mac_mgmt_action_frame_fill_elem_data(struct ath12k_link_vif *arvif,
+						       struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	u8 category, *buf, iv_len, action_code, dialog_token;
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_chanctx_conf *conf;
+	int cur_tx_power, max_tx_power;
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_hw *hw = ath12k_ar_to_hw(ar);
+	struct wiphy *wiphy = hw->wiphy;
+	struct ath12k_skb_cb *skb_cb;
+	struct ieee80211_mgmt *mgmt;
+	unsigned int remaining_len;
+	bool has_protected;
+
+	lockdep_assert_wiphy(wiphy);
+
+	/* make sure category field is present */
+	if (skb->len < IEEE80211_MIN_ACTION_SIZE)
+		return -EINVAL;
+
+	remaining_len = skb->len - IEEE80211_MIN_ACTION_SIZE;
+	has_protected = ieee80211_has_protected(hdr->frame_control);
+
+	/* In case of SW crypto and hdr protected (PMF), packet will already be encrypted,
+	 * we can't put in data in this case
+	 */
+	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	    has_protected)
+		return 0;
+
+	mgmt = (struct ieee80211_mgmt *)hdr;
+	buf = (u8 *)&mgmt->u.action;
+
+	/* FCTL_PROTECTED frame might have extra space added for HDR_LEN. Offset that
+	 * many bytes if it is there
+	 */
+	if (has_protected) {
+		skb_cb = ATH12K_SKB_CB(skb);
+
+		switch (skb_cb->cipher) {
+		/* Cipher suite having flag %IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set in
+		 * key needs to be processed. See ath12k_install_key()
+		 */
+		case WLAN_CIPHER_SUITE_CCMP:
+		case WLAN_CIPHER_SUITE_CCMP_256:
+		case WLAN_CIPHER_SUITE_GCMP:
+		case WLAN_CIPHER_SUITE_GCMP_256:
+			iv_len = IEEE80211_CCMP_HDR_LEN;
+			break;
+		case WLAN_CIPHER_SUITE_TKIP:
+			iv_len = 0;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (remaining_len < iv_len)
+			return -EINVAL;
+
+		buf += iv_len;
+		remaining_len -= iv_len;
+	}
+
+	category = *buf++;
+	/* category code is already taken care in %IEEE80211_MIN_ACTION_SIZE hence
+	 * no need to adjust remaining_len
+	 */
+
+	switch (category) {
+	case WLAN_CATEGORY_RADIO_MEASUREMENT:
+		/* need action code and dialog token */
+		if (remaining_len < 2)
+			return -EINVAL;
+
+		/* Packet Format:
+		 *	Action Code | Dialog Token | Variable Len (based on Action Code)
+		 */
+		action_code = *buf++;
+		dialog_token = *buf++;
+		remaining_len -= 2;
+
+		link_conf = ath12k_mac_get_link_bss_conf(arvif);
+		if (!link_conf) {
+			ath12k_warn(ar->ab,
+				    "failed to get bss link conf for vdev %d in RM handling\n",
+				    arvif->vdev_id);
+			return -EINVAL;
+		}
+
+		conf = wiphy_dereference(wiphy, link_conf->chanctx_conf);
+		if (!conf)
+			return -ENOENT;
+
+		cur_tx_power = link_conf->txpower;
+		max_tx_power = min(conf->def.chan->max_reg_power,
+				   (int)ar->max_tx_power / 2);
+
+		ath12k_mac_op_get_txpower(hw, arvif->ahvif->vif, arvif->link_id,
+					  &cur_tx_power);
+
+		switch (action_code) {
+		case WLAN_RM_ACTION_LINK_MEASUREMENT_REQUEST:
+			/* need variable fields to be present in len */
+			if (remaining_len < 2)
+				return -EINVAL;
+
+			/* Variable length format as defined in IEEE 802.11-2024,
+			 * Figure 9-1187-Link Measurement Request frame Action field
+			 * format.
+			 *	Transmit Power | Max Tx Power
+			 * We fill both of these.
+			 */
+			*buf++ = cur_tx_power;
+			*buf = max_tx_power;
+
+			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+				   "RRM: Link Measurement Req dialog_token %u cur_tx_power %d max_tx_power %d\n",
+				   dialog_token, cur_tx_power, max_tx_power);
+			break;
+		case WLAN_RM_ACTION_LINK_MEASUREMENT_REPORT:
+			/* need variable fields to be present in len */
+			if (remaining_len < 3)
+				return -EINVAL;
+
+			/* Variable length format as defined in IEEE 802.11-2024,
+			 * Figure 9-1188-Link Measurement Report frame Action field format
+			 *	TPC Report | Variable Fields
+			 *
+			 * TPC Report Format:
+			 *	Element ID | Len | Tx Power | Link Margin
+			 *
+			 * We fill Tx power in the TPC Report (2nd index)
+			 */
+			buf[2] = cur_tx_power;
+
+			/* TODO: At present, Link margin data is not present so can't
+			 * really fill it now. Once it is available, it can be added
+			 * here
+			 */
+			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+				   "RRM: Link Measurement Report dialog_token %u cur_tx_power %d\n",
+				   dialog_token, cur_tx_power);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		/* nothing to fill */
+		return 0;
+	}
+
+	return 0;
+}
+
+static int ath12k_mac_mgmt_frame_fill_elem_data(struct ath12k_link_vif *arvif,
+						struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (!ieee80211_is_action(hdr->frame_control))
+		return 0;
+
+	return ath12k_mac_mgmt_action_frame_fill_elem_data(arvif, skb);
+}
+
 static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work *work)
 {
 	struct ath12k *ar = container_of(work, struct ath12k, wmi_mgmt_tx_work);
@@ -7838,6 +8006,20 @@ static void ath12k_mgmt_over_wmi_tx_work(struct wiphy *wiphy, struct wiphy_work
 
 		arvif = wiphy_dereference(ah->hw->wiphy, ahvif->link[skb_cb->link_id]);
 		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id)) {
+			/* Fill in the data which is required to be filled by the driver
+			 * For example: Max Tx power in Link Measurement Request/Report
+			 */
+			ret = ath12k_mac_mgmt_frame_fill_elem_data(arvif, skb);
+			if (ret) {
+				/* If we couldn't fill the data due to any reason,
+				 * let's not discard transmitting the packet.
+				 * For example: Software crypto and PMF case
+				 */
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "Failed to fill the required data for the mgmt packet err %d\n",
+					   ret);
+			}
+
 			ret = ath12k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
 				ath12k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",

-- 
2.34.1


