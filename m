Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B7EE77175
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nQK4f3el+qJanlB4qbJMhi0R1L7N/CsD2G7j33fudc=; b=MBIC4UGalHwxJjJbXdcCfX4UVn
	boceyhFnDtZVhrRwsCcDzYlm0Zsbh1kM/S0TpQKXuVbGbPVNcwbWnkCOHVuCCWMAaZgGnZ0oAyVyO
	nHgBFuZgJuFJQc8/ud/g5+w41FqIaNWbFBJ1JHZ22FXqwypQ7Xp1r0YgwI09aOREXSXv1A7J0YhN3
	t7SryFY0EPRwSzTIwEsVuf1wSotcp0jXW8PYOKCa8EsV+QWyFeFMyH9GNNSygyGe8vbSEctCQtiB9
	tAtpBy+/WsQCnFuicjii6m8S8xv6T4X/EvplfDaDThQagOfmfs+MAF2ZYjd0I6/ljEJl9EnCHlEbY
	HbYWpSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUy-0000000HJRj-0O51
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:30:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUv-0000000HJPm-3BtM
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15972A4179A
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E8CC4CEDC;
	Thu,  5 Dec 2024 20:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430652;
	bh=STfKckyL0TMpxsYw5pn1QelzJf/9pGSJYyWVqtZs/DY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ln1WEEgi5AwNjjG1Al06I5Rl17ncLg9m1Uy4VjqF8VXU8I0bmchqFmbNEuPQ/aAKC
	 7sa3Z8Tqw+/FibkRcJ652RAkeZqlbwlgXn5hGh5sTLnqxp0OXok8VmmFdtoqeaA3en
	 WbcaC8Bq/RSEhorU6XhWF6hJivUCwa3rpp1nfsU4a1RAvZb4A4+dQkAXIlnFVUh/tu
	 Cb0lNDY5Aq5KUc4jpUlva+37JNBFUg6vDDesoTKjdwySPUGytmAAUHj0+ma+zyadII
	 DWUqwBAQscOjftwjD/uOjYl2SlErtcxrP/ZEIkYQoR/vDkzduF6RyeXar37lj9yHm1
	 UsU8zvL61jzzg==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/8] wifi: ath12k: refactor ath12k_qmi_alloc_target_mem_chunk()
Date: Thu,  5 Dec 2024 22:30:40 +0200
Message-Id: <20241205203044.589499-5-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205203044.589499-1-kvalo@kernel.org>
References: <20241205203044.589499-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123053_949636_D08AD00E 
X-CRM114-Status: GOOD (  16.81  )
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

From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Currently, all QMI target memory types share the same allocation logic within
ath12k_qmi_alloc_target_mem_chunk(). However, for Multi-Link Operation (MLO),
the firmware requests a new MLO global memory region. This memory is shared
across different firmware (SoC) participating in the MLO. To accommodate this
logic change, refactor ath12k_qmi_alloc_target_mem_chunk() and introduce a
helper function ath12k_qmi_alloc_chunk() for memory chunk allocation.
Subsequent patch will add MLO global memory allocation logic.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 82 ++++++++++++++-------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 2f10c83ef54a..7f3d5b269b9e 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2423,9 +2423,50 @@ static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 	}
 }
 
+static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
+				  struct target_mem_chunk *chunk)
+{
+	/* Firmware reloads in recovery/resume.
+	 * In such cases, no need to allocate memory for FW again.
+	 */
+	if (chunk->v.addr) {
+		if (chunk->prev_type == chunk->type &&
+		    chunk->prev_size == chunk->size)
+			goto this_chunk_done;
+
+		/* cannot reuse the existing chunk */
+		dma_free_coherent(ab->dev, chunk->prev_size,
+				  chunk->v.addr, chunk->paddr);
+		chunk->v.addr = NULL;
+	}
+
+	chunk->v.addr = dma_alloc_coherent(ab->dev,
+					   chunk->size,
+					   &chunk->paddr,
+					   GFP_KERNEL | __GFP_NOWARN);
+	if (!chunk->v.addr) {
+		if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
+			ab->qmi.target_mem_delayed = true;
+			ath12k_warn(ab,
+				    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
+				    chunk->size,
+				    chunk->type);
+			ath12k_qmi_free_target_mem_chunk(ab);
+			return 0;
+		}
+		ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
+			    chunk->type, chunk->size);
+		return -ENOMEM;
+	}
+	chunk->prev_type = chunk->type;
+	chunk->prev_size = chunk->size;
+this_chunk_done:
+	return 0;
+}
+
 static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 {
-	int i;
+	int i, ret = 0;
 	struct target_mem_chunk *chunk;
 
 	ab->qmi.target_mem_delayed = false;
@@ -2442,42 +2483,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 		case M3_DUMP_REGION_TYPE:
 		case PAGEABLE_MEM_REGION_TYPE:
 		case CALDB_MEM_REGION_TYPE:
-			/* Firmware reloads in recovery/resume.
-			 * In such cases, no need to allocate memory for FW again.
-			 */
-			if (chunk->v.addr) {
-				if (chunk->prev_type == chunk->type &&
-				    chunk->prev_size == chunk->size)
-					goto this_chunk_done;
-
-				/* cannot reuse the existing chunk */
-				dma_free_coherent(ab->dev, chunk->prev_size,
-						  chunk->v.addr, chunk->paddr);
-				chunk->v.addr = NULL;
-			}
-
-			chunk->v.addr = dma_alloc_coherent(ab->dev,
-							   chunk->size,
-							   &chunk->paddr,
-							   GFP_KERNEL | __GFP_NOWARN);
-			if (!chunk->v.addr) {
-				if (chunk->size > ATH12K_QMI_MAX_CHUNK_SIZE) {
-					ab->qmi.target_mem_delayed = true;
-					ath12k_warn(ab,
-						    "qmi dma allocation failed (%d B type %u), will try later with small size\n",
-						    chunk->size,
-						    chunk->type);
-					ath12k_qmi_free_target_mem_chunk(ab);
-					return 0;
-				}
-				ath12k_warn(ab, "memory allocation failure for %u size: %d\n",
-					    chunk->type, chunk->size);
-				return -ENOMEM;
-			}
-
-			chunk->prev_type = chunk->type;
-			chunk->prev_size = chunk->size;
-this_chunk_done:
+			ret = ath12k_qmi_alloc_chunk(ab, chunk);
 			break;
 		default:
 			ath12k_warn(ab, "memory type %u not supported\n",
@@ -2487,7 +2493,7 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			break;
 		}
 	}
-	return 0;
+	return ret;
 }
 
 /* clang stack usage explodes if this is inlined */
-- 
2.39.5


