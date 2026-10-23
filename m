Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704A560A3830
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C5GbQegO;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GyTKVD6J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZhUsAA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=; b=C5GbQegOaDmjBb
	d4CZDDYyFoL7WjvZcfEeJng6HaBm9AQOwhfU04GpSB6ECEMn0IViJSlpIxGNZhcj/SyOQbiSHwWeK
	2RmLxxM6A3RHgVZXmHjeH3v48ANbEmmtUQB6n5d26HpoMOYzwf79UlaZRxKvTBabG+jhJbc0PDa3w
	FpjVCdwzz2PTrrE4a3bYrqIM2iARRYIV3iAwOVPeEak/O1n/YLPPdq4LJaTXdx4nxW0eWxQWtbOfe
	K/Nx2D7kt4iK+IJCZMlk4z3lYplxrY6IF5UeTx9xnOj2Spc8hyHvkhaGEsXjQiZz/mdK9O1qX7neQ
	BrFOp2JvI4/WwOoK+yXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HQ-0000000Ffu4-2DwR;
	Fri, 23 Oct 2026 07:01:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HN-0000000Ffrj-3n9Y
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FJ6Y1793648
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=; b=GyTKVD6Jvsjp9M7c
	o9i00fL0yE7n0sYN/dfe7RdPzOU1rbMCMPQWhix7/6idz/czzJHTQf/lkXW+wwjU
	LWtllh+G4ALTaxOhuL1t7fg8cZHO0fy2vr9rQZTnvL7BMWh47xjw1STGKaUrY1cS
	PBy/Le5Yc36XIHnWx29nGHRYVUFoUM5VDGk+YZG8lclOgQL9JBl5SlGGs0P9HIH5
	h/xluJsVey7QRuRpXwR6j+ZJhBFnjdoLUuejK5C9molNpmVMxRzsdwWmXtt5dJD0
	6BwntCgE5te9hP7v8fzaDZ2aPlRbT4KMNBkktRtNXHHBhOVvN5HDlIwrTVf07BPS
	tABeng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jwe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso958795a91.2
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738888; x=1793343688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=;
        b=DZhUsAA4vjDb8IKg8pLc5iCuWq6JJ0xr8BexsXqKgVsV+Y464ZS/yFKpoYEMISy2Ho
         6oGpEGJ2+/mEPjUi2j5NLAhz48EIZmlUae37x3Jl6/MEBmxSWDgxoMUeY6yYedhVCzO7
         BahWgKluQesH5F45a9wCPGqu5l74EVFInQrmXLUKwNrbt2UK5iYfwsFu/f1n81RFKWNN
         H63kg3L0Zw5HZU3iGQeSg4IGWVY4la9Zw5HlvXDT16ONW1nZhxJ/7ydobnZ2f9AAkTba
         VXZ8HnoxuH9qijwEmaMBvPR9AVtdfZpDkVDx3f8LUKoNYCIYWCrlykDdWKof1IU27C+F
         fJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738888; x=1793343688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=;
        b=gWqHyRDFuBxz9SHslcETuXdI7kJ4il4YZ9WrnEjC7zF36AkKTrKdSlVHgs6Z2gL/eJ
         HYgyHhjikuBu76Sx8PpRPMEvwYeXhuMk4heWHe4RiCM2EIFi13ROCgNaYN0A0/L4TzXS
         gtlNArZsKhnJsJPA+Uz/+/b4apKlOEh/2eQGoUtrroyiuXQYTVTuzqxH0yt7ZWtWTEY2
         9nEDlIXEgdeZGQEoSSHU/FpARiXxgi+VbPRz3FtqK6qrecAmq9UxcdoAGVDm9BY+RHA5
         VSeRvRvpuSSXTl8WmqmOhje9I6FjgLPLamC9KQJ+zwWBD5fplW0uIYWtPyxjJpFRhl47
         C9eA==
X-Forwarded-Encrypted: i=1; AKwUvBygGLW9O5ns5b12yNSSoUgTdmGA7H050wrbukvG0npamxcrsZQR3mwIu3YXIGIVjLqEGzcWQv8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJrODWs51XlO+rgQbcTnCndOTMDl21nLEXsbonbnx0rrFrmkDFF
	hnX12W6X+zd7I6XUiK0nDwMrSxfUo1Cqte5U755KY1vT5ejBV5Q82P4GTWqUMnzAMu2At7u6MLD
	fXHg6pOcVpuP1ep/Vw7f6k9aoII1uOSC+67dx7pfncUZgzeQjBLyWdQ/auTSPKjbr
X-Gm-Gg: AYBFou3uGLgxeSNCfP2LGmKT8O+veeA5jFQSIqOZz95SmnEsmX27BSMa9Q4Fr/e7pem
	sssc4nUBfR8muFA/lpWEM+DWY9LWANqEaGiPVpYpzOjt8zDm5xRvn9N++/foawvqLO0wgEqVeB4
	QftioBcXIra12rdc7zuJE9CIteueejrHXH01xXVS0IuyXqszBr6PHMMtzQ74M4qmQBJ6PYW3gj6
	1NtwUoNfAQL/bjBUjRRmS6Pry+D1MNEYAeyiDQ8AUhE84XrcoP01xl4RjgdPFJRp/w86Tlvqp7H
	tRnMW6tvxhYzHCoH/r12B3MTl/ZGRjQdldNpolPoD7omo0FfIM/znjRkOUEuvFlrjHr1ct3I08e
	nMWhxHK2gZ74xM1foWC+D/zUWPasrp79bIRSJEQ4LqjAmtBarIRYRickahJnvVdFSXMPgallJBH
	P+Jg1+5fxK8SwLTcePvlnKZQ==
X-Received: by 2002:a17:90b:5201:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adce07f6e4mr1162226a91.31.1792738887314;
        Fri, 23 Oct 2026 00:01:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5201:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adce07f6e4mr1162194a91.31.1792738886675;
        Fri, 23 Oct 2026 00:01:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:26 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:06 +0530
Subject: [PATCH ath-next v3 03/17] wifi: ath12k: Add hardware parameter for
 QCN6432
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-3-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: k-9mDIEcW8-vH9RjJ0y-l9DS8gDwjvYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3VNYa9qYw2PS
 pWSu/rDtBP8f5ukTR2WV975/pV4oT7rv9w2VlwoEJUZxyZM/wHWdqbmBVH4HWWGIfxDAcExEiut
 ANshCi8qI6TcD03OgbrPrJIZLk5FMfdKZJ4dFhwUJGLwghaf1S3fAfjobreHLUFJHZk/RkkyTUd
 Y9vP9lzn+ad569TlP9LeHBRuDhxmKJk6pJwSjzkaOs5FO6vsAN0ndYXhsydfPyN0JZbSQcyvRg2
 KO8t4PQDZmFze43tZoFojFaGHyPpLiPlNABLfmKQerfhJnrsVJerwRz2+Su2kAKqTgXHi1jZfGv
 qAbPqtsFFOiYMAAv+4oROXZjWqvNdIJSG1GLBayXm+EesdY/l8vNU3FhXPzJC/en7gp/u7PcxlT
 LmehL2CKpkbh64D/KxCvLxFRRDTysBSeXnA7CmxIaUGqR04VI6z5RiSRn0YocfL4CC+HOTPs9BY
 yHdxBHTn7qkSLcHt/gA==
X-Proofpoint-GUID: k-9mDIEcW8-vH9RjJ0y-l9DS8gDwjvYW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX+XJ9F0YQgtLB
 mlGcDnkUAq00ssyOhJh5RO+9WMCcevsg6Zdq18TQnjnpg+IePU6kdxM54IuTi8e/wipzjS3d39S
 zUBFtRsHrUP39Hy/1AT9amKf13rMd44=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0648 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IkfkkYc7qEKKYK4gSbYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000130_082045_76B7A869 
X-CRM114-Status: GOOD (  13.46  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 86 ++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)

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
index b1c17cc197df..643c95c9bccd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -906,6 +906,92 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs_sbs = 128,
 		},
 
+		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
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
+		.qmi_max_chunk_size = SZ_2M,
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
 		.advertise_iface_mac_pool = false,
 	},

-- 
2.34.1


