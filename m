Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F1CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=; b=K+dGn64vEmWBtJ2767Pj3Jp+re
	4HcyOXAfu7edSRBlj13gQbh+b/IR9usrTOi85NA4a/exAAMRPr9Qsha+1+huKdQW2pvoseUruq7Rd
	zBiUSytsVpDcy8JS9tTgCdjLjmlk9M82eihO+rLNu1Idu+WzjogO1Ao4CxH4CDDbWOtzmyfcYODAu
	I2L8zhxH1u4G9tjuQTw60a9g2OGfjzPBedbA5kn8+FhCBE0Ll53N6sIY1C9ObJ9GvqUaq/ERiLMbZ
	xBwCHAf+oJduDRHCT6wX25keJndlxjuJFTOrDUeuySociooazo03WPn6i3178ycI3Mp2+yUQKToID
	xdCyWtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIW-0000000468W-1cSk;
	Thu, 08 Oct 2026 10:24:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIT-0000000466t-481d
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987Kd5j2686693
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=; b=Sn9ZY9b3k2ceh61u
	EmAQKOFZqGQicSglgmBeDcciRR6avPTgLIZ0HX7i37ch95viDdPbXGUzFESiaYwc
	/RyjTlTGFGFEx/KC49WAEEhNbuIp5Z2sr798zmlrdCRSesxd0Ac8JWDEiTY9xWOm
	k2f/8v+BsS7OFxnHcgJMUElvdu5bVJnYV94FO/kS3CFBW/3cIv3XnhZVP+8PzR2o
	oxj1+mYSTfntRi0QDzP5tviJ1n7UIzwAgqdwRFO2TbCvEFQ43xBECy2veGMlYgIc
	EfPRwtL9OZWWhhBTrQFEI6Ed+zCD9VSXOFNMqDsVnPq5I6BCOEmT6wWDLYxxu00M
	yYI5lQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42f43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60bb65626so6969425ad.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455060; x=1792059860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=;
        b=R5j2sMdlNMXLeb654+Ai2Oo2v9QF/u1y+rFgETCdaUm4aFr+BXfdJo7JL5pol11Vx6
         hQto20mLu5NMOa9uNLhKs2VC3YWZWd3Bj9khoN3LhjAi+2lmay7MVLNYZdjbH5PyR/b7
         IpveRXveExYZx7wISaFYLSI7uQ2b4N0ft46s0jYOXL76uw9vmbftkPjxzjCn/BNHQtSR
         XWcItmArcWDlFqaLAO65EKrBRYqDF5cFSsFu61OMW8+0VssSVVnslihH51lsibUqCAhu
         YmN0lEZy0Wuj4v0hL+54IU7ykO/yM8Qy1d4AyrgyV1dpxluNjXfynR9P4WGXR2T4EMLC
         1nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455060; x=1792059860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=;
        b=uOhojeh9JLdHSxpFv42h75FEZ27nmuDratM3bZ0K+MKn5XFa+Tq5597JFGbxXNTtbr
         zvy0EaS1umYoskFs2ghEHEafGKJPiZ+0NqQFJcY1kmkbECdRNW5H/jssyfWZ7N+hJybC
         5JqwE90Cb7pj8MWypWW3WB2+rrDoPSBHtFUob3fUCTybJo1QfEIV+kHc+JpP4brAgnmx
         pREHfydYnEdMcL1bEHUQJAL6ZMsnNJwhS4B+7B+x0kMg2fzpNv+vbCSB01cvKBa7lWHN
         UFu3XgYbM9OTdXcsOkDIiXbDGe7mSuo3Qb+0RmY+r12R4mLDvsUxX2qeGj/Py48AGDRK
         uHZA==
X-Forwarded-Encrypted: i=1; AKwUvBwzwLCKCMvJNpSM0DDKd3AmIFRdXvOAtvVeN0LoxsCqtI4v1aNDwdJZI6/4T2S1AiEDFCWfFMA=@lists.infradead.org
X-Gm-Message-State: AFq9FYL5Jq1UCV0pdhifvBugoz2dUFuz6uAZKYPw4BwHf1zPubL+9oIR
	G/GKyQywqUVw0xnovJEMQdCXEt57McDY0k/UDSiwjGunixutnO5F2gyrmuwdoYDMGKbpecF8+id
	rF9odLY5/XWvtsYL2fZ8OK4JocWLrOpXYUMZ6WrgpbLkDCnz2UxjmIDhitjwHoqoz
X-Gm-Gg: AYBFou1kMbana4qPDkEtdY15PEVrPoyb7yymR0tPagUTczVKMmJJ3KI65nSzT9D5ZsH
	pcCZmZyNMCWUfihBdo5fwam5unj5I65szrNfwVe2kSzc/7BvgxWjZbijijPqdmP1RtT4jJYXMUo
	6oM8DOclhbTOQQmp+B2DgZQAsHwYLjT+mROrXS+8KWzltxrGNGTpjdR14vhwDakteZpeqvNBzL9
	I3eK+i96f+wxSQwpaCVVhjL6lAacAJmqBfZ3UxOWn64aFiwxmPmpuJu0aKY684rIKrqtUDauz/W
	xtc2FgJBwfQdHx9HCk/DVV/vtvlwccWfW72QDGgS7LfBl+QXnHV4eem4nwlQVLIzOShQ3V3Xs0M
	WTymBBp0wyyXhmnGnLb6j5N3TpH37zuBpTZuJ/pbOmWFm2ZS4gQ+hMp/5QtQrez/19i+AyEPui5
	wDoJcHe2JIjZnmDUSSiLeZpg==
X-Received: by 2002:a17:902:ffcb:b0:2e2:defb:ea63 with SMTP id d9443c01a7336-2e7ffe05757mr11589715ad.23.1791455059839;
        Thu, 08 Oct 2026 03:24:19 -0700 (PDT)
X-Received: by 2002:a17:902:ffcb:b0:2e2:defb:ea63 with SMTP id d9443c01a7336-2e7ffe05757mr11589595ad.23.1791455059188;
        Thu, 08 Oct 2026 03:24:19 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:18 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:53:59 +0530
Subject: [PATCH ath-next 03/17] wifi: ath12k: Add hardware parameter for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-3-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: xyQWPCaRT0Jor4P7kHoSUUjA1C7o9pQk
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac76f54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IkfkkYc7qEKKYK4gSbYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX6qTSmrUAO1R7
 mnxui/jMuqUhOi5Sq1DilThOtI1Z3UvSiKJaCeqo4XXIYmIha/V3ldMBuu7Q1/1fCBeJwF8om7U
 KKc8FTAJBlJrIPxud2gKuLTyhsBCeQM=
X-Proofpoint-ORIG-GUID: xyQWPCaRT0Jor4P7kHoSUUjA1C7o9pQk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX27fqjcN9EwOQ
 S+xSWtmyKVXZDhKJeOypGm7zEjYcsRaj4M91Dprqc310WTPRqRK/iHBuwran1bSd0cLXaz36144
 9yPNCb9YR3SDOCl2/ptL8c11ZnBx8MgGr88yhEMAS4imKYhG9tEyCooATWp3QBXCD0z8Pq5WU61
 Q0qmBtOQ5S4WlsALhkda5qrneRLHKw4Vo8cBow4SXMVlkSyE/2a6ejm3+5JMGn9HF3AK+VcAwOr
 0U9m9Qy7TA/cMIzSmrMryRUeT42iVLvJvSrk+BTDhLzLtOdNu+MZivNWac/iZ85O6L/nt8S5iAO
 LxZLuCNvlMWTqEEHNx3ahuiLJkAbm/kSl1u8s0mq4TPdXiSsCPdTURLOCw5mnwEEAzmLoWOWjwh
 DVPNbsX/2RNgN1RXJxu7EkRu5yacD63KkYfUQleXnYFYhWDztZZSr7/epqKyCOudrKyPC9Py0is
 9EbOHUW/riXHuIyAm9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032422_151209_0C79C679 
X-CRM114-Status: GOOD (  13.40  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware parameter (ath12k_hw_params) for WiFi device QCN6432.

Some hardware parameters, such as host_ce_config, target_ce_config,
and svc_to_ce_map, are identical between the QCN6432 and IPQ5332
devices. Therefore, use the same parameters for the QCN6432.

Additionally, certain hardware parameters like wmi_init and hw_ops
are the same between the QCN6432 and QCN9274 devices. So, use the
same parameters for the QCN6432.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/qmi.h      |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 84 ++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 993aa3f350aa..d87c59f68c12 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -158,6 +158,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
+	ATH12K_HW_QCN6432_HW10,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..60d5811b1c87 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -20,6 +20,7 @@
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH12K_QMI_RESP_LEN_MAX			8192
 #define ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index aec7c652808c..f57adb2107df 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -901,6 +901,90 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs_sbs = 128,
 		},
 
+		.host_alloc_ml_id = true,
+	},
+	{
+		.name = "qcn6432 hw1.0",
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.fw = {
+			.dir = "QCN6432/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map = ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
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
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
+		.supports_monitor = true,
+		.supports_cong_ctrl_max_msdus = true,
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
+		.mhi_config = NULL,
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
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 256,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
+
 		.host_alloc_ml_id = true,
 	},
 };

-- 
2.34.1


