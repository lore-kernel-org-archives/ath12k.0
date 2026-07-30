Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DF9C54FDF
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTV0lOko+NiXhECP6eCpyev8Ziy/a1d8Ju+nHmASDK4=; b=uVnTh2gRovUllmHrtQyWu3QKNQ
	QgMEsplw6AN+qS7eqshoN/eYfUWWCOfJeiN4mjoYNxkbJK45HxzE7OhzZItZ7Mt94LcDn6Mi5DIgE
	876KQKlSHiF4AiWzgXUPuH9H28IMSyRZveIMb0LdPTMNSxqoGEzJ1yZsYk4lOEJLcRe//MWFb5UoC
	Kv2TWjoNW7i+wCG3xVL5AKdlOhn6nFYFzFc6Bz/zFfImbb341DbyDWGRolBkcY+G1rPuyIKbEVzmZ
	egxkxefJE05SajsmULUepByMK+oUD9uME/qRZcUnR+pS3eWOvwUhu6rDZPw4Tc3rZcjNLkfHOqBHf
	+ECRbP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5s-00000009b0P-09CE;
	Thu, 30 Jul 2026 06:18:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5p-00000009awV-3d4G
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 06:18:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U61PJN4012485
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTV0lOko+NiXhECP6eCpyev8Ziy/a1d8Ju+nHmASDK4=; b=FvFmw+n1gyzjB3j8
	7Epdq8B9SSl4x9LjLiZqmAPxq/gOdcQL9V04nz51QgeRbeTxDrGop1MP2snqTmcV
	PRYN2Z76g+pKA3j9RaE2AvwkxcrC4XA3atGcpv87ePKYkR8097ckt3rnJTHhppvk
	N/GKVzNIRcKx4Kg3mSijgTB33uyJxCEU1+R0nfKStGsX4PHmOxGdXjrKZTfZdWo3
	ZhVM+E4cv5IXugsWCUTs4pREz5F2a9zVlFnguKTbVxq4d10OwgTbkNjPkgy7HjoZ
	SwwYXi3MDjklFcmv/01oY1oeBFLv70SSX8cpf9GMzxvCAhbrvfOzKfseb9Xcdt4q
	svPPIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0yvr2f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3129542a91.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392288; x=1785997088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTV0lOko+NiXhECP6eCpyev8Ziy/a1d8Ju+nHmASDK4=;
        b=QYDZXsU/LH6pgzAdOIkEVIHOh65BMu2SN5UabshSAJTl4P1sqLCN/AfGAXXE9hzJTG
         RBOeMmUi+qPZFTe4s4Pqg10lbBkxC9aEuD3lflKLShgbSvlxRzSQExRe2z0RnoRgM4+n
         wm8kuQvsweKNN+XeEuVHZprRFn9NODb9GDTxwb6zxXX10msYLT90c2nuEvwWeWzPg/xY
         QEbUi9XOk7TQhduSPwChvJfsgB0PSKmpszKLt6eaDPi10O/C7E57hLoGC9E6GjlRi0cn
         5KQ38h+y+ieHVBh6+lGeLxiUYCa7wnCaydaX+U9ofZDOOkxmaOP1tr0dKnfOeGeZ3Wrw
         cjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392288; x=1785997088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTV0lOko+NiXhECP6eCpyev8Ziy/a1d8Ju+nHmASDK4=;
        b=RLtAMxoJSEYbj8+y7dzKTsq8CgkH2fSdgHh7A4JI9tlGWw52jiypJQJtIWl/aQBaHv
         yQBFYekP3RaVbOVW8ugjY8fQB62YwV2Tk3iNAwlH/7ZbYuypEHZWvLxRDFKt3a2YM56f
         6xQsmTy2Vz8sssL/3oXK7VDabGm+FS8ihc4tgLduex2U0AE+viofClI6mpbUdGOXkE4Z
         fccN/4aHdH1jzuNAgyjiE8ksOnQU3tEMhwU2o7aqIIpSwN5GBdU40JCUsFXmOvrlGkvr
         CiZmzGLSTRM22CLYe0VsZEhZIK9fGyM2s623vbJmPqPusmB4Vedp45ER/UI0F84jnWK/
         bhZg==
X-Forwarded-Encrypted: i=1; AHgh+RrVUq9QuvLII9nkbGko6myhnhNUd+702pZJMDuBzvxHfBmL5UuauMnkKhn61Ny9Co+lCvy3erc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxnRvOy/Jx7UVcr7tzdZP2ykCLK/tI3ZEskDYdjQ0RqLTiwX2G
	TUyejtsYMByjWu1h2lUa9b78o18Adwo4/8xyibrrcLYETQB5pX4UqHm6RgEGIPPiAu23g+ilb5q
	0dtn/OGdceZgxQkGAKCGS++9aO6tkPv5eORyUE4G7RwKcS+Eeh8ns1RNHKMNshwQR
X-Gm-Gg: AR+sD13X+MSpqrAKq4MaBz4sIcSv8QQbY8tS7sR+w78ppQtadPXV855Wwt+bcTj1vf6
	gBh6rbBkLjM3e686Sb5mKC5jGo5RCgUSXzomLuONjG6LhsqB++KzdgnaYDdi7i0AjLQw5HxBuNs
	hDZ1jvSrMMkau9N5HlblYiiLy19/PQjDI+e5fXjNWmCyg3sQTO7EHuekwPDQU9gbZOPSn/L4VXI
	V4pZTMANKFFJU4e07iKoJLu3scykngnwj4Mt4odULQqm5XkGVpx98KiAuxcFhdzZbQelhUJ/6TD
	325gP7X+XNiFyNKnEuLYN98rlm0X2I1oNB4feFdZC1VTa1DpwZ3KQlWLxQtqpT6O2ELkfe6MaU1
	/srrcLJRcGvN9l669IR0I4+iwiuegLhqfHtBm21tMA/a5RtiJAJGPrw==
X-Received: by 2002:a17:90b:570d:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38f9c04cb68mr1142871a91.38.1785392287717;
        Wed, 29 Jul 2026 23:18:07 -0700 (PDT)
X-Received: by 2002:a17:90b:570d:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38f9c04cb68mr1142834a91.38.1785392287278;
        Wed, 29 Jul 2026 23:18:07 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b928f09sm457254a91.2.2026.07.29.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:18:06 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:17:42 +0800
Subject: [PATCH ath-next 3/3] wifi: ath12k: align QMI target memory to 64
 KB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ath12k-align-qmi-memory-v1-3-0fef98dda614@oss.qualcomm.com>
References: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
In-Reply-To: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FfsHAp+6 c=1 sm=1 tr=0 ts=6a6aeca0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qS1--j5BNTmtoKFDeJQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX1sTwT7ZE7jgY
 6IedkwGwFO4aOr8Iwkf3+g08D3fVoUPJ6F+0FszxW4SaERMD5x/u+DJE4VMIMnb2mMBCxpgZrku
 TQNECWyxMmoBmOsbjX6NHKneSFaI04V1m6vq8VWAw/x/R4c1y0oqI4C1BH1QZyLi3b5/pnTPrin
 kSg5wW0S8hT80zZ3mT4Y0rB/f8loRWbXM/6fabseseIv+mp2J34BYqVCTByZGcK4CIz5ALTtS8p
 WolDAew8mLDBgp+1VuR/o3ZxyDW+wfIsBwg6teukzBrn2DUSYQX/2AK8MKgnBvhqQr5/zciHC04
 kSb/qScajKX4XWr4w7WhSRBWAUJ6mFMmTqvLkZECu7ZJPOrq+5eSfZ+rcXnRyEOcq86XOJP9kdD
 ZgdB0hJo9hOOoqtMbthWOV/wuqe33MdrBB7kJ+CJ8mHY+fIfjZzEAc7QBGiKx/PJki6qE3WrlJk
 +kJ+EQ9pNQPs2He+SRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX/7cbhRdzwXds
 aEKURXZaOxAe+bz8cG/217G7thQ4WPgpitlkz1sjA+k9xMQJOikK3ljFG3nnwgWhRV+cbGRR8Ha
 ZfVBy86GGV6S4tS+e/hJS3h63e3/QtQ=
X-Proofpoint-GUID: ymb1aAUZm7__n-lejeiLJ9PEWepmQ_GL
X-Proofpoint-ORIG-GUID: ymb1aAUZm7__n-lejeiLJ9PEWepmQ_GL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231810_037220_1FDE2DCA 
X-CRM114-Status: GOOD (  24.13  )
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

ath12k_qmi_alloc_chunk() allocates the target memory chunks the firmware
requests via dma_alloc_coherent() and hands the resulting physical
addresses to the firmware. The firmware does not require every chunk to
be aligned, but each unaligned chunk consumes extra TLB entries when the
firmware maps it, and too many unaligned chunks exhaust the TLB and make
the firmware crash. The firmware team recommends aligning the chunks to
64 KB so that the TLB stays within budget. dma_alloc_coherent() only
guarantees page alignment, so a chunk can end up unaligned.

Align the physical address handed to the firmware to 64 KB. A natural
allocation is often already 64 KB aligned, so try the exact size first
and keep it when it happens to be aligned; only when it is not, free it
and over-allocate by SZ_64K - PAGE_SIZE and round the base up. Since the
DMA allocator already guarantees page alignment, that padding is enough
to reach the next 64 KB boundary. Record the raw allocation in
paddr_unaligned/vaddr_unaligned/total_size so the chunk can still be
freed correctly.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 79 +++++++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/qmi.h |  4 ++
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 03ec2057ca27..bfb5b6659f21 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -14,6 +14,7 @@
 #include <linux/of_address.h>
 #include <linux/ioport.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/sizes.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
@@ -2583,20 +2584,28 @@ static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
 		mlo_chunk->v.ioaddr = NULL;
 	} else if (mlo_chunk->v.addr) {
 		dma_free_coherent(ab->dev,
-				  mlo_chunk->size,
-				  mlo_chunk->v.addr,
-				  mlo_chunk->paddr);
+				  mlo_chunk->total_size,
+				  mlo_chunk->vaddr_unaligned,
+				  mlo_chunk->paddr_unaligned);
+		mlo_chunk->vaddr_unaligned = NULL;
 		mlo_chunk->v.addr = NULL;
 	}
 
 	mlo_chunk->paddr = 0;
+	mlo_chunk->paddr_unaligned = 0;
 	mlo_chunk->size = 0;
-	if (fixed_mem)
+	mlo_chunk->total_size = 0;
+
+	if (fixed_mem) {
 		chunk->v.ioaddr = NULL;
-	else
+	} else {
 		chunk->v.addr = NULL;
+		chunk->vaddr_unaligned = NULL;
+	}
 	chunk->paddr = 0;
+	chunk->paddr_unaligned = 0;
 	chunk->size = 0;
+	chunk->total_size = 0;
 }
 
 static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
@@ -2621,14 +2630,17 @@ static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 				if (!chunk->v.addr)
 					continue;
 				dma_free_coherent(ab->dev,
-						  chunk->prev_size,
-						  chunk->v.addr,
-						  chunk->paddr);
+						  chunk->total_size,
+						  chunk->vaddr_unaligned,
+						  chunk->paddr_unaligned);
+				chunk->vaddr_unaligned = NULL;
 				chunk->v.addr = NULL;
 			}
 
 			chunk->paddr = 0;
+			chunk->paddr_unaligned = 0;
 			chunk->size = 0;
+			chunk->total_size = 0;
 		}
 	}
 
@@ -2641,6 +2653,10 @@ static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 				  struct target_mem_chunk *chunk)
 {
+	dma_addr_t paddr;
+	size_t size;
+	void *vaddr;
+
 	/* Firmware reloads in recovery/resume.
 	 * In such cases, no need to allocate memory for FW again.
 	 */
@@ -2650,29 +2666,56 @@ static int ath12k_qmi_alloc_chunk(struct ath12k_base *ab,
 			goto this_chunk_done;
 
 		/* cannot reuse the existing chunk */
-		dma_free_coherent(ab->dev, chunk->prev_size,
-				  chunk->v.addr, chunk->paddr);
+		dma_free_coherent(ab->dev, chunk->total_size,
+				  chunk->vaddr_unaligned, chunk->paddr_unaligned);
 		chunk->v.addr = NULL;
+		chunk->vaddr_unaligned = NULL;
+		chunk->paddr_unaligned = 0;
+		chunk->total_size = 0;
 	}
 
-	chunk->v.addr = dma_alloc_coherent(ab->dev,
-					   chunk->size,
-					   &chunk->paddr,
+	/*
+	 * Each unaligned chunk costs the firmware extra TLB entries when
+	 * mapping it, and too many unaligned chunks exhaust the TLB and
+	 * crash the firmware, so align the base to 64 KB. The DMA
+	 * allocator only guarantees page alignment, but a natural
+	 * allocation is often already 64 KB aligned. Try the exact size
+	 * first and keep it when it happens to be aligned; only fall back
+	 * to over-allocating and rounding up when it is not.
+	 */
+	size = chunk->size;
+	vaddr = dma_alloc_coherent(ab->dev, size, &paddr,
+				   GFP_KERNEL | __GFP_NOWARN);
+	if (vaddr && !IS_ALIGNED(paddr, SZ_64K)) {
+		dma_free_coherent(ab->dev, size, vaddr, paddr);
+
+		size = chunk->size + SZ_64K - PAGE_SIZE;
+		vaddr = dma_alloc_coherent(ab->dev, size, &paddr,
 					   GFP_KERNEL | __GFP_NOWARN);
-	if (!chunk->v.addr) {
+	}
+
+	if (!vaddr) {
 		if (chunk->size > ab->hw_params->qmi_max_chunk_size) {
 			ab->qmi.target_mem_delayed = true;
 			ath12k_warn(ab,
-				    "qmi dma allocation failed (%u B type %u), will try later with small size\n",
-				    chunk->size,
+				    "qmi dma allocation failed (%zu B type %u), will try later with small size\n",
+				    size,
 				    chunk->type);
 			ath12k_qmi_free_target_mem_chunk(ab);
 			return -EAGAIN;
 		}
-		ath12k_warn(ab, "memory allocation failure for %u size: %u\n",
-			    chunk->type, chunk->size);
+		ath12k_warn(ab, "memory allocation failure for %u size: %zu\n",
+			    chunk->type, size);
 		return -ENOMEM;
 	}
+
+	chunk->vaddr_unaligned = vaddr;
+	chunk->paddr_unaligned = paddr;
+	chunk->total_size = size;
+
+	chunk->paddr = ALIGN(paddr, SZ_64K);
+	chunk->v.addr = (u8 *)vaddr + (chunk->paddr - paddr);
+
 	chunk->prev_type = chunk->type;
 	chunk->prev_size = chunk->size;
 this_chunk_done:
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index cbe5be30053a..afa380f5e934 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -101,6 +101,10 @@ struct target_mem_chunk {
 		void __iomem *ioaddr;
 		void *addr;
 	} v;
+
+	dma_addr_t paddr_unaligned;
+	void *vaddr_unaligned;
+	u32 total_size;
 };
 
 struct target_info {

-- 
2.25.1


