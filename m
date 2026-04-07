Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65ACFB5190
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM1GMM51Iu7/nwLIogGClI6hwQIaOlrbCMte0LgS4Qw=; b=rsEb/oBjII3MoFrPFsB/7V87/g
	TIkGxkcL5TbZGQnJrrc9yjHyNCHYJ+cRBxmY0huR66YcXY8iEMLkj1ZRQo4w6tj8KG5j63lL+REvw
	fRBepB06YdIdbmctLdWH6YIW9nalk5IvV3n+7UoKt009CO0MyxuUeUUneslhHz9GNNOjGBbYDL12f
	IBTlFc0pc+dUMeDl95XJVDvPgqoxVyeIYK0hKwKi69IMHDLeQpknyoiUDeHGRdyzHeV/gwkS3qdD0
	mDF8ADRj63PAOgmb83MY/YfngUjCN3YazvTUBN1KnUaHReG2Sx5atFSR6q3GZZxao1GLBGmMhMP6R
	jnlbUrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxc-00000005urY-2KCf;
	Tue, 07 Apr 2026 05:26:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxZ-00000005uqi-2igd
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:26:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQrYF3402637
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lM1GMM51Iu7/nwLIogGClI6hwQIaOlrbCMte0LgS4Qw=; b=YhvDUgz6R0unB1cN
	O0/BelCtQ17OfARXy21byqG3l2pb9B2//t7Qa5OhINjOB7Mi/Kp0eTP+f90zWGit
	4tB0T+K15OhfFLQJV60Kg6NM5M89LXW8S7CF7rDLMGrubgMxNSgXxCznDb9Uo/A8
	W5dTx7BGgVmOx5oxMwt063kWpNUICcSH1IGrKlB42n6+qxrZFGlRpzljxYlvkH9/
	O899Eu/64VQZ7Qc0AdG01lm9dgfjOtfXO5EX7LjqfG33eklJSTvenaIja6EMuvyV
	0oCgc6lD+mwIv4OUrILFXui5AFdQEVQKw9yDFYLErYeIwloAcHuhTmKLTAXnAqB/
	/GSTLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhs5ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso7912637a12.2
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539604; x=1776144404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM1GMM51Iu7/nwLIogGClI6hwQIaOlrbCMte0LgS4Qw=;
        b=Gk81DzJriP23/LWAUm83G/Sch9TdXwUa+rJCd1xpQImsRpMk8XSXiWK+mh+lff5Cc7
         p3zPxiX1/3g+/oa2mlFlxeoFpMcQoSUX7u04lHF5/fvIG7NFmQxHowLb8rjmaE+xAygK
         WJURIr3yUpTEPWH8ezldPNlrhlACRl5LYCE7siVXs3qGoUKKFcWzFahm9CUlq4s1iZe4
         Z9VZLlyfuhTYuouBtnoectzj9qfOLkuMa/rUhmOMBdr86XXWjz0aGJbHKT7lOxKqk0ED
         ulU+nn1GuSURZvop9b/kYtJLSIonzzs1sELDDqNyLzjsn2trW4WDdw6ZBLgRbzmGI0+k
         C9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539604; x=1776144404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lM1GMM51Iu7/nwLIogGClI6hwQIaOlrbCMte0LgS4Qw=;
        b=h1Ws7hZhz3AIkMMtxsBd54eoNopHhjNaIa/ZMg1wGeWK1eaGx/LyDZhr+ks+WEthpO
         eaq3lLeQ7WUkoOR5pwAwbn08jUmEUML/A71rvyATw9JtiGawnOrf7ev1rxC10jkpoAfZ
         dctqmdi/l3nyd4Wcnd4+fPLFsofQrAfx3hNid0DBs1hYZZoE8rda+F/uXm4K/0d1q1ZD
         ky6fZziXpmj1U+M+emdxBMBB/ttaXM6A+2HgX7FX6esC9q9KdrooxKKVbjzq6TuNS+30
         +yQU1TcgO73Psqbg8ThAo+4dxyrro5G3AeNxMfz3ggltlrc4YMRBe33F6t0+4rj57c2O
         vR7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGns/2QRml0hKBdYy2TmgJQGkYuYOiOonfA+MlwTzt0mDXpwaA3qRSSrRAeQYWpuf/qE78HLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4phWUg2YuCbFE5thj9cFGXz2pYPA1ClO0fmhAqn6F3kF4TNPj
	gM9ucLcAgF9jtfxwx2+J+Ma/LlVjVyv/pd80Fm29dqCbT8qNNE/CBd1z7NQ2xIBMEwGCauLn9BA
	KUZ/vA4qwIC6795vzzyJelijA4JJpQhkdijCgNVNhzhloHqqnwAnJ4eIMIAiJmVr6
X-Gm-Gg: AeBDiev6WYDeZsELvN6md6n/lmhzZ4y0FPvUFHO/VigyxKEKu1IEnrYX+tGuAQBZzSw
	PUkBkGUFhJmXttQQHULP0WOvMF184liWc4XBGe0jiU/coK6LJ4LmLSM0b2WvokLYBw9cPiiLF+7
	tE4Nm7vpX+gaS1L0KeexPjjU8f4puOhxop94wAFh6oQY8b46LDXaSi0M0gofMjCrC0VPzy835S7
	Zvq8ca0lJI25mQtZfdCMUUH41IUrLsA9+PFVHLyPC4+8oMvGZ1hTuXJpy8HNc8f4zXOUQn0K4lS
	7sgBZ/xT4a5qH2m2EK/Lnydy3aKfY167QFEDvOGeVD0RE967LJcMHMdU4o/z26hCjkZDBGGizPK
	TrrFhOj5jRlP4htDuWIRd4MUQ5bqIjO8koc458anSQiNKywWRTap1GNFyiMKrLwaHXE7osCCUIJ
	+82bqjIzyd2Job049nOgfPDhWT4tANd/JEHFPSZs4=
X-Received: by 2002:a05:6a00:ab87:b0:82c:e227:e9c with SMTP id d2e1a72fcca58-82d0dbcf9eamr15586832b3a.51.1775539603670;
        Mon, 06 Apr 2026 22:26:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab87:b0:82c:e227:e9c with SMTP id d2e1a72fcca58-82d0dbcf9eamr15586799b3a.51.1775539603076;
        Mon, 06 Apr 2026 22:26:43 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:42 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:29 +0530
Subject: [PATCH ath-next v5 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-2-8e96aa660ec4@oss.qualcomm.com>
References: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
In-Reply-To: <20260407-ath12k-ipq5424-v5-0-8e96aa660ec4@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfXyXFyEw11edQE
 XHEyezMmSu/TlMnqzJ1vNefwKQIpzw9Va5xfAMk8OLuHhmLrZd7Gf93F4kV9Yb5eOpI3pm2yhwq
 IzHSp4YMcqqdmfONm71UAVsF9yM5pdFXNPoI+tyms5+OoWbPlzIzzgBsd/3JN59+GSKHLidXr/D
 ECCsGva79YDBOQwBCofAr/5WRyVPY7eAZeGH6DjtGk7GcbhdKw5zUn/7RDEusf1MHLwwKCNrTxJ
 qzphr50rIfL6xEPMWVfsws7Fu+y/H6E+coidCtezKNL3csTb07969Qq8KKy4yINeSjfuIEdC/SW
 Kr8wwCZnycTbvBZGvQW9FaiOHyPy4c0uH2lvKzM9FSaJfXJ9PFbrpsZvfjO1fdXRA9KYCtO8Hr5
 E2egQ/Rj5TW2o0GGf33VLkHn4bsZFRRKuoSY5IVf9NUkeU1n+Am3p3hs4QCykq2LHwCAyl36RvI
 5eTW1h3v4Fgm1pg7/dA==
X-Proofpoint-GUID: xtDKt53NL4uEimkVsYCv_g7EwFoLqMdi
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d49594 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vBmMNsOPyRzkxF6eNBIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xtDKt53NL4uEimkVsYCv_g7EwFoLqMdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_222645_812734_EB23AFCD 
X-CRM114-Status: GOOD (  12.16  )
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

From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>

Add ath12k_hw_params for the ath12k AHB-based WiFi 7 device IPQ5424.
The WiFi device IPQ5424 is similar to IPQ5332. Most of the hardware
parameters like hw_ops, wmi_init, ring_mask, etc., are the same between
IPQ5424 and IPQ5332, hence use these same parameters for IPQ5424.
Some parameters are specific to IPQ5424; initially set these to
0 or NULL, and populate them in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 79 ++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 59c193b24764..68453594eba8 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -157,6 +157,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_WCN7850_HW20,
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
+	ATH12K_HW_IPQ5424_HW10,
 };
 
 enum ath12k_firmware_mode {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index ec6dba96640b..2b5d1f7e9e04 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -753,6 +753,85 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.dp_primary_link_only = false,
 	},
+	{
+		.name = "ipq5424 hw1.0",
+		.hw_rev = ATH12K_HW_IPQ5424_HW10,
+		.fw = {
+			.dir = "IPQ5424/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map =
+			ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
+		.svc_to_ce_map_len = 18,
+
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT),
+		.supports_monitor = true,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = true,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 48,
+		.max_tx_ring = 4,
+
+		.mhi_config = NULL,
+
+		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = false,
+		.iova_mask = 0,
+		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0x940000,
+
+		.current_cc_support = false,
+
+		.dp_primary_link_only = true,
+	},
 };
 
 /* Note: called under rcu_read_lock() */

-- 
2.34.1


