Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341CDCA0EDB
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFw2Lff6Tq2J7srX4n7Fk4zpUfnygl/Mr+Iyqr9K5Jw=; b=bwrbdzjVrMTMXQ0MaGdmQOaBJh
	UR93IKa4YACoyUvlfhB3kYpMedFKJf2IPmNW0L2zs0TVYfCpKkqxuOQAQK7fGvDLRyLJphODEd2x4
	bqL0MXwFZKY0zFRJ07ntVbRlOa/8IA5ZkY3axo8l6Mz911bVrSxWDiU7JkIOI/r3CHMdG80nWWaHu
	sSBoq+yP1/O//NJejvyc41u7EVqDS+RU00E5uqPalaZZe0GcuX3D90HrRf6rX22gny3bMjdwudvNN
	lu1xx2XDueJ+4juReBKCUzKapil9AIRWVNlzoQVSQSviH3QKzRx+raIY2djqjdy//uCumX42NlI41
	U6msb+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulufx-0000000Bqhl-3uZO;
	Tue, 12 Aug 2025 19:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYT-0000000BWZ1-08HB
	for ath12k@bombadil.infradead.org;
	Tue, 12 Aug 2025 17:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TFw2Lff6Tq2J7srX4n7Fk4zpUfnygl/Mr+Iyqr9K5Jw=; b=RKVL9TKL7oA/hmqE1n4MBJR+Zh
	lHlVLxstVa86dNeXs5DCP+gD1d3mxFEqVFO1oONeoJteVO1UqOZQfuzlX9BJ7re5GNfY/vMJi//gE
	TC1Nc3X0drhPlapPzAQpzFI1sR9Bj5DBf0RflnEEQME4x7/+0mzP9900HW8s0ofsZl21lC41xVv+q
	s0XrkTxcxGvj145M18Us81eTTnvuE/eWP0oD++6zd8+aY5yMByWUp8N31tr1I8lmkyeJSnZ4PmVep
	RXKiqFckNdKKJM/TDtf00yGX/EjNWWGA6xdjVEeoeWkLIE/Kpj85MOck7aPWjGSegqZEQh5nSSggI
	x/LPOx5A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsYP-0000000Fs01-12he
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 17:12:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CH6eri011485;
	Tue, 12 Aug 2025 17:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFw2Lff6Tq2J7srX4n7Fk4zpUfnygl/Mr+Iyqr9K5Jw=; b=Vk0QoXdfN4q9Fy1B
	lcPVacl6lJ//HTtf5Hs4WhZVbcEUu4+elLQ4uIgVxFEJjyoX2ULAy9E2ufDSRzo7
	yqBEGaMWX/tGmIGh44QpZvqiemceaoswtQc2rid/963ndA2I/UjGM15EelTav9u/
	0RnMkUOGB0bxpaGRNqljY5Q1BqutzvphVx3XcOSMkIzjqba+IlO3oIKLSkRfkQb9
	1grzC3QU9wVvt+O7G3fpNWighEPefKUmixGEfBlT1RY6DkZfUUChh1vaev76vcXz
	YCzkUAnYi3wecO3EuHzhDtyzFWsIjDI28fXQpASQ2HXRZusTXCsjYfwsOckCx2Oh
	leWNNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9r0hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57CHCoqE026492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 17:12:50 GMT
Received: from hu-kiranv-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 10:12:49 -0700
From: Kiran Venkatappa <quic_kiranv@quicinc.com>
Date: Tue, 12 Aug 2025 22:39:39 +0530
Subject: [PATCH ath12k-ng 13/13] wifi: ath12k: Remove HAL define
 dependencies from shared AHB code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250812-ath12k-mod-v1-13-8c9b0eb9335d@quicinc.com>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689b7613 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=jfDO2W7Yx6m_jtC0e_MA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YnNuQO-7O1l2v4M5YFa1uGghmqc-RSP4
X-Proofpoint-ORIG-GUID: YnNuQO-7O1l2v4M5YFa1uGghmqc-RSP4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX88wRY8iv4Xos
 trMdonYTZxtQ5UDgAfrBdpWmdtiHICmWiFRcXOr+znytb3vIuM62YVb3Sg0Oqev8sjg3mj0Lp2a
 0czc2kXKgEHvKuejeU7Cx9/hc+AabFLrDR1QLXgDp1pAQlEcpjIjnoj2SwTFvcZjKEt+bCnPaHf
 vn/plOiUDxquD9EzgF8Ibf0msEKBODgwIsmOwgoSbuecPMKQsV/5NQmr2cBrb5C8h8OZNAHCTiH
 4SeI2538HTOuSCxn6s1pU0o3JasVX05ZACyRhfsEuiJ4bw7YyW+PduM5O/nDTfmc4iighBDgGmR
 guIEmuzqJBzzxn1p7wwS/CTtuELpwXr1Kumd17pUJ2iGP2d7pJjtM6wltUqH5LGQcA/+GWbbrEB
 1XHyBFQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_181253_633989_75B2A37F 
X-CRM114-Status: GOOD (  15.08  )
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

Eliminate HAL-specific defines from the shared AHB implementation.
Store the WFSS register base-already available in hw_params via the
ce_remap structure-in the AHB context and access it directly.
Add the CMEM offset to the ce_remap structure and use it consistently in
shared code. Improve modularity by removing hardware abstraction layer
dependencies from common code paths and enable cleaner separation of
target-specific logic

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kiran Venkatappa <quic_kiranv@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c      | 7 ++++---
 drivers/net/wireless/ath/ath12k/ce.h       | 1 +
 drivers/net/wireless/ath/ath12k/core.h     | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 41ef5170556e9255337b26ec3565ab25f50adc65..efb0ef609dcfab307b942798b901fb7f2b85e7d7 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -123,7 +123,7 @@ enum ext_irq_num {
 
 static u32 ath12k_ahb_read32(struct ath12k_base *ab, u32 offset)
 {
-	if (ab->ce_remap && offset < HAL_SEQ_WCSS_CMEM_OFFSET)
+	if (ab->ce_remap && offset < ab->cmem_offset)
 		return ioread32(ab->mem_ce + offset);
 	return ioread32(ab->mem + offset);
 }
@@ -131,7 +131,7 @@ static u32 ath12k_ahb_read32(struct ath12k_base *ab, u32 offset)
 static void ath12k_ahb_write32(struct ath12k_base *ab, u32 offset,
 			       u32 value)
 {
-	if (ab->ce_remap && offset < HAL_SEQ_WCSS_CMEM_OFFSET)
+	if (ab->ce_remap && offset < ab->cmem_offset)
 		iowrite32(value, ab->mem_ce + offset);
 	else
 		iowrite32(value, ab->mem + offset);
@@ -928,7 +928,8 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 			goto err_mem_unmap;
 		}
 		ab->ce_remap = true;
-		ab->ce_remap_base_addr = HAL_IPQ5332_CE_WFSS_REG_BASE;
+		ab->cmem_offset = ce_remap->cmem_offset;
+		ab->ce_remap_base_addr = ce_remap->base;
 	}
 
 	ab_ahb->xo_clk = devm_clk_get(ab->dev, "xo");
diff --git a/drivers/net/wireless/ath/ath12k/ce.h b/drivers/net/wireless/ath/ath12k/ce.h
index f44ce2244bcfdb60d505d51096ed70b3965952c9..38f986ea1cd2bf6e7739ca939a3db66644c4ac77 100644
--- a/drivers/net/wireless/ath/ath12k/ce.h
+++ b/drivers/net/wireless/ath/ath12k/ce.h
@@ -85,6 +85,7 @@ struct ce_ie_addr {
 struct ce_remap {
 	u32 base;
 	u32 size;
+	u32 cmem_offset;
 };
 
 struct ce_attr {
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fa04aaa836fcba9d647b2127651cb366046e2e73..3c4a8f834b70ffe1005e761aabbb966c30cb8ff0 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1060,6 +1060,7 @@ struct ath12k_base {
 
 	void __iomem *mem_ce;
 	u32 ce_remap_base_addr;
+	u32 cmem_offset;
 	bool ce_remap;
 
 	struct {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 9995eccd32d39f69191f0308b67d35ed3501ebf9..82b4f5b9f570076e3ca64dec7b866e1d88787789 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -695,6 +695,7 @@ static const struct ce_ie_addr ath12k_wifi7_ce_ie_addr_ipq5332 = {
 static const struct ce_remap ath12k_wifi7_ce_remap_ipq5332 = {
 	.base = HAL_IPQ5332_CE_WFSS_REG_BASE,
 	.size = HAL_IPQ5332_CE_SIZE,
+	.cmem_offset = HAL_SEQ_WCSS_CMEM_OFFSET,
 };
 
 static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {

-- 
2.34.1


