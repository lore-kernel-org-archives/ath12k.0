Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B41C83F17
	for <ath12k@archiver.kernel.org>; Wed, 23 Jul 2025 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6OAgETBIo5KYl0wAQ2L6Hxvxd9XFR9GD7QBZUpNqysQ=; b=Wjn33D7dvES8d4j/gAll8j+vmR
	KnxTKGcH8E9HC4KTu7lqEgLO0Ou4AqOGPyBrn+hTTLIe/LLhppgssMcLZWiVRsxGMX0IIr2P9T+LW
	AO6o7MqEy5WFqu43/mYEPEQmShU4Vo+wYs/AUouwb6I9ixHqD5runAVRvAEaa+EXv6LTG5EOiWtBM
	VrEMaXNTzLZdrfguNdnzGnhid3Nh+Ud71T3S4xJE+i3FIdEzE3GikIYDxzcvLyrP4wrsRlb35Ozzu
	GI3nEU/Qy81LbFZB3gHswXoFHtUkH7dqRQhgUlC3oTNaJvxKp/LUKqobLkqQH2rPfT0crcUmHnz7m
	nMmoiznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeny-00000005o0z-1Poq;
	Wed, 23 Jul 2025 19:07:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueenv-00000005o0e-0Sla
	for ath12k@lists.infradead.org;
	Wed, 23 Jul 2025 19:07:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH3SdP009376
	for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 19:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6OAgETBIo5KYl0wAQ2L6Hxvxd9XFR9GD7QB
	ZUpNqysQ=; b=DxEHCCpsdExlGWLApGnobsYhg7ZujnVkou5AMy5oVHNPrKwm37h
	RdL0u4mtJ7Qt8adp2rRVwEOrLZ73PqwCQP5rMJF38cwTJ7n0VMXz2mnc83Mc7ACb
	Pd5z1FIq5rckC+OWXrscz3f5uqNg45bSQ9hdYGQSzsE9W3RKluTcE98zUEavDAUJ
	lKJv7I4Ikx/ykgw6OSXvOmCs7HzaV/JjC6xNx/BKS7rskkBEJfWb45fooYyA55Oe
	Z2ub3cztE3qCgbpZnG9nwsRGTCOPNe1KYXsue7f1FxTt/xSrtpfRTeGoPadbxE77
	WT3LCcnyyI8cZRa0wRyDA1Yz4yxR+Gz4x1A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na4rbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 19:07:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31cc625817so969649a12.0
        for <ath12k@lists.infradead.org>; Wed, 23 Jul 2025 12:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297621; x=1753902421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OAgETBIo5KYl0wAQ2L6Hxvxd9XFR9GD7QBZUpNqysQ=;
        b=xRSZYWgU4XfmmxRENpXlFxAarMG4nDZyxQsvLlzYVHSEDdtr+gD9PqzyFx5bNh4d79
         orXQ+2AEGFu/FEYwCRC+VRGYdAAQUpbMzSl/M+eNGMCOx86V/6BVcJ6sz1kESNn7OtmC
         trOKA73X2W6layWarhZ8eNY9SfcktsZ2WwBZW2LU4LfcYCoYoe0MGQOLMol1ORBEM82n
         c0HUdVnphNDDZ9PmE6+YhkTS5jzMpNMAkGPqgkZFaeXTjFqfUqpF/c+/U4SyElVXJS5y
         c7Du35H4cTOSRm9VqfAo9dJdgv1RY4AE/a6A+YOkw4w6S7pbCQIblpfq09+X3F+49o2+
         lZjg==
X-Gm-Message-State: AOJu0Ywl2GTzSjgqkBaUh3YSc3Y6PqSQt1DNQEYKyhFq8RDla5BTZh5m
	oGPm/2uABALDZwvwA6/xFJFI+JyypKpSQSbdr31zyaczGJYC35AJ8Ss8tCORvXmZph2AeQ1i1lU
	vhJNiwpMA4aDHOm9U1Fy/f0PG8W7PLJyDjTQ2HzrEHyaBv2gDIN5uiCLYtSS1Pimu6cy1T5Ll
X-Gm-Gg: ASbGncsWiqtBNrakE5ghQRZ94uU3WEj1d1phSX+aVzl0RCHUYXZpm/NdrmZY2tG6dEj
	vlDJAw8uaju9Is/51z0aj0z5dk/mHchBzWVAu/7DGNJvgOwgYieLWK7P1yeWA8/dLqd80frlMgA
	z7zZlRmGZciWACp3KPbzhDm8eBu5kXAedGHX2dp4pfGnUwROdO7oHHaHt6fMaQhoXRjRa89vAT/
	EHu8vPhXm2GGY0B1KkVXB8Uc5+F8FL7IhsVqM+dNUJmg1YAodtPhij3KdbxTF5IC3KMiyEAmrIk
	D4IkzgNDjJkiuQa3mAWCCeYzff0dzaRXxcqnKRo7fytxUNNpAQnqH3fTk8p9OtY0xc7ok6GstKc
	OIukjnZs/9TdUm5ge5nm9cuyChxlXMoW0dpiDSHLitLPQHmBOTrv1cQ==
X-Received: by 2002:a17:90b:3ec4:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-31e3e107b35mr10939149a91.3.1753297620710;
        Wed, 23 Jul 2025 12:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMW7SPxYd5AV88V01ROsSqlFgmOzoQGRQjlPHQTKSQch4m9RBwARFM9Viisr5FxDFdGrXm8A==
X-Received: by 2002:a17:90b:3ec4:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-31e3e107b35mr10939111a91.3.1753297620202;
        Wed, 23 Jul 2025 12:07:00 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e519ce880sm2219528a91.1.2025.07.23.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:06:59 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Vinith Kumar R <quic_vinithku@quicinc.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Add fallback for invalid channel number in PHY metadata
Date: Thu, 24 Jul 2025 00:36:51 +0530
Message-Id: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c-TgnVY7kTYHqELB7u6qGYCTEY5SycFk
X-Proofpoint-ORIG-GUID: c-TgnVY7kTYHqELB7u6qGYCTEY5SycFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX8WEr1L3beJYu
 dYLekLwkNny42Akj6Swkwe4TFBYO2GIERgXUl6ppQWsDMWPUfEzDez1HwMgwEyLPUJ6w3SLm+m0
 tzkbpUh4gY+w3mK7XDa9KkozPDvQsC0SWvgYjp6AQxo6PxxXP0W1XPWxt5NFzJYliBD2Hofr5Vk
 XkLpY8+nEn70pazJ+t+X769yI2aAr5oR2gOx8wUIjhNs3b4Tx36pPgTg0RQIrL6kPqcd1+GGl/C
 woH7BsxQ7XUBLfPlRuwRTJ/XQZ5WgxDMsXXmLET2bKq1/YKm/WJThQy3LwW2ZHEsNfr8BEEwSao
 gXMbHzm0dsnpDyrpj2IPohMYqdCubB+TpSM+k3Wv6nWx37GItUiAZSnsxd1u9pWTcsrJXTXWdFh
 t1t6Oljf7cuA5MwHVNkAdmTr1P2cyNgmvs3IOhYKIz4aZdyuBFTseb4My2Fh8eH6xM718tPO
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=688132d5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=wNp79QKJu4ZgEVFT10sA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_120703_154493_AECAB173 
X-CRM114-Status: GOOD (  14.87  )
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

From: Sriram R <quic_srirrama@quicinc.com>

Currently, ath12k_dp_rx_h_ppdu() determines the band and frequency
based on the channel number and center frequency from the RX descriptor's
PHY metadata. However, in rare cases, it is observed that frequency
retrieved from the metadata may be invalid or unexpected especially for
6 GHz frames.
This can result in a NULL sband, which prevents proper frequency assignment
in rx_status and potentially leading to incorrect RX packet classification.

To fix this potential issue, add a fallback mechanism that uses
ar->rx_channel to populate the band and frequency when the derived
sband is invalid or missing.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Co-developed-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 8ab91273592c..adb0cfe109e6 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2533,6 +2533,8 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
 	channel_num = meta_data;
 	center_freq = meta_data >> 16;
 
+	rx_status->band = NUM_NL80211_BANDS;
+
 	if (center_freq >= ATH12K_MIN_6GHZ_FREQ &&
 	    center_freq <= ATH12K_MAX_6GHZ_FREQ) {
 		rx_status->band = NL80211_BAND_6GHZ;
@@ -2541,21 +2543,33 @@ void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct ath12k_dp_rx_info *rx_info)
 		rx_status->band = NL80211_BAND_2GHZ;
 	} else if (channel_num >= 36 && channel_num <= 173) {
 		rx_status->band = NL80211_BAND_5GHZ;
-	} else {
+	}
+
+	if (unlikely(rx_status->band == NUM_NL80211_BANDS ||
+		     !ath12k_ar_to_hw(ar)->wiphy->bands[rx_status->band])) {
+		ath12k_warn(ar->ab, "sband is NULL for status band %d channel_num %d center_freq %d pdev_id %d\n",
+			    rx_status->band, channel_num, center_freq, ar->pdev_idx);
+
 		spin_lock_bh(&ar->data_lock);
 		channel = ar->rx_channel;
 		if (channel) {
 			rx_status->band = channel->band;
 			channel_num =
 				ieee80211_frequency_to_channel(channel->center_freq);
+			rx_status->freq = ieee80211_channel_to_frequency(channel_num,
+									 rx_status->band);
+		} else {
+			ath12k_err(ar->ab, "unable to determine channel, band for rx packet");
 		}
 		spin_unlock_bh(&ar->data_lock);
+		goto h_rate;
 	}
 
 	if (rx_status->band != NL80211_BAND_6GHZ)
 		rx_status->freq = ieee80211_channel_to_frequency(channel_num,
 								 rx_status->band);
 
+h_rate:
 	ath12k_dp_rx_h_rate(ar, rx_info);
 }

base-commit: 708243c62efde8241e2c66e9c3f377658855149d 
-- 
2.34.1


