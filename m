Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D85109B474
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ps6EZi5pljoLGLvzoDpPQHaRe0lZ6apdq8W+9amtx0E=; b=CwSqN1J9N0ZXpt7yeuHxrfNWNY
	z93ydACxXKkXdTMQIoluf++WlRY5/yyLxLtQ7jVke4Ui+0q+mpqIGh01zWpnkT9m/pM7SfGh30G/I
	OtdZw7FiDnqpoRkWrVmxiRkceKvjAwPwrQZyPN6b00KXvG5bkrQckp4DdZnG3NvEWZJlnZ06ZkQl2
	V+tG4Cj1yJOLGvvxs/Jj2svPKcxHS/snVwfTemZQ5B55PxT4EFriBpREUsO3onQslbw3dmkg/nNkX
	kYaaLH9/rp8Ri8G2qZFFII/KcFsbWZVyb8p0gJLkAdE+R4+cdYfgMA+PpWSFbtTKIg7zuTf9s2T7z
	60mzugtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1n-0000000D5O9-3ceH;
	Tue, 31 Mar 2026 14:25:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1j-0000000D5LU-2IGf
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEGHPM2761618
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ps6EZi5pljo
	LGLvzoDpPQHaRe0lZ6apdq8W+9amtx0E=; b=CMoBOrDSRj7dw1rueKgr5TLXv+T
	OZk7uboX63xl6sBM6XRdpKnZtdrqg7mE/qP8SxnU7jAIZuMPabo/y6K6trPTiq4W
	0//2CuRjpyp+Bl7CHLpl4HEaIOf7Etx3HlZn4jXC9sF+ZQNE0ydBuxrLTiqj+/HA
	768IQA/Qf7Ob2TxyAuvMhuxFjl3hHsxaFCIsoH/tUbJ8EOpDUwcYYEPx9a+VQGjB
	jfNcEjkHY48kn0ykzg4tQ5QYiUXvfRcmTQJFe+1pFTjg9Halco+caE/svAmgzz/o
	QBoW0slu8ko1SVa/JiEIMxL/tmvT4SZ6AomT0OVMP5rc+tN24GoEGhFIljA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931enf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24a00d12cso32314035ad.1
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967106; x=1775571906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps6EZi5pljoLGLvzoDpPQHaRe0lZ6apdq8W+9amtx0E=;
        b=INUFFTs6cQpczATFhbonXhFVhIWj8jCtdW9xkf4RhuZbNiACh6G9bfGHcjDQlE4pSQ
         suFbcCNZwdDUWooSXghFVM3o/jKd6cCwZBybao+TROxmErq3q6r9CZpQ7GL/sprBIVtd
         eThWiMJTpdFq5UvZ/zbyniDQ2j66zQ+f8YvobSTC1O0P97CQ3yYiBx9fWOSzO8Kqj04w
         74NQsUsyt3Fz0inxXsCrBKjGKd+Vh2MjKYwAAuDuJWP2T+jFwlVIpQ0RLUqJFo8dIZY1
         6lT2uIUYmbxbaheXwDiVVWPMMQNilear4kDb4fE88yGbIPaSb4x3jJzKPokFm7fKREm9
         fWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967106; x=1775571906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ps6EZi5pljoLGLvzoDpPQHaRe0lZ6apdq8W+9amtx0E=;
        b=W58W+/Uh9FyKUP03itzTNZ4ZtcKBVOVeD5EmvYrRXvK2ysB1jmmtLs027x8JFoEfET
         fJvf6FawQm6y+CllirYVGUQegcQlvSDtQ0wC0KR1DtU0RAiLcdrx9kWEQzRvju7AfkSx
         fSidSNXiXNHOCDO7l0Tlw3OhNdJ6RsLDaUMUMW5PZCFLYr8ZY+yCu4R+8fr5I/uVFh+E
         51+U5ODkPSzLFJ4iVVGCc54K58oVstdLy+FQMCF5uGW1TUZKnkxmPRWXpZjYOzI6k3/7
         sY1SUkp+tb/OKxRnB/jmPQCsK65Rxse/3KkalIeS3vHbyjB/jo4zWpfFD1EqTTSQPlEh
         DV/w==
X-Gm-Message-State: AOJu0Yw7H7w1+KNufLnaZj0OrKu/Ix709KyijI7S9WOaKJWxULvtFMgW
	t82vVijUJQE2Z/Wru+cSpLibhiZU9XNLg0peQnXXNNqY0CZLFogSomhhGeFdIgf/flIjCgdS9g6
	dRYybbOgVACqPy876phRUuPZFhiwVn1jpPjpx2x/PBVD/oh+E/Wm9QrYEZgbAIoVqVwvuG/af
X-Gm-Gg: ATEYQzyxHApgb5BIGxQB30ytIsm668/37B09R1rZSE0X9f0zlAv3gUmf4whgSINJ6XD
	RcLcQ5R38DUyu6RYsCqX3zeTYjBLDWGfMOc3rE8fpEOt2eXlEhopJZ2K2qW8h5ThXf6NmBqipsA
	QlS+HrOGrEru1mBPOYChm+Fudl3wluoYh5GGeTn7GVoXnAQFgJPKuvUQTDsVvPQbwIKsPWerpI1
	j5LWAsSnt6oR8i/dISiNtr9OKN4BT1KZBV15F3WMmy34nbP1OvfnrutTi77cXQwMQlN1Qlm6ot/
	23337pJ4Ckk0WxhFp3SV4dxLxfxlx95ZA/KXrG1CbOS5ziuMnoAIw48BXDmMekW+z0ztEkeFB+p
	FCAzsGWKCnSWiELeIOdUN2KQK1yrA5M2cx6VsTyrj8dvT2DM4u6vpsXkzf9cynmW4GhZFJJ5yIE
	8RgsmTAL0pRkoAMouKOApwQKx2iVWD2yb+6biNjClM8iW9DxKXhn8=
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr185104355ad.26.1774967106054;
        Tue, 31 Mar 2026 07:25:06 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr185104045ad.26.1774967105522;
        Tue, 31 Mar 2026 07:25:05 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:05 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/5] wifi: ath12k: handle thermal throttle stats WMI event
Date: Tue, 31 Mar 2026 19:54:42 +0530
Message-Id: <20260331142446.2951809-2-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzOSBTYWx0ZWRfX4nS5ixWt6u78
 /x3ZPS7Jyltn7UG48v5u7Y3ceMHWIlIylcK+jaV8uxZHR1dkoltaNq13lRDIFHEJtEp7OLXpNjZ
 t4xE5o4AsVk+pR/GHdtI6GlhQOaG7tZZfqDU6z4Pd/8FqjdY+66489Ohu1jgG4IxvNTxpevH5Ew
 ksX2o0mjKJOPCA91jDYi1lY9JVrGx55BVx2zlWp60HpxOXoMWL3ejWXRnkp8FCyEmPTGg2WxO3/
 1slEMZjPkfUjGyNkaPLI/TgNCSQodyzlDHkHblfe7aYcZrwJ0J3tRAgHzRffHelnrocvaolbGkr
 Yyi40MzCaUybmnN2/HU/0mWmS7MGbAB5gbeYiYGTA+ogSFYWGVLJDkugZ5FMCIKJk1yvXINNzrh
 KzlLVdTo+QvLrm2cKy+c9im1d5vlpCGPNf/ee9jEtSVLOCguTn61JVJdrzhX911if7LTLqGWhww
 pyOAIkSHqUja1vCT5eg==
X-Proofpoint-ORIG-GUID: CHW3WwqudQbreamQKBAjMPDo-dPsvmoy
X-Proofpoint-GUID: CHW3WwqudQbreamQKBAjMPDo-dPsvmoy
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbd943 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=E37thjIwhXKEW9KdV9kA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072509_449973_C3A5CC6D 
X-CRM114-Status: GOOD (  13.48  )
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

Add handling for WMI_THERM_THROT_STATS_EVENTID by defining the
wmi_therm_throt_stats_event TLV and parsing pdev_id, temperature and
throttle level.

The firmware can emit this event periodically, including when the
throttle level is 0.

Log the received thermal throttle stats to get the current temperature level,
temperature and thermal throttling levels.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 38 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h |  8 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 65a05a9520ff..34184d0d03ff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8819,6 +8819,41 @@ ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 	rcu_read_unlock();
 }
 
+static void ath12k_wmi_thermal_throt_stats_event(struct ath12k_base *ab,
+						 struct sk_buff *skb)
+{
+	const struct wmi_therm_throt_stats_event *ev;
+	struct ath12k *ar;
+
+	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ath12k_err(ab, "failed to parse thermal throttling stats tlv: %ld\n",
+			   PTR_ERR(tb));
+		return;
+	}
+
+	ev = tb[WMI_TAG_THERM_THROT_STATS_EVENT];
+	if (!ev) {
+		ath12k_err(ab, "failed to fetch thermal throt stats ev\n");
+		return;
+	}
+
+	rcu_read_lock();
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev->pdev_id));
+	if (!ar) {
+		ath12k_warn(ab, "received thermal_throt_stats in invalid pdev %u\n",
+			    le32_to_cpu(ev->pdev_id));
+		rcu_read_unlock();
+		return;
+	}
+	rcu_read_unlock();
+
+	ath12k_dbg(ab, ATH12K_DBG_WMI,
+		   "thermal stats ev level %u pdev_id %u temp %u throt_levels %u\n",
+		   le32_to_cpu(ev->level), le32_to_cpu(ev->pdev_id),
+		   le32_to_cpu(ev->temp), le32_to_cpu(ev->therm_throt_levels));
+}
+
 static void ath12k_fils_discovery_event(struct ath12k_base *ab,
 					struct sk_buff *skb)
 {
@@ -9900,6 +9935,9 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	case WMI_PDEV_TEMPERATURE_EVENTID:
 		ath12k_wmi_pdev_temperature_event(ab, skb);
 		break;
+	case WMI_THERM_THROT_STATS_EVENTID:
+		ath12k_wmi_thermal_throt_stats_event(ab, skb);
+		break;
 	case WMI_PDEV_DMA_RING_BUF_RELEASE_EVENTID:
 		ath12k_wmi_pdev_dma_ring_buf_release_event(ab, skb);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 5ba9b7d3a888..8539435c292d 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -870,6 +870,7 @@ enum wmi_tlv_event_id {
 	WMI_READ_DATA_FROM_FLASH_EVENTID,
 	WMI_REPORT_RX_AGGR_FAILURE_EVENTID,
 	WMI_PKGID_EVENTID,
+	WMI_THERM_THROT_STATS_EVENTID,
 	WMI_GPIO_INPUT_EVENTID = WMI_TLV_CMD(WMI_GRP_GPIO),
 	WMI_UPLOADH_EVENTID,
 	WMI_CAPTUREH_EVENTID,
@@ -4120,6 +4121,13 @@ enum set_init_cc_flags {
 	ALPHA_IS_SET,
 };
 
+struct wmi_therm_throt_stats_event {
+	__le32 pdev_id;
+	__le32 temp;
+	__le32 level;
+	__le32 therm_throt_levels;
+} __packed;
+
 struct ath12k_wmi_init_country_arg {
 	union {
 		u16 country_code;
-- 
2.34.1


