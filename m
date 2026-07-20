Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AE6C44515
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOHSQiMKVR1IwBDP6bunGeFjzNHHpa4oZ3vKtcA1gOA=; b=ffvuYcKpj16VNdqR5KnWAZDiaz
	29Y+36J6A8EoENauNIZvLW4kT0VnqCQ+ETzWxvDqLQEZ79AHqD6FudYiGfgGmSRQJqRpR2IP88uJM
	ARg5kz2MWAmeHkEu4khtu15Tcy3fFV5rhAHPKRGb27Y84Ir2NtX67mSnoyRImWu5gofvNU2sromHg
	YoIrnK0GAPOnXxJ6mKP95I6CVfZm0P+ndEGDVsjJ5aFMEmegxLjDgAy1AMIed+yuFuFi3wlW135rL
	Ys+3DR9XMlO+YeXLoYRuQixxrbGf6fwBJzaL0px+MQZfMSpxzvcrqqt2md4bCsY45fMnR6jlPaYX2
	wCar75Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhjC-00000005zOU-2wwR;
	Mon, 20 Jul 2026 06:43:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhj9-00000005zLi-2vQ7
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RglK1774822
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOHSQiMKVR1IwBDP6bunGeFjzNHHpa4oZ3vKtcA1gOA=; b=aeCe45qysGX5X3sy
	TEVOhdiDYp1TDUcUFdd8hNxeumEu7fJP/YBFIat4ygTDHVUzt8ffgj47UHB2zHVB
	bRM3VVPnx/a4RqATXvYDCl+8f3kXCs9o6C3KQoXBFByxwqHY4dTtV/s1yZR0LdP4
	e2Tde42pSe2fP1OHilhFt0okEHwxxk6QnSuh88qsXQyxK7nmDlQaEA9Cul93uVxh
	VyiT5pIuZjpuZfMJc0K5uIf+04UvzcWRfXH067pWqGzuDpzmjTtLAzkGpIOJO6Dm
	77mMs91T9xslDw6ZSVraQqH7MqYfxY5EF9iMQ85452xc1VrrMU0C1DWdVXjP8EuT
	nkBw0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af4sb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so3925204a12.0
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529826; x=1785134626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOHSQiMKVR1IwBDP6bunGeFjzNHHpa4oZ3vKtcA1gOA=;
        b=K1J3/eccgE4t9Iz/Q7jOqBlHnjbLKCLUR/qQ6B/1QLijI5psC5JgnkDypGoI0+5SxM
         0GdYFVN1S3Mcw/F5mGqEBI7+lPdFnG8N07BU/+YKY6Mi2zpvw28AX/9ZbkPMw60fFE8W
         QQ782uJjJN/jbgqmEiP3r4NUpNIAyhsmpjgq94j2FyPyqZyqI0D0j8NqL2GdZW4aS6Gu
         qX/vVwgx2pF6+9rnXJllgaxoUqwge/U07Ny4s0Gztl5vEO9bCZr1YMleRQCLTSeRCSsy
         4yys5wDXnSbCvkHySC3JoDIRhbqYGbJzaNkO8LY9zBHW9mQ6A7XTgYbwjHoJHCcQnGxn
         ge6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529826; x=1785134626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOHSQiMKVR1IwBDP6bunGeFjzNHHpa4oZ3vKtcA1gOA=;
        b=Cnjnh1bELR1zb4PmQqeoEGUSj1W2lZbk6faP0tQull/7RXOa1KJ9W+M2XlILLa/lSr
         oD7MaHFUJueqyTKC/FzVJf5GUqj8HxN9xRaiswsqv10PQP3dr3edsBbpibvN2bv7o3gh
         HluvfUQYcrpUl58aTDkw5I7OeZCksIdVPL2f2sf8enPMH/IEGhV/9rOqlLlBnNcd4B4t
         HWrFmxCMc0pvEWFm/CYUo2nOtSBZHApVvYQi8dcPW1TAohdKaFk1ICcuxgQYXpeVUn0Q
         eAbRRHmbinUO2yIuofKApR/m8hcVuhKYnqtORECYSW07X4vjpH7GeKnuzWtwbau9QgeZ
         DNQA==
X-Forwarded-Encrypted: i=1; AHgh+RpyRHedbsq99wp9xbOtWHWp1dKCqrf3NhoElch+wuaEHifHqyu6t3rUHyGkGRbyicGhXRk5/ks=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTP+PHJ/z8zHW2khTBfLP4G37XW16HrZUhsbqXSOTLUfanOZ6H
	og7wtEasw5Qypj3EVnTjyBDUb97GmxkjFGAP+P49699GwbWALt+cFqs+MJeuIkrpkZWlA4izYi6
	UFemAqejkryE2A/pHTg6wk5nkY+H3s3uVIkDutGSg48Bbl9RBy2NG948ghfQ9aze3
X-Gm-Gg: AfdE7ckQ577pqcvOdU1XwJT0EdGkWXguFW+RdP6jENtjYNjUoohDQC77sOeJPBTgMyh
	7BYfrFhCjy5jsaTd/olQkd7l2ML1GVXPjwn9ZcepN/4GQl0EVfbjtZzWvfRHD3io8L3ntbOpI8I
	WHsExbRzyls+ZNJpJfNxizjlx55mtWLojoMPdSsJnywgIrGKFxI/hisYl/J5kEslIRvT6koAE6d
	Mxq2jdd+XuWs801JJV+G+6fuQpWRmMJ2+Z9ovu/ff7z3kwcTqVsq+p2pJZ+Y/2zucCxbg4qoxKh
	UKokMJ02k5XvZG4nsL8vXSsk7frwd71PECHdAJ5UoCPPm8yYH7lLx3g9vA/QrqAjw9Gb3bwwvOT
	gyaMr4OVPoIA6xenYiNubnbZ3cfBXGt+2Kbc9ff6OeSrhwzfppMyQhw==
X-Received: by 2002:a05:6a00:2394:b0:847:8bd0:1b96 with SMTP id d2e1a72fcca58-84c28aa6e58mr11631403b3a.23.1784529825651;
        Sun, 19 Jul 2026 23:43:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:2394:b0:847:8bd0:1b96 with SMTP id d2e1a72fcca58-84c28aa6e58mr11631382b3a.23.1784529825163;
        Sun, 19 Jul 2026 23:43:45 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:43 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:27 +0800
Subject: [PATCH ath-current v2 6/8] wifi: ath12k: do not advertise MLD peer
 ID for firmware-allocate devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-6-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX/TpMtm3ZLkwX
 oGX6s3/YEAxF1R0WJCJAeJVNAevjz9XrLYm781Ec1bKcLaW6s2GYQyqzNf0Z4wmuV02XTuBQmeq
 YDuWZxUvL6GYa5faGx4961PohSxpcqI=
X-Proofpoint-GUID: fQcGeSOmLw_c-PqTXp1_JdRghmSByoLJ
X-Proofpoint-ORIG-GUID: fQcGeSOmLw_c-PqTXp1_JdRghmSByoLJ
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5dc3a2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zO7lKvSgDLHZEP5-WbMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX7ttwX+C6xb8W
 4k++uTKeTeJ7fuC+3uvT5avNL8BStKC1kGbeXqG2/WBpn58EX9PzxXtgMCEHxiibS37Yy7wtGIO
 vJmiqaI2I/M6x9KWz1C5HFW/RMK6n/yo66ROpBwswnU59TdtKoN+304S2RezOjBqqh73M30qFcT
 hzH7nm5LZ5+Q+xUl76wwbEFTv+r8NXryTn/c2OXmKUVPAOij21sHbN3ac/zeHKGsBK7Wi3I5Yst
 Isb1Nr4RVQwpemNjwI3r4l0X5N7Y5pzbUvjPCO6QXBCwq3Et0Ar5K6p4eTWXNtB1nBR6IdYfFAT
 7ep7UwJGJR65L6s3WoFRKo9pX7rh8CXtM0gzarN87WjQ74hY8kdnx8B0zh4/NvrzUgh4b415g6d
 sauq3ckm6YGxr+Xh7KoyR3Nh0fcLnQSpj6tmYNYB2Ll3zGg25X9//aMH8n3CDuxjy4RwfHcGmep
 7D+x7QdtZqAPBGV1ZpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234347_857941_957C01C6 
X-CRM114-Status: GOOD (  18.52  )
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

ath12k_peer_assoc_h_mlo() unconditionally sets ml->peer_id_valid and copies
ahsta->ml_peer_id (with the ATH12K_PEER_ML_ID_VALID bookkeeping bit masked
off) into the WMI_PEER_ASSOC_CMDID ML params, which causes
ath12k_wmi_send_peer_assoc_cmd() to set ATH12K_WMI_FLAG_MLO_PEER_ID_VALID.
This needs to be gated on chips where the firmware allocates the MLD peer
ID:

  - WCN7850/QCC2072 firmware always picks the ID itself and does not honor
    a host-supplied one, so the value would be silently ignored anyway;
  - QCC2072 firmware additionally crashes during MLO disconnect when
    ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the preceding peer assoc,
    so the bit must not be sent at all.

Branch on ah->host_alloc_ml_id:

  - When true (QCN9274 etc.), behavior is unchanged: peer_id_valid is set
    and the raw ahsta->ml_peer_id (without the VALID bit) is sent down.
  - When false (WCN7850, QCC2072), peer_id_valid stays unset and
    ml_peer_id is sent as 0. The firmware ignores both fields and reports
    the ID it allocated through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP.

The early-return on ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID only
applies on the host-alloc path, since on the firmware-alloc path the value
is ATH12K_MLO_PEER_ID_PENDING here, not INVALID.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1ae21618afb6..485be2998180 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3529,11 +3529,16 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	struct ath12k_sta *ahsta = arsta->ahsta;
 	struct ath12k_link_sta *arsta_p;
 	struct ath12k_link_vif *arvif;
+	struct ath12k_hw *ah = arsta->arvif->ar->ah;
 	unsigned long links;
 	u8 link_id;
 	int i;
 
-	if (!sta->mlo || ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
+	if (!sta->mlo)
+		return;
+
+	if (ah->host_alloc_ml_id &&
+	    ahsta->ml_peer_id == ATH12K_MLO_PEER_ID_INVALID)
 		return;
 
 	ml->enabled = true;
@@ -3541,16 +3546,25 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 
 	/* For now considering the primary umac based on assoc link */
 	ml->primary_umac = arsta->is_assoc_link;
-	ml->peer_id_valid = true;
+	/*
+	 * Only chips that allocate the MLD peer ID on the host send a valid
+	 * ml_peer_id in WMI_PEER_ASSOC_CMDID. For chips where the firmware
+	 * picks the ID, leave peer_id_valid false to avoid unexpected issues.
+	 */
+	ml->peer_id_valid = ah->host_alloc_ml_id;
 	ml->logical_link_idx_valid = true;
 
 	ether_addr_copy(ml->mld_addr, sta->addr);
 	ml->logical_link_idx = arsta->link_idx;
 	/*
 	 * WMI_MLO_PEER_ASSOC_PARAMS expects the raw ML peer ID without
-	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit.
+	 * the host-side ATH12K_PEER_ML_ID_VALID bookkeeping bit. For chips
+	 * where the firmware allocates the ID, the field is unused (the
+	 * firmware always allocates regardless of the value here); send 0
+	 * to make that intent explicit.
 	 */
-	ml->ml_peer_id = ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID;
+	ml->ml_peer_id = ah->host_alloc_ml_id ?
+			 (ahsta->ml_peer_id & ~ATH12K_PEER_ML_ID_VALID) : 0;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
 	ml->eml_cap = sta->eml_cap;

-- 
2.25.1


