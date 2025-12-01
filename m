Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F69CD116F9
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=; b=N1b6lRxPBaNmqwATuLSjRDoN7e
	B+Uc3f4LP2st+T4GPZTU6Bky2jxZ99arL14nT+8J+4w0OGxbEcPt81hU2om0RMhgjzIcc5261wCaj
	vk3XHniANiQwdCuDx0dnzsDJqEZlX/Gasw5q7rV2GwkuSI/Wxyb0WYhJVJyPBdzyaQs4ucdPZTPLp
	ok9F5DT0A5Qkkq26CCV/wKMVDDnV7CDawSiSqIjBY21VVCocieP4TrfSzWCjkKXWNxJrWj60Doun4
	uKEhwnNET+SoG4yYGF4wHsZqp5vIkZLurySrXaI7nYC6U1n0FXpJ45WYUQzIJyOjhe77SejJtTh9C
	ClLtGdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fu-00000003a66-1NBo;
	Mon, 01 Dec 2025 12:43:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fr-00000003a2V-0yCq
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 12:43:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B63UP397475
	for <ath12k@lists.infradead.org>; Mon, 1 Dec 2025 12:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=; b=XR1PcdKXJkx1y7lP
	1hl+9CzAqtSL+e2kFxF9sah35MGnmVSLivazrLvPrWo8zhkg7+7F3Yc0qBvAdw0D
	0Rcx9XHoC33Q8YGhzsSr2ctUULz9VLVFpwG90cz3XFjuC08JTXw8+X8F//dQ6yUO
	EUI8HizI6XGSjaSydbEGKq/bfDn3etKvt+Y+kjdW42c124s11HPFXwt3c/iPxi9v
	LpGNA6GsTRNY+gUhwKKygIq+XJRpipG6W8++QY32QNS9U9UR5SeZ5Mud0gWSY+9U
	3IzOsDms4kTgtONn4rgbYXruSqffW5sCfJeh2IzcdSiUw+glechcoP9Yr8sdEhnz
	gkzUyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug08h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 12:43:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e1cf9aedso70452035ad.2
        for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593025; x=1765197825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
        b=cJlzZWSpgcGWU5JDPW8Pa6BW0lhb/YKc1h/TEVFjsUYspF/Z3raKy7wk5Br5RnIh8m
         QZK0C5v2744+ff9i93sFNTlDV0MYvxX7aGgE1oLZL3nYzrsC66D7mZE93vcj0vGLqPX/
         BveX37gGb4FwltEKqOU/wh3dSfdUc9Ok3C5Nm+x6D9eUAUesK8fqlIHkKZD8HtEjj4FQ
         FsLJvspIKKRIA5wG6L8sM5lJo9wb7GTjts02xsOuZp8j6KR6WbHpQsreF08XkzVJWWCK
         yfAQnxgUGlm/eYG2z+Rk7yzNsyHeJPtVGa+VWmE8j3J/EZ6/3rD3cyfRWRuW1vZ5HNlU
         qOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593025; x=1765197825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpnTx2DCpn5NW+7UCBeMn/SqdtMDI0Y8uRPDmg+UDbk=;
        b=KCDMwfIU3IplYsLh4Ax3HIm12n9W6wFnsdfhobe4sOZYD22ZlDVAvGRaWnWtVe5KgL
         m+ypjtVCkF0w61y8mFAqL7fEXgHGsoRxKAaJz+kBocaYCXJD7rKChVD7/925AQbl5EJj
         F1PyGlE5Kt+2x1f88j01M7b4eR2QP6LXQKSfoTrOjrf90eRHtsh6mFwaQL0H/HlcGdYb
         zj3MuX6eCqnF9DlcHcZ90N2JvdOMKs6tk/VcXJFiu8DP1avYTvnZRaNRpnaC9XEFPFIu
         fJWKKiBfNnBXodERcL/lfG7IKhAjn5i6kWZkRas7DXhH/uMyzm4dd4vjPmCUcuWm+CSx
         XXOg==
X-Forwarded-Encrypted: i=1; AJvYcCUwVPNcGNg2mP1Nvt6+GOZnB+UKXt3/KvEu16Sx9N5BzNgO0KlG7mZmwJEn4YxoyIs6eoL6O/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWua5TsWILqBWJZBlamG/RRePeaJnBhz4x8tElQnsOCAuIOHs2
	6oQ+xZejmljDDXjP0XGzCa4symE9ealCzI/GymMRBgoIPsZ6LlAt2FRPDSj7ORu70pYISkEERg3
	y+luQ37SOchdf+X5fBwH9mO5f4lkwuG1fcOlCyAGIIIf1fjB6YJpGIro2Lk3G8qfw
X-Gm-Gg: ASbGncuhwwRFq2iCNB/xqaW7SXcN2eqHjgmFCKOFjdo+HdEm1jHP+S7rfebEFdDBg0k
	ywS3Iz1efAGu9547VDY+8/TLCX5uy9waQNgHi6Kmdsdit7IHAdnZ+KflTbt82+ikKPhqarn3ryv
	Zd9L74npQRi7hBMbM+46xYGCRDduWs+tCMyWPO0eTjqOHA6Rl4B2PgvRh3IpjfNReLbtCnKopnZ
	o0d+me3w2vjBB2g6eQf8Fk9jaVVutVtzKAxbBx7kwY7JjBsxK27ZtD3F1OoY0ppIDU9ropzNzQR
	STAbnFZb7GLDg7H8KpcOdIB2fdl9KtaHLSlfZyqpEKgbppktp9yFj2rJQARp4k18n6kjhSj3N4D
	lz0BcwYM9fTlfXBRbPNtTZGmafVSdoReNCdrRvE0C2DE+
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29b6bf3b620mr427701455ad.36.1764593025058;
        Mon, 01 Dec 2025 04:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQRyQeaORqv6EIcBnGlMaq26A/hMlADJNn0YXR98fYBetj3iI8jUv1Ui+5YteXsBVLZPjwlA==
X-Received: by 2002:a17:902:f712:b0:295:82c6:dac0 with SMTP id d9443c01a7336-29b6bf3b620mr427701135ad.36.1764593024474;
        Mon, 01 Dec 2025 04:43:44 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:44 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:13:19 +0530
Subject: [PATCH 3/4] net: mhi_net: Implement runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=3344;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rbqwP2YI4CzGHgLkC6DPKf/HhJhVBMMGwEXYBUIoF6k=;
 b=/Y2lIbKnoetk66YeT7B0yhq+Lp6V/NhqVD5b7G9I3ctKq/8126e4MtAa3KtI53yQh650IoAtH
 yDP4z6ZpJW+BDRVzLPVbyhcZhAeBx2UtPa+G7f/CG+yfkSzgm82tWqi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX7ulYpAlW8waZ
 86gCEfRCzjX3Ym9WX/nVDs90qTYasrEpVtVtSKEJCYS1Xyl8dOdEyOePT7S2JV1PRHos2iRBy7V
 x/GiiXB3wP2xE8jAIFku8bAfJAV1NGKF5CtBaTZLkM2E3g9ixllAd+UXG7F//S9s3acE9mS2O0a
 BwEXezR6XDUZ8IqVyBfFlEhYuzobN8mxdsGkY8nHSjNW1RaTiXWhbUz9lchfA7Xigvv6i7jnosp
 E5ZPEdrVoFbgfy3uYvjlQebzc8rzF6uz+1MqAuDEeiMvrfeWfyzp5ChZw73bshIHvxa0oYzrAHZ
 Dqnr77rIMtCJUnF4hJONnBgSwhnAZK1wuh72h2IdnUHwui6elSdWyGwc54NNVqhbTQ9STnecl8B
 znO0Zy8GKCKIwHtt0hD2nObJi6NbvA==
X-Proofpoint-GUID: mCaDOQ-xSpQxMQeGroDzUiZMM-6-bEv1
X-Proofpoint-ORIG-GUID: mCaDOQ-xSpQxMQeGroDzUiZMM-6-bEv1
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692d8d82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FGecwo-O3dF_YbjdleMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_044347_404625_DD6F4726 
X-CRM114-Status: GOOD (  14.85  )
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

Add runtime power management support to the mhi_net driver to align with
the updated MHI framework, which expects runtime PM to be enabled by client
drivers. This ensures the controller remains active during data transfers
and can autosuspend when idle.

The driver now uses pm_runtime_get() and pm_runtime_put() around
transmit, receive, and buffer refill operations. Runtime PM is initialized
during probe with autosuspend enabled and a 100ms delay. The device is
marked with pm_runtime_no_callbacks() to notify PM framework that there
are no callbacks for this driver.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 
@@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct mhi_device *mdev = mhi_netdev->mdev;
 	int err;
 
+	pm_runtime_get(&mdev->dev);
 	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
 	if (unlikely(err)) {
 		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
@@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	return NETDEV_TX_OK;
 }
 
@@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 
 	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
 
+	pm_runtime_get_sync(&mdev->dev);
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		skb = netdev_alloc_skb(ndev, size);
 		if (unlikely(!skb))
@@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put_autosuspend(&mdev->dev);
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
@@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
+	pm_runtime_use_autosuspend(&mhi_dev->dev);
+	pm_runtime_get(&mhi_dev->dev);
 	err = mhi_net_newlink(mhi_dev, ndev);
 	if (err) {
 		free_netdev(ndev);
+		pm_runtime_put_autosuspend(&mhi_dev->dev);
 		return err;
 	}
 
+	pm_runtime_put_autosuspend(&mhi_dev->dev);
 	return 0;
 }
 

-- 
2.34.1


