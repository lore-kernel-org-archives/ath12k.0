Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1831061B1F
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=; b=flI+jQxHcCA5RHan0BeeIGFykW
	EIoqnexW6WGkUGupYPOkB9ZKM09vJcbjKe3Eoh1uxKYMNMP1qG5XehNaLhB4ReMuULsokQeg0VxBI
	W/gOJx/wj8AJH+lDT6faMQwKAzQjDvh9WBIxmPRUbGR4vHSwauE7l+fvafF0HMDPTdicOi+JBJtN6
	XTzkv+N8iye2/2FPTXXcT22dxEszxcLuemu/Sf48rULFlGdrhLsLPbo5jjZi2Wu0h4HoO8NteMv7D
	Y4OEH7X3mDtoJgTxX2XbZIb3Pn75KanoYyOQxIlAiux69I5/gIFdSscJVb0/sTxwY9jcKcaNvSCh/
	hSQUEdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOT-0000000BqI8-48qT;
	Mon, 30 Mar 2026 20:39:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOQ-0000000BqGU-0gdn
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGCbgg1402787
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=; b=BPVXb8+bEFLhr+d5
	SNpnVhcpLCp2Eazj+NWzkllPz3Q284K/qalQl4NjZZ0PdORB8ay7ZCuXTbGd+kf9
	yCX9R70sp3yoeq4FjampkQDkOlSQNwu4i8Hxt5AJ/AiHQkMh9nMdYNP49uvPo376
	AZ8SwDC/B2PJmN2+3zKl40WgdD2PEPerJ3wNDwgRhoM0LvBH5zO3D/dX+Lge++xN
	lURZf1DYsYdwvIsCLdE/QWK9CJ/DHUodrCR/ZKqm5eiev5sjk8Q2GW6BlfHGzdNy
	1BiKntiF9MLSTkPCo9N763V10Pmn5he6qATXgPQF3czLmGybfrxIIz09af5GJ1No
	m/l4Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4haa33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b250d3699aso47218265ad.2
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903164; x=1775507964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=bwf5fMjE+q/AcvHRXw/PF1VgSPWN24LYLlrtOzTCQRjgll3Uj3RMnqFYctSD1GbvId
         +WuYP3r1tBUl8MpR66tPtEnMVr4jEAmE0N2ckJxGQvZkcxMQpcb9CyNEeF7lSEE2Sy9c
         nZUGAxOKQThCAajxGP5PFeJDzlPv9iwy65O1g7InQ01BcHjbkR7UAbsb+Mrt8xSSSJgL
         O/p5jmI/ru/zrQQQvBl1LUxWdg+Go+/n7/Rkj7fdTcuXSaZUl+0AIBVEBmzBDTcMlAJO
         EDqmrscD3UI0tUMMkd2umci6+un8lU1yr19LUyX8gIAsSRhu0WoqfFqateMFCtrgztBD
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903164; x=1775507964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYYhjMFDVSGGdtAN/NncaSVaOw76bJQ6T7loTIJqlLA=;
        b=RWm9q68BJyxvMXj/1VagTxQQNJsBxOh2Uw+CNjqxrIj53scvazfnneOoGsHyQLSVHf
         thV3NBwh3CbfEXmgMkUEpUOdNrVdMlRsbuBLeJqQ4cPGpkPnxVnRZc5ndf7MW8DKdHQT
         CBfWotFgbm41/3IK4YDsshJQmWTr0zQJDXjhtUc3g/RFOdo/ds8O9a+asyoM8ldEkzpH
         ih8KqtKSAKkbldOmYXp52caiacecffMbA82TCkj5vfkTjfylh5eOXDm/Z7IFCvx85ugN
         BIaEg14Iw5vnLBg6bDa2Bws/WrXN4jobzUYwkJ/dV+4MPWr4psP/dq9AStvf8yqTSoad
         n6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLjnI7xBiTexV2m1pXUN3dAJjfNcSU3pcXw3LsIGZ5GGnT16Eukao4I9E6zzWpDx84ZwdhNsE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm0RTeufwZGo1sMowfjmdA6/AcmnQJ8BN0MhQIo4kZ1ryv5uV0
	Q0JUy0c5gGeeyj4kC7ICYT2pu37Kd5VFEHd2cDSltxrdhbv7adhSIJhrZOmFW85KqnfMCfekwQ+
	P9nL7N9JtDuYWc6Htw6s53Y7qX6J2HVMzFgUVFXm/ZaGQtqjxjcpy3FY/t6tooUF4
X-Gm-Gg: ATEYQzw78jB81eJJQ2dLNFZZLzu1D3RJus8yyPAA/v382kQZvb7K+IHQ5vtHnavSUkp
	zaZMAm4I9wUsITfFxZYsiERSF8cmQupt+tcCl6wVo0VR6hoGMISMU8Ad3diKfjegRS3u3yVG8x/
	hTjhjuKuyPdcrRYtZyyrsNxp2zpG517s96zKQntSrZb27xkvVhDjOfJeo9Lb5Wz5vVaQhXfgQm3
	KaFlUNXFTowHNk5MIOAtq+06h5R87V341YPyrlGp61c1Q7OEGN85vt7VxdQLvpzfsNP08EaSX5a
	lEk5E9TbG96ogdXRv0sJ9/KsUxN7bgv+UH+0gSH0kMbHN/F8Z3AFD3AxF86hFmRLx7unFTdMlE9
	xo6dQR0Fyr18efdMLq1UEQlklqBAS1vYFnIsfyeJwmLk7kmHon6vCCLD/n2I96HcJWE3y7IIwBU
	lJaLjrMBDdx8b5ykraNGsD5J0CiSDRhc5Rvrhi5l8=
X-Received: by 2002:a17:903:28f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b0cdcb0791mr138534425ad.28.1774903163977;
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b0cdcb0791mr138534135ad.28.1774903163479;
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:23 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:07 +0530
Subject: [PATCH ath-next v3 2/6] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-2-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX/3Q2smfusqEd
 a30S0VXR0+PnjTS22WH8X9tqhwXgWjKvYZBQaGSu2ZZQnbhbW8DbCNEe79Tz7jadec8YejRBdKt
 0xc6RUhXEqxMw7Xu/0x/IGu2GB1k93m8nKAsLAMkJFd8shfc2NdzTEc1Dk/uaaA570UgCrin9bw
 jO9G2lWycP33NdMtKCrF1braHoW/yBFSvRLiv9w1LR8PcPADFQa8oAZTVTLSFhKnLZMIMErNwrI
 rKWkNqpTyXvIh6vfDABoKYdtbR9NNFf/C0QSa1YjsFii64OaQoDBTCmvzgu7Ess57yEsk6o9YoZ
 Apy7p0l0Em51hBDRwF30AT72HR7k55ea7hQ1XYLnroQCKU2hUHwblyVvqPrarSe7rFrPrtsddRZ
 lrk67i3PCDZR+FqAOWkObNU3vCwxVh3Xkmlj+8EYsyvLoz4It6AEGTVW9zBq3FFu1h6Dbyxbm4u
 qEOhykfT8iO3wGRO5sg==
X-Proofpoint-ORIG-GUID: 4n4ST8ZuoNEIqllWQlCZvznlZwTsYvlX
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cadf7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=vBmMNsOPyRzkxF6eNBIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4n4ST8ZuoNEIqllWQlCZvznlZwTsYvlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133926_936383_EC5806B1 
X-CRM114-Status: GOOD (  13.21  )
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
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 75 ++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

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
index ec6dba96640b..9b9ca06a9f45 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -753,6 +753,81 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
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
+		.dp_primary_link_only = true,
+	},
 };
 
 /* Note: called under rcu_read_lock() */

-- 
2.34.1


