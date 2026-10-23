Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04C60A5BE6
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EMvcY4Ei;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OFxcrFkj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiB1w18t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=EMvcY4Ei/U5rUl
	2GWimzfg+GTKlCfTzlEbqtJex9mktQtt1yOBeF7Id3M3c4bUzok/nJXxqR5ZYSuZ7JElXuSstU/8w
	ieCVs0FESLGdVykUcFKC35BjZqJRBW1/nTZKNqsaEjkAkJd67q1NEzKh/Fszv7nadPaD08XlURnHp
	ySO3LOdE7WCkhGmGnt4o8e9aak4SjAPx+86GMpEt9pl4ubEe2hlwbQSDxoSzc5HTwiuBkpa+iCd42
	J5hAOi1RWL998ivx7CxmgC47hNHzoQZcyIdZ62haVGa0CiWMrDRQzo2ee1E/9kfEYayU1u1YnrzT1
	OCwLVHvd4AipueRjDyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Ha-0000000Fg2u-0TWz;
	Fri, 23 Oct 2026 07:01:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HV-0000000FfzC-27fx
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EuuW772900
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=OFxcrFkj/0KvfZ9+
	+IjW23BCE+F/fcqkDU9JqkifJNhm4PRQjFTCF3h6a9Mo0kzenX4Rl6DOk/fph0ow
	LHE2Q7C6t2ev/fXjDGy0XyVi5ALwlXGqK/sGdnfgqARN7zLWSTixPio4m9FyIk8w
	qcA7SCg+1l9hCfsJqR88lpMCACc6/AF3Lj3uMWZxxzo1RZHUBP+lcwZg/v2NzUQ6
	tvWP21Sn5wKcvTWeHv+14Pd+xm9c373yhI4uusfveLyhhFgnUxPYa39MNLE4QHPH
	QfKctnnuaaDcAV9iOxAR0ud/BLS3JGNocn6n2rcLuNQs1S4RjDCT00LADG49mEQL
	2fOK2A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso652363a12.2
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738896; x=1793343696; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=JiB1w18tyfl/9OLIe8qDyZPJcf66EASmzZavZ86LkRNv0Z9YJwUQwInL4c6FexYjbF
         kC4dG7DJhx71AJmdQugFgdZMmWM65dGYL/8IPG+6LuO6HoGcKQ5MGPMZUeYsPdf9YsNe
         OWB6e3lwmklFweAG+nR6UAnAIKdGmh7sY+YZXN4zeQUMwoxGhxh3yklauJTqXxxklx+U
         Os8C2j3WIEdwOew8tcH0a0Udofk5mX6q0oN5Z2GFAkoah9M9Iwh0n9IC6lCGiAa2/QOH
         zLfLpVcMZo+eJBOdxkm+OkSzCq42i10arWjPihSWCPJSzGovoNH1XLTvcDy7YK1MqV0Y
         TagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738896; x=1793343696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=aBQS37Il7S7PmV1lbEZW+TbT+HVv6cuPVDQjitQ87UmmGAEnjKFCtvzdNjpH6cU7nd
         hU+aMbVFwiyf6m/IUXgub3h4Dl+9tS/WJFzsmRZjD+q8hOvRjlAhdEaVb4O2IxKn0Iq5
         NTdVoS6BkbzCSa5ooJ4w/lCxb3wjFnDiFDUgc00xCBnO3TMgCiuSO9yzA7rI7oLCARJi
         Jq1X2Q0WSELsD/zzm256nH06qSvveNNb4wdX/WsGKayUcqUYF0EtWVwDumSVTqkQ114h
         q+lsQjSW2ssEMS/a+g8AeJxcVRe1hdakrXvdqV8HOiY7IfC0DX29XxySqttVTkzJWq1U
         EV5A==
X-Forwarded-Encrypted: i=1; AKwUvBx+j26rh2Vjmoons7zpAz96d3YidgJqyW4IYozDEKFSJ37/nOXKnKUR7XmBhOv7cXRcSmUwazQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYLYY4q/Ua0fD2FnOfMFOfYKqjJXg6nTt5fh0DLBCueo1zfTY7Pk
	MRojaSfP59SzWGE8PEO4F7xP7+tGoBx1FHc2KgG7bII7hvnq9FcnupZYvIpo2dnawFuMMYCMBVY
	59h108l8Xej4LuqeYgmq0Hb4+drONNtOjKXxY/49h/9BsFb3ZK2v/2n5rbRW5XeaJ
X-Gm-Gg: AYBFou3voPKorw1mOwInFxRhu530GAP49/bHG9IHy7LxVOEHpH+8RdadI0JkUCKN8+M
	m27n9VBADTLe3MRAQU+aiwl6EtkNPxV55aucpQk2loqeAfOyQf/LiroW/xIbOnKH+fvJrl3ki71
	FnN1lcY/D1rsPi61+EFC/zlZAHZEM+4ibhqI29TrBx+QJRAdFTI9CEtpq6l4vdTKf5fR3g5lDvJ
	Cr8Gx6fzo4vKV+LtluooInUqbMqh4ZxIRwXZxLTZwe6S8FYOoooq6feduLJcgAszMeQLNzueFCa
	bGh8OgJn1pDHbYVjaTdjrDNJ2Fu0OaZ2kaRyRIs7XbZuaXRLr1FyFMf58dKpxqzmBqSIhun7aZV
	k1VWGtvYWCoW3NfL+L/XX+4eLBv2f3ToO7yWE65vHHFl97gx+h6WfeE3MYghju7i3mTDmd3pn3t
	38lXs62q0YHH8+09gD19FOuw==
X-Received: by 2002:a05:6a21:7985:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3e369227e36mr986087637.15.1792738896083;
        Fri, 23 Oct 2026 00:01:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:7985:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3e369227e36mr986057637.15.1792738895563;
        Fri, 23 Oct 2026 00:01:35 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:34 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:08 +0530
Subject: [PATCH ath-next v3 05/17] wifi: ath12k: add hardware registers for
 QCN6432
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-5-19f3fcbf7b5f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb0650 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4ETC605TzGOYwJmJ72kA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jpdZwcpSefVe2Xo7YjUkrdpg4bIg5g-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX7NcOE1thBER8
 gY0Zj/TDJfIZZWJTG3BxC7eIn7hgJGri1JOOitk+QTAJg5XM4y5zieOiPcwo+Ri5JtILsYYLgBg
 UfjyNyUmLnLV+OfZJBFpRx8NxoVhU8mOeSG9B5GhITtTrK4H1O10w3kTSZkw7g3//Hx8WDWKvdw
 /f/rnzD2DTOJJCttOchaZRawbxC5ZEilOkpfCOgAO3WPcEP1hX0b6jfGmkeagLqd5xX1uE5CVd3
 xOoxQH2bAS146as/oTt29gqx5ECiWx5IDHkehBbEd/XJMIBR1Ux59rCw6Nh/JpVsYwgBTbyBAUw
 T61R4jmT9oMN1ytMry+1ow+iK2ve57fvdZtyMe4EVYsvPRPQo8XglG71SagbNJd66KWkYPu5Ogz
 4cKvLtytH/MBLkpQZaSuiVNz+kpTYFL8+5lFVnC/oNLcNnEDD1Js/yKp+Kk1QR9K/z0ALCsY1YZ
 zP5OZtLbQh5Yj5veaMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX1rFkvhgmKhZ+
 MjL+icHYcL5Lgc889/SgEP78zItHTCq+vQmrJNYOjNer2I2rqIerv58mFXZ8E762HlHQHnf/yqe
 YakyCYwsrwwLsiOnRJffwNkkL/0hKz8=
X-Proofpoint-ORIG-GUID: jpdZwcpSefVe2Xo7YjUkrdpg4bIg5g-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000139_374038_6C9C4A0A 
X-CRM114-Status: GOOD (  12.23  )
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

Add hardware registers and populate the hw_regs field in
ath12k_wifi7_hw_ver_map for QCN6432.

Also populate the HAL operations, HAL descriptor size, and HAL parameters
using the same values as QCN9274.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 85 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index a0a1902fb491..7c468159085f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -57,6 +57,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
 		.hw_regs = &ipq5424_regs,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = &qcn6432_regs,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 052b59265af8..34f6be922479 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -572,6 +572,91 @@ const struct ath12k_hw_regs ipq5424_regs = {
 		HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
+const struct ath12k_hw_regs qcn6432_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000918,
+	.tcl1_ring_misc = 0x00000920,
+	.tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.tcl1_ring_tp_addr_msb = 0x00000930,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.tcl1_ring_msi1_base_lsb = 0x00000958,
+	.tcl1_ring_msi1_base_msb = 0x0000095c,
+	.tcl1_ring_base_lsb = 0x00000910,
+	.tcl1_ring_base_msb = 0x00000914,
+	.tcl1_ring_msi1_data = 0x00000960,
+	.tcl2_ring_base_lsb = 0x00000988,
+	.tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000b9c,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = 0x00000074,
+	.reo1_qdesc_lut_base1 = 0x00000078,
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054c,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000b28,
+	.reo1_aging_thres_ix1 = 0x00000b2c,
+	.reo1_aging_thres_ix2 = 0x00000b30,
+	.reo1_aging_thres_ix3 = 0x00000b34,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002a8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1 = 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0a8,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0d45c,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+};
+
 static inline
 bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 03cf3792d523..5c593773109d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -18,6 +18,7 @@ extern const struct ath12k_hw_regs qcn9274_v1_regs;
 extern const struct ath12k_hw_regs qcn9274_v2_regs;
 extern const struct ath12k_hw_regs ipq5332_regs;
 extern const struct ath12k_hw_regs ipq5424_regs;
+extern const struct ath12k_hw_regs qcn6432_regs;
 extern const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
 extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;

-- 
2.34.1


