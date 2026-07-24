Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1947AC53200
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 01:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=; b=L3w0bGp7B9TmDowxM4aEO4OJ5s
	fVRHFodZi2uY33VUZVFUyEttI4MiB8w/j+hq3jZccmqsN8CKs/t31qXSJBwS4mAahDfMwi85PiNLr
	WHAavt9ijiJTx2Dx945mokdGi9lj3NzyIw/F6i9Au4y/lOLkwHk9614ZPZLG04IZrsFoLURBzRfnS
	bT/ecUUgfiYDGPg96tYibkUBM3e1Z3x1duh3p4Vb0eS6Eh5kZ+JH3LuU10cLIrP6QRQJeCUbw4lKz
	9TvqsdQQHRIxqtnQ1brTw5gTJktT8gSDjxpA/8vydoHuJ7OusycfkUtRgIu7F9yD6GWHK2Qd+su0z
	hwhdYQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lG-0000000FLCi-2zJR;
	Fri, 24 Jul 2026 01:31:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4lC-0000000FL9C-3Au2
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 01:31:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeHnt1055316
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=; b=QCvoq+QgAd28XEsF
	1bijWBEel5NOwmESsCpjNRWLADJHd1iuAZHYFPdDPqYDyy1L0i2bx1Bn0cP9K0QS
	EP3rQZ9vp/q3hrmivt/a+2WWWhU7iBbCjRGLloHmaiVJPAB5RnOzjCcRZqQFVGW9
	P9q+LAB6Z0fLHZx33ocysxm9p6R3L6IqLp+bfFLeVuZWLD7uB/kTZv/4qzA1TMWE
	Na65oAHTZ9ywMSLJFENXXgsV1Ac/ZcDX7ff+LVszhkgUuIbWF3ItMmczCeEYGyQU
	eGxfjDW5PkoNlgqJKz/scDslDCt3s98qHnE/e1ut5hiHa1IMUc+kpHLRpOfKazW+
	nlOP/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmj8hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 01:31:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso925149a12.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 18:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784856693; x=1785461493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=;
        b=GqtsLKFFaxOrVeY1X+t0LzjSIy0UOMomojXzXxlaQ/YRR+WwJK7clnswBVw7uw7lxd
         hl6JCLJyV7rrXSFLtzZV7WdQgatfjvgeQ2MU5WBZQp3Q855hy9QqlFYWNJ1/uOd9tEvv
         IsHxRjJn3fY1Thh+PaSp2ExqvKQ9MxS6QknyS9xaLiwfN+mgi1gADnYx0RBHWyUL6QTh
         t1fpUbPNZfvfu/JuQn1a4m0kX5OqTuqxjUBby9d62OLs/WpGxL2ftcAVYggQA4v6ExiY
         ntAGUTPQLk5wm7KhNgkXnxjKpEr3l4AWba4DwqCLHA5vcaEYx4nWQO+M8bBJ/GR07aUd
         KvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784856693; x=1785461493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8vVF6hHkGu1xxeXQmSUf7FgyLwedcYDTnsRmaxHtcc=;
        b=YB/I4K28CKBo8pZj5ODD9xM0LOKJodxAUcorKXYDmtESFrugzuSXD8z22vx1k1nE0+
         u9Gd4Qzv7Ih+FBKvHiqkpMiEEGUHZBJTklI2mHI3K6DpHtKA3y0ZjwklASsoogXH9dTD
         4Chnb7ckEb+6wKjeTzhlU+Og6XfUyedktbrhb87bxrd0+h/w7SMOIISMan4D3qRC2RCM
         EHsggnfmvSt6/nULmaFJjnoHj7X/z+5v0IE/Lr6QDdzkmi6/SM81GWyAz0yXyRdz1wfr
         StIhgnFrYYqZ5WoErMuA4Hl/T8PNzmPdDxQld0A97+A7T2aEOBzfrGqTXwaKN97onU3Z
         L6SQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqg+XooTHqRwUtal0Yw7t6BfYoe1bbtI0hu7XSWn+QVvyQykx6UxPRhaK6AlNWnplx6/cc178k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Yirx+6ZTttfDgw1D+exj5S8qhw9mCg4aNeinikd62uaz+8ll
	bcluNrVjKUO6fSMXO2nHLjIklv/SEtbX0BQHh7mVX26S0d6/xBu6kNq9Tz0Swo/qv+p0MMFG6cp
	oVBupAwxvRuD6Xw4n3JoGqpoHkvaZPco92itg6/gE72VmWJRs234rYRKoyurSPN4D1k5/L1Wt
X-Gm-Gg: AR+sD11VNtpWVjW5XM6kB3gmitEB03sRNKHBFSktRiNuCWwgtlIboZuS2maZAPiE2Nu
	mvyipIo7Fk1eEjQciV/SDh+LcRDYXWtLJsog2zk9++XltfV4zwgGhMCKl60h8ulAzcrkZ6hwPib
	WI8ERAoTikOBWdlyG+frVBsyP7ez27jome/WhGf+qzL6kCm1PGEILkxJObRX3luKHjyOw6VFO63
	fg1qAJFdXbQTKZl7amBADmUzwtPKZo1uzLlvhaTYL3T8Xha/GoT5GmzAzgGSKyWRpPImM9s8x5c
	IIblqGoKRG5sKxc+dldfxreWKcIFGcCW29vCnkp5Ql712lYcI0Rdeb8kcPVdWAgtXd/XbRpBXno
	OHf+WNmDk9uN/OOCEFcSsAB4l2HFu9cceCo5ce0kCA5PdI3eeyLhz/RU=
X-Received: by 2002:a05:6a21:9182:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c44afcf8bcmr6254463637.6.1784856692684;
        Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9182:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3c44afcf8bcmr6254435637.6.1784856692249;
        Thu, 23 Jul 2026 18:31:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm22655306eec.18.2026.07.23.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:31:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:31:25 -0700
Subject: [PATCH ath-next 2/2] wifi: ath11k: fix overreads in
 ath11k_wmi_process_csa_switch_count_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-2-c01ef10bc6a3@oss.qualcomm.com>
References: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
In-Reply-To: <20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a62c075 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hOGj4-57aE1FpqoUBq4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: C51tjdAnpGnpga0x1vwpsvJ-AR8viSFr
X-Proofpoint-GUID: C51tjdAnpGnpga0x1vwpsvJ-AR8viSFr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX25mMv+Ebxlix
 wkQh87digly62DJ3FlFirzc/JQRT8p8hfBPYHvDtV6ijVeTONTtPy7g505R2jO83F4yATn91URr
 489CrD262M4QPOHeiYavwYyavk3Tulc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAxMSBTYWx0ZWRfX8Iic79e2N2+8
 D3LUAHu1elEG07f7jpv6IliiUGnURtZbxLtkYfkaKr8x/hpRvLIndZnZ2ugAi36RW8l/atqnRb/
 WrFFuCw2fISuicKb9Js4y3rJpRwurDLQ1Z+N5w3jIGu5QouJkmOKMl8oBG9YZKz4lMcL4pEnBSP
 cg0kLcVvVrlHTs1Hw9Bh+yfACCHaoJ1u0Su5WZRPxegL8T8VJYU+Y8t6qygGbx5A7n1lr+d4Unh
 xekmqtcFWexHMi2VWjAPL5hPV8kPRCs7x8aQtS18fmjMDRQKZqIrlrAgKkVty0UzNvIR2Zv64T3
 rzEWm8htemNT1VJWQxDz9Sjfq9k9vPamdERJGpUMGaodFv3ar0BWxwCrPwre/A/2I2GAre3/sVL
 JEB8j+N4+Vv3X0n6TVqW2T/wEflbXhfPCB5hVO5YfNeG5VWKQpmdgL0NoizZiogSxTADKDNcsKP
 hp7lWY52zDHKvgclzvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_183134_909520_2F2B230D 
X-CRM114-Status: GOOD (  17.33  )
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

There is no policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT, so
the parse infrastructure does not enforce a minimum length for the event
struct. Additionally, the num_vdevs field is taken directly from firmware
and used as a loop bound over the vdev_ids array without checking that it
fits within the TLV payload. Either condition can cause an out-of-bounds
read.

Add a TLV policy entry for WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT so
the parse infrastructure enforces a minimum length for the fixed-size event
struct. Add a helper ath11k_wmi_tlv_data_len() to recover the payload
length of a parsed TLV from the header preceding its data pointer. Use it
in ath11k_wmi_process_csa_switch_count_event() to bound num_vdevs before
the loop.

Compile tested only.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index dca6e011cc40..feb0a0b29c81 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -159,6 +159,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct ath11k_wmi_p2p_noa_info) },
 	[WMI_TAG_P2P_NOA_EVENT] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
+	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
+		.min_len = sizeof(struct wmi_pdev_csa_switch_ev) },
 };
 
 #define PRIMAP(_hw_mode_) \
@@ -262,6 +264,13 @@ const void **ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab,
 	return tb;
 }
 
+static u32 ath11k_wmi_tlv_data_len(const void *data)
+{
+	const struct wmi_tlv *tlv = (const struct wmi_tlv *)data - 1;
+
+	return FIELD_GET(WMI_TLV_LEN, tlv->header);
+}
+
 static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buff *skb,
 				      u32 cmd_id)
 {
@@ -8353,15 +8362,23 @@ ath11k_wmi_process_csa_switch_count_event(struct ath11k_base *ab,
 					  const struct wmi_pdev_csa_switch_ev *ev,
 					  const u32 *vdev_ids)
 {
-	int i;
+	u32 vdev_ids_len = ath11k_wmi_tlv_data_len(vdev_ids);
+	u32 num_vdevs = ev->num_vdevs;
 	struct ath11k_vif *arvif;
+	int i;
 
 	/* Finish CSA once the switch count becomes NULL */
 	if (ev->current_switch_count)
 		return;
 
+	if (num_vdevs > vdev_ids_len / sizeof(*vdev_ids)) {
+		ath11k_warn(ab, "csa switch count num_vdevs %u exceeds tlv array length %u\n",
+			    num_vdevs, vdev_ids_len);
+		return;
+	}
+
 	rcu_read_lock();
-	for (i = 0; i < ev->num_vdevs; i++) {
+	for (i = 0; i < num_vdevs; i++) {
 		arvif = ath11k_mac_get_arvif_by_vdev_id(ab, vdev_ids[i]);
 
 		if (!arvif) {

-- 
2.43.0


