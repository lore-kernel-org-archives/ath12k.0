Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4741DD65C7F
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 02:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0c0byoprbygggccCZGmfKLOHam2B4psNJuvEQj3fpE=; b=0MVse+41+VPPV5tgvvwGsPyuzY
	Fu+X6U+SwoI81dD8wtHFa9+T1vfvQs3fPnXcyFr08vNpLFfX5QQkoI+oA3fZGJdSTRxkHHqaR81Se
	rw6XNjg1Hg7rMvfcwqovQM4tQfQuWSGhXUv8bDt+Cxwtm/i+HgOx53YZqGzB4J0hhZ8bCt5gLeip7
	elzJ/XKuzPOk1JQ7sRTuiwnJP8xZpgjfBWJy9i5Nn1Crc3drcyQjwxTaIKod/0xreGWYPlX5u7+ER
	WKS3Z+ZipD4VzUdwPNbgNhdVwHCxmSdVIb8PJwe6BPIydFfSYUOPQ4GQnPqiLKCwogDL1zGfYEbw8
	Ekn+F24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jr-00000007guZ-3thn;
	Thu, 18 Dec 2025 02:00:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jp-00000007guR-3w3w
	for ath12k@bombadil.infradead.org;
	Thu, 18 Dec 2025 02:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=X0c0byoprbygggccCZGmfKLOHam2B4psNJuvEQj3fpE=; b=TTOyits3lpf4vAW9mAzqtQPzIA
	KGrZ2sEt3sBYUwVzXk2gkAXXTpriFtXjWeB1YwNmlxaGm0ueHQ8JW2af50beyuRLC2ZN+dnoDRnV7
	v5osEf+ADdF3sEcRtSdxxhxPvFPNiXoaRKCcmkHPzdbryKEHMtC6fuzLHj+OZd95nzVeDzpIA9GZA
	l1K049cQfr9LFw6v9Laazh788CdjTyNtuyZa/+uZUAkW5v9nx2NTlgL5Rfj/iKtgN1LLwBPqOhwxh
	Q35QqdyFdSruTpy7rkdkSQa03whMl7o7e7tL/vUNUew5LdXkxpeOBQmKj4g0OXVaBlFRF+mLV7AsD
	/gns/Mqw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2Ng-00000007ss4-2YAt
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:05:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Z2Dk4191394
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0c0byoprbygggccCZGmfKLOHam2B4psNJuvEQj3fpE=; b=i+EY05+SfXlxeFmL
	cUrGhPgJ7ZFZOssCgvbLxP3hTQ7IdnW5hnTh8+1D9Ixcoxx3h5DMJBGPvCH5nlik
	QwXg+NGYUfWW5gjbcryxXWd8AimhVAT1H3kvd7fNPaS04WynQQ3uFiiJUMT196s/
	Fpb/3CY/ziJQd8u+ZC2LFt4q5qQ/PU9ryM3LlLeLlFq+mrFMwF4flQ3SsX6Kc7Mg
	fKCJQFNBi4L6axSOCe1M+6hdvJk3famxR0+CUUlJoZLsmMlN8d2DjwxQallERP8D
	ZyYOrqcRFDzmmuJ6CMR9YdA1lgzLp8KAHvrf+O6afPFh+CQAOcT957SSXRuF4Z0o
	6haaBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkg344-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso2869515ad.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022938; x=1766627738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0c0byoprbygggccCZGmfKLOHam2B4psNJuvEQj3fpE=;
        b=YmEzNZqkul5txt9N/DBB94fucUO0grk5j+FEnd+0hz1z7l/qW8oPOH6TpOrIU94pro
         0imBVxZHjB3yWpvc8X9HJ2gqzvz2Z+EGSyqWixex1dJDdHzvE6aMwxwFBzRcYPVYb/uL
         ZeLrvy0uDf+bG1NhvfvzGNrW9sIyhdS+03r39AEfPdWxiiH2qXYWoapbZ4clyLxBg9Ap
         LusXWB256vJhXegJc8eUQi10lvxi9R/GS56wm2itg6x6LhkP6CXyKiaW7AaKx+9ELy2w
         1/11+FLv88T7DiFn9n2HGqXd40fksXULl0gse5JQOpSl5c3W0wyouWTRqT+EKVlfm1Wh
         K49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022938; x=1766627738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0c0byoprbygggccCZGmfKLOHam2B4psNJuvEQj3fpE=;
        b=qc7YlU5fLqIKJyQWHHrJJH3gjZQMsuk7BxaGVzcHnVqpuaJ5Z1XFVc2CrdUqa5/5HE
         xhPyqhhsTgNHKZFfwxSKei7Y7qiDZ83Tb29r70lMhZer5qV1kVGuJmJp++/BPNd/vwQZ
         sDZbJYitSbt5nULn40EDfRLEACLmVgsF1Mju5X1U0pWfjSyGU86UMJW6cYErlfzFu47J
         z2E7zKUI1Ia3IHiCv38e2RffOKE/unqRkLJB1BqLc1SF8fzm2RBUZ7EbzY5UuAvYTbCP
         pqaYU2m9FJAapO50zmQjuB7CyQgjmN2SyqDTTw/qDU27MZ4FroA5fuMJwxTX9kYgxc1I
         fWYg==
X-Forwarded-Encrypted: i=1; AJvYcCWHsCRkC/e5rKz71QLKolOvkGP4fBUvTYBt6zjFjm5aQl/9XEnvPiSRvqRFBposhF03Eac1fnM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEU0rrGBRv2h/nMBHb5yleJYHWIgTtVFWRyEyzvh1/6wA4TyLv
	Pw++DSfkHW4qhIgJjnjMTrk7SJs/HfB2Rxir1zSnv/1wGb4gq+YwgE/xU4HdW3rw4Smz9I+gHOj
	gZn6bHvd/Pmz5CutysjPJzGdjboOGFC7EQs95uxLA5dbHwvP0b/uF53S7xUa8zmfqhIa/eMQyuf
	E=
X-Gm-Gg: AY/fxX5ucZZnZKjkJ6UNzioZC74+8eYaClA+/4VV+IGqJiK2kFR9bdN3++xgPDNGKeU
	jyuU83KcQ0PTHxSRtBA2PMgbSyBhecrUFkwfA9l6vsoE9b94DOiCNV6x0X+MdDKY/JxZbBwUXRt
	5vMxJWbZVWuwXnKJjpI8asJ2iT5KxTy+gQ7dIY3XH1wlzt++Z9qFligzJNn3vePxFTZnSKbE8kW
	ujD9VvX8oQeg0MKS85bmKDGt8KhTgyZX+7qaXA0BGh78ZOFupbGDc+DWw8KyLb31bfvDJIQwbcF
	5jUiPbaHhYewgZn8uZ75SzFoYisgYIjLGLWwXHk/fhcRkdIZNgF7u60zGh2crDFqRgM3zdH4f+v
	MdjeD2s27fGhzNGllWNVB8XnqExZTmoknYGswfAwnJdxCQhi2LpYEvAKWRpdwl1Q=
X-Received: by 2002:a17:903:3d0f:b0:2a0:993b:d72a with SMTP id d9443c01a7336-2a0993bde77mr136643665ad.4.1766022938492;
        Wed, 17 Dec 2025 17:55:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5l2irzvxLxgTh3qm66e2OsOjrdhZilRqtx5c+ZNk26BjGvqdjrirvnYsZi0fUSWfE05IHZA==
X-Received: by 2002:a17:903:3d0f:b0:2a0:993b:d72a with SMTP id d9443c01a7336-2a0993bde77mr136643465ad.4.1766022937987;
        Wed, 17 Dec 2025 17:55:37 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:37 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:31 +0800
Subject: [PATCH ath-next 17/19] wifi: ath12k: send peer meta data version
 to firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-17-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tUiZ_VoWIEMsB_lAPBVKYTvRuE7REOgj
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=69435f1b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=irMkNu71nIbfwbNoXCgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX0k33gERQxFE+
 HU821C4Q0IQ6QxxXHrpoxurNrvo0OpB1LWcKXdQvKFacA5VyWZHFoeQ7PzSZLmtDveuJUiHD8w6
 n0NvM9TgFjnqOemyvB4qA+TUsfzSVTI9rHHw1Li/tH+QlBZpz9SRUpOw3D3I0l2temVaf/CGsiV
 TEccS6ZqUEt8iEyR0oIg3H/7/QA5jkb50gzJN8vcVExvps0sKc8Cbph3cE4eAjPFQBEQOBPs/Yz
 w64KR5RHB6LcIpsbfJ50vTKsTsqnpH+WVKaNsQdApDDUm8LXfdqj0EjVEci00LaTaIxYxFBMoYB
 8e4ILaZR28QPLDYKJlB+YCtmkn3qqeuEXuKdX8dL88GBcoPm00stwtq5vWQbChxTus/i6+rfiUt
 bdgy4+oTuFN2noe3B4ZTB8gX6DFlew==
X-Proofpoint-GUID: tUiZ_VoWIEMsB_lAPBVKYTvRuE7REOgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010252_971646_6E5B4FC1 
X-CRM114-Status: GOOD (  12.65  )
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

Peer meta data version is currently not delivered to firmware, resulting
in QCC2072 data path issues.

Parse it from service ready ext2 event and send to firmware in WMI init
command.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.c       | 4 ++++
 drivers/net/wireless/ath/ath12k/wmi.h       | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/wmi.c b/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
index c575b44a33f3..ed538d20d324 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/wmi.c
@@ -102,4 +102,9 @@ void ath12k_wifi7_wmi_init_wcn7850(struct ath12k_base *ab,
 	config->num_multicast_filter_entries = 0x20;
 	config->num_wow_filters = 0x16;
 	config->num_keep_alive_pattern = 0;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1A;
+	else
+		config->peer_metadata_ver = ab->wmi_ab.dp_peer_meta_data_ver;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ed2374c4aac0..84c29e4896a4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5477,6 +5477,10 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
 				    ret);
 			return ret;
 		}
+
+		ab->wmi_ab.dp_peer_meta_data_ver =
+			u32_get_bits(parse->arg.target_cap_flags,
+				     WMI_TARGET_CAP_FLAGS_RX_PEER_METADATA_VERSION);
 		break;
 
 	case WMI_TAG_ARRAY_STRUCT:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index daee2787cdfd..fdc203fdba0a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2783,6 +2783,8 @@ enum wmi_channel_width {
 #define WMI_EHT_MCS_NSS_10_11  GENMASK(11, 8)
 #define WMI_EHT_MCS_NSS_12_13  GENMASK(15, 12)
 
+#define WMI_TARGET_CAP_FLAGS_RX_PEER_METADATA_VERSION	GENMASK(1, 0)
+
 struct wmi_service_ready_ext2_event {
 	__le32 reg_db_version;
 	__le32 hw_min_max_tx_power_2ghz;
@@ -5230,6 +5232,8 @@ struct ath12k_wmi_base {
 	struct ath12k_svc_ext_info svc_ext_info;
 	u32 sbs_lower_band_end_freq;
 	struct ath12k_hw_mode_info hw_mode_info;
+
+	u8 dp_peer_meta_data_ver;
 };
 
 struct wmi_pdev_set_bios_interface_cmd {

-- 
2.25.1


