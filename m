Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB42E7716E
	for <ath12k@archiver.kernel.org>; Thu,  5 Dec 2024 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxIi56FEzPQ6ak24kw+qlmbop0bdsCz5KlWXPBNw7ms=; b=LEoV6/J3XBa2GS7bbU8JeC+5Rs
	nTdGTJf4vy3FW9s/QW61tnYWKgdkg6MDwPfcrZaKA03mJP68UAuW0sHEs/nPitVg0bRvLKXbqNF8C
	BNA/w6nsV2nNTj6BmKUU7kdATj1pb36LwIo7TUGl3A0BG14SQozHspp9hnA9dQdGpABKNt9+1LCQI
	uo/y2w93P1kx1CGoACEx5Mqqj1p27Dk8tWUiacXob359adseEfYq0AhDQ/Zk9GESC0Tg7iBlrrnvw
	GZK/jSWMQUf09n+6h7lBHv3OL+J0FRePofZp3Jd80nXYdQSLI41Io7xo4leveDSGgHAA0karfvCFl
	fx8r/bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIV0-0000000HJSl-44mh
	for ath12k@archiver.kernel.org;
	Thu, 05 Dec 2024 20:30:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIUw-0000000HJQi-3CpH
	for ath12k@lists.infradead.org;
	Thu, 05 Dec 2024 20:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75DCB5C598D
	for <ath12k@lists.infradead.org>; Thu,  5 Dec 2024 20:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393E3C4CEDE;
	Thu,  5 Dec 2024 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733430654;
	bh=0MpnDzEdOw00/eEu1dedSOMrvM8zY0rTM/h1/lkQtCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2vt+NJGnGruQ0LXODJ2Cmd4CNLYtnjMh/SzKb1wDCMwDkBGRJVldwV1cLMUl9CfT
	 Pq0og7nSBqca7WOUOPfsly9f+g7wIQKfzE11uWvaXmzsBAAk8zLvQSzqLxP8/mHGfG
	 btY4hK5ewXE8D+pFvkUspk4LVoZrAe+aZjIpe7vKqukyoZUlV8tD0hk7RK5wLwRHye
	 PrUIHYR2dFK5nzzvj1yrOrV/+fymjvfbzj2LvoAU4jLaWuHS7Nm1c0Zc3PYn+JX+xc
	 E+/fb8Y4w7O5q0/2u3ykFqPoRzaZidHmAY07K4X4FLfenWLN/K/Vhgl2F796ggskkJ
	 0MAaH4IjY82Qw==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/8] wifi: ath12k: add support to allocate MLO global memory region
Date: Thu,  5 Dec 2024 22:30:41 +0200
Message-Id: <20241205203044.589499-6-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205203044.589499-1-kvalo@kernel.org>
References: <20241205203044.589499-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123054_889823_909CD09B 
X-CRM114-Status: GOOD (  19.32  )
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

To enable Multi-Link Operation (MLO), QCN9274 firmware requests MLO global
memory (MLO_GLOBAL_MEM_REGION_TYPE). This memory region is shared across all
the firmware (SoC) that are participation in the MLO.

Hence, add support to allocate and free MLO global memory region.  Allocate one
MLO global memory per struct ath12k_hw_group and assign the same memory to all
firmware in the same struct ath12k_hw_group. WCN7850 firmware does not request
this memory type, therefore this change will have no impact on WCN7850 device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |   7 ++
 drivers/net/wireless/ath/ath12k/qmi.c  | 127 +++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/qmi.h  |   1 +
 3 files changed, 125 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d0e466819036..bf310df3d8f7 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -822,6 +822,12 @@ struct ath12k_soc_dp_stats {
 	struct ath12k_soc_dp_tx_err_stats tx_err;
 };
 
+struct ath12k_mlo_memory {
+	struct target_mem_chunk chunk[ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01];
+	int mlo_mem_size;
+	bool init_done;
+};
+
 /* Holds info on the group of devices that are registered as a single
  * wiphy, protected with struct ath12k_hw_group::mutex.
  */
@@ -847,6 +853,7 @@ struct ath12k_hw_group {
 	u8 num_hw;
 	bool mlo_capable;
 	struct device_node *wsi_node[ATH12K_MAX_SOCS];
+	struct ath12k_mlo_memory mlo_mem;
 };
 
 /* Holds WSI info specific to each device, excluding WSI group info */
diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 7f3d5b269b9e..e7846aaca10a 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2407,19 +2407,64 @@ int ath12k_qmi_respond_fw_mem_request(struct ath12k_base *ab)
 	return ret;
 }
 
+static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
+					  struct target_mem_chunk *chunk,
+					  int idx)
+{
+	struct ath12k_hw_group *ag = ab->ag;
+	struct target_mem_chunk *mlo_chunk;
+
+	lockdep_assert_held(&ag->mutex);
+
+	if (!ag->mlo_mem.init_done || ag->num_started)
+		return;
+
+	if (idx >= ARRAY_SIZE(ag->mlo_mem.chunk)) {
+		ath12k_warn(ab, "invalid index for MLO memory chunk free: %d\n", idx);
+		return;
+	}
+
+	mlo_chunk = &ag->mlo_mem.chunk[idx];
+	if (mlo_chunk->v.addr) {
+		dma_free_coherent(ab->dev,
+				  mlo_chunk->size,
+				  mlo_chunk->v.addr,
+				  mlo_chunk->paddr);
+		mlo_chunk->v.addr = NULL;
+	}
+
+	mlo_chunk->paddr = 0;
+	mlo_chunk->size = 0;
+	chunk->v.addr = NULL;
+	chunk->paddr = 0;
+	chunk->size = 0;
+}
+
 static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 {
-	int i;
+	struct ath12k_hw_group *ag = ab->ag;
+	int i, mlo_idx;
 
-	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
+	for (i = 0, mlo_idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		if (!ab->qmi.target_mem[i].v.addr)
 			continue;
 
-		dma_free_coherent(ab->dev,
-				  ab->qmi.target_mem[i].prev_size,
-				  ab->qmi.target_mem[i].v.addr,
-				  ab->qmi.target_mem[i].paddr);
-		ab->qmi.target_mem[i].v.addr = NULL;
+		if (ab->qmi.target_mem[i].type == MLO_GLOBAL_MEM_REGION_TYPE) {
+			ath12k_qmi_free_mlo_mem_chunk(ab,
+						      &ab->qmi.target_mem[i],
+						      mlo_idx++);
+		} else {
+			dma_free_coherent(ab->dev,
+					  ab->qmi.target_mem[i].prev_size,
+					  ab->qmi.target_mem[i].v.addr,
+					  ab->qmi.target_mem[i].paddr);
+			ab->qmi.target_mem[i].v.addr = NULL;
+		}
+	}
+
+	if (!ag->num_started && ag->mlo_mem.init_done) {
+		ag->mlo_mem.init_done = false;
+		ag->mlo_mem.mlo_mem_size = 0;
 	}
 }
 
@@ -2466,12 +2511,21 @@ static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 
 static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 {
-	int i, ret = 0;
-	struct target_mem_chunk *chunk;
+	struct target_mem_chunk *chunk, *mlo_chunk;
+	struct ath12k_hw_group *ag = ab->ag;
+	int i, mlo_idx, ret;
+	int mlo_size = 0;
+
+	mutex_lock(&ag->mutex);
+
+	if (!ag->mlo_mem.init_done) {
+		memset(ag->mlo_mem.chunk, 0, sizeof(ag->mlo_mem.chunk));
+		ag->mlo_mem.init_done = true;
+	}
 
 	ab->qmi.target_mem_delayed = false;
 
-	for (i = 0; i < ab->qmi.mem_seg_count; i++) {
+	for (i = 0, mlo_idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 
 		/* Allocate memory for the region and the functionality supported
@@ -2484,6 +2538,40 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 		case PAGEABLE_MEM_REGION_TYPE:
 		case CALDB_MEM_REGION_TYPE:
 			ret = ath12k_qmi_alloc_chunk(ab, chunk);
+			if (ret)
+				goto err;
+			break;
+		case MLO_GLOBAL_MEM_REGION_TYPE:
+			mlo_size += chunk->size;
+			if (ag->mlo_mem.mlo_mem_size &&
+			    mlo_size > ag->mlo_mem.mlo_mem_size) {
+				ath12k_err(ab, "QMI MLO memory allocation failure, requested size %d is more than allocated size %d",
+					   mlo_size, ag->mlo_mem.mlo_mem_size);
+				ret = -EINVAL;
+				goto err;
+			}
+
+			mlo_chunk = &ag->mlo_mem.chunk[mlo_idx];
+			if (mlo_chunk->paddr) {
+				if (chunk->size != mlo_chunk->size) {
+					ath12k_err(ab, "QMI MLO chunk memory allocation failure for index %d, requested size %d is more than allocated size %d",
+						   mlo_idx, chunk->size, mlo_chunk->size);
+					ret = -EINVAL;
+					goto err;
+				}
+			} else {
+				mlo_chunk->size = chunk->size;
+				mlo_chunk->type = chunk->type;
+				ret = ath12k_qmi_alloc_chunk(ab, mlo_chunk);
+				if (ret)
+					goto err;
+				memset(mlo_chunk->v.addr, 0, mlo_chunk->size);
+			}
+
+			chunk->paddr = mlo_chunk->paddr;
+			chunk->v.addr = mlo_chunk->v.addr;
+			mlo_idx++;
+
 			break;
 		default:
 			ath12k_warn(ab, "memory type %u not supported\n",
@@ -2493,6 +2581,25 @@ static int ath12k_qmi_alloc_target_mem_chunk(struct ath12k_base *ab)
 			break;
 		}
 	}
+
+	if (!ag->mlo_mem.mlo_mem_size) {
+		ag->mlo_mem.mlo_mem_size = mlo_size;
+	} else if (ag->mlo_mem.mlo_mem_size != mlo_size) {
+		ath12k_err(ab, "QMI MLO memory size error, expected size is %d but requestted size is %d",
+			   ag->mlo_mem.mlo_mem_size, mlo_size);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_unlock(&ag->mutex);
+
+	return 0;
+
+err:
+	ath12k_qmi_free_target_mem_chunk(ab);
+
+	mutex_unlock(&ag->mutex);
+
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 98f6009ab21e..45d7c3fcafdd 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -172,6 +172,7 @@ enum ath12k_qmi_target_mem {
 	BDF_MEM_REGION_TYPE = 0x2,
 	M3_DUMP_REGION_TYPE = 0x3,
 	CALDB_MEM_REGION_TYPE = 0x4,
+	MLO_GLOBAL_MEM_REGION_TYPE = 0x8,
 	PAGEABLE_MEM_REGION_TYPE = 0x9,
 };
 
-- 
2.39.5


