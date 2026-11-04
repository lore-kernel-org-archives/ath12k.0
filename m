Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F68606A331
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OSKdjDL0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9jVdZha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GKcjAj5E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=; b=OSKdjDL0oRujtO
	hDQsoyLUhA+BducO+xUNrabcDKwp69MlgvkZ1Z2BDNcGZbCKgxZXU5pdTVeXuPqpvHzEXq3T7f1JE
	Ur4FQ/q03G94Jf4ydDVIcStHmbVL/7hpVRlyW5TVRVC7MDsibValzu8p4/9dRSSNA0kGsxKiTi2kr
	UC5eIQrz5C3wIkaUpOWAtJQxlycMHrm4pF3Fee5kSnfY9T6vdhiSTWeo5oNeTeCbnqFCYhrxCqg4u
	0CDQamEzacXKpjiq6+8YpNa5+/nTTgvC65L0AU1/DLd+tZOuAEwY2mB8rePxdAdtrPBwAvB2j7C72
	iKIKxDOZ6wp7mEuLhqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWw-0000000439X-1Mju;
	Wed, 04 Nov 2026 01:11:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWl-000000042wQ-1g0h
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:11:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RP6j230660
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=; b=F9jVdZha4RDxyMQK
	IdeCxPBeSuSI4TQFl7X2FMDZQVKA+r6vWEDNNXbvkXK8L517TmKJLi/iOdWIC5On
	Mf/WBquVtCUaf6H+MuArhEBEV5OdIZo/Adbmct1+hL9z3caRV3RpDnoDtcEyot4h
	ItB7vPQ++TgmJKldmPhTQTMi3UD3ZjBq8U3lM9DXxArnXeQ9odauEVx0ESvM9kxd
	uMEimuEm2EWRvhHUONmTrf1MayB+DWTl+QpJ6s3xoRel62asQrtHLkQOA+VRe8el
	kZTv9mJsw4H75ujjFz6ij4U7FGiySs5PKf4EzickHPh3F/4+crC8TvALLatquQ3q
	cIGFdQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypjdwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so584782eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754657; x=1794359457; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=;
        b=GKcjAj5EZfhQwJb6CdmTPGuHIm64XrGRF37mv/VJUaoAN8YGrIbjX2ES/JaSuQoAwU
         1wUgySnaKA0Q2iRs2iH3xcMVT5Hlfa1TBH0NESdWJP1sc58RkXhyxinRoPZ71fc/IIIT
         qWr6W3sgaVU8NHl2oBxw7zbljhBGYHrJz6v+LUX9dsIrSH6tRjqgvUFog3nXA6sb940b
         zs9N4b7ti42w68KvhKWozwRk3okS4wtT7b0rCRwyrX6JaIn8Wg2lQ4kWQjJ95iGzuTed
         Biye8VGg4zYyhEgh3CDdzMW8/GNPDk6S76ANxvMqF7gEZ/4S0Uq9SW/PT7ODflid+KdK
         W5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754657; x=1794359457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QDjf16KlN4Jc+gwC5yfBRZndY4SFSNVWAqyLtWUkj8=;
        b=s+pl0WhI9yxuDiss2H4yr5qNnUo4IGDoEoKZCX5TS1goZXepU/7CyMHE4zTm/ccqbs
         Vi9hAccDjKzjNUTJ0w8zV8IVZniMDDmgFsz4nxteTBrLGnaZ+39VSzH711cs9zzNxK71
         2qo2LchDkjTYuEjbMKXXnKyIxxqtWsEROi679Pge03363imPMZIrBoCigyWy8Kk4pI68
         5vrybx37uF+jubLjW2rJoH/30F6DVHRCfG21LME39ODhrtiLDlkuHwrDSLhbnQ/sQgod
         SyYcNA7gs/ccn/aJxqZ5059QZLUAeJSXkLUuTKmmE6Sk2rBoBK5jNkfGtUHmF6XsoeuP
         mkBg==
X-Forwarded-Encrypted: i=1; AKwUvByuH3ZCOJym1Iht7HGlleBNk6Dqy4zqMxQ+B21EMupXH/LHtVVA2DftjyNVehRaDe5hQPtMwnk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8TWxRj+qzds0VPsk1fpWZ0ys5p7Hf66VGm/hbpahIOl3aMM8TN
	iBS6FR1NljFbYzzVwIiPXJMJ6zTJ5fAIsa+rZahbNBzWQfUMlw+1NGc4YParYcbLv2w8QWiM/Gy
	chSCKEuJYb+Pdzxc7OaFNus9CmCiRzJO6crI07IQgsuhYMbHW9JloOU9iUPYWeLQMu9sgLsBy
X-Gm-Gg: AYBFou2IyQ18H/04ll9veA/TN6DGDEhzbUkrjoLv2I86glhRIZmkzd+ZcKgdQdmEYXd
	eRKVwgtS2T3u4SwI4FY9cpUN9Nd+aO2mTjx8YbCz1YNg6FES5LWT0VumYwxpW2YHGUJIuxd6wTY
	6wu+eqcVkVqZjEDCCe2uiR9+mzHx5wkQN0AGsENBtXDcFWc45mnMARnguW6/IK1XnR+/lt2EMdr
	6lW98f9vzBx0LY2hQe5cCz8NkeycZPSO5KiHJudb12Yj7kJ+Odxx9K1a0DaVVOhTfU77p/QglBW
	fM98qIj9+RpFKB5HkT0tJ68CtxWhvFG+32+ccRFkoPqP8YIXFreq01XFTOy51yXkY5odR3LLdlY
	FcbsHCCgRGy0i6MGfX0kMz9x2M3TQNAG+E0sMIh79O/l1zsbGbLSTTBqhGTjfDmkcy8QdylUSFk
	39ZOR+x8xQMwA3gouAWjtxePhdQaagaV/jsXbp
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr22485666eec.3.1793754657310;
        Tue, 03 Nov 2026 17:10:57 -0800 (PST)
X-Received: by 2002:a05:7301:e0cd:b0:35c:707b:acba with SMTP id 5a478bee46e88-36a4220406emr22485624eec.3.1793754656537;
        Tue, 03 Nov 2026 17:10:56 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:56 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:53 -0800
Subject: [PATCH ath-next v3 10/13] wifi: ath12k: ng: add REO qaddr cache
 clear support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-10-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX+0K8mVDmsEog
 UHZdNO0569364v9k8ykhjyyyM5bE5IP/NirDBVKQ8VbzAda+NQmSX3lQYJjhlR7l2EQey8CZV+0
 vwnSuHWJaOw/0TvLy3XBj0dZpFDcg4s=
X-Proofpoint-ORIG-GUID: zSctpR9kElyms4f32SK4w1xYzRtoCktX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX2izfVw7nnggW
 dyCHYpn0O1Fe4HZkAJklJanDlBFbkqqlGA9V/19EdFIBpqlMvzsc1kVH5jZsIUucxihasBHsQTP
 Us1B3BnVg26awjKHbXjO+VDBLsrDudVIPl9FVuEBLx9Qu4RolG969uDreWw0ar1cSfwCzcJn9CJ
 U5K+Bb3JVeIXMXWFdQctS5Euniu/2MACbFUA5lLpw8+KOoQcBmZI7xo0cgaFpSup26CRoFHTNg0
 0CgEIXMBtzxluZJsoVyrbu2j7eQOGfhfWtnIzzvFgZ1pfX32MH9bLp91OAxRi4khMbyjSvD3l9L
 +yTRpA5ppGZRFCVkof/bQK47OLkvlaNv7AbwDw1aY57TVX+7/ncX/ZECGaGj5ddbzVYmhPoMHwh
 ozQYUpB0MoAgggauHf4FS7TB0PeY7EOj9gXeDOc7hxJM/ndGi+76Yo2HIBJYo5YqslDK6G9lchW
 tZrnsKxkRe8lCy8NEow==
X-Proofpoint-GUID: zSctpR9kElyms4f32SK4w1xYzRtoCktX
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea8622 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BFncArQEFM-slyMzr-AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1011
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171059_570564_66160D6C 
X-CRM114-Status: GOOD (  12.64  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wi-Fi 8 RX TID setup updates the shared queue-address table. Once REO
queue LUT support is enabled, those updates must invalidate the hardware
qaddr cache or later lookups can use stale queue descriptors.

Register the Wi-Fi 8 cache-clear callback before qref updates are made
reachable so station add cannot call an unset HAL operation.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9625.c    |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c     | 23 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h     |  1 +
 3 files changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
index 6235668e23cd..bb2f114d97ab 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_qcn9625.c
@@ -421,6 +421,7 @@ const struct hal_ops hal_qcn9625_ops = {
 	.tx_configure_bank_register = ath12k_wifi8_hal_tx_configure_bank_register,
 	.tx_set_dscp_tid_map = ath12k_wifi8_hal_tx_set_dscp_tid_map,
 	.reo_hw_setup = ath12k_wifi8_hal_reo_hw_setup,
+	.reo_shared_qaddr_cache_clear = ath12k_wifi8_hal_reo_shared_qaddr_cache_clear,
 	.extract_rx_desc_data = ath12k_hal_extract_rx_desc_data_qcn9625,
 	.rx_desc_get_dot11_hdr = ath12k_hal_rx_desc_get_dot11_hdr_qcn9625,
 	.rx_h_is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9625,
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
index ad00c182c2bd..d636f6ab60ff 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c
@@ -907,6 +907,29 @@ void ath12k_wifi8_hal_reo_update_rx_reo_queue_status(struct ath12k_base *ab,
 	ath12k_wifi8_hal_reo_status_hdr_parse(desc, status);
 }
 
+void ath12k_wifi8_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab)
+{
+	struct ath12k_hal *hal = &ab->hal;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	u32 val;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (!ab->hw_params->reoq_lut_support)
+		return;
+
+	val = ath12k_hif_read32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+				HAL_REO1_QDESC_ADDR(hal));
+
+	val |= u32_encode_bits(1, HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY);
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(hal), val);
+
+	val &= ~HAL_REO_QDESC_ADDR_READ_CLEAR_QDESC_ARRAY;
+	ath12k_hif_write32(ab, HAL_SEQ_WCSS_UMAC_REO_REG +
+			   HAL_REO1_QDESC_ADDR(hal), val);
+}
+
 u32 ath12k_wifi8_hal_reo_qdesc_size(u32 ba_window_size, u8 tid)
 {
 	u32 num_ext_desc = ath12k_wifi8_hal_reo_num_ext_desc(ba_window_size);
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
index 94732f82f614..26a24731cb06 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h
@@ -129,6 +129,7 @@ int ath12k_wifi8_hal_reo_cmd_send_n(struct ath12k_base *ab,
 				    struct ath12k_reo_cmd_entry *entries,
 				    int n);
 void ath12k_wifi8_hal_reo_hw_setup(struct ath12k_base *ab);
+void ath12k_wifi8_hal_reo_shared_qaddr_cache_clear(struct ath12k_base *ab);
 void ath12k_wifi8_hal_reo_status_queue_stats(struct ath12k_base *ab,
 					     struct hal_tlv_64_hdr *tlv,
 					     struct hal_reo_status *status);

-- 
2.43.0


