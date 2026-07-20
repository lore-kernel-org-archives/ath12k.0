Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AB9C44521
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wYSefXJspKu/F33bCo7jnk3E3ZSEwxIqexvka0grbs=; b=dSN7v/jLLPejvYa1Jv744kRP6W
	RhJZl7PKf4YoQ6JAQF6pBswbaUIEh0x9RKJg51hBvCYMlQL05XeQr1ts+keKAdBEtvNr6UcjTz/nI
	BVgUKwZ/rrbQIkNRCswiVudOFGC4jzHNBnJykSW0JBF8D0A0vlbZGwIFv4eqPF5G9Ettfjp0ijJCv
	RmemP6waLjfljRlmqLIqc92rvx0A39E0K70nsMk9VyZdqIoVh8wqQ6jRy0ghQIaUnCXNc+BR1Qx9g
	Y1cYL9tPRliadwLyb/qWJZ2WPvf0zgqC1VKmRlybNVlJIV5IoUe6IRQz1eNZeVZUc/OhmIH82eNmp
	mLvljHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjA-00000005zMm-2cGy;
	Mon, 20 Jul 2026 06:43:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj7-00000005zJX-0hX1
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RYaQ1616992
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8wYSefXJspKu/F33bCo7jnk3E3ZSEwxIqexvka0grbs=; b=oHmaijl6FucFRQ0b
	0Ja/5vbGpbW+8uffe2aejYSzcaOEGqqBX5Dy+TBg239bETUZLDvu0XUYea4Nuv4S
	FxAXS4R6bGs9vvhXGsfgv2RYDWrHejtnMm3QVRNlobkYS3uQeJ6X4I/FIkGJ7E73
	XiyJIjBAEIdEODOoR4UkRv2rDtINZTf2ikrzwuOd4iSc+rg6j1uaHO0L0cQXyYXj
	E9cMqWzYdm1T4wSXgSyl9uv6lpSFWU2WzeRuu5kbSnyT1QQNfE0mn2Jx1IeedksM
	s12UHadCsgKNhr2XlFI1mywBX9sC6u6UQ4U2LTdV7qskLH1e1eBJ5J0mnCnDkBLZ
	FHiVsg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmsmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so17346798b3a.3
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529823; x=1785134623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wYSefXJspKu/F33bCo7jnk3E3ZSEwxIqexvka0grbs=;
        b=cdBvE0VkOuZmP9aRAJ4YormdXgPJ2p+FeuiFeYZt45PuEPmy1NA5F7noPncgDREFZU
         codcLbBBcaFX6A4jrLglws1FSnzEdLHa405v1sFo0Io6qUJ9vysGxfEI/Kp8waRbPgqM
         sEr6hG2y8UmBsk2iHhWVKnm0PQzWSxb5aNNIAjVz/hKGryIb2VtXhbLrD1yezi1uDP5N
         bRlwRbPzrxtQ7nAe7/QJn1xDCRYM40NT2+ZaYjU5aInSY2+Zy+jhDyDqdKuWw8sHR1sh
         L/y59Pl8B4aeCm3arSW1+UXkw2fAutYtuFFL1scujxgdOQuxiE6+bV3DgDIKPgeirPnA
         asmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529823; x=1785134623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wYSefXJspKu/F33bCo7jnk3E3ZSEwxIqexvka0grbs=;
        b=qiK9edBm2lGiw3PfKAk1LqQUMZuTqNr6ii3EHLcX8nlG+fTVWBERHimH0OsRES0rJc
         ZQvk+/1o4zyZe7EjVA/sO/BJWoc+vQKVmq+7xLTohstrk9IEwZOWKEmPYKSML6FTso4c
         gib2efeXyhNGGsTFRFU0HV45H6OdReke8PWGPGvGoysI4nXpTp5i0mLAgfP3ZQbLrx7L
         IveJnE81+mEBnV4fj1HzwjMzaF4agpOuByFpDy0j6ChhtG96xhaYM2GJKIsSWESTGK5n
         0rB7dGfWo5IQrvGyizx8UDU+Obq/VchctXmIVC2ND3SUajP1P92s82ltF1S1rvmY2cRh
         +S1A==
X-Forwarded-Encrypted: i=1; AHgh+Rqxvuwd8lUBgkFik5RjZfHRV4/6dJMP4GZVjy5gMLBMgQVLheg8GUZ+ekZmL2Dkf8HdWLog4JI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJxn/Hvcy5ldFBOlvXuWZjV5nPbgz/gP5DLUu/46CN3T9fXMI
	7O9V0oe2r1yMmiSr4YQ2aLqLBKVN//j8oHxSeRTEwvt5Ot1BcQfjg+W7ahBUa5gZixWn5Tf4CVS
	9SPnXyrON73mM3RmbbZoQ7dBz0Ry8/k2itwAYnxwLSY4NrQ7js3ea65Fxz2nq/uYUotdkAeNSWi
	k=
X-Gm-Gg: AfdE7cn2LRPuP56apu1qbrNhNiymTLDzSvyOAWftIA15RLx3SCB2xNj2kdPJBjLdRmw
	g/HAo6h+VwwYrBKm0QUxqmoimn3kwO5gjS8A8xqZsELd9d0G7N7FauyKPa2BAEiV5N/fMziIRkg
	v2SI3W4p4KH0aw5aNEa9SsovSql/6Bjs46Rlfb7ov6f826HCbiFrnXzIs11aP2Ln8eN/XH0T2G4
	j9oo1t+osYEBf3zGZANZMLLe0/Ex3zn9Q+jRADKHEEbRBlFgJWeNxOV9kOHVk14mWV0+dc/oHbO
	x952Qb10xa+AWRNGqnJG4k0aDbn60xx/+ZOYhloi0UCIldHBeViTsDm9cThj+hyGYyP8U2aYcT0
	+N7w5R/GVcCde0Ay31P2ay4gVF10oTFFLlf7CpKmDsvhiiTbOxYRMMw==
X-Received: by 2002:a05:6a00:a88f:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84c294fb467mr13402962b3a.55.1784529822710;
        Sun, 19 Jul 2026 23:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:a88f:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84c294fb467mr13402939b3a.55.1784529822079;
        Sun, 19 Jul 2026 23:43:42 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:40 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:26 +0800
Subject: [PATCH ath-current v2 5/8] wifi: ath12k: introduce
 host_alloc_ml_id hardware parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-5-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 3ij1_jP1h56XpZNgDYyvK5-BSuJzECMp
X-Proofpoint-ORIG-GUID: 3ij1_jP1h56XpZNgDYyvK5-BSuJzECMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX9TNMimNA8XUG
 EGbHAOc1KCj0rm9B9MbfA7PWuYk3fQgtSqXYiABbhX85gkKdYEj9VZOdvmhPzpdAQFgDN98wPDu
 Do1fHWstS+nPqNbRpAzzEBDsoI5WvNgK4JhGmM5V/NDLHH9Tun3PDDzbHrVAfGepX8+uSohHGsa
 UOrM99EQprYy+n8A8z5ixsUOWDMtqujlcRzLrxxAh3j/oneST+v+c9CmJlIxk1naycquvrFHBms
 2qylq17o1KLJriv7rXeWGMzcEquROfD7eoewBpW6YJ2dftM4VskhovCXP2yvEEL5VdztV6FjkJN
 dM5HNCl97NlT2crsXO9W6Qqfn5ujm2+D8btEBzRNek/cQQqx4ZbLXX4ytHmmDv4UPddfVZQGdSp
 KxoBQNPx/q1zV8TdqFHJ9pJT/Xg/VHvQABWl6+/UP2pbujJWtTriQM5DKGtH6UrRDHakYxSUS9u
 WAxlDH6DBzAY0ZUmUKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX3kyMXLjwKUb6
 HgzmYbDX0sYH/EbbSAyHpHw/rk3HxDYEt+HhY2kcLflgkKK4tlpQ7mMrTAz1DBmtTh2WFmvpmno
 URBU+j9K/hS1KuWSqgP2vWEudmRCs8E=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5dc39f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Mqij7SlxvU2Fhucnr4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234345_335693_BBEB7708 
X-CRM114-Status: GOOD (  21.02  )
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

Different ath12k devices diverge on who allocates MLD peer id:
WCN7850/QCC2072 have the firmware allocate it and notify the host via
HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP event; While others let the host allocate
it and pass it down through WMI_PEER_ASSOC_CMDID with
ATH12K_WMI_FLAG_MLO_PEER_ID_VALID set.

Currently ath12k host allocates this ID and sends it to firmware by
default for all devices. This breaks WCN7850/QCC2072, because the host
maintained ID may be different from the firmware-allocated one.
Consequently data path may fail to find the dp peer and drop some received
packets. From user point of view, this results in bugs reported in [1] or
the 4-way handshake timeout issue.

Add host_alloc_ml_id flag to struct ath12k_hw_params (and a copy on struct
ath12k_hw for hot-path access) so subsequent patches can branch on it. Set
true for QCN9274/IPQ5332/IPQ5424, false for WCN7850/QCC2072. The flag will
be consumed by subsequent patches.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221039 # 1
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c      | 18 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 12 ++++++++++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fc5127b5c1a3..1f56474efbea 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -793,6 +793,7 @@ struct ath12k_hw {
 	enum ath12k_hw_state state;
 	bool regd_updated;
 	bool use_6ghz_regd;
+	bool host_alloc_ml_id;
 
 	u8 num_radio;
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index d135b2936378..8091501cf742 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -232,6 +232,8 @@ struct ath12k_hw_params {
 		u32 max_client_dbs;
 		u32 max_client_dbs_sbs;
 	} client;
+
+	bool host_alloc_ml_id;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7d0d7d5fbf53..1ae21618afb6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15382,8 +15382,9 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	int mac_id, device_id, total_radio, num_hw;
 	struct ath12k_base *ab;
 	struct ath12k_hw *ah;
-	int ret, i, j;
+	bool conf = false;
 	u8 radio_per_hw;
+	int ret, i, j;
 
 	total_radio = 0;
 	for (i = 0; i < ag->num_devices; i++) {
@@ -15423,6 +15424,20 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 			}
 
 			ab = ag->ab[device_id];
+
+			/*
+			 * the assumption is all devices within an ah
+			 * share the same host_alloc_ml_id configuration
+			 */
+			if (j == 0) {
+				conf = ab->hw_params->host_alloc_ml_id;
+			} else if (conf != ab->hw_params->host_alloc_ml_id) {
+				ath12k_warn(ab, "inconsistent ML ID config within ah, device 0 uses %s allocated ID, while device %u doesn't\n",
+					    conf ? "host" : "firmware", device_id);
+				ret = -EINVAL;
+				goto err;
+			}
+
 			pdev_map[j].ab = ab;
 			pdev_map[j].pdev_idx = mac_id;
 			mac_id++;
@@ -15447,6 +15462,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 		}
 
 		ah->dev = ab->dev;
+		ah->host_alloc_ml_id = conf;
 
 		ag->ah[i] = ah;
 		ag->num_hw++;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index e5bf9d218104..0c277f51d99c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -439,6 +439,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -530,6 +532,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -617,6 +621,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -697,6 +703,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -789,6 +797,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -873,6 +883,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 };
 

-- 
2.25.1


