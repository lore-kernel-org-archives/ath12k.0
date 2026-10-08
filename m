Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD3BCA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=EiO+1LhB+GenZIV5HQPNpk2vDC
	BR7PRcYNkn4Rgoo5T4WL26HYAUnpAvcJ/jK09ja6LGrYUtqt6J1gNCgdIqyupIlRnqYTxRO0iUdnr
	wIQeoh2FgXyTET0g8i2B7o7UZnCRsK+db+2t/idd09nqOfhjV1Z7g7Xe7NKEW9gmlW3j24xPNqLrG
	glcT8n84C38AHHljixp3cODg5n5Jjtw4P2X6HA6QboYTzEMZAM+pQbjdhQBFU6gqtOrnWJtInPEsg
	f6Da9bjhEvPpK1osIBHNR4++B5oTnOhhHlsmZ16WKTyBYHUM8d12MhXiEl9ZGkQjGIsaSbRxZ9RR4
	FxHayCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIm-000000046KC-46LF;
	Thu, 08 Oct 2026 10:24:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIl-000000046Ik-383Q
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=Db0cM64mhZCPpm+e9dSCkYb2dH
	5h3EOqju/HrfJaLCKr06DjjDJMHODCF5gd+7pf9w8UNtxGEmy9chfFHSbu1WZLWjUMd2ldLXtAUzy
	tvosbCNZHo/j2tidvLiXD8L17zd7oIDakBELEz5G3MlEDkCSSr3gR67mWsE9RtOQhKTHdfmPRyL97
	PcNW2ktlRIF5zErbFK8IesDuwYmIEUgM6IL6UACNGMaR0jw+vW8zW/H8yYk4iOPZaw5prwSlIvQxz
	P+rp2FtL1a+eLrfRISxkXjMQldxPWjtr0NGJCCi6vvwTaZPUDgf+sfMQVtORovxYBkIKu4cENNou3
	QFNkq4Jw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElIi-0000000AHei-0oAD
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOr51846063
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=n9x/wqRiwM5tM9wC
	qdlXG5lb9ksM+FH0A4Q4XqPnoRCVvwSD6mpTNGdLBDlDM0biGUi2QtRuKUQErwQu
	kaTPBaquooTGN086ARTuXI4H7PmJQ6frdFt2D367KerL2KJ0MVjP/ZDQhS0QwK5k
	zX4DMbWqbmuYGFgnFe4bEeF/+GuzpgWxx77vEPpE7bG80AYfjCVLKjvFeMpS5/oa
	qJLjtn1M04CqsKk6GiTpbLifUZ5WxbAewx1HM1haCsYDLaWrjR18BM/DTganmGTo
	8Te4D/V4rhL34KxlwnjHdekYrPVehhChRCHnJTxtRiuiFamJncP4dSGfq0Y1hzQR
	i1Vb4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jhgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so52939365ad.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455070; x=1792059870; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=TftGWSfOJpKHuOvxaIHX9t1yj54EcK5+eLSp4HfvvHuPVDdm16XW4J/fkByHoMRebO
         vq6fnh+8AlNksUsQZ58SC4qtt7B4w3GTjTm6GcpDW1tuXOfWgTenwXLb23ZOI21jEeMv
         L0R1Ug4gAMU19CT2wB25oPJboeKwJQbBS/bZzVrxVeMdXWg6HZOOUkH6LaMWWHQfL8YR
         Z73CEYTgX852+xnItelwtqcUjIkMiZ18/H2GaTgJgTT5oKDxm0mKrAG1WfzrfZfrRbOx
         1h3tX56gvv3UnI9DXDSH23jOa+8jilxSno4kyNIOZJPZhdoct6+97HHZAYTfDj6cZrjX
         xZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455070; x=1792059870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=in/tZMg6qG6rMj0VyktVV8ohuE/lMJT/dBYSjT/SrzH97MdC+l5LMonm0e4v9tj++Q
         CX2tC6gqyy75df/JAV3KftaoMurTo9L9bKWDlwspIOUyqKlyUIy9k/qIQfC1Fpq8jtA2
         fr57azTCt7/ZKV6kBKnAeQaEznRTRVgf8lM0r/Twg2GH+WiFXTMDxf4IwbdhYk2fL7fC
         iPoVdwDJPf6QbVsvxjtS6VYgNP2tP9Yv4TpKB+YcyX9hQL9pXxELJLfxyLQIvK4c4TXa
         ju3zjqtXSClLZaIwaOpWBzz6elwtH4s6hA/ztFQ79jFvU/urlYakh8XBS0Nmo1vJsfF9
         aglQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDTI2KNJVdo5qqre2GohGeICb5zyBSj9cCZCeyu9Pg4u6mtv7Q0SqZy0o5KWP07QJNdlfcdW8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8VCIn9HwxggVr167Otcw+C0WyHqz3d9CUTYT3hz0v/C/rbgt/
	szhHQ3cB4tHIHMYriikDrLwsK9dPAHKcXdNDzhA19fVUTjUV43uLnkSTNvG93dZm/ixef4befCA
	8TbowJwk3X9t29+pydsvauypAPckIfZRSq/x1H/DIJhNY2dyJdE4WMIES94s5eBT+
X-Gm-Gg: AYBFou3zGijFSHUrVTCY3VNfUlVeSsj3+pYZItzBJ/uiO0acsKqXNt2Cg4L0v1L9wVa
	rfDV1GZhqk+pBdhmDAkSf4kMtOmRh/VNnx/qs0E+FWaaNwymVyLRgZkg1bvjeNmrpS7/MAWDc76
	Uyvi9XH1vQNaT+9wgjgppnTxeQeetX00LVqSgtSOUfjR8fE5ushT5mPKJMx1ICeePPfXCKWBEPl
	rCyJrDANK9iZwkNQjUimuSV2Cpa3AL3q6s4c5pEMNxdgADbSbhXoqG0+T9vx0IzrMowS9uM9mOt
	n5oPDtMRDTMXdFlhXpYB2z41YsLSnsLxCZHbuyAc/JzsVeYU3hlNszoGlUhXqU+fpPhRT7e1CdS
	9ti877HhS1SX5WNQtkazoX04OB7lGDVkTeq+m2M9Wi/1HpSmu4XOHSA61hJ3OS9G2Yqy20hPIUX
	Q0IWTFiJ6c0jX8DaIfU9LvwA==
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e6005979d8mr43173455ad.60.1791455069787;
        Thu, 08 Oct 2026 03:24:29 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e6005979d8mr43173285ad.60.1791455069288;
        Thu, 08 Oct 2026 03:24:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:27 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:01 +0530
Subject: [PATCH ath-next 05/17] wifi: ath12k: add hardware registers for
 QCN6432
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-5-2c5797b5e4ac@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXyx3UiHQyNAfp
 58Ycr8Oje7XtIvBFzwQN/m8jKsu/xK1leqCoTIpLQ71t60F/bddBXGRFTq7N1/cqOc9jb3M/WRa
 bPgZHXRJlBrbpLzzsz+w9DLKOU5HASQ=
X-Proofpoint-ORIG-GUID: qfesbpsq6hSPtB7RIvsyqfOwe1BGjso5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXzBziD7a0Kb12
 HRJFu8Jkd7S3TSUxMVLx4F7hYtPJdVJdpMhCzhMCFBbPPGXmnKhw+hcmZW4pNwDrgQhjD2dPvdu
 Zp+U0S7SRC9aX7ZE1L4piCEilDmug5UIumlsciIMNlexQUvdeQ4VHoHTdcY6eH6DQeqGOzHbCJE
 sLA4ByxFB1efi1yUMt1xB/rrmxX0nol84psOvHpwPXM55K3ZbHFn7S9yw7UEkTiSq/YQsOocgZt
 Pikc+MINT6mcuxdmH/ii952+qjN8IrsmWMXaZGtFHRurZ5VaEDW/W9Le9LD/PvNe+dxZnTSEJxc
 Iilje6O4QYvyDZfsLk++QXejXh9k5AT/zaPXu3oLyClZjWokmRZ0SdOzA57KCj2D7QCdm0SlVdX
 3Rori73a1/Ae7tfFhiVooenOnc9d+xqdTrTcM/h4ry1KrZbr2HEbygy9OhhMmMYhqxXY5CvrLY7
 ebk8H278R/F6BHvMypA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac76f5e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4ETC605TzGOYwJmJ72kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qfesbpsq6hSPtB7RIvsyqfOwe1BGjso5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112436_607188_2D90D779 
X-CRM114-Status: GOOD (  14.12  )
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


