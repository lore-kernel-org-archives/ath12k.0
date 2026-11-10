Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4F606A330
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S8ULmynN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdWF++WR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfNV8/ix
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=; b=S8ULmynNCM9Wd3
	giljE3bp+42EXYFxiMPxlL0dyqk9MPOxRAaDZMCCaoOfsmoc55Os7OTdc+iCfPAyYt+CBz79gkXM1
	8KlcXeZyq1m/mfVRzQSnXLLGLKHpGbeoPDt5MaEQRpjT1kAD6iRpjcsTJNZ8mxYd+fW3d7FjfQpXo
	RL2StBii7B20Uwv/P7NvxyN1sTdDh3RvUPN0yGlhz50ghzsATmYqtimTnsW+2ni3fuF3p31DfzVnq
	HK1cKfKMEBwis9rHAxNXPa5sazfTmPYt5vcw48/EYOJJcSjDimrpzrJIUDgZrNKl1kpxupHTzlpdK
	JKz3cIjXyGaRFSJW1axQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXL-00000002fuh-1EO3;
	Tue, 10 Nov 2026 06:40:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXG-00000002fq1-2ods
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A2hx1207369
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=; b=GdWF++WRs1ifv+D2
	r9WuoSlBuqOX94pi1sQ961qpN4wjryLNQi3BDi4F4V+y+Ox61UEExwFPrlYRo/OK
	6TbzfQHFsIvr5mCqxK+kbFwSmr3Tpj8taa8RQO3sIggeGAR93Shrgv1jwT1XTH0E
	TUPPerZPkwdGcgcEkbWUGxnOmJMBfAI7sG+owQ/2JVsGOg/xV0FnWeCmNUtpjNde
	YnQNIiJkL8VuapLHnq1elOJlRYj8rfhhlnDyJSOnot9ytNZ0RRZrnSwuFDFR39mf
	tyOsehU2KvSvIt5rfWenLHAWbIF9Pl/u+8wsNZ5UCC1SjEg7yjS22UtwccVnM8id
	y+lETA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhv1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so1397262a91.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292849; x=1794897649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=;
        b=NfNV8/ixW7PGyJWiLwexlswRhr7qBFEanS4Dce3p5bTWMxyE5XlvPoosCQdXeRbJ7W
         UpshNoXqCXnooBfN1Ql5fbxMCWsF9PnvkhhpEg5pZM5R29RVuWZzOcDatCw8GaQhUEd3
         4ina3u+aiWMph+w712ONRwoWYYfYRMHEMxMmPzrJnmtFxxd5J9uVy79I9anDUaQfM7Hu
         sSILBknBkDOa00GEecEsl6lHhWRTr6iYNOpF/KFrD+AK8m5TKueDiRV8Nel3EN6o9XHL
         tcANltQ2mbJMh1Wzjmniv1hSe+Juuq8UqoeLRs39g5xr7UtORXAgj6VaMSZ3/jQJvReP
         gEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292849; x=1794897649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPCc4ls98JdGYtgofGkoI5F4uUEAEFNFpoWmjv5ZdMU=;
        b=Mhr/ryRAsdk855jZWSfESg2MK1xYMYtwUDQRus6rZteA6ZEm1HLhsXhNB7D7YWGB91
         5/FLhf7FiUH6RlcTfLmlAa1D6Mtd269iUFZAQbeVY9edMnBoJLNnF/ecqMra1xmMYiZa
         Bm/sWSBq2cyYMz7KG9IJ+LtehnyAjbLHR+/YyWNaPa0DbnKaU5+CSznqtrWovlVBGIt6
         vqZVWfa6EgDct37VhhNiaD0U8gN3+1Nqu+JfPDbZ/5sdC6G8SymfO8xVlX42dXssiCTB
         NAYFtK0uUpHOMwfCYyN8B4UWSTC6MjspBlkKX2tks0OFFGyKc9F3K5FXE7ALTrAe2Dj3
         /O/g==
X-Forwarded-Encrypted: i=1; AL+hErFPXUERtD4QAvT39rg8m/M0JDP3JoRw4SDcxgCwchitkQCFOfHhhjBOjPuJiBY8gVdogEbGWXg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Bg9t5lUG0BhICtd9732mROQuHDqncpH6G9A4iBuyiEE0MQjIM
	zlx4INVqYwrouu7FrqAKZ/lGIkoYe/Pm+hEYJY6YN+ptwUwe7RS6NL4qvfcYCOtoFzyBhb+wbn5
	UUGn1zRBPeDPpYmi8Ghqr5i6FnBAdZlQHiJY8w0/uEdqObpLTEr7epVOfNbbmGPVH
X-Gm-Gg: AYBFou3seka2Y6GFNruLQP5THohVSEAcXzCFxVcK4b+0esySKrLmDKbxpHWNYBeuU5W
	pEZZoSySxvslN1wdhfVtFPE5TMWFXkBWRaXEhjThZ88b1+8P+Ri753ALjjDkj9hnh+Pk9ePJBLS
	ZipQ4+34XTnlWgL+URQHHLORKcqP8YTrCBOH6M8efW1eMP9saRB1mpQu4o2XamWpKMeLsFg15C8
	euaPKzdj7Hb8zKKeRJsKcJ1PltXKXMUgnz/ojCxAFu6dGP/05OjDexFhoazml/QVGda4A+v9LyK
	cgt993YSaMApMB164LhF2A9qXFsHPeRnlVHArC4vjRym7wX8JjFH5mS0KJR/Fm5wwo23TN1lRrM
	m7pf8AKrcrTkh7CWnyt2bxTtRGQm10q5uHB+bYy3/Eql47hrCgkdRf4GVgbzKjxRTZVp+SJKvqP
	9RG3uXT9CgaFJcrH5vt5mYd7mCD55xRA==
X-Received: by 2002:a17:90b:278f:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b166cf7a31mr1929700a91.26.1794292848516;
        Mon, 09 Nov 2026 22:40:48 -0800 (PST)
X-Received: by 2002:a17:90b:278f:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b166cf7a31mr1929684a91.26.1794292847961;
        Mon, 09 Nov 2026 22:40:47 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:47 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:27 +0800
Subject: [PATCH ath-next v5 06/11] wifi: ath12k: derive device id without
 drv_link_id for single device group
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-6-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: dosjfR2FcAKHtmH7IWL3cvuRTieJwqIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX3TcNVGW7vWCP
 2YGi0ap2oBuE6xyBNM543Zmi1CXm4kwF4FSbP2EpudZEwOWtMnkqcWWwxtgnXieqC+ZKMAvCD+r
 JnEvQ5TXl2Ds4f42Y6bVaWc9rfPfpzs=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2bc71 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fys5ee70t4wq8xtZfioA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: dosjfR2FcAKHtmH7IWL3cvuRTieJwqIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX9J0p64uiKlwj
 0xq0cuHEKY2HAr29G7ZtQGkxDF2r5SPBHBPxqYjLJ/zI5xsR49XflUmlXTgg5puGcsHTp/ToNte
 F5sjIcBp6ddQjXgYJsJSrwbd4Dxdwh/iuetzDB84o0ykb5jGp+TgNO9bX7kyem9rNbTAOGkmH8z
 yj5Hh/q6zoxLKBiBEs55bXN4fn44tK13ZzEJnbZpwosNmEKYigimwBDcJiRiuWAF8SZ9ApFEy18
 WMGTuclE2FNtatyjf8JXqSVYX64pTTqILjWRBS4nrBx29emxAT5ig4fCuIPHoMynEnrlg2AE8a3
 R6zKP2R1RervRH7U/+bVrx3lmrCD5/U/9PEnLL+1bglMfBpcI/qms6W6UOVyG0ptKehYLO4hrt3
 YagVKua0vfkcNEK8DFuPMdac5HmdNiXjF/MktRuhUyuUOTlA+fXPG/Mj5ZDrK3r2Bo2dkKh9hAd
 iPii855VR1UCYJncqgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224050_889182_CDD0B237 
X-CRM114-Status: GOOD (  20.12  )
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

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c          | 18 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp.h          |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 13 ++++++-------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 0f0800388935..d49576d29da9 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -939,6 +939,24 @@ static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
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
index 5e9cdf72670f..82724b87733a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -736,6 +736,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 	return p->rxdma_buf_ring_size;
 }
 
+u8 ath12k_dp_drv_link_id_to_device_id(struct ath12k_hw_group *ag, u8 drv_link_id);
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
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


