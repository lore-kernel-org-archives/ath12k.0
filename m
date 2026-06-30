Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96937C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc9ZgSH1IhNcvRK3+f/zV7bRmIGfWIN4CPW7NYpsFnY=; b=GUFcophBX0YPGn2GF5XQcZOsTu
	CjGQFEH1DLRZ8unD/+WFpQPvs8J1mLju0+wtNshgG+ook14t60I1WDRDughsCo/WmjcC1gj6U5nnt
	gadmCyQFg10gFhaoLPvJbyI3nKLzit+9+Nlh9sho8BGfOvGTAyiOPox+EaJZJ0QaXDZ4hvQMSam9v
	xUlnuRNQrG4jkaZm3RhqzogJjltrsnkCJ6PQOb41avBF/gM2uDnyqjyjE+vrsfh1CG0eoaxpXz1rx
	r+uz9OZVNM5+G20A/5b2B+fnJT8ahav73TRUwSkGN1ozqC8i8PRqvGagjeUNQ6+WBbo8N7A7JPdM6
	aKuoY5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRqD-0000000Fuy4-1XMC;
	Tue, 30 Jun 2026 06:21:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRqA-0000000FuwF-1Fza
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 06:21:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CL031056057
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tc9ZgSH1IhN
	cvRK3+f/zV7bRmIGfWIN4CPW7NYpsFnY=; b=j0uc1K07spziNDsQ7oK1GcNV/HC
	SL9TGlvjVIx3c4dhmQDjuePVgfLxNW7rXF4ANy+KCHToH6zySauTlhe1OXo1RtjY
	7Ykm24e4S5/1CamVUZ+CQTVeF3hgsmN1T+wgHWeqfvTloLThAv/W4PT+08ZNEN2T
	f2YnAe2Vml6krS4XqZzjtrukc/USUApAabiHTHgGOgQRMsC/dwUIBhEymhPJK2ra
	+pRQggdwqhrA5wdSEzr8TOa2nPaRBA1TNpzxVHz0mVIp3GMf2RdLAQVSJCBIX9+T
	DS1/dmoP44oFTqf4tz1V8tAu0W0WqhQNKjLSWv2CWUWzYwM9pulXepeiqRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46860ges-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:21:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca0481106cso14870295ad.0
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782800460; x=1783405260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tc9ZgSH1IhNcvRK3+f/zV7bRmIGfWIN4CPW7NYpsFnY=;
        b=agV1jB24V7v0m5n/gFL9wFoIOXVUpWYjUf7qfJnSiKFSHN2ZYRLSCwUxubS3srYlxi
         2Z6h81EcUxiHXyGdbBeAV/iWZzaQ4eUCRUf4289gyZod2HzMGN3+ykU/D/28qYivLvnw
         8ku09F1Qp+g2AGs2tkWwHDO1JkG/FQzl1rZi1jMYe6YNUOgw1ibXm+D3pXOzStEFlycQ
         KMnP8tVDXU14yBkwSClcdxzUG1efvB7VrO0Jnp5mRAcuKKyetJyWhAVTplhwybp4g20U
         GLaLaht2LULW08oegwOvwkme9BypVDxUIP4WRmL3J982IzekQwPmYGu6CcZtf605oJf+
         pgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800460; x=1783405260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tc9ZgSH1IhNcvRK3+f/zV7bRmIGfWIN4CPW7NYpsFnY=;
        b=hNbBh8x8WsagMhU8noYwhglxNHfV+IhYw/OJlgOpYzXYi7xlgxS3W2Y38u7Lz/X703
         J3w3ZcHMK8+EuNO/+uxzY6GEOcd1KWXKEEfhc6KzUxPaQqY09HoSZoFBJAcZvBuXQlkY
         3acbSRl7y/OU2sXNFC9P+KeJWP3Y3bDd3myRiHCz9gqHRZ5iEYj+iuaKFEtAZR7Bh0hF
         SfLZP45mVebDLySv3HV9pqWv9nJWH88lBHE3ALSjiKxg0OlKy4IZ33aLqYKjd7B2bUns
         geo2r2Vb9NXFil0nVEwxs1wv2LH14pX85EhU0l8lZF5vHgWlmcK7HoSjyh1/OZI4Le+/
         59/w==
X-Gm-Message-State: AOJu0YxVM/2JYyGtCqbGjZWvniKzLGArzDLBKuu4mpW1oBZbh2rkABMq
	GiYKkuqV4eZVlyp2B290777Jy94JQmHKCquRxIVykposGnbSsDn1f+/Nz7buV/4+wfbRThAGpE3
	sb22xO9NVBFbvthugDYKPHL2xeOzklFQv1yWy8A5zEUeyCUj/+RrkuVSZUHUjAQbNZVSheIyD
X-Gm-Gg: AfdE7cmIBnQacg5Zjw+w0vMgv9l+BrhWCaPUJ4gVK1h37fkscqHZSR2L2XSxqlQkTVb
	h1X+dFm/s8qBSMMIV2kEQYuYSWU6xjDoK+xp7FQsncoHwQVLqvVbPhrQBPGyJyraLs5iGmSEDhh
	YUaHn8ABvD0G8Z9yb56snM7q0BMYbQ/v9LFC7vkp11UMRriFlx3NnWDXdNFDBvLLgWjkx8yW26i
	a7p57tmHfarpw9Nr1FCP3+irK1689QYZ1fHJ88kHSyJUpUERUYZ4fcUBO/mbMu5238AiwH2Pa0x
	AxVgGcgUDHbD10cBm/T2XOZrRfqgztNowc98HvBtpEWvnFkJSWdG9Atevx15ZRZ7wj7+AfcziNn
	dDYUQRV/5cQrayt0pzt1z6HYy/NNf9C53Ehgo40mgs5G+9HPuieXDo0Uu+uxPAZdjE34afIHmIH
	lWG6CWONqre2NrpYlL34u4rffkHCrF8oitnA==
X-Received: by 2002:a17:903:2347:b0:2ca:1bbe:c3d0 with SMTP id d9443c01a7336-2ca2eb32b77mr17377565ad.43.1782800460217;
        Mon, 29 Jun 2026 23:21:00 -0700 (PDT)
X-Received: by 2002:a17:903:2347:b0:2ca:1bbe:c3d0 with SMTP id d9443c01a7336-2ca2eb32b77mr17377295ad.43.1782800459640;
        Mon, 29 Jun 2026 23:20:59 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm6413835ad.80.2026.06.29.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:20:59 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/3] wifi: ath12k: refactor QMI memory assignment
Date: Tue, 30 Jun 2026 11:50:47 +0530
Message-Id: <20260630062048.1615178-3-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 276nOi64urykXa99v_IQO_rYBnGzQ_5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX2kiMEe60k+ym
 hGSfU+Wfw7XZkZxQ3kFacVNWI8JC2WzZXO+WgsAddq3c8rnZDw2IPb4xmVhy9tmJK2Q1MzkAx2F
 t6lRr4sTY4nsYZ/rremhavkHFc67iRTVOju8EivrkeReeT7kcpatGJIGi5hmap1slvaSoFcDKV9
 x8YUk3206paHWKcMkRztKEsi9rnds62wlEHqT7mtUic95bmIyxvn2XPvjCoycl6cNewy3DUZecv
 vOKXBRPELyJ6KNFoIKFAX5umAMwfvnIhMChUFTdzE31YZAVd1cVRr7fW9Km7qhiWP+UhkZqfUL9
 0HuhfZbe05ekLLbTkVMnrdOebpQN6tsuZAESwaH3YorK9zzfgK5ZGG2bz3788qOZ+qIXWrnqwJE
 YeMybCwY3NLbf1ZAgx5Nd3CAwbN98n2RWFVZGzK8v4wCBIVsYZdx+B6a/MoNFQxPBhSIa4PHAtt
 uDdlodnuxEtLJIZKzMg==
X-Proofpoint-GUID: 276nOi64urykXa99v_IQO_rYBnGzQ_5w
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43604d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FsuqK5EfqoqfIKw4FYwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX1DUi7rBSvzYn
 qELCxNK0zVepBkuVwS13UkWdGTt/l26hRx+tY1R5mXKQ/j+JTIgKSpnlEZEeMUwcLUnRS+fsm8W
 9H0c5HVF3uIRI7pwkqLM/KXuz6dJfdE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232102_467877_98682368 
X-CRM114-Status: GOOD (  17.63  )
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

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
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


