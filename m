Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26C9C83F26
	for <ath12k@archiver.kernel.org>; Fri, 25 Jul 2025 08:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAgHmAd88JIFsSnckdXzib4pSs1e+bcnMAoyy6n7EJ4=; b=AUXZ6HA+ZHe8r8GNKlTch0zM0k
	9mAX2J4BtX/70ni5qU8iSbhZfqCOotI1jDwHmO8FDJVtO6xd46XGm/Uo7WQDFPvZxjbmvRKx5vL37
	BF+L1LbOhmxYngFp+hgyCoS2HWyzmLUxveyWUjanBKLcVaDUBa74QBGXSJFRN+YNur1FPwyExfZQt
	GiU++LSwrc7d9eqP9S4jbazTtYSlSU4zrddiPfR1v+tc11cVqc+/9Ejqkzk3tqAiDAwH4hW2Y1Hjl
	htlRhvC/h/abcZw4yVBI7hdG+3txQIU+NwEf689pbgQhPi9vKv/nbTzbCMrYQV3t8MVnMR1/U21bU
	x8D3fy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE33-00000009NlV-2euK;
	Fri, 25 Jul 2025 08:45:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE2q-00000009Ni8-3ppw
	for ath12k@lists.infradead.org;
	Fri, 25 Jul 2025 08:44:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLrcms004877
	for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 08:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hAgHmAd88JIFsSnckdXzib4pSs1e+bcnMAo
	yy6n7EJ4=; b=T0azgPHd72sYnYyMIcaDVQsM8obs9xYU9omRTCUefmOtfVxRuQq
	2xM0lKHyi1dY2YK4wpDN2jmDjh0qwO/u6f3QvfeCftAW/w41C259kYkpj6KKobi8
	hEoG0rMFrskq2osGp/Vw7ye3rvXZh+CCZXTlQ9MyKo7kwxQ/wVFtGgav42t79Sns
	0klORYJFjsyBZu1C4M7Qcj6oNLRunKScSFSUbF1cKHIR6I3CyCJuQN3w12JmYMAf
	GjL5qdpVE8vFQEA76uvIS5o/TIGUOUeZSoMIAIeNouA44UmtwYg/TsTScRGMQBcd
	UQGGMoZJ78auRspF1hAul/YUQK4Vx0xNELQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w539dr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 08:44:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748e6457567so2110180b3a.1
        for <ath12k@lists.infradead.org>; Fri, 25 Jul 2025 01:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753433085; x=1754037885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAgHmAd88JIFsSnckdXzib4pSs1e+bcnMAoyy6n7EJ4=;
        b=equzfoYje53KNibstKro8qg3NfDZzNRv62KrlISN6LljRY05hFQk0UXSoiZlOzR19t
         pXgGilaS5pEiiMSJmxBifvQ1q/MHfBCJJaanVcYltFX4v5F0jSidYTERlvoEQIt+lQ9X
         RKfSKNG0Xw+vPW7co/HFWpcPbFf8pRPwmI+aAprf1GPcOaMJTxdfejp/ydcBAWRVwapd
         1XpoKGEn9bV8yLZRNO+NAmHB/3znwTB7DkDHzROdOK+RCA+1inXvtZNS3H27BZ9CqDdy
         XTvhHhXbOjIxXT9cuFP9ad8pCcALzpW5XGgUdROONDy7Nfc1BUq6qF7F3R0UIfYYeqRS
         2WRQ==
X-Gm-Message-State: AOJu0Yx48K4fra1BaRKww9XAIFqv9uedGorLEBaAxNbquZ3KXblLEakM
	4saq1Si7+34qEFrnKBAbGAT5dcBXvPNmOAyWWjJnIHKFZlVruoT9gAwvL1MoRZhItKDRMbjOYY/
	CQriG+VR7t026wY3fGiyBMBAaUowjeZVCFvNlGGQPO/KmImygS4m8+Yjq2Rgg6WACua+U716s
X-Gm-Gg: ASbGnct/rxyinOg2deBWuuTFjmSovoUwXm8BiUI7j642zUnsjM1par+28c37XTzqRms
	fSLduBv7++wWv+lzM8N53BI84DQ62BE3of9+EPWtnWzwmDMYxqIfsy5+UuEKoGGZtrBpsKem2AO
	JOV86dVK6h2LD2Tr36yhGsAqU2OBJx7ejTWFrjQ92mBaq8mDH/Z/I3S1rbRqRuZXpJsIj2RhUqi
	vDnzyTXa6vx2gdY4ocndB0+07BrAawyRtSoEXmw31jo9QsThqbK58BZY/whOh15NuZDmQ2EV6bc
	nt6Wb+vs/LOyl83r0YMcTQXjeQg5oYd6FH4Ej2o4bhlQ9YrvSEs9HPBpAfQZ0+sz+HVGZg/C6nM
	ZADHIUHPcyR4DXKR2B3T9iH7IEBlDjuY45toeusVDYrYBiEwqmtphaThJeAdQHxZVkmJv/x9A
X-Received: by 2002:a05:6a20:939e:b0:238:351a:f95f with SMTP id adf61e73a8af0-23d6e3b8bbbmr2037086637.22.1753433084933;
        Fri, 25 Jul 2025 01:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJgDYw4QdC9rQdP92kriMFcU28GsTOcopZ13OIgOkWnTDFXnZHHuUzqCUmQfxcZSKSXIzx+A==
X-Received: by 2002:a05:6a20:939e:b0:238:351a:f95f with SMTP id adf61e73a8af0-23d6e3b8bbbmr2037049637.22.1753433084492;
        Fri, 25 Jul 2025 01:44:44 -0700 (PDT)
Received: from hu-tmariyap-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0625917sm3380834b3a.122.2025.07.25.01.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 01:44:44 -0700 (PDT)
From: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Fix NSS value update in ext_rx_stats
Date: Fri, 25 Jul 2025 14:14:26 +0530
Message-Id: <20250725084426.3989966-1-thiraviyam.mariyappan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=688343fe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=K37uNGIe9fc187cu1v0A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA3MyBTYWx0ZWRfX2UGuNjXydVnz
 JKnbHnr2MKYy+mvO/3XMdF5/URxulOT7JU7ngBB9y8L+YMSMyYWS9A47BYM9UHYJfMorD1NNL99
 3tkNzia/CS60VjUJHMauB5Ff0xQT696+zQAkAzXFwXKtXYwF9cVABM+9GHd59dPeruFORRWWbst
 G6ulN5HmWZZGfnBWXBgMmtrOhB8VMWQoMcN8JuDy7srZr0Ah4J8N/tvsN6dxbnFG0hwD3UC2Jsk
 1wBFTBhOFT14nJu0RK2oCKuWynnAMSf1u7KmRPJhYWfnCp4ZaaS0Eec6Tin9hWkgRndT/SWBv6z
 ZTGtnJTuyGOe/MNG9SzR0RP75EL9gMdJbljfq3PVxoTB319hG2IKhCE+gy8BGs2dfEbbQxZD3He
 6lihtnGWkajctA7pXmYdAq3j+DVVxBOt+rKB4wSCf1K7U/p0MKxR39++xJbt/ONUUebQkzFJ
X-Proofpoint-GUID: SYvu34AYzkj5wsRdXDCXbWV1--vpksoV
X-Proofpoint-ORIG-GUID: SYvu34AYzkj5wsRdXDCXbWV1--vpksoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_014449_073641_D1923CC1 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/net/wireless/ath/ath12k/dp_mon.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 8189e52ed007..4bf21286b95c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
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
@@ -233,7 +233,8 @@ ath12k_dp_mon_parse_he_sig_b2_ofdma(const struct hal_rx_he_sig_b2_ofdma_info *of
 	value = value << HE_STA_ID_SHIFT;
 	ppdu_info->he_data4 |= value;
 
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS);
+	ppdu_info->nss = u32_get_bits(info0,
+				      HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS) + 1;
 	ppdu_info->beamformed = u32_get_bits(info0,
 					     HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF);
 }
@@ -261,7 +262,7 @@ ath12k_dp_mon_parse_he_sig_b2_mu(const struct hal_rx_he_sig_b2_mu_info *he_sig_b
 	value = value << HE_STA_ID_SHIFT;
 	ppdu_info->he_data4 |= value;
 
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS);
+	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS) + 1;
 }
 
 static void
@@ -553,7 +554,7 @@ static void ath12k_dp_mon_parse_he_sig_su(const struct hal_rx_he_sig_a_su_info *
 	ppdu_info->is_stbc = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC);
 	ppdu_info->beamformed = u32_get_bits(info1, HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF);
 	dcm = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM);
-	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS);
+	ppdu_info->nss = u32_get_bits(info0, HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS) + 1;
 	ppdu_info->dcm = dcm;
 }
 
@@ -2155,7 +2156,7 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 
 	rxs->flag |= RX_FLAG_MACTIME_START;
 	rxs->signal = ppduinfo->rssi_comb + noise_floor;
-	rxs->nss = ppduinfo->nss + 1;
+	rxs->nss = ppduinfo->nss;
 
 	if (ppduinfo->userstats[ppduinfo->userid].ampdu_present) {
 		rxs->flag |= RX_FLAG_AMPDU_DETAILS;

base-commit: d29591d5b52eaa62bc8c07ec83fe63018b5546ea
-- 
2.34.1


