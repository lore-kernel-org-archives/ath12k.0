Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95259CAC5A5
	for <ath12k@archiver.kernel.org>; Tue, 23 Sep 2025 22:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uc1pbnhzdQKbs99YbruR9OK0hcEX16w/DIBcbHtd1lM=; b=4YoeZd+Yp3dTUPqRjEOOzx695v
	+N6fsH6zvUUSkIA+t7Plk6RcrFUrpHII/z7EqIKOW0xFmLs85bowXXWoVvcwxxexBfGgOn4u/lM7M
	h/HHFJ1r5RWzdjZwh2TRkH0aMLk7AgdRQw4yJ9reP4kucQ6H7SAMniy2/g+bRKmWRPPaSDu/7/lp9
	v9Hf91cFOBHl9RvTTGcwz4utiNek9YB9ovMKnvdKMx/vUmiz8w4H5pBRov9Hka2DmaVY6ZSFlH2t9
	DEFJ3cERZXthUfL2y4Rge8UBEqFEyitpLy+mWClPyncT7+TghqsS9v2ayoKbKA3M4XSZ8A6q+Nwcb
	z8OID4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1B6c-0000000F2lU-1Gax;
	Tue, 23 Sep 2025 22:03:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1B6a-0000000F2l0-17K0
	for ath12k@lists.infradead.org;
	Tue, 23 Sep 2025 22:03:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFGf7p004512
	for <ath12k@lists.infradead.org>; Tue, 23 Sep 2025 22:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Uc1pbnhzdQKbs99YbruR9OK0hcEX16w/DIB
	cbHtd1lM=; b=Yqm7zph3z+mlv6EVIydn340IzGzza6b93moSJ4NMGgwLNkREWlU
	Mu+GDvjjYhfwwlFdCZ+8WkfQof6/ShwQmA9X5s+se6XOZ5wbUUJWAkyDOKkDKJjy
	1CScUvpoFRkQI4vRRda97vWxSUOwAwKkukR3AvnaSpsSRvWaOWvqoxjiL9ib3ppw
	Zp8zY4gg5H7hvxPAz8nDz1ttVQo51ta5l9akViCaXqW7AFYZyM/IuhY+UtZi46en
	ywf3m0FTTk52OmhB+7HWSa8Hb0Va1XnVYunOfoCl7gkkreqrNMRiX2XnRlyCUbuK
	n6Ph+UaaAaTnxSKsbhpxWA6/giXKI3mQdbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmntg89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Sep 2025 22:03:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2d29dc2aso2139129b3a.0
        for <ath12k@lists.infradead.org>; Tue, 23 Sep 2025 15:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758665001; x=1759269801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uc1pbnhzdQKbs99YbruR9OK0hcEX16w/DIBcbHtd1lM=;
        b=u2xIO3qxKTRtygPizXFgkaMygCc0ia3b8p5gsugAqr1nFKQC510FrtdKCit0yC5prX
         yDZqgmP2Sc6F3+QuZvaO95EP9NyV41UIl8iSR0pExefsSntgpPlOIrBEZyPvW9kLzQux
         zkQ4FAs+Ag/owI7JrWy3hk2+9/qe5eiTHa+YerBlH2efs72Fp6QP/4t5KC/f7N8IHTfH
         xE9K720EMCWWmka0uW7mp3KbTrkhqzGaIDJI00LNRe4b8caUWjLCCJl3+tEhYgDt4EIW
         z129bFXD01MNm3+QsQnrz3B/513nJSHTPVZA1ZG+3EVk4brD57eHaD67dTIXzWSnF8Zu
         kC2w==
X-Gm-Message-State: AOJu0YwKyBlHAiW+c6L59vZBYpArs//zOgxvw+kYWXXxo73fVBccDA+T
	jXZMHTAM3/Ib+RUr0KIfu9FEX+vGlSN4msQtYz1SkR/mFQmCQ0eSweuBOQZcuQQqYLYSXzZ/VWx
	k2b6mXKG9bUxPFOcTXg5MCcyWvHBMzH/Hn2KGxCq0t1nsJpeQkXE8beJegjvhh9ieoruyle0G
X-Gm-Gg: ASbGnctARHH4cWf6NfZnJxnczx6ONMSsGC9s6lfNySzRMswa2Rd9e8gPW1Mh9iYeXLu
	ZTfwwUGhp79TdS/JkX7vM2ISEWT31jYrx6MObv00ItuA5XPX2g0M6t1zq0w1Sd175fNp4QMbSNT
	IqI+P39a8vAGdrGARZPqW4kZIxCrDgtixBxkHYVbT/sGqW7TcQ7CvBAID8wcWqE0fsgIVLXAuii
	OMr22kODAGdG8D4wvQrXuwNB4ZJKL9euG3ApoWESGHqeh1AfKpOao5BfBeLH1JoCiHz3Q+mWsEB
	CHFg9LBYn6DqUWwIDq1o7pSM9ftiHUTBTCHKgPcSjWbCmDySwsY2RWeSi6fvWRCGSDTycsQyeRF
	6zCInxu8s0HWsbc5xMyHp
X-Received: by 2002:a05:6a00:3c8b:b0:772:5b74:c270 with SMTP id d2e1a72fcca58-77f53a84587mr4180011b3a.20.1758665000538;
        Tue, 23 Sep 2025 15:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEinvX1Hnftmz6nTwHZivIr39eTOTRQqEhyM1sVpp6OJZ+UGYVB63E4dDrJtLcO3INkUfbhIQ==
X-Received: by 2002:a05:6a00:3c8b:b0:772:5b74:c270 with SMTP id d2e1a72fcca58-77f53a84587mr4179992b3a.20.1758665000059;
        Tue, 23 Sep 2025 15:03:20 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f254f8f68sm9202214b3a.56.2025.09.23.15.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 15:03:19 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: free skb during idr cleanup callback
Date: Tue, 23 Sep 2025 15:03:16 -0700
Message-Id: <20250923220316.1595758-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3192a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=f__cQE-5ugF2exXfO0kA:9 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _QNv-TPMMmq6wy4-1wdQ8tDAO7VnTcpI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX9Pg2asKxAlxX
 3UW9D24XFhwSXlNVbdcjaIoIvI1r/oGzKCtJXRL3dzfwkSTTxkccV1PqJ+EI22n1wJbbZLWFMZR
 JXfJJ+wxhvH6yzCX7CAbnfFy+tPnGeKDp8zbkhkoxHPnte0FgjJ7ilsveer82C6CQ4bIQDFX1sE
 r5Zp9d0zjm90/yEqZ/nkMSPM87ttdEwk21PSbdT8eP3iXMRCZJczQz0JAQgLOcJO/d0pYldxfTE
 L3mu1dWvYWNzcWxA8iRaMA7/5bB/Om6xNCWh2fGBO3004zXEsdvsdE8XIlVmE+7E68tjZubOV9U
 JTKbIlTwIMJcvd37y3e+Ub3eQCEkIWLRxx5yPkGZF583JNNOVZhc6cXZsOD9L7hOMym950NTSzp
 tCHhgqhR
X-Proofpoint-GUID: _QNv-TPMMmq6wy4-1wdQ8tDAO7VnTcpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_150324_428186_A25C728B 
X-CRM114-Status: GOOD (  14.84  )
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

From: Karthik M <quic_karm@quicinc.com>

ath12k just like ath11k [1] did not handle skb cleanup during idr
cleanup callback. Both ath12k_mac_vif_txmgmt_idr_remove() and
ath12k_mac_tx_mgmt_pending_free() performed idr cleanup and DMA
unmapping for skb but only ath12k_mac_tx_mgmt_pending_free() freed
skb. As a result, during vdev deletion a memory leak occurs.

Refactor all clean up steps into a new function. New function
ath12k_mac_tx_mgmt_free() creates a centralized area where idr
cleanup, DMA unmapping for skb and freeing skb is performed. Utilize
skb pointer given by idr_remove(), instead of passed as a function
argument because IDR will be protected by locking. This will prevent
concurrent modification of the same IDR.

Now ath12k_mac_tx_mgmt_pending_free() and
ath12k_mac_vif_txmgmt_idr_remove() call ath12k_mac_tx_mgmt_free().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Link: https://lore.kernel.org/r/1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com > # [1]
Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Karthik M <quic_karm@quicinc.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 34 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1d7b60aa5cb0..eacab798630a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8290,23 +8290,32 @@ static void ath12k_mgmt_over_wmi_tx_drop(struct ath12k *ar, struct sk_buff *skb)
 		wake_up(&ar->txmgmt_empty_waitq);
 }
 
-int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
+static void ath12k_mac_tx_mgmt_free(struct ath12k *ar, int buf_id)
 {
-	struct sk_buff *msdu = skb;
+	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
-	struct ath12k *ar = ctx;
-	struct ath12k_base *ab = ar->ab;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
-	idr_remove(&ar->txmgmt_idr, buf_id);
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	spin_unlock_bh(&ar->txmgmt_idr_lock);
-	dma_unmap_single(ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
+
+	if (!msdu)
+		return;
+
+	dma_unmap_single(ar->ab->dev, ATH12K_SKB_CB(msdu)->paddr, msdu->len,
 			 DMA_TO_DEVICE);
 
 	info = IEEE80211_SKB_CB(msdu);
 	memset(&info->status, 0, sizeof(info->status));
 
-	ath12k_mgmt_over_wmi_tx_drop(ar, skb);
+	ath12k_mgmt_over_wmi_tx_drop(ar, msdu);
+}
+
+int ath12k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
+{
+	struct ath12k *ar = ctx;
+
+	ath12k_mac_tx_mgmt_free(ar, buf_id);
 
 	return 0;
 }
@@ -8315,17 +8324,10 @@ static int ath12k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
 {
 	struct ieee80211_vif *vif = ctx;
 	struct ath12k_skb_cb *skb_cb = ATH12K_SKB_CB(skb);
-	struct sk_buff *msdu = skb;
 	struct ath12k *ar = skb_cb->ar;
-	struct ath12k_base *ab = ar->ab;
 
-	if (skb_cb->vif == vif) {
-		spin_lock_bh(&ar->txmgmt_idr_lock);
-		idr_remove(&ar->txmgmt_idr, buf_id);
-		spin_unlock_bh(&ar->txmgmt_idr_lock);
-		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
-				 DMA_TO_DEVICE);
-	}
+	if (skb_cb->vif == vif)
+		ath12k_mac_tx_mgmt_free(ar, buf_id);
 
 	return 0;
 }

base-commit: 32be3ca4cf78b309dfe7ba52fe2d7cc3c23c5634
-- 
2.34.1


