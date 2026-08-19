Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A761C5DF81
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 01:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mp4ZhMMjfijtoqQ1OmkqH9ytvM2yRZTPmG1EfzLALiY=; b=ml1xYkNeHud1F333QtsgCSQWk7
	nwbgwyU95dVGQaJmw2Trh8H0z4+GbFQkGKlHF85HEEF9Jafsp0T+n/Q0wkIVoP3hBhY3JpyVlJxVA
	/OwqNcUL+VMt8suw8w2VMQdG5LWbPGwuBgbUkAvVbmMMdguU7GHYCUqgvkyspsMY33IuUpGk3vXie
	/k4U4dMsrT64xoD98ZfqohjlWLxcmS7ZPvWqKvR5wMAMOAna1Utjwb9j9LqZk401lFjZoTvraDg/a
	HJlC1W6PBlHhUOWcpyRXHAyNS8KIvCv4fJ+mntA8W+GIQX9uyeXSG6tOBpLPMJHUId05VPtUEyqJ2
	+x/jxoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVL6-00000008qET-3Fxc;
	Wed, 19 Aug 2026 01:43:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwVL4-00000008qE7-1ITY
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 01:43:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67INkVrK2775448
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 01:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mp4ZhMMjfijtoqQ1OmkqH9
	ytvM2yRZTPmG1EfzLALiY=; b=AYyXJnzdZ62vf198FMuA7fBGXIxnpvQIOYLOkQ
	sUvq09s1608MsE84b1wDJQvNP33p2OHCjVZmL3p59qHRL+xcSAiQXuZQUeQp0Dp2
	SAO4AJ4DKLGmIojyWkn/w/lgFXjMV4J3Qk1pzEKA7LUfdNjK0dhVesDxNFCQ+JPV
	lBQNzRZziKLhzydOHXnLwh76KM2UEUeq4j+p/V3LiM/VlEhoI6TnLiUOaOk8BiPJ
	SdXnN++03Jd50oFQQnlgvxBsw3GaFg/3d0hDZDImFKE5gWE50IUcwauCzRqpUyks
	kdSBu21aYE9oXGHDuwpECErXwx6v5AXhiO41UieESX1Wu36A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftrs6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 01:43:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso716394a91.2
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 18:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787103812; x=1787708612; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mp4ZhMMjfijtoqQ1OmkqH9ytvM2yRZTPmG1EfzLALiY=;
        b=PumndVZ/v9lnhva+vkcuWpjdPDVuD1qOws9rQwsyz60T6zRobL2hqo8NjU+poG5Ap+
         HcWVDHb5rYwH/NPPcj8g7v1wzXaYkade9PHIQciQJ/h0w6K/Vx9YKIjwTmDda9BrxEac
         wxTeZu8q1f8USuAjYh713nzqTjtzGjfPFjRZ7YDl8t9kOp3p2MdLGtzfttZJ0+d/kHvx
         VGmvOOdjJyEcOZkfmTt0ltAGavx87BTL36CHhVHVc9UxtVEcOVEMYRY/4PckoUrpLulS
         MQBCoqw6tCvMkaItl9DZLIAPSk4W+LNI5dOtaj4njogc3UcwIUWD3Zu20HymQLWxy6KA
         vTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787103812; x=1787708612;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mp4ZhMMjfijtoqQ1OmkqH9ytvM2yRZTPmG1EfzLALiY=;
        b=SSByfTv887Mqmk1geWtGlTb9p+0Nq9iipnBtIv6eJ7EztKmCUBZIl0/LTw1Uk/rRCu
         na0+LdvW/TvdmJsrZCaxfQSoRLgdjIS1lPYROn9N/kgx8iU+qS7zdZzgDiJKvB96t4NO
         cXtl5IILzOg89ZvwS9NBqR2iUr1HYcGB3x6+RaBkqP+zwVXrn3sgvq0l8yfec5c06Rmh
         +QufoufDbP0CQf2qbtbtplXF/BgrvBEnuk64tUJfjhVIFQPJO79/y8bwgKaKYpg2QxMY
         uPG0Lbui2oxR6bdSVimxHjuQ0JsAwpThhdX99+3kjAVC4Upx4s7VVcg1n8Bky2f9A2EV
         kFzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6XsqpzbADjgzluLUrjuhSiBM4B57cSB/yRAAVwKGJAEGCKqVXf+q5/e7EFBU6hU5rri7sjIM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxfsLdybVwtHhwE9XsTPOzsvBauEmOh1FyAszu+gECJnFj0VkY
	b6S8znJBPKHfRIjMAxElZ+xrQHsQtUXEd3c5VESuHyy+dfvEC6YXD0OEhYh8w57d1FuJiUFoYsm
	9anXIwImZlBtViR+EeIJpPFbrIu1thWOc3bmjiFY3w5r7gy3l9OqxFPx1pJR7OyBAKPaUPDlC
X-Gm-Gg: AR+sD10RP1gz7l6XtMuVKpntuQT/8YSye58UZN8XvsOpcTpEXgG2Jyr2WYuLfK5fTv9
	w3AQEKhD7LJjEdFULBD/bZbLF8dmH+aPzmu26Blzv+kVyQQFkuMxGU3+84nGXOwS+kLlCUa30g3
	ZfOqfeUbUR4PE2HANZXAysFOoBONW2BD89J/cdnztD++RK5iev84NpPitsl2hoTtsAqb9r/nibw
	2+E5TXZV/thfp9H3I+k0lZS6MTW17s6HrNSe8AXIdmiEnufy14Qy8CK3anSKGvODeMgEP0CluAk
	/6lLhpMktNhZvAs/tzYkEDXzW9PoHMhzADHhvpNYKKaDrUkQJ5xw3kVP+hyyU8fDqhb6X+2BjVQ
	fzlcrouB0eEdUJqKC6/K3tD30EGON5YjiiyJS7b9rTdi3RHwCoLtCXw==
X-Received: by 2002:a17:90b:1dd0:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-39580f3bcffmr2074768a91.9.1787103812357;
        Tue, 18 Aug 2026 18:43:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd0:b0:395:4e0d:bc60 with SMTP id 98e67ed59e1d1-39580f3bcffmr2074708a91.9.1787103811898;
        Tue, 18 Aug 2026 18:43:31 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm780660a91.15.2026.08.18.18.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 18:43:31 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 09:43:16 +0800
Subject: [PATCH ath-next] wifi: ath12k: use kernel types instead of
 userspace stdint types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-ath12k-cleanup-userspace-types-v1-1-161a1e8910f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADMKhWoC/42NTQ6CMBSEr0Le2kdoq4iuvIdh0Z+HNGJbaSEQw
 t1tOIGbSSaTb74NIo2WItyLDUaabbTe5cJOBeheuhehNbkDr3hdNUygTD3jb9QDSTcFnDIfg9S
 EaQ0UUdBVCdUZw28G8kkYqbPLIXhCZtHRkqDNS29j8uN6mGd27P9KZoYMu0bUZBSpy7l++BjL7
 yQH7T+fMge0+77/AGU7tY7dAAAA
X-Change-ID: 20260813-ath12k-cleanup-userspace-types-3e7b3bfdd29d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a850a45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N7lZ1fd5K2eDO5c5ewYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAxMCBTYWx0ZWRfX3Vunfw3K2UA4
 XsXT86Vsg//hYUtPQcz2BqgiPfEI2O1Wy3LUyCic7I8Z4frUa9T0Z0zxJVWW83uEp13/dFZtLw7
 bBVPTUaKsnC5vkFt/7TQMpJf7YqQi0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAxMCBTYWx0ZWRfX4JrTORpxYBDB
 wsqz/b0WUA321BClQzby3fo5IliYSdvuLLnt8XHfIFRYiHQl2xkyaRMmFq7wA1VkyzmBtILtubK
 pr6XzzVS1TSfpzcg9dj1MrH/E75PYKcDX3DUt08CCddXVQkB5O1/XV8XS9np+6WBritjFsaY/OO
 X7aFqwUPmohqdQiT2Cma6KEH2ayeP9eGaI2Vlo7ORwrA3PEcXCLrnk8P6DdAVgTVchuBg1ZBvGm
 yb0wp9vpeK046KOVz+5oDoWEm53taNEYjnq5UMNmNTVCwWQxn1utVyo72ll7mDdNcNh9Ed8eofz
 ngWC5SZ8I+aAX2ygd7rXkRBsl1ptUQ8xq0FJHHRqO2u7L75QMYNdMLqUNa3pi+TrYo1W7GMeZCg
 zQDaul7sta846CPGufvmcjORcEZXzQQYe6uMCeMeaH//IyzFwcojYdm8agd8quZ4hlpd7etTiPL
 sNwIpj8r091eKrK6uOg==
X-Proofpoint-GUID: EWz9813oUm0xI5noLo-GdxoZAhRKehyu
X-Proofpoint-ORIG-GUID: EWz9813oUm0xI5noLo-GdxoZAhRKehyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_05,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_184334_468757_1A0753A0 
X-CRM114-Status: GOOD (  13.39  )
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

Replace the userspace stdint types uint64_t/uint8_t with the kernel
types u64/u8 to conform to the surrounding ath12k code, which uses the
kernel types everywhere else.

No functional changes, compile tested only.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.c           | 2 +-
 drivers/net/wireless/ath/ath12k/dp.c           | 2 +-
 drivers/net/wireless/ath/ath12k/mac.c          | 2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.c b/drivers/net/wireless/ath/ath12k/ce.c
index 67bbc6d8d0c9..c99e915e3885 100644
--- a/drivers/net/wireless/ath/ath12k/ce.c
+++ b/drivers/net/wireless/ath/ath12k/ce.c
@@ -269,7 +269,7 @@ static void ath12k_ce_srng_msi_ring_params_setup(struct ath12k_base *ab, u32 ce_
 	ath12k_hif_get_ce_msi_idx(ab, ce_id, &msi_data_idx);
 
 	ring_params->msi_addr = addr_lo;
-	ring_params->msi_addr |= (dma_addr_t)(((uint64_t)addr_hi) << 32);
+	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
 	ring_params->msi_data = (msi_data_idx % msi_data_count) + msi_data_start;
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
 }
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index fbc0788b37a0..ae4ba6948f96 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -224,7 +224,7 @@ static void ath12k_dp_srng_msi_setup(struct ath12k_base *ab,
 	ath12k_hif_get_msi_address(ab, &addr_lo, &addr_hi);
 
 	ring_params->msi_addr = addr_lo;
-	ring_params->msi_addr |= (dma_addr_t)(((uint64_t)addr_hi) << 32);
+	ring_params->msi_addr |= (dma_addr_t)(((u64)addr_hi) << 32);
 	ring_params->msi_data = (msi_group_number % msi_data_count)
 		+ msi_data_start;
 	ring_params->flags |= HAL_SRNG_FLAGS_MSI_INTR;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54056dd37409..75ecdb7648bb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3517,7 +3517,7 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 							   IEEE80211_EHT_MCS_NSS_RX));
 	}
 
-	max_nss = min(max_nss, (uint8_t)eht_nss);
+	max_nss = min(max_nss, (u8)eht_nss);
 
 	arg->peer_nss = min(link_sta->rx_nss, max_nss);
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
index eeabe9db776e..def540529872 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c
@@ -36,7 +36,7 @@ void ath12k_wifi7_hal_tx_cmd_desc_setup(struct ath12k_base *ab,
 	tcl_cmd->buf_addr_info.info0 =
 		le32_encode_bits(ti->paddr, BUFFER_ADDR_INFO0_ADDR);
 	tcl_cmd->buf_addr_info.info1 =
-		le32_encode_bits(((uint64_t)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT),
+		le32_encode_bits(((u64)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT),
 				 BUFFER_ADDR_INFO1_ADDR);
 	tcl_cmd->buf_addr_info.info1 |=
 		le32_encode_bits((ti->rbm_id), BUFFER_ADDR_INFO1_RET_BUF_MGR) |

---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260813-ath12k-cleanup-userspace-types-3e7b3bfdd29d

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


