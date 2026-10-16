Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73717CCA466
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=xNjRyzZHelslMYgdrc1YWZeRJ9
	Xn5rNKHuY1lYmTu7cLmtTtSOjhatq5XxXMWJTnXCCu8dbJY2g8iiQCNLctZ5jV+j0/yE6edUeefD1
	BSKoOTN4Ey5gegfhjyuZVVznG3/b7DlqqglJzSqSgadwE+K3Laoj+yWJ8uS7KIwMsAEFnvS4Qpdi9
	G7AT+3GohZeuKv1FY8i7s8ha/Diy0QOXjoESekQzNe+ZXLYDHTryWM51s7kHGHEqcOgzS+/L/4KaG
	mSKatApgLpX0G5YJKeEuH0pUCEIaIageR2lPdgOdgDtOf4w5RTapUAeF3VWfm1uAkKad3JnLj1d9e
	YQjiCjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWm-00000001piO-3zKI;
	Fri, 16 Oct 2026 03:22:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWl-00000001pgO-0AUu
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=dHAvgmSSDUpgb1L1ToqkU7wEag
	CTQ8RH0yZWSQNxRjWtzb+98cICiwkMxHdouZXssuMOHdT6yKFhbRLFDJco9y+lYAHRb3Y0P79C+qN
	U7LwqErFHI25MHBrOE8JRIyGNqmOVSUHRNGx9rC9B0ysODo57A7Gytggp5qt+0GggbHLMoD1LJ7Sm
	w3vsu1zhjlgM7CYy6KWR41K9MczqwqQndCdrqpUeK51qtbmmfLJxXsIbC/K0pYGC3AS9cH8Ir+0Pi
	H+Zlp+26TiBKP+b/a9auXTGPR1J95GMcJGDpADZVliQp0iCqch4IA8wcbQ1w7AGLs/RKP+San8Ii+
	u1LXszJQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYWf-000000012Wo-0pQX
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCh5c557562
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=Hs6xo075deQa5g+J
	HbNwJvBoKM6xiougM26CaneMWkgjJoqHoMdBsr/3z0ikWuAFVu8dFmenBqSLZtfa
	Cm4CidWmYQmdo2+2q5WwgCCeDN3cjY1XdNZtHW3itl0gaTucns7zo/QipzE+zXoM
	Ns2frhBo33vh33I7aeuSStJ6zr2OoHE2KYoJPFDBTecyCEi0CW2dAc1NFyGvrw5n
	PPPGTKwwPCwK7RKnOtThYGYO5yJJpA5vx67gMuydrpVx6v8UspcLk1gaefxuvdKx
	GF01L4+75etKT7YMKa8OEfeOry1ykHEHDsdzyL+vzN+tDpMxASf11i6w7Ig29Zjz
	3gUr9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88p5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso10584831eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120950; x=1792725750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=XQhsuKONf+V2B+0ey1Oh1W3hD4vGj001lB2PCqwqsVDkenx/BX37RWnqj9ZnepHCtJ
         2HZ73Ly2yM7wPmC9rHtP8tZ4GcD6EiMtBq66AtAz788Wmu0ye5DQZMQdPeo8tnoHYxmt
         tlHnMJlGFy7stkgyLKtn1bMK6iey/ddUEG8hR5NAkXAovmdlBWAODtYmf3BpsaVhrJjZ
         +NEWr0B6sxozaWM+VXly9YzULWblsx5GFTx95ZbFy17Gi9QxhsKZ3YMaT9iIK8apiJGB
         vNycUZXt/S563WF3a50PhMo/s+xXB9HKkxcNalwia7d19TbWw+6IjSvAqOHszuTxfwvI
         YSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120950; x=1792725750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=N/QC4JF8t9uuCuLrg4Jz/MTfl7847EeQ7+Zm4qnVnfLS9sFMTAaj6Mmfo4fbvrUblR
         xWG+mJjErC8oIJCYw4PPKLZy1l4tYqVAckR5vzJeU0pB1GXo/0KJlGFdzNfklLwXtyY/
         IUePGLqjUWSGLeRX9KBRYnP53A/7a3Unz8MTU0JSBLcndJ5fNCdZrCXyDi3EInUVgIkQ
         oB8gIJUERPLvK53sD6TT65amf55+T+mQgSlkT7DVBTRemmoRHwj3rDOaLhKO76W+Nux+
         J+2kk0KFfezh/deTzLTZUEwloG3eye7CvHTHbRBVJHHbOdz45TRjds/7VzHwiBtx1prJ
         x73A==
X-Forwarded-Encrypted: i=1; AKwUvBwtY3RbM3P6KhKZZ8UmImP3wpaazU7fcEefqhuWDYlLHaBoedQZZx7m22uJRVkf+rR+4NjtieE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJbCapkT6nDCPnIv7ysVPZwuHqrSPevqoqxYEjUcqT/XokdPcaO
	gJFcTgdq1G4OHArdbm/BUypfFtqsiISQnGra8ZmejEJcyiBWaiT+mJcmzlzGmVj543KOD7FBkqB
	iVybShmRrO62YHZvqwh5EG3Z/nvwYpuXlmE844nnDEPNW56AU96nvLaMbBLn72/2T
X-Gm-Gg: AYBFou29sS1/3aCEJJB37G0xNsC5gZgBJ6FrSS4/gPc7t//j+dkWQF9evYteQ6zWNVi
	gMXteFck++tjvqgF3yiYCZ4Aj5yjvPJmjvER7K8xPNZpEXYrgCljYWJd0aEYkJiTAi3kc6YWG6R
	mN7UUUB1yEavn/evEOMJuDikDWM73VRQzD025Yq18LLTapkduAU3RiWCllq72MCtFtHKPLjHS8p
	GWN7itFzbmx4ESu4TdDuTpeT95U+k9dX8GpH045BaZ9hEYJ9LKOftmy16zaNzexHIc6q4BqLRQV
	xjV1epG2md/pFpwX1tQWeENZL2hdNysoYsLB5bDGfUtVySL0sPaI/3x2zf4BP2+/aOSdmByRP01
	QnkXHuuUi+dEBwe5uJ+nHQJ/412+i5shrQXztByV0JxEMbECkA9CBDoD8as4yJQ/9jKqdvXvWT5
	QY0DMAoeTDTlPcXdLghGq6hw==
X-Received: by 2002:a05:7300:cd91:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3537e13248cmr40625988eec.31.1792120950150;
        Thu, 15 Oct 2026 20:22:30 -0700 (PDT)
X-Received: by 2002:a05:7300:cd91:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3537e13248cmr40625950eec.31.1792120949655;
        Thu, 15 Oct 2026 20:22:29 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:29 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:46 +0530
Subject: [PATCH ath-next v2 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-9-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2JINMdnBaQEt
 tBK2hLTiA4YjCtt7PM6QEXHQxtTMe5UcBER0V0eLVTWo74/qfsgABsRjLAbo8BNjfwGJO5tQktd
 t1Da7IbrAtFJAkiPwN0UeE9hu1DX3Qk=
X-Proofpoint-ORIG-GUID: HnEa3aSNVzyLCVazlyri58IR_DJb9X_5
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad19876 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX56r7ZA6MMFs1
 YMolwMLmAmP1+daL14S1QaYVxR6bGal/sCu/p8Whnd8JN9OCVpw4ENZr0DUxavN701jRKnTTPIb
 mftHGXtvSURXbqGY2E48pJxuSwdcIEDW0X9WZYXI2YnZbAT19EwubZucZBWWASn3c7LJrLQtu/m
 A1kmLnlair3okGeG2U6k2b7emswgWy9YZ/Sh7EecoWzvsoscIbLDEirxyCFsnrQ+9vJOmFeR5k9
 RR2Gg8VTOpwxZ3kAZ9YQlp8YJ4Rst8clQ/bw/0cKxMFXcnqPayD9PrE+8K7wL4/oNJSUbcMrZIe
 hAVEeOy48KgUYm5YSSRNJtkDppgyBCGu+lntdBpAwZW//xmLLAlJndjBqGYA1gj2YSZXe9osctC
 iNo647KlFieoPVma2TZX3HC4xwqOSz4MgnGeeT1vgbUWeZG+yESrUC6YIhn61vJfjRl99N8z/WM
 UmqtBBG8XgxK0GvX/Tg==
X-Proofpoint-GUID: HnEa3aSNVzyLCVazlyri58IR_DJb9X_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042234_366926_5E548F61 
X-CRM114-Status: GOOD (  21.15  )
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

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory
node. The QCN6432 device tree continues to provide separate
q6-region and mlo-global-mem regions, while the memory types
mapped to M3 and calibration memory are allocated sequentially from
data-region.

Track the allocated space using an offset and allocate each required
memory chunk from the unified region.

If the data-region lookup does not return a reserved-memory region,
fall back to the existing per-memory-type allocation scheme using the
named memory regions such as q6-region, m3-dump, and q6-caldb.

Introduce a helper ath12k_qmi_map_target_mem() to initialize and map QMI
target memory chunks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..cc488cfe2b2f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2842,6 +2842,26 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 	}
 }
 
+static int ath12k_qmi_map_target_mem(struct ath12k_base *ab, int idx,
+				     phys_addr_t paddr, u32 size, u32 type)
+{
+	ab->qmi.target_mem[idx].paddr = paddr;
+
+	if (paddr) {
+		ab->qmi.target_mem[idx].v.ioaddr =
+			ioremap(ab->qmi.target_mem[idx].paddr, size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr)
+			return -EIO;
+	} else {
+		ab->qmi.target_mem[idx].v.ioaddr = NULL;
+	}
+
+	ab->qmi.target_mem[idx].size = size;
+	ab->qmi.target_mem[idx].type = type;
+
+	return 0;
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
@@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 	const char *rname;
 	int i, idx, ret;
 
+	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
+	if (ret && ret != -ENODATA)
+		return ret;
+
+	if (!ret) {
+		avail_rmem_size = resource_size(&res);
+		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
+			chunk = &ab->qmi.target_mem[i];
+
+			if (chunk->type == CALDB_MEM_REGION_TYPE) {
+				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+								chunk->type);
+				if (ret)
+					goto out;
+
+				idx++;
+				continue;
+			}
+
+			if (offset > avail_rmem_size ||
+			    avail_rmem_size - offset < chunk->size) {
+				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
+					   chunk->type, chunk->size,
+					   offset > avail_rmem_size ? 0 :
+					   avail_rmem_size - offset);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
+							chunk->size, chunk->type);
+			if (ret)
+				goto out;
+
+			offset += chunk->size;
+			idx++;
+		}
+
+		ab->qmi.mem_seg_count = idx;
+		return 0;
+	}
+
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		if (chunk->type == CALDB_MEM_REGION_TYPE) {
@@ -2860,10 +2922,11 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
-			ab->qmi.target_mem[idx].paddr = 0;
-			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = chunk->size;
-			ab->qmi.target_mem[idx].type = chunk->type;
+			ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+							chunk->type);
+			if (ret)
+				goto out;
+
 			idx++;
 			continue;
 		}
@@ -2904,16 +2967,10 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 		}
 
-		ab->qmi.target_mem[idx].paddr = res.start;
-		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
-							   chunk->size);
-		if (!ab->qmi.target_mem[idx].v.ioaddr) {
-			ret = -EIO;
+		ret = ath12k_qmi_map_target_mem(ab, idx, res.start, chunk->size,
+						chunk->type);
+		if (ret)
 			goto out;
-		}
-
-		ab->qmi.target_mem[idx].size = chunk->size;
-		ab->qmi.target_mem[idx].type = chunk->type;
 		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;

-- 
2.34.1


