Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C036FB5192
	for <ath12k@archiver.kernel.org>; Tue,  7 Apr 2026 05:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=; b=v3SB8gCSRritCHD3bRgpTNmb2q
	fg768YKSH/19Fy/gMwYVMDlFwrhD0P3iZYreDkbTsktLukSfSfOyxq7k7EVBch10rYaRk8ZcNCobE
	ajprmJ6/OSQsxWAQkASIRG/9BRBSPabZ1GWLLVuLNxqBQOkUF7P/uZqmdhe2w0aFbPtk5K6LVf42u
	UWfxRi/VelIZLMP9A9ifW/uHgfdSVQwDeL1In2qWVz1l6ffkoPgYy2LDzYWaiuWVWVbtHfrxNH68z
	YUZvue6XwqyP7zgmWSrpwIn+JPP9qmCQj+sycWKDoYucTxEAzA2TSxhyCJO/VczUgVTFhaQJQUPi+
	8uoh1ZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxp-00000005v09-36FV;
	Tue, 07 Apr 2026 05:27:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yxm-00000005uxe-3JEn
	for ath12k@lists.infradead.org;
	Tue, 07 Apr 2026 05:27:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQpsu3402629
	for <ath12k@lists.infradead.org>; Tue, 7 Apr 2026 05:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=; b=huOvn6VNueYZ+t+G
	OOOzY0jNl51/lYCMJly3m2aixKvXzmmJbKUeQJFIxZsa/W4Ou7nI6HD5wlgmRvQN
	Wz2Y7KbRk4s8GcIr+cXXuFbl5hIcujgyZnt0WQRA2nubc50pj9lk31Uqgb7aWC4Z
	YjlCkjlLBF5k34Fwp33DWbFa2c/ZZ2vF/zbKLvurHT89/g5iHHQvaBsWzVHsxS77
	bJVw4Ze4vAZbImMMKGKxeS/9g53gWXtCipUximiFLYerPTRAz+8bj4p438WqGp9f
	jUSP+M9NJgKVrpRZh9mPXVw1gh2zT3hxa75PpwRC6cEiPkY4qvjMbxowAnJzuosV
	XX8L+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhs5mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 05:26:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cd9fa608bso8090701b3a.3
        for <ath12k@lists.infradead.org>; Mon, 06 Apr 2026 22:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775539616; x=1776144416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=;
        b=WnLntWyrh8k5CoeYQXckaNIa7bau4MoDfz53VC/Sj2V5+HKTuOIgtm7HDnzzpb+29C
         fdWl3EvsoOCwAyyFazsigr61rxIIiTXv06FKKjTBoOUeyWurynFUK2HHbn5il3KmCrC0
         K3vbK8P3eVh3bazfvKCWdQwv2xw7NKknslqnDwWkhy1FBDKW6bKJSiGot1W/pbxupF+n
         +roYTCbyOhYh3HLpl+FyydQdZmzE3CmckvKiHEpD5ZtGRtIOSajNISktBmkcdFn97kci
         FmWVW/AY+0tIzf0z0SFuSeU7CSQ/0t5rnjFw09lttuegryhhiotkOYLof+bzB/QH6SYm
         49Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775539616; x=1776144416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgwPXeYNZJkWYjL+cSvBNV11RR4OBiR17RVjGom99/o=;
        b=food7AXT83Wqnga+5EaZRZyp09Djh/rGSc0rNRYs0NNhweS0BEv+EmpZ8y5WEHxcue
         AMKrllBf9yM0QBgOoeGNfflcWb8DjZ9TOVHzHS785nt5MZXSi8+gVeAWR5ytRPAgBKZC
         vyxMJL+Jey2LguTEfpDedswjylwEDw6l3V9C4BG/GSa3CO2hFQiT4c52OoBdVmsFTJOL
         vjqv/66U0nmMJ/O1CSUz4fc6NRB+2ipd+iSHRqUC9qOsibja0adDGF0/pIDEvv5QgilI
         M46cBV07JYtka8JBL6QWbNQWRfZgIq21XFFGDVS9kZJN5o1gzqf/DGtpIKG83wSqAq9K
         /ueQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIswFk67PFmTG9hd6oXmW0niOAyorviXlsssGh8SS4QntoKZLKEoW3BQGi56Eji/ochf8ZWYw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmS1Y9A+kuaVPokwwP9x1fOtlfPXBbTIwuo9z14PGjp+YrTHga
	HIGCFc/DhDjF1KHEu94d49nDzou+ts3wpQx6XTmMnchMj4E1B2NEjwVVyecgyvLoHS4StvBkLF8
	lua6/I+oHeAx7JaLRgAj0iE1bRahDLn3cNn6XmNXBKxE3E5YrWkH8v+5SBYT5Uu7B6yIEHqaT
X-Gm-Gg: AeBDievsXi4tOS74bMdo3JJ4u/oRyaxFzKXLbtXQP9RXdnNMb/L/E6rw+zOQUTCCjKV
	pdHhLWi73WgOQ+oYFLSESiJ5wRO7MF0iCZ8F/8yumDr/HgEhqzzpMr6NRtPANKgAk7cjCIaqtBM
	bnX8t0BrdELIqbfh00rRBQKlKVDz+chDO5MngX38nrV2iKJ3So3CrFoM2iie6paTfBgYukIOcUc
	GtdV9c1qlG1Xb7NdvLqvGOgE4Gv+lTTH3vM65TSnEPZiGnoyL0hsLb+t66JI0JM9qrDi9g8Dk9m
	VQP49jTwqtsqeDfFOe1fGgljRFCEummbUMT+hUjWQ0Bi9/bhWvxDKGSiMhtASSXYIpohaW4gyYA
	Xu0Hw0uC7HUer8GaGoSwHSp6+EzJexW1BCHCnTh7YZkJKpYE9E6kU43zQoVkp/srTkvyOQCIi3u
	uDUf1B11Gxoluv+RNxFIkBilQ98eQ/qMxZl1ydeJk=
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr13975912b3a.1.1775539616063;
        Mon, 06 Apr 2026 22:26:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr13975883b3a.1.1775539615571;
        Mon, 06 Apr 2026 22:26:55 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm19897219b3a.41.2026.04.06.22.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 22:26:55 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 10:56:32 +0530
Subject: [PATCH ath-next v5 5/6] wifi: ath12k: Add CE remap hardware
 parameters for IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ath12k-ipq5424-v5-5-8e96aa660ec4@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0OSBTYWx0ZWRfX6Wl/FwsTlBdG
 JH6qiT/Ebfon3z3bAMklfHZ8MEL7COPkE+JWcCU6gb/wT12STC78zmJKmY20lDnhtkSuGSHXcNy
 JFkS8xrd33MJHdfxkzo7G6x41lA2/F18OguTtfuI/FvSiRF+pKkhWBHKuMSdVKAGTXRwMvTJi40
 EwyQoadIjhAmLuz/RyCTa2JdB//0YWP/k2FGBuNYMJPz31akK/znU+VqQN+pP4MpC/d7Wujs396
 7YD4ZT4EaW8j4MIk1A7J1iByALxHgteQG7blDzNMzJjhmWsnsRsZu0nLs6onVHLtnys5VpgifEn
 FRJD966PXyN1SCBbj9KCv7FtKvyzSDl+o8Ssh+8CHNVlqIjHk5x0DnbwkHqfOUZOJZ2EiHV0+Hi
 BcEVCddPeUcpsQbyPrFsGuwCdt3UJbV2WYSEsJbSi3MWKhZhdEPUIZf+voL2Ks+zhpXhsoTsgbn
 0Pc+UupKHXsXwSJlMnA==
X-Proofpoint-GUID: ZD75qYyqCOdy3D1BDkCdP548rSx6N3ds
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d495a1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LDmrCAwXcT0UWmoAFo4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZD75qYyqCOdy3D1BDkCdP548rSx6N3ds
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
X-CRM114-CacheID: sfid-20260406_222658_966082_6FE9134D 
X-CRM114-Status: GOOD (  13.56  )
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

Add CE remap hardware parameters for Ath12k AHB device IPQ5424.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ce.h       | 13 +++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 22 +++++++++++++++++-----
 2 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index df4f2a4f8480..009cddf2d68d 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -38,10 +38,15 @@
 #define PIPEDIR_INOUT		3 /* bidirectional */
 #define PIPEDIR_INOUT_H2H	4 /* bidirectional, host to host */
 
-/* CE address/mask */
-#define CE_HOST_IE_ADDRESS	0x75804C
-#define CE_HOST_IE_2_ADDRESS	0x758050
-#define CE_HOST_IE_3_ADDRESS	CE_HOST_IE_ADDRESS
+/* IPQ5332 CE address/mask */
+#define CE_HOST_IPQ5332_IE_ADDRESS	0x75804C
+#define CE_HOST_IPQ5332_IE_2_ADDRESS	0x758050
+#define CE_HOST_IPQ5332_IE_3_ADDRESS	CE_HOST_IPQ5332_IE_ADDRESS
+
+/* IPQ5424 CE address/mask */
+#define CE_HOST_IPQ5424_IE_ADDRESS	0x21804C
+#define CE_HOST_IPQ5424_IE_2_ADDRESS	0x218050
+#define CE_HOST_IPQ5424_IE_3_ADDRESS	CE_HOST_IPQ5424_IE_ADDRESS
 
 #define CE_HOST_IE_3_SHIFT	0xC
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 2b5d1f7e9e04..cb3185850439 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -329,9 +329,15 @@ static const struct ath12k_hw_ring_mask ath12k_wifi7_hw_ring_mask_wcn7850 = {
 };
 
 static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
-	.ie1_reg_addr = CE_HOST_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie2_reg_addr = CE_HOST_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
-	.ie3_reg_addr = CE_HOST_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie1_reg_addr = CE_HOST_IPQ5332_IE_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5332_IE_2_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5332_IE_3_ADDRESS - HAL_IPQ5332_CE_WFSS_REG_BASE,
+};
+
+static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5424 = {
+	.ie1_reg_addr = CE_HOST_IPQ5424_IE_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie2_reg_addr = CE_HOST_IPQ5424_IE_2_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.ie3_reg_addr = CE_HOST_IPQ5424_IE_3_ADDRESS - HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
 static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
@@ -340,6 +346,12 @@ static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
 	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
 };
 
+static const struct ce_remap ath12k_wifi7_ce_remap_ipq5424 = {
+	.base = HAL_IPQ5424_CE_WFSS_REG_BASE,
+	.size = HAL_IPQ5424_CE_SIZE,
+	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
+};
+
 static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 	{
 		.name = "qcn9274 hw1.0",
@@ -824,8 +836,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.iova_mask = 0,
 		.supports_aspm = false,
 
-		.ce_ie_addr = NULL,
-		.ce_remap = NULL,
+		.ce_ie_addr = &ath12k_wifi7_ce_ie_addr_ipq5424,
+		.ce_remap = &ath12k_wifi7_ce_remap_ipq5424,
 		.bdf_addr_offset = 0x940000,
 
 		.current_cc_support = false,

-- 
2.34.1


