Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FBB606A337
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CHH5LYkW;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG11Lvkv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFh2loas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=; b=CHH5LYkWr6ipfy
	mz/WsBQrBbg2BLnskgcWwD4ELYm8mxCW5LMRQw5T3g+wn3hDW3oJBC8qCXKeaq1IViWBUGQxmddH7
	AmU93V2HNA5KvARXTe59JzqBDbJR9N2vNYguvCU799YGG3sKi66KyZVC6t92UzSLGobiRmjOEpquz
	PW11ymDjZkoYS4m99E3xasgJEZGkqIoZysTL9wYfiM0NmWvaO/cgLlBnH1zINIQTSe9uh+k6QoUjh
	1S0x0+T0tXu34HU3xvGeDfGLRhEoTRzKTUh874oW3eIjIIH7O2agnMNDQazaGmV7vyV50ID4aX721
	WROyrdqrej38vrkZTAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdO-0000000DEpY-479s;
	Fri, 13 Nov 2026 14:52:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsdL-0000000DEnC-2wmB
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 14:52:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbeB688697
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=; b=BG11Lvkvef19u0Rz
	1GQPPC03OvDsda8fBN4ImfLeqSnXMCqpuApWWV/pMYQ2LEmJe75k9r0gGqzJP18A
	DMdyyomem9mkeNbCcKH2sx3HX3ujTjkXu7Y9tLhDv1tgs8sQ1lGc7t1QZ5fpe/3m
	taRliXG6PhyQgA5OtojVnzaM8uu4F8VViSg1VW/Zx5M6LiUEwGIxkfiOGxyY0BCU
	yihPX9hH/cgc1m+db/ecAqjdR4XUjvb1jtpsjYnPSN9h1zQyiA2G+N+62yZQNUyq
	uVDq3pNF9Suxx4TTAjXyZWMI4zcFfJb/KaR40Lew3c5G7ZX/SLcfUFC5XenLboU3
	LK5rJw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufju0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 14:52:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so999633241.3
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 06:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794581526; x=1795186326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=;
        b=ZFh2loasbDeWGhSwwa7B6I2Czujt4y+YzsrGm6hK5ycJyKyUmTUWmsvPwEe1My6DVw
         t4fu0uCT2xIWdzFcJwjy2mIQB9LGqK0vtiEtHvkEoBNz+XdMrb5ileKcz0Dgn9m3hcxb
         39Vf4B2xQt8WnMZuPxDuoDCJhsqn4XGzw6bg9pjAG4kAXvMl9OkvCQ4CN1fJ7eWDLiEV
         OrftHiIkxyQJAwD7G07ajszeyKd5dSCYX0ixRjEzUehgf13bKmSz14xmHRxdxaionLvm
         MF/pa49h6X9REQSLwfUpFNjf9DwKg/4CXznC12o2AsaasS93MYpHf3boup5xWQSR2qI5
         mXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581526; x=1795186326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ae1jFPmauZcNjp+7tAYNxzWKn+SEejkwLzjwEcl8gow=;
        b=bOcaSmPd+ToXj+gT5lul2CblVeHOAxtjrodH4z+D645itxHegm9t1VxlKXDI536suS
         mUMwllLzDUCRpy977w/NkGB6ul1nCvVO2e7MLdjGTSxPJJENcA3wmC6+ILq6lHEwUQ83
         bTwitu47sp8yf1uqxWiOFi6nhscWKJMiPb4YjNQuoHQtpAKBIpboxc44kfSyhp7fVNaL
         6zJpKXNbYWm0+qhZgm9KH0kp0s5k7j1fFdnkcto9lpu3tvdPxX1THel0A+84Ml3b3XB7
         UOSkxAay8k2uM+28x1A5nmfUkSfova/pqLZcJF2xkDGMQ9n8TV0Nyb59w5IBYdD8ziXU
         dQ1g==
X-Forwarded-Encrypted: i=1; AL+hErHPuCSfuLBy3SBODkrSlY3yjpXYE67FmTGeAjJhj+RN4StyytWZx0sFSUvnELuky/qwzRJk7bI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/nKDS8f8DR56JXKFocBT/mJNeYgVh/lHsTU8OFFCm2MFTa6z7Y
	lg3X9EQRq5Oeot64zxcOEW/7up7xdNC4unWYOayDHBFQT8iKZJ9KKS4Aa7JgXADtBNl9g2+0cI/
	X0O4OJLaQkmzfQKiGzPYtq+owaF8po0391kDg05I/5c8hML/FmYYbaS8y4Jubksfy
X-Gm-Gg: AYBFou2S8L+HVAhzNZMuSXaoBb289p9Cv3oHoEBYEncmjJ8DycqSIA5v88LKX0nOX0B
	vXm+pjuhi46AkNigtyd8pymetWfMicjMVs8ogO4Fw5fhPOq5VFkB0QTh5pOWJ6ltp2ZgfezKcVa
	CVsK9VF8maEHLbb4suyDBuPeBykhhi3D9Q/kLRUy6VIE91sNbWu3J/kj9svypsTzQ9gC2N6LshJ
	YyViXRRG4LKAcIbOSvmpsjycfer9luGqdo+CJmV1MB48RwmzYghvqgqEpYUVX7cei4ot0994ryA
	LLXm0wuGR9PlvBTGeGcfzfCSFqW1vefITRHkYbXCutEbyMi2jHIEdYGDgMgkk8BJnJenk6dlmTf
	34m3Wan6dnUYVCWTuLv6EqXuPOfSpB3PsKJaBohWD9KQwMGw0YYOsQyyWVv5XyA==
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr962764137.25.1794581525715;
        Fri, 13 Nov 2026 06:52:05 -0800 (PST)
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr962750137.25.1794581525207;
        Fri, 13 Nov 2026 06:52:05 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm127575275e9.7.2026.11.13.06.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:04 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:51:43 +0100
Subject: [PATCH ath-next v2 2/4] wifi: ath12k: use MICHAEL_MIC_LEN for the
 TKIP Michael MIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ath12k-rx-avoid-realloc-v2-2-46d186f8688b@oss.qualcomm.com>
References: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
In-Reply-To: <20261113-ath12k-rx-avoid-realloc-v2-0-46d186f8688b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>, P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: v9gJp3zQTama7HskrQ8Hcln1xgfuc932
X-Proofpoint-ORIG-GUID: v9gJp3zQTama7HskrQ8Hcln1xgfuc932
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX1d5rFs3ObsW2
 t/bmH65nkk9YXWwU5+S9Npl/0eSfQYRkWU1kahzflCE2bBhmDt277CcNGZ0Vs/vqvVLpHz/pP4N
 2hZgixVV7irvBQ3GyKJnUpJSOFZBwdFmVplrjDddKbE+RMtr2EZoyodoO/YXHCtkUMzaNw2HLX8
 MxFcPlL7T6z5IcMAfBmZg0hcPT9KlibZNPpiFxGjiX0ZlA7K29s+90xEoVqBI+9N9Vomci5qpZB
 ddCLl5sZJAVIt9yHDHWASo4gVr+EWnUlDbtdpBe3GcYdFW8NQPpZhJWXX6GGj2ORTdL7VNdKOZQ
 8MU7CMzLZ6UQXusQyHMycGNLiNa/6YxrbpAhrDKac8puJmK6bcb3Uo+LHiT3gErkygj1GpQ0OWH
 GwVKYoLrg3hCJtuXz/Usm6rhY8ntzpDYHQh7gnA5l5xaGnJ2L4Zj0RkrPKrO56mg7h97ue7NCeV
 tVdjSrHnNbmXtUXXkow==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af72416 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TY0F2RvhvldOZ2O7BigA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OSBTYWx0ZWRfX7Y2NNvyYViS0
 68AEjLp5/OTFR27C2Klm7Wa7MORbKcSjlF4W4/FllWqVlFT1DOVNhkzB36fxBuV280X6wleMJgx
 I+BolYuBz3d3AN2zFl/Ek3WxZUha3no=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065207_756751_8D7D517B 
X-CRM114-Status: GOOD (  14.87  )
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

The Michael MIC length is 8 bytes, same as the CCMP MIC, but use
MICHAEL_MIC_LEN for the TKIP MIC trailers and MIC buffer so the intent
is clear.
No functional change.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 4 ++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 6003ca901208..063bc3e58236 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1064,10 +1064,10 @@ static int ath12k_dp_rx_h_undecap_raw(struct ath12k_pdev_dp *dp_pdev,
 	if ((status->flag & RX_FLAG_MMIC_STRIPPED) &&
 	    !ieee80211_has_morefrags(hdr->frame_control) &&
 	    enctype == HAL_ENCRYPT_TYPE_TKIP_MIC) {
-		if (msdu->len < IEEE80211_CCMP_MIC_LEN)
+		if (msdu->len < MICHAEL_MIC_LEN)
 			return -EINVAL;
 
-		skb_trim(msdu, msdu->len - IEEE80211_CCMP_MIC_LEN);
+		skb_trim(msdu, msdu->len - MICHAEL_MIC_LEN);
 	}
 
 	/* Head */
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 429f826923b2..f151f7de5554 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1037,7 +1037,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	struct ieee80211_rx_status *rxs = IEEE80211_SKB_RXCB(msdu);
 	struct ieee80211_key_conf *key_conf;
 	struct ieee80211_hdr *hdr;
-	u8 mic[IEEE80211_CCMP_MIC_LEN];
+	u8 mic[MICHAEL_MIC_LEN];
 	int head_len, tail_len;
 	size_t data_len;
 	u32 hdr_len, hal_rx_desc_sz = hal->hal_desc_sz;
@@ -1053,7 +1053,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	hdr = (struct ieee80211_hdr *)(msdu->data + hal_rx_desc_sz);
 	hdr_len = ieee80211_hdrlen(hdr->frame_control);
 	head_len = hdr_len + hal_rx_desc_sz + IEEE80211_TKIP_IV_LEN;
-	tail_len = IEEE80211_CCMP_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
+	tail_len = MICHAEL_MIC_LEN + IEEE80211_TKIP_ICV_LEN + FCS_LEN;
 
 	if (!is_multicast_ether_addr(hdr->addr1))
 		key_idx = peer->ucast_keyidx;
@@ -1072,7 +1072,7 @@ static int ath12k_wifi7_dp_rx_h_verify_tkip_mic(struct ath12k_pdev_dp *dp_pdev,
 	key = &key_conf->key[NL80211_TKIP_DATA_OFFSET_RX_MIC_KEY];
 
 	michael_mic(key, hdr, data, data_len, mic);
-	if (memcmp(mic, data + data_len, IEEE80211_CCMP_MIC_LEN))
+	if (memcmp(mic, data + data_len, MICHAEL_MIC_LEN))
 		goto mic_fail;
 
 	return 0;

-- 
2.56.0


