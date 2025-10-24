Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054F4CCD193
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uhYmznrh4YsAZSxAhg6tzNwg1UihZ2Youcj43pOEBw=; b=BU3S22LrGk+X5TFVPTBUPDBAfQ
	0nWYSpRWAsbHZ++1zbMXETgpvGbdSDwjucoPpB1zcxYrPXmcb6rEMG+lCBStvGYngBVQmI9LgKmK2
	oAzjNO0umoMN6HlLxXwA+Q8QLdjBtHo3JcxOPBXcSlS4CDZKh2+HnqlDjr0nHvrQs50i+UUJEDcIJ
	+AwIXvu8IIpPpPuCBydG+XJACkFkIav5Rhj/TKPOOXxGNKVDWMUqd/LXrE2D8BFwgl52LVrTwTKgo
	ofc+L0r0P6RKXjUEiKXzz+LWhGuXgnp1YPTIDNOxQorTNxGrSUtEJDfk6cnwa5Nl3cRK0MtKOKBCX
	iAgUyiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5X1-00000007tVU-3FhD;
	Fri, 24 Oct 2025 00:19:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5X0-00000007tU6-0Qyu
	for ath12k@bombadil.infradead.org;
	Fri, 24 Oct 2025 00:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1uhYmznrh4YsAZSxAhg6tzNwg1UihZ2Youcj43pOEBw=; b=B4p9aOqiFZBrw8yA6wlYiGyIHf
	EpYH+JRUa7aA+Aay1aGPkFpuSihMe9g/rk2pdIZj28yFyOD4nWW0iueVlERcPSL8CNhZjApE+vH4q
	sZPXeOadd8P8gwm2MRPcKp5Ih8h2lR08BUUEX1aws93CsxmDQHyVbZCA5JFg4IlpUzI28QfDIq0NO
	yYXRdhBm7nz7f5ObzL2zwlnw8lpm4d9ZP09x8VcBbIqnmVSWfQK7Xv4OSjWvx7LufoxkmBOAHVawr
	nQFUWIa2pVoHvrvPdP8ArGn6n9rX7CSt3b0BRrW9Xq1h54WpMMitQDsEp5n/8tC1SPfMtTqs6CDNW
	ASUVMG8w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC4fI-00000001sdz-2TBB
	for ath12k@lists.infradead.org;
	Thu, 23 Oct 2025 23:24:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O079qY022420
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1uhYmznrh4Y
	sAZSxAhg6tzNwg1UihZ2Youcj43pOEBw=; b=aPFR6wqSqEOI0no2JJZI9OkAwK+
	GLfjx7JuhaX87L4vyYuikUyyNaW4P343pNk/xgbPSU98mJR9zaICtmuqYBPn4kai
	IwG1u9SoayR3heB0PSNNxx0jsRkJ3mtU0XKbMg9gK2jPZqaRruDSt4SMMjk5xPbZ
	5qqpDUauE4N47zw5hgoJK0osyiR9IdfshJNOYwjJgij0seZsdhbsflqw/LR3XFM8
	1oDBdya+cTcL7X4Mp+EwG6U1AVHCGoJuV1fn7jKqRhxZhnJMEOF9NpIjyjF7yHr2
	hkS++MNebxRuggvAlCTsml4gL0f0ID4D/K9/vNK2bZexysGL73hxvyelahA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j1x2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-332560b7171so2031077a91.0
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265180; x=1761869980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uhYmznrh4YsAZSxAhg6tzNwg1UihZ2Youcj43pOEBw=;
        b=ezoRNdITVcbSV9baDpgFv3XzY/SU4Hl0x4bxWoe4I3lu9273f3ftyfHykXOnpK24e+
         pBs8KBooXkCihUYrHIxxIUaph2hlXUBPuWpZeZzmPk+4M/xTw2GorHcsPWmtxDYcZKaE
         FJMkI4VPG7JQEH3vsGX7i6nJT6xrNIS8lYpP8tH9+YtsEkxnrUICoyzV0qkdn3kYv1at
         xcLgqG5bAZlW6ELmLC0otxb+cTyndNJWd2izv7X/z7ykuiVczhBewngII3/SAOhoUk06
         jL0RbZ6gN88zFMrU4YxHvEIn6B0HntxflvgwmXDUIOytVD8yPlzdnxKE3AX7xHYKyTWr
         JqJw==
X-Gm-Message-State: AOJu0YzuvjwFKy/FL/I1Kk5+B2raaL+1sZdWsSUqJ3VHrbHxlkk0OGbz
	WamqwsVLCGFA0NnEZo/Qx5K/QBis7OQxc/4wW3wPate9ZjC2rVMIL8scd99XlQwhP+2z95heUo/
	H6vVTWsYzezO5guArbWEoaOq5kGYlF7A/y7qiO6lKqSNzOvhLkqExkqBtshbbW8yEyy2osTFo
X-Gm-Gg: ASbGnctL701jnCmmM4ttve6g2kajNl5R6lymWTglnhbzB0p5oK1G9X/U1snBcJR9ERs
	LNRPVDjSAn0dJzIeRQi40Wj+9YAht1ke2uQp+L8L5KK5Xo2udRwtE6NS7KGCpW0/ng8LFQlP67K
	KzaaPMmqSnQuzH6GSgo+xPiVVdWGOK2mDECv019/JimqEutfRHS/c5oJska8rwN7EBcr+rjkpsH
	s1w1FBO73WvooD/7+6XkkYHwuWMZ9Rm1PgI/G9s9Rkot54ip7RgVGg2fAM908O/dYmmnmSU/2Rh
	K8+mwqy/Whk8esGWhR0zTyFINsLs0vPXUqwa0H4/tN3oCBG+JFJERAM+8ZmYYN6IEduoaBIzVM1
	JtVnI6SvwdHWXsy0NoVvrkMQWnP9yTJ9ogmQZ2O5Ietyl3RNZe+7WstE=
X-Received: by 2002:a17:90b:4a50:b0:339:e8c7:d47d with SMTP id 98e67ed59e1d1-33fd3bbcfefmr942220a91.9.1761265180164;
        Thu, 23 Oct 2025 17:19:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6QSj6H0WeJ0+oL2ydkaYa1rBwt3i5f7u23A5zXKVR/sHBK6Ahw/kWEDCV7tlhk366lC+Hhg==
X-Received: by 2002:a17:90b:4a50:b0:339:e8c7:d47d with SMTP id 98e67ed59e1d1-33fd3bbcfefmr942195a91.9.1761265179709;
        Thu, 23 Oct 2025 17:19:39 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:39 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH ath-next 6/6] wifi: ath12k: Set EHT fixed rates for associated STAs
Date: Thu, 23 Oct 2025 17:19:28 -0700
Message-Id: <20251024001928.257356-7-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fac61d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y3pyt056CyUJ2_mRiK0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfXxBS03STInHX6
 E9TJbI/ryOvTXPLAV7tr8q0LKt33tCwmXxb5Lsr67MGit/XusSUBZMKZOXOKnEOKnv9bym8EeDS
 5J2Wf1OmTVzq64lTmUwgj+aPno6HYWVO60bnwjW2ecorRig4JpqF7BB+X3U/on7WADsafTiAQJG
 0wBFEjgtEhEYuwxWm8hk6bObFXNeeF2xyzyz2u0YKkt+bK07ePa0/LVpgRiF1HnvH92kvt7+mUI
 Cqdqfg6nRSjtbA1HBhP9ekf8CX4i5FaIB9NZIP7uYhRXoPiUL2I2OM+yO4cBHDUHF2/5lODBxDe
 eAz7xfI+5X5KqQbDk72hKmMSuBUtIwEGQKqg5ntISfdX/s/HOsSq3abvP1zl4okprJ2L4FnrMT/
 9iq+DVcdPyCU5NyFSdDfThrYEq0gjA==
X-Proofpoint-GUID: Wa6UiRSH2E7lVSAAKsylq5Csms7cu-Ii
X-Proofpoint-ORIG-GUID: Wa6UiRSH2E7lVSAAKsylq5Csms7cu-Ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_002416_997124_557B6CDC 
X-CRM114-Status: GOOD (  22.63  )
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

Fixed rate is set for STAs that are associated. This will be done
during association or with ath12k_sta_rc_update_wk().

Add EHT fixed rate setting for STAs by adding call to
ath12k_mac_set_peer_eht_fixed_rate() during the times fixed rate is
set for STAs. This new function sets EHT fixed rate for a peer, which
sends WMI command with the updated MCS/NSS rate using
WMI_PEER_PARAM_FIXED_RATE command id.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 92 +++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 31b0e641ce55..da94108c3f64 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6035,6 +6035,65 @@ ath12k_mac_set_peer_he_fixed_rate(struct ath12k_link_vif *arvif,
 	return ret;
 }
 
+static int
+ath12k_mac_set_peer_eht_fixed_rate(struct ath12k_link_vif *arvif,
+				   struct ath12k_link_sta *arsta,
+				   const struct cfg80211_bitrate_mask *mask,
+				   enum nl80211_band band)
+{
+	struct ath12k_sta *ahsta = arsta->ahsta;
+	struct ath12k *ar = arvif->ar;
+	struct ieee80211_sta *sta;
+	struct ieee80211_link_sta *link_sta;
+	u8 eht_rate, nss = 0;
+	u32 rate_code;
+	int ret, i;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	sta = ath12k_ahsta_to_sta(ahsta);
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].eht_mcs); i++) {
+		if (hweight16(mask->control[band].eht_mcs[i]) == 1) {
+			nss = i + 1;
+			eht_rate = ffs(mask->control[band].eht_mcs[i]) - 1;
+		}
+	}
+
+	if (!nss) {
+		ath12k_warn(ar->ab, "No single EHT Fixed rate found to set for %pM\n",
+			    arsta->addr);
+		return -EINVAL;
+	}
+
+	/* Avoid updating invalid nss as fixed rate*/
+	link_sta = ath12k_mac_get_link_sta(arsta);
+	if (!link_sta || nss > link_sta->rx_nss) {
+		ath12k_warn(ar->ab,
+			    "unable to access link sta for sta %pM link %u or fixed nss of %u is not supported by sta\n",
+			    sta->addr, arsta->link_id, nss);
+		return -EINVAL;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "Setting Fixed EHT Rate for peer %pM. Device will not switch to any other selected rates\n",
+		   arsta->addr);
+
+	rate_code = ATH12K_HW_RATE_CODE(eht_rate, nss - 1,
+					WMI_RATE_PREAMBLE_EHT);
+
+	ret = ath12k_wmi_set_peer_param(ar, arsta->addr,
+					arvif->vdev_id,
+					WMI_PEER_PARAM_FIXED_RATE,
+					rate_code);
+	if (ret)
+		ath12k_warn(ar->ab,
+			    "failed to update STA %pM Fixed Rate %d: %d\n",
+			    arsta->addr, rate_code, ret);
+
+	return ret;
+}
+
 static int ath12k_mac_station_assoc(struct ath12k *ar,
 				    struct ath12k_link_vif *arvif,
 				    struct ath12k_link_sta *arsta,
@@ -6047,7 +6106,7 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 	struct cfg80211_chan_def def;
 	enum nl80211_band band;
 	struct cfg80211_bitrate_mask *mask;
-	u8 num_vht_rates, num_he_rates;
+	u8 num_vht_rates, num_he_rates, num_eht_rates;
 	u8 link_id = arvif->link_id;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -6090,10 +6149,11 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 
 	num_vht_rates = ath12k_mac_bitrate_mask_num_vht_rates(ar, band, mask);
 	num_he_rates = ath12k_mac_bitrate_mask_num_he_rates(ar, band, mask);
+	num_eht_rates = ath12k_mac_bitrate_mask_num_eht_rates(ar, band, mask);
 
-	/* If single VHT/HE rate is configured (by set_bitrate_mask()),
-	 * peer_assoc will disable VHT/HE. This is now enabled by a peer specific
-	 * fixed param.
+	/* If single VHT/HE/EHT rate is configured (by set_bitrate_mask()),
+	 * peer_assoc will disable VHT/HE/EHT. This is now enabled by a peer
+	 * specific fixed param.
 	 * Note that all other rates and NSS will be disabled for this peer.
 	 */
 	link_sta = ath12k_mac_get_link_sta(arsta);
@@ -6113,6 +6173,10 @@ static int ath12k_mac_station_assoc(struct ath12k *ar,
 		ret = ath12k_mac_set_peer_he_fixed_rate(arvif, arsta, mask, band);
 		if (ret)
 			return ret;
+	} else if (link_sta->eht_cap.has_eht && num_eht_rates == 1) {
+		ret = ath12k_mac_set_peer_eht_fixed_rate(arvif, arsta, mask, band);
+		if (ret)
+			return ret;
 	}
 
 	/* Re-assoc is run only to update supported rates for given station. It
@@ -6175,8 +6239,9 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
 	const u16 *he_mcs_mask;
+	const u16 *eht_mcs_mask;
 	u32 changed, bw, nss, mac_nss, smps, bw_prev;
-	int err, num_vht_rates, num_he_rates;
+	int err, num_vht_rates, num_he_rates, num_eht_rates;
 	const struct cfg80211_bitrate_mask *mask;
 	enum wmi_phy_mode peer_phymode;
 	struct ath12k_link_sta *arsta;
@@ -6197,6 +6262,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	ht_mcs_mask = arvif->bitrate_mask.control[band].ht_mcs;
 	vht_mcs_mask = arvif->bitrate_mask.control[band].vht_mcs;
 	he_mcs_mask = arvif->bitrate_mask.control[band].he_mcs;
+	eht_mcs_mask = arvif->bitrate_mask.control[band].eht_mcs;
 
 	spin_lock_bh(&ar->data_lock);
 
@@ -6214,6 +6280,7 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 	mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
 		       ath12k_mac_max_vht_nss(vht_mcs_mask),
 		       ath12k_mac_max_he_nss(he_mcs_mask));
+	mac_nss = max(mac_nss, ath12k_mac_max_eht_nss(eht_mcs_mask));
 	nss = min(nss, mac_nss);
 
 	struct ath12k_wmi_peer_assoc_arg *peer_arg __free(kfree) =
@@ -6299,6 +6366,8 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 								      mask);
 		num_he_rates = ath12k_mac_bitrate_mask_num_he_rates(ar, band,
 								    mask);
+		num_eht_rates = ath12k_mac_bitrate_mask_num_eht_rates(ar, band,
+								      mask);
 
 		/* Peer_assoc_prepare will reject vht rates in
 		 * bitrate_mask if its not available in range format and
@@ -6323,9 +6392,18 @@ static void ath12k_sta_rc_update_wk(struct wiphy *wiphy, struct wiphy_work *wk)
 							   band);
 		} else if (link_sta->he_cap.has_he && num_he_rates == 1) {
 			ath12k_mac_set_peer_he_fixed_rate(arvif, arsta, mask, band);
+		} else if (link_sta->eht_cap.has_eht && num_eht_rates == 1) {
+			err = ath12k_mac_set_peer_eht_fixed_rate(arvif, arsta,
+								 mask, band);
+			if (err) {
+				ath12k_warn(ar->ab,
+					    "failed to set peer EHT fixed rate for STA %pM ret %d\n",
+					    arsta->addr, err);
+				return;
+			}
 		} else {
-			/* If the peer is non-VHT/HE or no fixed VHT/HE rate
-			 * is provided in the new bitrate mask we set the
+			/* If the peer is non-VHT/HE/EHT or no fixed VHT/HE/EHT
+			 * rate is provided in the new bitrate mask we set the
 			 * other rates using peer_assoc command. Also clear
 			 * the peer fixed rate settings as it has higher proprity
 			 * than peer assoc
-- 
2.34.1


