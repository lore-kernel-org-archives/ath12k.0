Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C875CD98CF
	for <ath12k@archiver.kernel.org>; Thu, 11 Jun 2026 03:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g43XeO4Dh6cO/pZEQr5ju05m3Cr2XMlgsLAM3KbtotY=; b=08bU307bwzJKS4opHeQmpDzopf
	XWeDwkubZ93bge7+2Zas0Fzy3m8QkBCgIJ/Ktbp0adNqhrphf6ulOR25GoFgCnaSqDE85fiE0B2Y2
	WPxN3N5uzpWIgSaVM6rkqo/nXs3w+i/diY1eugrehObv81bq+Px3+95e4lvqPnWJWybLDhdmD8ruV
	e4unkdKqVnDlh2cd6UXbV/GpJQvRwsv1QJasoLy2XVDulOz3jNCdYpfD+6v+s6dg7F2s/w6j26bm2
	WqRCN9pxDGAGRJP8UKGWupVeDEv/YIV7ojZCip0etZMJoCKLn6cQkHGGgXSkFFaJJZwYyFUVAUMFG
	XzZhgJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAY-00000008cGl-3zA4;
	Thu, 11 Jun 2026 03:33:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWAW-00000008cFk-3287
	for ath12k@lists.infradead.org;
	Thu, 11 Jun 2026 03:33:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NxiH3160173
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g43XeO4Dh6c
	O/pZEQr5ju05m3Cr2XMlgsLAM3KbtotY=; b=FPdrR/SMKM76elVTWCnDM1s/ez5
	0mpPl4zuZLhUD+PXIxULF3mDhMa2j83cF2rZGY0Idy6c0JZ6bYg5ivY78ABmGwhQ
	N2JAia+HhMMS0ixdtzNZNmtgvhPPI4HVK+9nOwAIKXQtZWKzUlS7y0UYWUdeKeNA
	3bCN/YRL0HpIz77wTgzJV0YsXusENVYcpSQ8eOCD5Q38n8qH1AUr4U8xl9y7RxU6
	0/999F4MTKgUBia6cRZRwen5DrL/itNVVpcaNtmNWirDmKfM84mk6TwxbMhIifR0
	57N4bH5GhmF2EJ9hCsU2eVa9+ohSLNGnIeVlZLcAtPIlrem7vZhDPnGNscw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701e9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Jun 2026 03:33:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so7356292a91.2
        for <ath12k@lists.infradead.org>; Wed, 10 Jun 2026 20:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781148804; x=1781753604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g43XeO4Dh6cO/pZEQr5ju05m3Cr2XMlgsLAM3KbtotY=;
        b=JP4/9dsjWs1ePmyahhMgrTUszO94V9XAQBcE5i5CiG8cVrr4I3lgtJe5BDIfcOhOYl
         vb+JZ/WSKMZ4H3Rh8pswEJgmdJsd8COGuYQZ7T96YxORdSTjr5Q32epHvMlO9Uj29Edw
         QZunojb9JO384UD3dhbHuasKlDXADsY7t8+132VNbPngxi1vS3JU0kJmoKVekW1BcUPz
         de+aH+eF0Rvru5T5FfbAXK+stScNZYfjlB6zf7HEWwx/bn/Ezk4Cx4xBWTwJpAM96Ryp
         bwo+sHsu7I3dZB5cxMR2Ov6sT5HTr3D2/2fWa3KwEXvWTgYO55MJu5zsxZvZ/9A7wrKN
         6N3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781148804; x=1781753604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g43XeO4Dh6cO/pZEQr5ju05m3Cr2XMlgsLAM3KbtotY=;
        b=gQyTbxuJwOJjS0llqxoFsOIsb8UBGpAOC8V8SCHRltOgO0TJFBGTZpahnnJJjlk6qL
         Dh2zwb4nIlkqND4Oh3afmL3n5Ak/LYoml+kDUeto2DxjELq6sC/fvKGhrqjZaE+RWjEe
         CwFMIbxm+lX5JuhfJFjpM6Sp0OLAwok6U2AYKwqw+ofoLUrxOGtEXUgTVBmGGnFhtIKT
         UzG1dcC+HTvygBkzzX/gXdoG9lo024incAtXv5U7anJoNIcfIo+b95kFYA+jEyuvnNyN
         zfb4bCZJbwCYAqmEzgymBAn4s3o37cimie+VYmELtTA5a8sOD3LG6tDPaDea1fdJZd3R
         HV8A==
X-Gm-Message-State: AOJu0YzI2Td0gx5T7sxRAfuk/d20C+K/l3gAhtJvjgVzqWt/CHQKPHft
	WKM7M34ts9vt9qhKZ7oowFe8lR/rYBq2WyIt1jsug9M67dr21vLr8ndeVLy7X0qwcSk+JZHu7NL
	zuTzlj9YHeWIg8W665052I7QuV71CppgYXuCv/dHPqoGkUns4O19qsIzu8XBwN1fJlJKZaE/Q
X-Gm-Gg: Acq92OFaOhktgM0lYzoKslMIVRawK8gAn2vusivj1pk0ELSPTKGF4vT4dlgkHHT1PLj
	UkYAg/VcZxMQrQGTxoVqRKonhM+QWaiwiGV+FC9o1J9REPrvL6hedegwsez69rWDaabk9D1ILeI
	ZuG6ABVeSrPgndd1Vo2l/Rf2xa1ET6Tv1wbCSQzy3XEtMLsTTQUTVvO9etE/3at+NhxhpKIH64S
	w+COIoyATz6wvy3kMccBeTAcdKT1LQCkRrY0fMlwQ+tYtgY6igE0sEuFZV87EEVXR9YtgrCiUYP
	Pzvk2YK0EX7GrmhRtzton5Qydh9rsFpLF3rwCxbWyJ98G+v4e2M0MEsYwKaWqnvUTWNUF3ZFCNX
	eyu/Q/JqeO2dwDeXznekGoQT5wI4iiFsBJqmIDdN66E/zT6kKe6/1I4oQysmwhyd9SpwKxLdiaz
	ix0TaDG5sEd4EUr+soMZzqln/ykOgPJTS7LCYablGGuRjcH8LGjGyJxmY=
X-Received: by 2002:a17:90a:e7c4:b0:36a:f612:e695 with SMTP id 98e67ed59e1d1-377a591536fmr1193540a91.17.1781148803578;
        Wed, 10 Jun 2026 20:33:23 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:36a:f612:e695 with SMTP id 98e67ed59e1d1-377a591536fmr1193501a91.17.1781148802969;
        Wed, 10 Jun 2026 20:33:22 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775287186dsm896041a91.6.2026.06.10.20.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:33:22 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath12k: refactor QMI memory assignment
Date: Thu, 11 Jun 2026 09:03:13 +0530
Message-Id: <20260611033314.2330-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX/WZR8ugtJNel
 +AHGbWKQjFuZfxgaZTdUmnlYCAVhNKXVN8RzIYKGfs88CiNVh/Bq7SxPI04repELEuLb9TWypE3
 vOB+OU6fYjsGosU+wzwBcy7mZLFJ0ckB4A4TTgMKNnPV7WGMpoWWD5mJKDXlMbHal0OmlBUqGRY
 7csgjHEUUqrulUyyTS2V/vHiUFyFO1/z3hsnhAkU7AXLgJheVse1SV/tlpDX8iagE0PFPZ9wo9G
 VO+Z4fZhGObCqpci82prUm2OjbNCwWXzhlNe8lRGV+IhNK4N8sPkgeYzv9zKes1xSaAlPB4r9J5
 323Q313XyEB7/EhoOy1efIfXbqupnPLfmFNao95WFtu+eAVL/OT9PiePFJWS3x5CmUGABDQmTH3
 r5nsNtMeqxBxvIatk017N5mWsqHIdVZwYA/0of0t9UJcLUYRLcGMNk4WV62JGKP6+jmdtr0NAZ3
 CYFnjz6wXCzA/jselaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDAzMSBTYWx0ZWRfX5kThoDDBgqu0
 jMuQ2tkYz19pOJkAX93bT1HmHZOnI3JIARwyv2a0BEuGFJXRc1LXD5ymgbd6Vj53uKYGkLD4flr
 af8RCTUCH/P+trr7wtpOW/snlzT0Wtc=
X-Proofpoint-GUID: SVZ5oeoPkbEA_PQ7Dmg6gRrX3NB0NALv
X-Proofpoint-ORIG-GUID: SVZ5oeoPkbEA_PQ7Dmg6gRrX3NB0NALv
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a2c84 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FsuqK5EfqoqfIKw4FYwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203324_765317_7C91B3B0 
X-CRM114-Status: GOOD (  16.82  )
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

ath12k_qmi_assign_target_mem_chunk() uses a large switch-case to handle
both memory region identification and allocation for each memory request
type, leading to redundant allocation logic.

Refactor this by introducing ath12k_qmi_get_mem_reg_name() to map memory
request types to their corresponding reserved memory region names.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 157 ++++++++++----------------
 1 file changed, 61 insertions(+), 96 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 0176d6a4bf8c..5bf045971c94 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2726,120 +2726,85 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 	return ret;
 }
 
+static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
+{
+	switch (mem_type) {
+	case HOST_DDR_REGION_TYPE:
+	case BDF_MEM_REGION_TYPE:
+		return "q6-region";
+	case M3_DUMP_REGION_TYPE:
+		return "m3-dump";
+	case CALDB_MEM_REGION_TYPE:
+		return "q6-caldb";
+	case MLO_GLOBAL_MEM_REGION_TYPE:
+		return "mlo-global-mem";
+	default:
+		return NULL;
+	}
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
+	struct target_mem_chunk *chunk;
 	size_t avail_rmem_size;
 	struct resource res;
+	const char *rname;
 	int i, idx, ret;
 
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
-		switch (ab->qmi.target_mem[i].type) {
-		case HOST_DDR_REGION_TYPE:
-			ret = of_reserved_mem_region_to_resource_byname(np, "q6-region",
-									&res);
-			if (ret)
-				goto out;
-
-			avail_rmem_size = resource_size(&res);
-			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
-				ath12k_dbg(ab, ATH12K_DBG_QMI,
-					   "failed to assign mem type %u req size %u avail size %zu\n",
-					   ab->qmi.target_mem[i].type,
-					   ab->qmi.target_mem[i].size,
-					   avail_rmem_size);
-				ret = -EINVAL;
-				goto out;
-			}
-
-			ab->qmi.target_mem[idx].paddr = res.start;
-			ab->qmi.target_mem[idx].v.ioaddr =
-				ioremap(ab->qmi.target_mem[idx].paddr,
-					ab->qmi.target_mem[i].size);
-			if (!ab->qmi.target_mem[idx].v.ioaddr) {
-				ret = -EIO;
-				goto out;
-			}
-			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
-			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
-			idx++;
-			break;
-		case BDF_MEM_REGION_TYPE:
-			ret = of_reserved_mem_region_to_resource_byname(np, "q6-region",
-									&res);
-			if (ret)
-				goto out;
-
-			avail_rmem_size = resource_size(&res) -
-					  ab->hw_params->bdf_addr_offset;
-			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
-				ath12k_dbg(ab, ATH12K_DBG_QMI,
-					   "failed to assign mem type %u req size %u avail size %zu\n",
-					   ab->qmi.target_mem[i].type,
-					   ab->qmi.target_mem[i].size,
-					   avail_rmem_size);
-				ret = -EINVAL;
-				goto out;
-			}
-			ab->qmi.target_mem[idx].paddr =
-				res.start + ab->hw_params->bdf_addr_offset;
-			ab->qmi.target_mem[idx].v.ioaddr =
-				ioremap(ab->qmi.target_mem[idx].paddr,
-					ab->qmi.target_mem[i].size);
-			if (!ab->qmi.target_mem[idx].v.ioaddr) {
-				ret = -EIO;
-				goto out;
-			}
-			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
-			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
-			idx++;
-			break;
-		case CALDB_MEM_REGION_TYPE:
-			/* Cold boot calibration is not enabled in Ath12k. Hence,
+		chunk = &ab->qmi.target_mem[i];
+		if (chunk->type == CALDB_MEM_REGION_TYPE) {
+			/*
+			 * Cold boot calibration is not enabled in Ath12k. Hence,
 			 * assign paddr = 0.
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
 			ab->qmi.target_mem[idx].paddr = 0;
 			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
-			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
+			ab->qmi.target_mem[idx].size = chunk->size;
+			ab->qmi.target_mem[idx].type = chunk->type;
 			idx++;
-			break;
-		case M3_DUMP_REGION_TYPE:
-			ret = of_reserved_mem_region_to_resource_byname(np, "m3-dump",
-									&res);
-			if (ret)
-				goto out;
-
-			avail_rmem_size = resource_size(&res);
-			if (avail_rmem_size < ab->qmi.target_mem[i].size) {
-				ath12k_dbg(ab, ATH12K_DBG_QMI,
-					   "failed to assign mem type %u req size %u avail size %zu\n",
-					   ab->qmi.target_mem[i].type,
-					   ab->qmi.target_mem[i].size,
-					   avail_rmem_size);
-				ret = -EINVAL;
-				goto out;
-			}
+			continue;
+		}
 
-			ab->qmi.target_mem[idx].paddr = res.start;
-			ab->qmi.target_mem[idx].v.ioaddr =
-				ioremap(ab->qmi.target_mem[idx].paddr,
-					ab->qmi.target_mem[i].size);
-			if (!ab->qmi.target_mem[idx].v.ioaddr) {
-				ret = -EIO;
-				goto out;
-			}
-			ab->qmi.target_mem[idx].size = ab->qmi.target_mem[i].size;
-			ab->qmi.target_mem[idx].type = ab->qmi.target_mem[i].type;
-			idx++;
-			break;
-		default:
+		rname = ath12k_qmi_get_mem_reg_name(chunk->type);
+		if (!rname) {
 			ath12k_warn(ab, "qmi ignore invalid mem req type %u\n",
-				    ab->qmi.target_mem[i].type);
-			break;
+				    chunk->type);
+			continue;
+		}
+
+		ret = of_reserved_mem_region_to_resource_byname(np, rname, &res);
+		if (ret)
+			goto out;
+
+		avail_rmem_size = resource_size(&res);
+		if (chunk->type == BDF_MEM_REGION_TYPE) {
+			avail_rmem_size -= ab->hw_params->bdf_addr_offset;
+			res.start += ab->hw_params->bdf_addr_offset;
 		}
+
+		if (avail_rmem_size < chunk->size) {
+			ath12k_dbg(ab, ATH12K_DBG_QMI,
+				   "failed to assign mem type %u req size %u avail size %zu\n",
+				   chunk->type, chunk->size, avail_rmem_size);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ab->qmi.target_mem[idx].paddr = res.start;
+		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
+							   chunk->size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr) {
+			ret = -EIO;
+			goto out;
+		}
+
+		ab->qmi.target_mem[idx].size = chunk->size;
+		ab->qmi.target_mem[idx].type = chunk->type;
+		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;
 
-- 
2.34.1


