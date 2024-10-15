Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6719BD1D898
	for <ath12k@archiver.kernel.org>; Tue, 15 Oct 2024 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEZqn7it0PL6ftdvoyHGFbWI7+LjfBRa+WzBcBcTrnU=; b=KchlMMHt9Xhwvk9CEDZjxSKptn
	fSA3kFjj8dP3mPUvnWGjsvzdrtyy5D8T4ca42vu999WZ+wiXvaaRCr/qFWlSjymVl08+fwBDnLSB/
	QfIoDg3vZaGne5O1yaPteWvqdexoQ9V4w0yLhFdoF9SdzT/ZDkCkLs0F2HfxDbvB3HZ00eO7iwt5x
	HyisyqisIiDp3bCsl/8J8paiKNqgYnyiTvr1X2tF/rPHRmRCg1js3FIzmnglDxNEdoCh4eA344vqO
	CVYkIvLelbOdWv7jdpWEnvNB+R2TH697JHwEzg4e6eLwcXZ17vnu3I66MC1APUJbWdevj6npDXYvC
	w1BYfMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHW-00000009CU5-0IVW
	for ath12k@archiver.kernel.org;
	Tue, 15 Oct 2024 18:28:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mHU-00000009CSk-0slc
	for ath12k@lists.infradead.org;
	Tue, 15 Oct 2024 18:28:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FEQkwq025512;
	Tue, 15 Oct 2024 18:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nEZqn7it0PL6ftdvoyHGFbWI7+LjfBRa+WzBcBcTrnU=; b=eousoP5tHn1iXIxP
	htdGyEA2n1tG54XP5L/Vao/RVR9drAZJ6rLtStAA4bdE61Twis7guV/PrbYHLWMv
	8ahOa0FMi6pPC5op4B72afeK24PzwFVN5P5p0LTVXkks6NLRCSLKN1NdeZd2hha6
	rmp41Gw7+cX+UQlQMxSVagJDBtvo1ZEAzH5zaM1ONTczkFX85nB+FM6RrLLUEgBL
	JvG/70QlnrNU+9vtElOuoB9LF682IZkUXpw+zF5br0RHYJR3HeQOWC4pu8EBd5iU
	jzL3xiKrIOuJ6wOh094b+/enclGeaN7FEyR8am/1AqOk3Fhx7w93P+3HxgIMs8P1
	83F2DQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429t5kgstk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FISP7t005196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 18:28:25 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 11:28:21 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 15/22] wifi: ath12k: add BDF address in hardware parameter
Date: Tue, 15 Oct 2024 23:56:30 +0530
Message-ID: <20241015182637.955753-16-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 09zG3Kabjjx7tvdD_j7SAYIVs-s-wLts
X-Proofpoint-GUID: 09zG3Kabjjx7tvdD_j7SAYIVs-s-wLts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112828_277946_D2BEA995 
X-CRM114-Status: GOOD (  14.79  )
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

The Ath2k AHB device (IPQ5332) firmware requests BDF_MEM_REGION_TYPE
memory during QMI memory requests. This memory is part of the
HOST_DDR_REGION_TYPE. Therefore, add the BDF memory address to the
hardware parameter and provide this memory address to the firmware
during QMI memory requests.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c  | 4 ++++
 drivers/net/wireless/ath/ath12k/hw.h  | 1 +
 drivers/net/wireless/ath/ath12k/qmi.c | 8 ++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 4117a4b718e3..8fc191b0b467 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1320,6 +1320,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.cmem_remap = NULL,
 		.ce_ie_addr = NULL,
 		.ce_remap = NULL,
+		.bdf_addr = 0,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -1405,6 +1406,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.cmem_remap = NULL,
 		.ce_ie_addr = NULL,
 		.ce_remap = NULL,
+		.bdf_addr = 0,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -1486,6 +1488,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.cmem_remap = NULL,
 		.ce_ie_addr = NULL,
 		.ce_remap = NULL,
+		.bdf_addr = 0,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -1562,6 +1565,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.cmem_remap = &ath12k_cmem_remap_ipq5332,
 		.ce_ie_addr = &ath12k_ce_ie_addr_ipq5332,
 		.ce_remap = &ath12k_ce_remap_ipq5332,
+		.bdf_addr = 0x4B500000,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 580c7be109e0..038fe1b30d11 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -225,6 +225,7 @@ struct ath12k_hw_params {
 	const struct cmem_remap *cmem_remap;
 	const struct ce_ie_addr *ce_ie_addr;
 	const struct ce_remap *ce_remap;
+	u32 bdf_addr;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index ec8859031824..b5cad6656722 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2491,6 +2491,14 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
 			idx++;
 			break;
+		case BDF_MEM_REGION_TYPE:
+			ab->qmi.target_mem[idx].paddr = ab->hw_params->bdf_addr;
+			ab->qmi.target_mem[idx].v.ioaddr = NULL;
+			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
+			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
+			idx++;
+			break;
+
 		case CALDB_MEM_REGION_TYPE:
 			/* Cold boot calibration is not enabled in Ath12k. Hence,
 			 * assign paddr = 0.
-- 
2.34.1


