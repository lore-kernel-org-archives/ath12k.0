Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F57DC87FCB
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y05UIg546tJB5TyXI8H/T1k9acjQE3Skbb07u+v6VgY=; b=IquTV5GSRBD2zo58F5vcCbPFO4
	k0lZ2Ib6mi/fxDOQbWHIniAJhwB7REOeGyUjitBYcfXu9X7e2hjaQM5NtIgVLTgu7QuQQxl/0AmHR
	urtmvTjk7dI/bcJR+rbAWGExG1z2XZOMbSFmzm7Mfa+xGtdBH8tvybYEbWg71PKRAHb3uzCE/GkwV
	BpRodC2MBMOjr2GSfcPYCbQRc4ZqjeU/Moa5bKcRaj0SQEJ3bnwS3Fc2wtMr3sVn1votCssvXisf8
	ysH2XVTigNKHr1v/Js72d/m9qg//KQU3cFYxnOX1sJpHDno63Ml6MR/pS14OmK7BPXtvwa3SpM3r1
	+TNViKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9n-0000000Ezhp-0WVB;
	Wed, 06 Aug 2025 11:18:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujc9k-0000000Ezfx-3Myl
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 11:18:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576AMs9V017483
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 11:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=Y05UIg546tJB5TyXI8H/T1k9acjQE3Skbb07u+v6VgY=; b=eT
	wlgHt6bIECMxkDmhK6ZXHLgq9nQx9z3cvl/OaaHUHruUelx0HF5ranX3ClHR6zlw
	Z5A/Co9HeQ4RSMkmnQn4IOB7YtI5/qDY/W21GckxcsA9N0CxK6aMoyHk3gx7H3Di
	XxhJRFLjjcXYcuyLMAALd320wPVkC2sv34fvydNLD2Fjyslul9OUAojkEELiMmUz
	BWFeRkPGj1tdKT9mpnoXNUvLISqrYD/pDvqxmSjw1jfdgh6CYT5j1TIatYqwWAxO
	T59IXSnaF3e62FS92IrT/5DZTDC2JpNqdhrF7FoZNfwRy34J8cVRTQ1BONihjlGj
	5GWST4MULzigBxMDVWew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c586840k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 11:18:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b42218e4a59so4523512a12.0
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 04:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754479082; x=1755083882;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y05UIg546tJB5TyXI8H/T1k9acjQE3Skbb07u+v6VgY=;
        b=ZJ+AjD6CTZt3RfI1cCXPFtmYdTsIajJbJ86HMku7dqO2yJ6b4KPhW7fwMsIHHtjn5/
         DHkeXC6xHyESrzXeMq3vRggNiyFJgRk1/7n94B+0wE5fLe9/NaS9usN6n6onv7dulYa2
         fi+UwvbPfYgn8xBhwfs8wUTXmQSuIvAZOqdzCajYliD5euRT4SlAw4ppVrGvOwQbBU3W
         RA+/wZJJo6Q3+Jy8/t+2xoP9frWsejUzwC8r9GwAJ+mdE/QWHB12GqYbf/h8IQhcKPIz
         0pp8V4sj+D5/oy0jBwlOBpKjz7wXC/SGii0XWYYuWKkiGnoVpTw75520V+hxDmzXlceA
         feSA==
X-Gm-Message-State: AOJu0YwSIxiUnFzQ6Xhlvai7/BvYVoEqhFdfkv4ExsebK5pt9f0X7kw8
	9ckX0RFppoG925HZXQTOec82stWlgp/MLaMPkGQ2frMLG72tUFApWZvisPgXNHaucXy8tXSk+fV
	FyVvtqtRSZYsqdrqFuF3V3+DkWMSYLvnh8aMh6/xaCRcIKBjtkmKIRi1Q21qPqrM11I9EkT0X
X-Gm-Gg: ASbGncvaYJaVyu+AfwfpbBVZN9KE9qSJ2c9KyspbTRyaAyQn1pUDFjLLZmNPW20KLTW
	+7uHQ4KW/O3Y/ZptuuiE3z+BLeivvsL7r5YwairDSvmqkc3JaiojXDOW41/vcGk5CuRwbjKlfDF
	mOFWKBcfAvHtZDjt3dtOpyh/zMNaItvEQazGc2grHWk/hqFPcKFPqJu4HjjWm3vwt6g+K984cUP
	oPv8m/cTVQywD3/wQl88EAMCpM07SiEarFOkN2aR69mOhqbyP6hL195intNYpHDLE+HZlEYn82V
	MBp0tTQtVVYmhUB4VWPBYPqfgJj8kYfephZJav9mygupzh4ShMr+Wo59B97TtamVTWA+LkeN1PB
	+/nGz4LhWAbU4qW60fdBqhJPJj9Q+CjZgUl/2xnnVHd9tQQ0SG+0PDo2qnjrqsVlKJu00QhOJfw
	==
X-Received: by 2002:a05:6a20:3d06:b0:240:1f14:f6a0 with SMTP id adf61e73a8af0-240314b552amr3978257637.25.1754479082493;
        Wed, 06 Aug 2025 04:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrGy4fikHZlg8qjirjIl3JMQ759ohE9+tbqYgrSa8dpEtBtc5PXbO7CHA0IOQA6IWPkWfg6w==
X-Received: by 2002:a05:6a20:3d06:b0:240:1f14:f6a0 with SMTP id adf61e73a8af0-240314b552amr3978207637.25.1754479082008;
        Wed, 06 Aug 2025 04:18:02 -0700 (PDT)
Received: from hu-nithp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7d9dafsm12984111a12.23.2025.08.06.04.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:18:01 -0700 (PDT)
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Subject: [PATCH ath-current 3/7] wifi: ath12k: Refactor RX TID buffer cleanup into helper function
Date: Wed,  6 Aug 2025 16:47:46 +0530
Message-Id: <20250806111750.3214584-4-nithyanantham.paramasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250806111750.3214584-1-nithyanantham.paramasivam@oss.qualcomm.com>
X-Proofpoint-GUID: WFFMwzHGz5go-4jPQjs6yWcPUNGNcyuT
X-Authority-Analysis: v=2.4 cv=MZpsu4/f c=1 sm=1 tr=0 ts=689339ec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=f9pqRqKp9ZjM8ooqtKoA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: WFFMwzHGz5go-4jPQjs6yWcPUNGNcyuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA2NCBTYWx0ZWRfX05S31WgU+Zjf
 q216FhKcpAv6ymr0zXDxPTs+LtZ34rQXndN/dXQOxRHv6uiaZav0WQolkbFe7ebu04eYiVlJNvz
 +7XHb763JGJ3hqG+tSCSTeXKa6Z5sIastNLY3c7mk7OuEP9DH/H74APmj/fpNgQMxQ3mExWrnFN
 2kLGWE8M0cm9MFrkg71JcX07eRd3UGmmdaAQXMDvglvgQRwZ1sxUhBuyl/MqeCBAVTc9ddgw1CL
 gvjd7P6sr1foUPq+38ivNq1jsICUx8tE73wv46HFrijdknlJwIZd97gf9Hv5XhyiWnzZ8mJ7Vh9
 4u8VA2GzLe+RkrfILXbG5phAhuA0Nv6ZAVHLkOroFDNB4iZekx8g6ES4S1V/ewkY8iSWqOcV728
 ZVIu9C8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_041804_956452_F99D9B2F 
X-CRM114-Status: GOOD (  12.39  )
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

Introduce ath12k_dp_rx_tid_cleanup() to handle RX TID buffer
unmapping and freeing. This replaces duplicated cleanup logic
across multiple code paths.

This improves code maintainability and avoids redundancy in
buffer cleanup operations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 34 ++++++++++++-------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 15097fe9e35e..0337355262f2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -584,6 +584,17 @@ static int ath12k_dp_rx_pdev_srng_alloc(struct ath12k *ar)
 	return 0;
 }
 
+static void ath12k_dp_rx_tid_cleanup(struct ath12k_base *ab,
+				     struct ath12k_reoq_buf *tid_qbuf)
+{
+	if (tid_qbuf->vaddr) {
+		dma_unmap_single(ab->dev, tid_qbuf->paddr_aligned,
+				 tid_qbuf->size, DMA_BIDIRECTIONAL);
+		kfree(tid_qbuf->vaddr);
+		tid_qbuf->vaddr = NULL;
+	}
+}
+
 void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 {
 	struct ath12k_dp *dp = &ab->dp;
@@ -593,9 +604,7 @@ void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 	spin_lock_bh(&dp->reo_cmd_lock);
 	list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
 		list_del(&cmd->list);
-		dma_unmap_single(ab->dev, cmd->data.qbuf.paddr_aligned,
-				 cmd->data.qbuf.size, DMA_BIDIRECTIONAL);
-		kfree(cmd->data.qbuf.vaddr);
+		ath12k_dp_rx_tid_cleanup(ab, &cmd->data.qbuf);
 		kfree(cmd);
 	}
 
@@ -603,9 +612,7 @@ void ath12k_dp_rx_reo_cmd_list_cleanup(struct ath12k_base *ab)
 				 &dp->reo_cmd_cache_flush_list, list) {
 		list_del(&cmd_cache->list);
 		dp->reo_cmd_cache_flush_count--;
-		dma_unmap_single(ab->dev, cmd_cache->data.qbuf.paddr_aligned,
-				 cmd_cache->data.qbuf.size, DMA_BIDIRECTIONAL);
-		kfree(cmd_cache->data.qbuf.vaddr);
+		ath12k_dp_rx_tid_cleanup(ab, &cmd_cache->data.qbuf);
 		kfree(cmd_cache);
 	}
 	spin_unlock_bh(&dp->reo_cmd_lock);
@@ -620,10 +627,7 @@ static void ath12k_dp_reo_cmd_free(struct ath12k_dp *dp, void *ctx,
 		ath12k_warn(dp->ab, "failed to flush rx tid hw desc, tid %d status %d\n",
 			    rx_tid->tid, status);
 
-	dma_unmap_single(dp->ab->dev, rx_tid->qbuf.paddr_aligned, rx_tid->qbuf.size,
-			 DMA_BIDIRECTIONAL);
-	kfree(rx_tid->qbuf.vaddr);
-	rx_tid->qbuf.vaddr = NULL;
+	ath12k_dp_rx_tid_cleanup(dp->ab, &rx_tid->qbuf);
 }
 
 static int ath12k_dp_reo_cmd_send(struct ath12k_base *ab, struct ath12k_dp_rx_tid *rx_tid,
@@ -766,10 +770,7 @@ static void ath12k_dp_rx_tid_del_func(struct ath12k_dp *dp, void *ctx,
 
 	return;
 free_desc:
-	dma_unmap_single(ab->dev, rx_tid->qbuf.paddr_aligned, rx_tid->qbuf.size,
-			 DMA_BIDIRECTIONAL);
-	kfree(rx_tid->qbuf.vaddr);
-	rx_tid->qbuf.vaddr = NULL;
+	ath12k_dp_rx_tid_cleanup(ab, &rx_tid->qbuf);
 }
 
 static int ath12k_dp_rx_tid_delete_handler(struct ath12k_base *ab,
@@ -856,10 +857,7 @@ void ath12k_dp_rx_peer_tid_delete(struct ath12k *ar,
 	if (ret) {
 		ath12k_err(ar->ab, "failed to send HAL_REO_CMD_UPDATE_RX_QUEUE cmd, tid %d (%d)\n",
 			   tid, ret);
-		dma_unmap_single(ar->ab->dev, rx_tid->qbuf.paddr_aligned,
-				 rx_tid->qbuf.size, DMA_BIDIRECTIONAL);
-		kfree(rx_tid->qbuf.vaddr);
-		rx_tid->qbuf.vaddr = NULL;
+		ath12k_dp_rx_tid_cleanup(ar->ab, &rx_tid->qbuf);
 	}
 
 	if (peer->mlo)
-- 
2.17.1


