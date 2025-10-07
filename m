Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28FBCCA470
	for <ath12k@archiver.kernel.org>; Tue,  7 Oct 2025 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=niQkkf7HgMoKKp1+WrllKQhIsL/j0I6kBdevJ4pk0+0=; b=12OLA6zC/2ScN5ajokRPAJJFIr
	QQhKIb2zOpRTQHyMMjrA0bDlRjHDd7YkaxzLbxL3BHK4Krc3Gj1qS9ngHDZnYe0luueEHA5BJVQ5z
	iA+d/27JAcEra2MBPGdTpuww3O5dWhXMdnYQpAX9AKUCcUyp6OBtGF3C+r5gBQp1f+OcoOeSpzChv
	KiqmN47wooKrUqpTHUkOW4zePotOHyThi8qLcRwG33sO6jJjzCvYOu3IZzWVIuqUbFN0VyYMKES7O
	oygQFbGCvehq0AcciV1ot1Qjq0sFJdaJetj0/SfZ9JyzjT1jq72IoXUugdqH67rw9TP+9TztCXUfE
	SvPdyUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67pB-000000024s7-2sW6;
	Tue, 07 Oct 2025 13:33:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67p9-000000024rk-1qqn
	for ath12k@lists.infradead.org;
	Tue, 07 Oct 2025 13:33:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597BsbUi013641
	for <ath12k@lists.infradead.org>; Tue, 7 Oct 2025 13:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=niQkkf7HgMoKKp1+WrllKQhIsL/j0I6kBde
	vJ4pk0+0=; b=OzPpIme1cZ63RNgrtIFfXjqFbkpj4kHKFgDxnPaqzltQaQ+SDYP
	6zcOqoWsl6llsezhUrBlyHgROA/HtC06z94cNZ7GZ8X/eQtDjkZL+NPVdqQYVNNL
	I+YalawD/1+nAqR2GTKg+pJ7MXqr5iJhdD/Fyj+LeTxZoJEUrtitUW4GSJONfxcw
	CQj0l4IigRwkgU4o/a6kiIHRw0XdoOeXhJJbXAWCj9oiFA7bWcjT5XjAmTwxz1JG
	W4yVOGD7Qsk+II2NZaergOiakSimO9OwAWHm+WYV6m/0ax0mnxTeyx5zoh7givSC
	FTy7y8NxoiCgpOyZ0pImMj7+GUxUU7ceXWQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu7b99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Oct 2025 13:33:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so4778411b3a.2
        for <ath12k@lists.infradead.org>; Tue, 07 Oct 2025 06:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844029; x=1760448829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niQkkf7HgMoKKp1+WrllKQhIsL/j0I6kBdevJ4pk0+0=;
        b=oJPX+67IJqzEe0u3Dyh3u1FOx6Gw8+KG3SOnDX4DiVpvu+fyN8E8Tg5OqZFdohHglJ
         7sbljOg5AhKJOAEcyc35/3DBhDzQKh8G51v/DYMwFMQPsC0Gx/AGJvUDOd6HKMVhTiwL
         hern/f1iBkqiepeZS2A94yu5fsFktva8IGfP75484kbbEKJbRaXAT34ZElJOabz0qmlK
         uF3FS9Kdp1DD4PZh11elS84OBSjm7bvtUw+gYMmuYUaN5J9yU6oL64WeeZ3fW0feBDyS
         w/KicTDzt6/ckg5Y+AEVPygeD4dljVKGMllbMORXbzPJyWrr1mtLP29/cLAkU3xG0Of0
         ZvBQ==
X-Gm-Message-State: AOJu0YzitVpO8ofayZ4m61Ioxohxqr5eZnmmICBt48e1Gs1V+f+ylJPI
	BS20IshB7Y9lcOfyEkc1wO/mHeP6k8P7ZhSjilttH1rgGyddfnTLv3sV/W2wyLHSpjJTnpbtUyV
	Sib/3oueHLi6kP1Pbn+zuA8/n/7Zv0uoL4IkoAKOUSMOZhBdjcpBqH/R/v68J4gH94JBpkT8Q
X-Gm-Gg: ASbGnctludqiMPYf36ySK0DE9BycTI/cR6XcYmCeNMxSB0z/AAKRrQvnphJb4k/D2lc
	2OxoK8eUSfSzvU13fydnWy9m3bJ9JIAbpNBkNKuT7jZo4Y/aQM3lidt4dbJ1K21zDQdgTcr88Qo
	O0IOjt36XMEY2/QI8uSEIW/YMSmUqvcUGwtUyV0qsQqPW1wXS7cdqZ93YJMmNOwepZC9Q3fYqX7
	bvoavDu+9oRygZOsVlZYYm1v3TGn7NZHg3PrWLsQWcH1M/PXNyPWCxtWdeRnr7pbw2k1GO7Pgjs
	Y+qD79r5e+rYRlAjq5dracuqcHv+9N6ByIe5hRso4kziNPx8T9hhqd85eVah8IMidt2d7vvee2g
	YYEG8FWtF69UcpYxvUFvpNB0hiVSBY/yjn8ZtB3EQKve7UVSUSbbjntXY7ZUSAq99fqSQZ6yqw8
	qnFQ==
X-Received: by 2002:a05:6a20:7fa5:b0:2fa:516e:26b5 with SMTP id adf61e73a8af0-32b61e58364mr20907839637.20.1759844028790;
        Tue, 07 Oct 2025 06:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd4uOTYbCCqX64dZuLBwCZIQP8tE0wWh9u3cKOdDbFxUzaBtFKggP1sH/FQpelDTRU5YYxFA==
X-Received: by 2002:a05:6a20:7fa5:b0:2fa:516e:26b5 with SMTP id adf61e73a8af0-32b61e58364mr20907804637.20.1759844028298;
        Tue, 07 Oct 2025 06:33:48 -0700 (PDT)
Received: from hu-tmariyap-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b81760e58sm14045353b3a.24.2025.10.07.06.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:33:47 -0700 (PDT)
From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Fix NSS value update in ext_rx_stats
Date: Tue,  7 Oct 2025 19:03:32 +0530
Message-Id: <20251007133332.1092178-1-thiraviyam.mariyappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1AvYQkqhbNu2pZGxfuOq1jwROxPCVPne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX9pd8cQ6/vtJv
 GaLazJp937XEhW/GMCaQz1omdYH8SQePVbTYajjF3Mwwzc30EUOPlmH/s9zJFw3+8SYpYZYSU9M
 lML4Fuz9K+JO1GT9SfC9QsA5WmRbTCE5Wuao7o27l+dOGrEpA4lslJU2Yojvc1u7HLhbfvsfPG+
 EGwdf5e4FnGyZtBzB3ugKY6ko/yJCz8b+QPMjSF9Rrw9vqp7x7JjlfemIIOLj67IWv9UE5caC5T
 iFkaC+ajIwceV+1ZYXIMRxTOKB5d7vGqcc7+ZFVzYslTSLMP38BsKQ9WT9S/PTGK+ww4Cz3v4ZQ
 3UKYySO7NbYlzh0I1D0XmKCoMoE+VvmHaMxomF9GayHMN1IGdRDl9jWv+Pg2cKbOEflt0MyMy8z
 VUOd7sT7fgIOmQKwPc+q79wX2Izwrg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e516be cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=WCOCDAP-shxDn94hZWYA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 1AvYQkqhbNu2pZGxfuOq1jwROxPCVPne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_063351_598289_956D708D 
X-CRM114-Status: GOOD (  16.19  )
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

Currently, in ext_rx_stats, the NSS value is taken directly from
the firmware, which results in incorrect mapping:
        4x4, 3x3, 2x2, 1x1 SS are incorrectly updated as 3x3, 2x2,
1x1, 0x0 SS respectively.

Fix the issue by incrementing the NSS value by 1 while updating
the PPDU info to ensure accurate spatial stream statistics.

Remove the redundant +1 increment in the radiotap header when monitor
mode is enabled to prevent double counting.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
---
Changes in v2:
 - Rebased and changed copyright to QTI.
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 009c49502148..39d1967584db 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "dp_mon.h"
@@ -105,7 +105,7 @@ static void ath12k_dp_mon_parse_vht_sig_a(const struct hal_rx_vht_sig_a_info *vh
 	if (ppdu_info->is_stbc && nsts > 0)
 		nsts = ((nsts + 1) >> 1) - 1;
 
-	ppdu_info->nss = u32_get_bits(nsts, VHT_SIG_SU_NSS_MASK);
+	ppdu_info->nss = u32_get_bits(nsts, VHT_SIG_SU_NSS_MASK) + 1;
 	ppdu_info->bw = u32_get_bits(info0, HAL_RX_VHT_SIG_A_INFO_INFO0_BW);
 	ppdu_info->beamformed = u32_get_bits(info1,
 					     HAL_RX_VHT_SIG_A_INFO_INFO1_BEAMFORMED);
@@ -129,7 +129,7 @@ static void ath12k_dp_mon_parse_ht_sig(const struct hal_rx_ht_sig_info *ht_sig,
 	ppdu_info->is_stbc = u32_get_bits(info1, HAL_RX_HT_SIG_INFO_INFO1_STBC);
 	ppdu_info->ldpc = u32_get_bits(info1, HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING);
 	ppdu_info->gi = u32_get_bits(info1, HAL_RX_HT_SIG_INFO_INFO1_GI);
-	ppdu_info->nss = (ppdu_info->mcs >> 3);
+	ppdu_info->nss = (ppdu_info->mcs >> 3) + 1;
 }
 
 static void ath12k_dp_mon_parse_l_sig_b(const struct hal_rx_lsig_b_info *lsigb,
@@ -233,7 +233,9 @@ ath12k_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *of
 	value = value << HE_STA_ID_SHIFT;
 	ppdu_info->he_data4 |= value;
 
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS);
+	ppdu_info->nss =
+		u32_get_bits(info0,
+			     HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS) + 1;
 	ppdu_info->beamformed = u32_get_bits(info0,
 					     HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF);
 }
@@ -261,7 +263,9 @@ ath12k_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b
 	value = value << HE_STA_ID_SHIFT;
 	ppdu_info->he_data4 |= value;
 
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS);
+	ppdu_info->nss =
+		u32_get_bits(info0,
+			     HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS) + 1;
 }
 
 static void
@@ -553,7 +557,8 @@ static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *
 	ppdu_info->is_stbc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
 	ppdu_info->beamformed = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
 	dcm = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
+	ppdu_info->nss = u32_get_bits(info0,
+				      HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS) + 1;
 	ppdu_info->dcm = dcm;
 }
 
@@ -2179,7 +2184,7 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 	spin_unlock_bh(&ar->data_lock);
 
 	rxs->flag |= RX_FLAG_MACTIME_START;
-	rxs->nss = ppduinfo->nss + 1;
+	rxs->nss = ppduinfo->nss;
 	if (test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
 		     ar->ab->wmi_ab.svc_map))
 		rxs->signal = ppduinfo->rssi_comb;

base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783
-- 
2.34.1


