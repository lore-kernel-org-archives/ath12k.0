Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE629C4451C
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 11:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrmPyelbu4twgnEe/79SbA2Xgw5GVHqyb1VHCIYacxo=; b=EZIUtghmKOoe2jESI7y0qC0gOs
	d2HdzR66MqF5YxoTHV3PuWCvSri20xBaHTbmO+El65E96ulSDKNdi9m6+gozbND+qzxSZyubKM9lW
	dyySRelJH0BzJdvvAdj3Jx73oxP3k2Xqjy7h69MDTiWLQNrzVnjk7469QlhXEK6JY8yCcs9ew5JF6
	6Yka1nd0tXVSPquHzm7jNzLhguhdIATi1kr2LdTUVItM+spFeBYVr/6Z5DOYQtDAYVBF80ZrGfDGI
	3BKrcVcgDhuqrUQQPwC8BzRD3WrU7YX1MiPkEhN0d+1rHbu88FlRXsoBBVCWLMcqdUbI/r0uY9Wx8
	e1twtcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8He-00000009HBM-20UR;
	Tue, 21 Jul 2026 11:05:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Hc-00000009HAn-1PKf
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 11:05:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARPbm1482233
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 11:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OrmPyelbu4twgnEe/79SbA2Xgw5GVHqyb1V
	HCIYacxo=; b=awukk4i0QndzOY1MRK9KGcPqWUqvsNkPLRECHcU+JraWgx/9xDn
	dfYBpaTUI97nKyPkcsNGk9e5Ga9SHF2dbtQNMaOx8ai/m1FuAMlVkBOxxTBXY+Jt
	AQRxAjonh9Le63XmqeTmAeTs7I53/gOhGF1bd0/Q1m8i3CauU1wGIvtkCwm4AZPd
	5CvMBA63FocfLaCYI8bvS1R0YK+hcAI/hCTSyqByrnaJlswX7nn97SA0XDGwTM8z
	1xVNaus4CuRH9jCs5bUWrhZGeyFJBmFM47f8e7QhJ/kAveWtVQR2uq7zqkaHyBWJ
	wnfasEIT2es0SGtqOVEsPkrq+QAfC61hOvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnavrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 11:05:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so11719187b3a.3
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 04:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784631906; x=1785236706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OrmPyelbu4twgnEe/79SbA2Xgw5GVHqyb1VHCIYacxo=;
        b=VWP3TjxmjTetwj13/cryDwXo8W7yJTXdgywc36W04OH5533B/wdkE1nSfUK1RJwN7/
         GIgaj7VdGQlIOuqk1reKDjPBRyLUmNOqwlTyrH12qI8SaNeF2F6K0nLy4irV+gYQSkAX
         glGlmMjob/LgxGdax2Az+em8hAvjJm7iPm6Ue4L6mGfnDEjbBwEQWokxLViMb2g1mYY6
         aj/5u7Xu1ypBBs5vptkR1K6mVqcT8fpt4dG3roRP+Oy7Ta/VkgUdZcGLsEKDbsj0+Yaj
         JZmrf1Xht5Ebvu/PhKtCQBhStkhq2JVj+zUtNCxW51FGO2pt5virmUj1soNn8KW8jNb8
         yOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631906; x=1785236706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrmPyelbu4twgnEe/79SbA2Xgw5GVHqyb1VHCIYacxo=;
        b=nFhMzI0ZgtDgbNAQze+FLi1vqk8suQnGg74TrspwRaTmWtvMIkXlpA1G4KZr8NdDiv
         VLAGhz42yBZz5TGps8/SJQLyCchz/jweRl+v3U9MQdsk1e2Q8qB9QxgNpSj1c4z3wIVm
         894rnLaAtM06KAzbn6N2EKVOLFbJop46EEWj5wUo4ur/m+JyzzSM9CfS+/wMNc7VbCse
         a8q90kCLdoKGKFbD85gdX+a0urlQqoZ7arEm9+Pqt3QDFGgUO/NXn0VW8MNayFR2Z8+z
         5aVj20yfpgA1VzlkdceWnCIBHbBKuMcmh7fDKIlNPjqhYiEuCh8omexJkbdb+pLFsAyQ
         aIeQ==
X-Gm-Message-State: AOJu0YzEdsqlspMeT0pln3qRn18kSn1wmqGzhC14bJID3LvTeBuFHWfV
	9c4ZG6g4BnVeaeHzKI6r+ffTVYlijFnosc43XCHxnVIr768j82slZyQbBCEaEpzOtTNKqr++T5z
	ZagSrvzzV4sYaqBeY+657GSpSKMXvWe0V0r0Z+y4XiRC5FqMPdbJJb5Jj+tcyB+8CMeL+xkV2
X-Gm-Gg: AfdE7ckE10fqh9G7iWGKuc24HwBNWZbUEVBPjyMJIjR1+F448x47tPbSnCgzNeTxrDJ
	e93KJkkLyJn8/XyYksUJkR43fUOpoqguZDsNKDgxj4nc9gwrXWp+nalCAYw3Etzry3CR6Nbu/Kg
	ZhphihyRKWH3gQ4Xi05c1e/I9I/lpN8tGjsV6P7D0HaA13lZjEiIPXBoN+HZyTRNDQujugladdm
	K2GCQrTweAoOuPwTG20wiq7NW6USypuRso5Egndb0V4Yca/OVtvfPhmgwn92sQyGsezo2KDul35
	9vNZhrzofTDifPBW9iwD6e0Z11Gf1sZR2QTbHDP2avUC6HKZviDoLx45yNuQc6VXuaP8FRSCuLv
	52fn57KlZM6stZ/kcBEx3vm7ZiNe+l2VuNLWgxUx7gJhEVaOE1O+n//KilaIo2GV7l6MTbC1lwJ
	7+5W9tA5SK/CpKxAI8y4Zc2s/9gQMLdZDv
X-Received: by 2002:a05:6a20:158d:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c3ad6777e5mr18827053637.10.1784631905993;
        Tue, 21 Jul 2026 04:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:158d:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3c3ad6777e5mr18827016637.10.1784631905369;
        Tue, 21 Jul 2026 04:05:05 -0700 (PDT)
Received: from hu-pnandesh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm53595591eec.6.2026.07.21.04.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:05:04 -0700 (PDT)
From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Use different RX release ring sizes as per memory profiles
Date: Tue, 21 Jul 2026 16:34:59 +0530
Message-Id: <20260721110459.2203038-1-pavankumar.nandeshwar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExNyBTYWx0ZWRfX0b2MlVXdTeL7
 9FQXsxMM2ockL5y5j2zF+JyrJmMBCGN/tiasE5JofAEj1/sZKCVXEhy8i2eX3WpX+zfaV+VL6f9
 ejIPswOjNH7enH94o+01coVw9ujpB8XZln2k1OaHPZacmeFGtne+KcjhZxpve2Q1C8JxDM5GLxK
 XlAY3aX69t9w99sMLwhjIOWhc2EUiehnUwbO4jStJbEzbLPueqVYWrvdFmDqOJaN4I3ij6VeWAq
 2jPk8UOz2Pi6myNi2sAM+UNR9uNlm0phHwvso8vI8Rc81XEW/3YB5WbVoko0UtH1/O5Bgm/AvFf
 yJbQMrnyCk7ZhMk7drVxVpghbf1dIGIZDkltTkpu5a8U3UEYTw7vSLt2KPQl0IKA6BMCejia2QZ
 efPuoaEIemzFewKEa3K5ABXX3cGlCgTmfaiqLJTMlkLx0SrVskgG45P2w43zxJB6YI9ufYxj6Wg
 6qHr9ECqKCzycYMK3/w==
X-Proofpoint-ORIG-GUID: YgKplc85-LmnTQ8_uB1MFbo5IKaOW9om
X-Proofpoint-GUID: YgKplc85-LmnTQ8_uB1MFbo5IKaOW9om
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f5262 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=F2ceSjyJtutaWC8X_kUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExNyBTYWx0ZWRfX5aO3rT5zUie2
 QLWrywC+XjzwQcXckFwkJrTxfjMSHVPXd9wUDU+vXSbLbPYddAMbBq0MFVao1eqZZiF85Q/vk4v
 i77M9j4ziy2b8hGwfM82DfLqcKtcWi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_040508_381548_20CEEBDD 
X-CRM114-Status: GOOD (  17.10  )
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

Currently, the RX release ring size is hardcoded to 1024 entries via
DP_RX_RELEASE_RING_SIZE. This value was sufficient for older generations,
but is not adequate for Wi-Fi 7 scenarios with higher aggregation,
parallel processing, and increased likelihood of error bursts.

In Wi-Fi 7, a PPDU can carry up to 1024 MPDUs and each MPDU may contain
multiple MSDUs. In error scenarios such as REO out-of-order (OOR) events,
a large number of MSDUs can be pushed to the RX release ring in a short
duration. With multiple PPDUs being processed in parallel (e.g. multi-core
or MLO scenarios), this can lead to significant bursts of descriptors.

Field observations have shown frequent OOR conditions and back-pressure
issues with smaller ring sizes. Increasing the RX release ring size helps
absorb these bursts and avoids back-pressure in the RXDMA/REO pipeline.
Without sufficient ring capacity (e.g. 16K), back-pressure was observed
under stress conditions.

To address this, make the RX release ring size configurable per memory
profile by adding rx_release_ring_size to ath12k_dp_profile_params:

- Default memory profile: 16384 entries
- Low memory profile (512M): 8192 entries

The larger size in the default profile improves robustness under high
traffic and error conditions by reducing the probability of ring overflow
and pipeline stalls. The reduced size in the low memory profile balances
memory usage while still providing sufficient headroom compared to the
previous fixed value.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 drivers/net/wireless/ath/ath12k/dp.c   | 2 +-
 drivers/net/wireless/ath/ath12k/dp.h   | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index a9112760185f..6a361f63f145 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -52,6 +52,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.rxdma_monitor_dst_ring_size = 8192,
 			.num_pool_tx_desc = 32768,
 			.rx_desc_count = 12288,
+			.rx_release_ring_size = 16384,
 		},
 	},
 [ATH12K_QMI_MEMORY_MODE_LOW_512_M] = {
@@ -65,6 +66,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
 			.rxdma_monitor_dst_ring_size = 512,
 			.num_pool_tx_desc = 16384,
 			.rx_desc_count = 6144,
+			.rx_release_ring_size = 8192,
 		},
 	},
 };
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index f9fb1399e0b6..1ee8393255c3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -935,6 +935,7 @@ struct ath12k_dp_profile_params {
 	u32 rxdma_monitor_dst_ring_size;
 	u32 num_pool_tx_desc;
 	u32 rx_desc_count;
+	u32 rx_release_ring_size;
 };
 
 struct ath12k_mem_profile_based_param {
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index fbc0788b37a0..f9b37d75956d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -487,7 +487,7 @@ static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 
 	ret = ath12k_dp_srng_setup(ab, &dp->rx_rel_ring, HAL_WBM2SW_RELEASE,
 				   HAL_WBM2SW_REL_ERR_RING_NUM, 0,
-				   DP_RX_RELEASE_RING_SIZE);
+				   DP_RX_RELEASE_RING_SIZE(ab));
 	if (ret) {
 		ath12k_warn(ab, "failed to set up rx_rel ring :%d\n", ret);
 		goto err;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index a94bbc337df4..bef0f2ba0560 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -200,7 +200,8 @@ struct ath12k_pdev_dp {
 #define DP_REO_DST_RING_MAX		8
 #define DP_REO_DST_RING_SIZE		2048
 #define DP_REO_REINJECT_RING_SIZE	32
-#define DP_RX_RELEASE_RING_SIZE		1024
+#define DP_RX_RELEASE_RING_SIZE(ab) \
+	((ab)->profile_param->dp_params.rx_release_ring_size)
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048

base-commit: 612701854b588759c0df3094197d415869ada159
-- 
2.34.1


