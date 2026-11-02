Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12286606A331
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Czgr6oNe;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oq66d2Ih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLM2KBgY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vUkgn0j3ZwVkTzOQ2ppjEgj9os/4SAIvISeglCi9UKU=; b=Czgr6oNeNLjHmv
	GTymqYt+Ot0U1tdX9hRaP61EIGzUYhhZMIlHoUETP2l3jbjA/92jBvVdLhdwtqtl6YMFz6UecsV3m
	t4VunapRw7hsI58SfPO9XxM2pEJS+4+Df3oeTDSjZIXwKjWwjU8mkWpzLLW6HnqO7ym3HXEukfBQR
	DL/bSgtF8TdtUE5K0QE+wVciRUsfyDUNVSejklCvbnAZ+VeyYNGT5tMPAbubqUNq6kuBmrybCwnVS
	mCTefp54gWu60vc61z75xr38QiiDjmo9vzZ6ZLXJFn4r61RtXTXi52gYH0KF5nlXEsKHWz+hFQI5p
	DC+71vn+kuqgbgyVScOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh8-0000000FevG-3Jgp;
	Mon, 02 Nov 2026 06:39:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh6-0000000FesZ-0G1A
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:39:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vDCl2753081
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vUkgn0j3ZwVkTzOQ2ppjEgj9os/4SAIvISeglCi9UKU=; b=oq66d2IhI6LsFSe3
	bGvAOJSNJXXc1Mla2H46EZtNxwRVtdCYpv8qIgWRr7i+RyM1wncREt+fLQwQEx7R
	8dl/8jpQCJ/GZqP1k7Loyj0fRlPCEJflFaIZqSxC3iQoSBTKWQX0GC8NSMpTgxSL
	ZJdabjI0FuSGoYQw2N+7hR7mldyGWJJmDXVBONwgD6yMUoEiMGFJXoxMWSE/niGX
	6FEm55L9aGzjqloccskbNh65bNr4pH4a2g0ns+N/kvZoSJIvJZ5BgUrP0hL6m4Ze
	hhclF9eVIkVaWM08CJ8984lJCZOH4WeIIk/Mr/Lxi1DOsRfUkGf3Gg9nmo4a+e/c
	R9fkEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg200yhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so3602972a91.2
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601538; x=1794206338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUkgn0j3ZwVkTzOQ2ppjEgj9os/4SAIvISeglCi9UKU=;
        b=iLM2KBgYhQXAJGqjutnUQVxfzxGVPgul6Shkazjd29c8USSyPSDyft/fYNm6fyxLLg
         aIT65yaLBSC6KNOVTOk2TP+A9INBiRBDDqPRdXnnMf+qTZxUNKnw78aLbcJak+UXcEYS
         8xI8Nbg1Zk5vMBetqUjECAGV7GuYPAGqj3oMh+3kNGW5PsIXgDWy93Qu3NhNDWiBMs/x
         AdE/C0Vm7PSXfADPpkXOn2mN7rH1a1Sr6Bzoy8/D/sHUVL2MqlqBbhbRJFWKkvFp20dM
         mwOAYpAt46oi8rYprGMsa4qLfgHa9VGeTvHL3wSimAgS3xWt25Ab/dJtxpMNC2BP1R2m
         eRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601538; x=1794206338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUkgn0j3ZwVkTzOQ2ppjEgj9os/4SAIvISeglCi9UKU=;
        b=hTKGSd40sGxFHIKUwRJ0WeZn0qkQRXvEUGjO5OQ7kc/hXV95Vo6evF6cnTuCkUVyx/
         luAmNooeqnWR/2P8KO79rvuLCAzLuGLgFoDSjex85re8jFvroRyLPuJhUhMoreUJa5WC
         C715WBagnH0kpIYQdhtbQzPZyLu+7jHj7Dj0HaCtTnvP29V/IQ5QBLae0sikWxJLx/YM
         /aDf2xv7xQXDEHx0jzxTdxZCZCzpegAdx9ntUx3zg1A/ZYUUxZc/2LtUx3w7Wnc0CXeV
         mRFirunvoPQKvAXN2g0bXIL1uwI3SQGxEfHSEb3wILVmRyCuu2EgoqK+WjswAF8r/AyD
         LBRg==
X-Forwarded-Encrypted: i=1; AKwUvBxN7jI9gyrgS0kuG4JYel/DQCPvg9OXPYagvS53K7j1emHAzAA71TCic2zCxNDst4AVBywB6Jk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/F7Yxn7WKSSXlBsxw8EPx5YK9huV0ln/HGqf/PqNil5ag5hWuq
	yU0aS1XZRR6a08l3yIhHlqcN97r9dFuaGqvmQvrx1PAeAnQKw7fYhw5gOpdhCXwAZr1cNNCV8eh
	rv3oB6nXRfW79K8ofHEEDvG6+jv4+NI5uvKYTvKlPOtJ8sjUscoLi3XGxQ8/drIXZ
X-Gm-Gg: AYBFou2vQetenwDPu4Hw0qNYOd05U7vqaLy3d7s/9wmnmzygnoCccoYiPidR40aDkSi
	eAHXzz4HEiCJ3bqDaacDd7If3LktlGiaPl3ZTvoMqe4wWnzpigZ1f63HqYaVRqsT3Fhy8Fmi6yR
	2euoJlcSgOyq4paqCkC724xxiT+IYslv3kgT0tAee60o0T7NMyAw8Fe9RaUMIvPFUpLbxbV2VKn
	QwAuR5NMNemhwFZTkl1ro0Qi5RAd6ii23xiA6fPnSp/Xs0NUlLQbYBHU7gTIZC11e5CZH6Kvq4/
	EbF0z9uJ4ZGBpDZcKsnHsRtK9J91qxr6rstbDc/5JVG7XUvpcyBfFe8qtcUCRRo32HXGuUeYFNN
	lYAVQKWNHT0LHY8Sc/2DXRyp7nUSox6QnBFEHuqkALLSBsn5OjK7qHt8BIF8lhZHz8U/sW7Adid
	IV+folvK+wp7RFXmTIZmy30sY27yDH
X-Received: by 2002:a17:90b:4c09:b0:3ac:adce:60af with SMTP id 98e67ed59e1d1-3ae89724b12mr8573966a91.16.1793601537919;
        Sun, 01 Nov 2026 22:38:57 -0800 (PST)
X-Received: by 2002:a17:90b:4c09:b0:3ac:adce:60af with SMTP id 98e67ed59e1d1-3ae89724b12mr8573952a91.16.1793601537373;
        Sun, 01 Nov 2026 22:38:57 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:57 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:15 +0800
Subject: [PATCH ath-next v4 06/11] wifi: ath12k: derive device id without
 drv_link_id for single device group
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-6-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: aIJIKw-QpliUUUBkhyOqjwrdsym0lXRS
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83003 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fys5ee70t4wq8xtZfioA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: aIJIKw-QpliUUUBkhyOqjwrdsym0lXRS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXzGDqTieSHYWk
 Qp/BV9oBR8Q7LWn3jI3Kw/GoT1TnNyElga7jkXY0QhhpBT0nEMI++H1hnoeprTWqvaeRfNBRo13
 bHhqP7SVXD1VEkZCX0pJ2vPPkBNTNqIY0ugI3K1Ev3X0+Tex7iSQUBdDvNmHqyEuaxTmMzMlZfa
 wKcP5o37aahCc9Pi+mKIFnCWC2W4lWmKMxlqYG2t+B1yGJM7xqzx7M4mSf4q3KEZ4K+SWBh0qbv
 tmp3sPP0IviDjacdWjjqu9lgst1YVd4ZvEWIU0XoG6kKohffx7x+bUslS0J4cmiIS+Kv8+c5RIW
 KIitPf4AARPmwAQ+f9cPMkX0AhECHSiMo1Up98w4sbzNQp7/urbLEVhMlU63w1aZr8WK4GNeTcH
 TyYx14O0xpMlI4p3UScJ29q4zR612hL+rld2EhhmzXLYvA1zS0X9gCoGDy3dGLW0juQnbX9ml0Q
 NW28ib6/RPpEycyQEKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXxNloklO1C4VF
 YsBiGLi6HL6QMSy8pojbWsAc0yjz61MGtdBFDU+AndxvhOoZ0IMZNIr/LaPa4j2CyLPhjWvLEfB
 qp+RqCSZsdbYVWukHVZd2n9DKfTsn6Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223900_222543_9466353F 
X-CRM114-Status: GOOD (  20.64  )
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

On the RX path several functions derive the device id from the
drv_link_id via ag->hw_links[drv_link_id].device_id. This does not work
for WCN7850/QCC2072, which use a logical link id rather than a
hw_link_id.

For these devices the whole hardware group contains only a single device,
so the device id is unambiguous and there is no need to look it up from
the drv_link_id. Add ath12k_dp_drv_link_id_to_device_id(), which returns
the device id of the only device when the group has a single device,
and falls back to the drv_link_id based lookup otherwise. Use it in the
RX path in place of the direct hw_links[] dereference.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c          | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 13 ++++++-------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..67b1a1229d20 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -934,6 +934,24 @@ static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
 	}
 }
 
+u8 ath12k_dp_drv_link_id_to_device_id(struct ath12k_hw_group *ag, u8 drv_link_id)
+{
+	/*
+	 * For a single device group there is only one device, so its
+	 * device id is returned directly without consulting the drv_link_id.
+	 * Otherwise, derive the device id from the drv_link_id.
+	 *
+	 * This is general and works for all chips, but particularly useful for
+	 * WCN7850/QCC2072, which cannot rely on the drv_link_id to look up the
+	 * device id.
+	 */
+	if (ag->num_devices == 1)
+		return ag->ab[0]->device_id;
+
+	return ag->hw_links[drv_link_id].device_id;
+}
+EXPORT_SYMBOL(ath12k_dp_drv_link_id_to_device_id);
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif)
 {
 	struct ath12k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 108e27dd5797..df22f5d43455 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -736,6 +736,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->rxdma_buf_ring_size;
 }
 
+u8 ath12k_dp_drv_link_id_to_device_id(struct ath12k_hw_group *ag, u8 drv_link_id);
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a59adbb78c76..08a9f070e4aa 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -608,7 +608,7 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	struct ath12k_base *partner_ab;
 	struct hal_rx_desc_data rx_info;
 	struct ath12k_dp *partner_dp;
-	u8 hw_link_id, pdev_idx;
+	u8 hw_link_id, pdev_idx, device_id;
 	int ret;
 
 	if (skb_queue_empty(msdu_list))
@@ -622,8 +622,8 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
 	while ((msdu = __skb_dequeue(msdu_list))) {
 		rxcb = ATH12K_SKB_RXCB(msdu);
 		hw_link_id = rxcb->drv_link_id;
-		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp,
-						    hw_links[hw_link_id].device_id);
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
+		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		pdev_idx = ath12k_hw_mac_id_to_pdev_id(partner_dp->hw_params,
 						       hw_links[hw_link_id].pdev_idx);
 		partner_ab = partner_dp->ab;
@@ -669,7 +669,6 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 	struct ath12k_hal *hal = dp->hal;
 	struct ath12k_dp_hw_group *dp_hw_grp = &ag->dp_hw_grp;
 	struct list_head rx_desc_used_list[ATH12K_MAX_DEVICES];
-	struct ath12k_hw_link *hw_links = ag->hw_links;
 	int num_buffs_reaped[ATH12K_MAX_DEVICES] = {};
 	struct ath12k_rx_desc_info *desc_info;
 	struct dp_rxdma_ring *rx_ring = &dp->rx_refill_buf_ring;
@@ -721,7 +720,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 			continue;
 		}
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			if (desc_info->skb) {
@@ -1483,7 +1482,7 @@ int ath12k_wifi7_dp_rx_process_err(struct ath12k_dp *dp, struct napi_struct *nap
 			continue;
 		}
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 
 		/* Below case is added to handle data packet from un-associated clients.
@@ -2104,7 +2103,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		rxcb = ATH12K_SKB_RXCB(msdu);
 		hw_link_id = rxcb->drv_link_id;
 
-		device_id = hw_links[hw_link_id].device_id;
+		device_id = ath12k_dp_drv_link_id_to_device_id(ag, hw_link_id);
 		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
 		if (unlikely(!partner_dp)) {
 			ath12k_dbg(ab, ATH12K_DBG_DATA,

-- 
2.25.1


