Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DCDCD5BAC
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 10:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=; b=KDr5JBIu9g17Q6kFaG3JYbhfpG
	bxExhuNkYdvMM/qXZEtBCwEW/LRB7crE7cIqxyXTKuyFfLm7/0BTbHlS/2cwBaiQrNSblP8HIbcT9
	rTTuplEjyfS/Qg74NBkERtw5a1yFiZ9thdoEd+lxyk4iCmzNWTKQjlVu7d7lfj+vMdhoj8uymxbpD
	SHCf9c+zWqgBtXTKHVbsyIzY4DVjVHyAbRcFnDrQR296WQkbmIsK9EuP5bjydkjirXhUrMqVerGBM
	8EPKcCaLmYYwpOMidryfjzndQMBDv4AB/3QQQUiYPekzUd/VTzYqxI000Y5T9WbvhuHgAE1Lj6kaL
	wT9LXb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgz-0000000APDm-3U4f;
	Fri, 22 May 2026 10:01:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMgu-0000000AP7m-3ilh
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 10:01:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7Fb3A779483
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=; b=jqjpioQFFAri1m2v
	HbJL84xCVFhlIq0d2UiQ47xNCEwDEpYfl4QL2066E9UNWXygtvKtJX6KVopUig/B
	DNCs1cdIbKI7+ComLVYO15cK90mYoNtvznOcMR7Pw8RmqruWrK/FwqkO21zVgCBK
	BGtMJPVA+o5ViB3j7kd4mCSt1nju/CF1aR0HxDv8B2oJFbuE0NkFGMdP0EDG41PL
	2EARo6n8CCNkcRm9atfIEi0uo7M3xl0W6uCWvjaXHbMUrrZvkd43nV+sABOxFnxR
	QFVHmfwgpIAYWljVCxKScvyUUXS3b4Wc3qsYtvf0yKf+zVnB4cPFQ+LMUzoQGMTs
	inJCFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at5ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:01:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso11152236b3a.1
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444075; x=1780048875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=;
        b=C6ni7uXbTYQJkbgvvGp54VoLtgVFwTZMrmk46G5Too1CU+8dDzUHHN0BNOBiSUPJeg
         F95zc0+TWn7nEQzAaE+a+SBl7JhYNq9XToa4/PYJHHGx6l44C87jrB03Df3gyisLhiaE
         XJNE85q4trka3fF1xVSyZWq/8dOYZVCgtlcx5CLaLd+ReDxoqVlU1kps/fy7prJO5no3
         8OsvjMrjFd3VQuTq3bxzxk4MyrYbzAeeFSD/YsUZyw9bleJfoiFErDSKSNEodH4HQrHh
         OerjwBwHmzGEgFvKwGIkikh72ToLQnuvo1FeCfAiHgsijLMs9putqi5CTquOblbWnnjR
         Qimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444075; x=1780048875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89GZyqjxzP4kzPz+TzUkPQL4cVAEH+s+D1a55Or7dm0=;
        b=E/23nurb8yyEqCJV2A6VCNBugYAB3yA36cAEk16t4V88M2ZfXzKpTa2BfmNfCtrkME
         j3rGMsoQ9z4BiCO2vCLePI5GzkfCfAQrV8pXNXa+Z3WKzAnPO1U/6buM6oEv4hS3MdBW
         fxim+Kxg5hkt8eFhVy0ATfgYVgfQGUzNX1g7Tl6qAMs2hz7ifbZPyEvEZhehb0qV4RH1
         1DF6d1ua0rIJsH8u//bnNqmS3mf8MPn+U3I0zl3T0KtMR3gowVTxNcchyagnxD7ODl+z
         SMJuYQM/n3yuZPxlEcE85TenH2HmK7etoAFcmjgSH0lO2hpy4Yya7FD1HTcYNuw43G7w
         k+Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/knnlvcY4gusnaZVKZhhupcxxkkbeoBA3oGIlu28ia1ixR1XtqtjPn6tMn2V3NDok1OTvBvgU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxytNU3UC5BJ0hRKMWOWUgTyQnEyGdyqfpbr35JyzRw6g6cZwEN
	f8sa2IdL42zrwI4ZC6lfhkxw+8FvbaF6IRdZE/LD/AyaAKUoua0NviKp4FY3LFsp8s/hUMgYZQr
	bDbDSelO8iQpjpuOecpZvlwPUWEt3Vn6+ohVPfVArQjPrZXLOMN/80b7Yh1z5j8Vk
X-Gm-Gg: Acq92OGuNDeiEA0btCLEV9kg/fVdzOoVHZvH9GNSJlYALcmVhAVV654roDs/9bkVKDZ
	0SCIc8UweNE0a/I1IJvV0S66la1MHunpkEkI6dBYLstVIZBPLWbbJVRFIbXpNIqSXl0NrFp6HHO
	00/Qr7xCn/9vob2gpCr3tfI/Az7wAqTYhphTxd3MsvJbu2JHzVK4Tvc/oPE1p/0ETBx9GhFZSCM
	VLCjqKCyIHaydY+KN9GdY0Df0R+2oy+L8LzjnH906YXZCQSJCFpXdAHUZVPZFRIUnhn9KvmP6NQ
	hpNUSunbSFTN8Wg0yIpMQGj1Z3xdloW9XF3B98e/B1twwiW5asqem4dRxBzZCLS+ml98OP9tSh3
	KlsrJoq6rTayZh4DMM9EtJpYyJJPurZ5+Iol3bRMen2TA75rfVjlEUEtZ
X-Received: by 2002:a05:6a00:1807:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-8415f330494mr3326898b3a.25.1779444074820;
        Fri, 22 May 2026 03:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:1807:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-8415f330494mr3326808b3a.25.1779444074141;
        Fri, 22 May 2026 03:01:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:13 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:34 +0530
Subject: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=4173;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=y3Md+/LJdRoPfa8fSBTst//7iA3QrqSh3tsJRClRwKA=;
 b=s+sHbgZoUcbrkhk1NuhJt9uKCZYJuw6T6gtb1ZC0H9M7hSgDCA1Etn58jrZgjHnvT0SCRG62Q
 V7oqxMJp/lHBjYl/lZQf2obhPMwRXspe8hoAXlE3MFihEsy0yCkGb4V
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: MkyH5Tur4i_awLE4CL7O-StyMhwEUvTy
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a10296b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-cKO2LIWXEwUer3o84gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: MkyH5Tur4i_awLE4CL7O-StyMhwEUvTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX8srmBnyxUUsw
 mfOpxadWT9mb0JAX1L00JP9Du5GisXKGgSME2jERYZAdQY1pNImcM9UQvk0FTVxXC4eHMdEYM0E
 c7Im5/LZ/9NEVktAi4VmUWPyyFk3v89JNFTy5bZFcK9xWvTWq1+XmRnd5neAyJ+otnAyR9e6NoJ
 Rt56MzeunOfYUP95E57L6mfutQ8t7DoTd+6zjWFMwIhyMrUAIPszDiUFiyPkXmy05BZoquM+t9I
 xixJkPPklztEprqASG5uzzr/FQ1lrytiAVhhL9sy9TC3zFddBPZJpYx60N8efJBBpudbhvBW96Y
 s34umFJ3mtIHQISY7CT5SpZUExSDxCnFgMMwujXKmZ0A71NBnXjEfc06AfhFr8F2Ob/xnBkxQtC
 ZGVC+m3uc12IoJEL7r+IH02vsQfJEGmJAorr6YjI/X6xs98l20QU3y2/1wnAqwwRknifqPCgMi9
 lDNjVYQhD+p5yUMdg/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030117_051228_8E30A14B 
X-CRM114-Status: GOOD (  17.33  )
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

The mhi_net driver does not coordinate with runtime PM, which allows the
underlying MHI controller to be runtime-suspended while transmit, receive,
or RX buffer refill operations are in progress. This can lead to stalled
transfers or failed queueing once runtime PM is enabled in the MHI core.

Add runtime PM reference counting to the mhi_net data path to keep the
controller active for the duration of TX, RX, and buffer management
operations. Enable runtime PM during probe and take/release references
explicitly around these critical paths.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ae169929a9d8..5d7f9ccdb17b 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -9,6 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 
@@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
 	struct mhi_device *mdev = mhi_netdev->mdev;
 	int err;
 
+	err = pm_runtime_get(&mdev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
+		pm_runtime_put_noidle(&mdev->dev);
+		goto exit_drop;
+	}
+
 	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
 	if (unlikely(err)) {
 		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
 				    ndev->name, err);
 		dev_kfree_skb_any(skb);
+		pm_runtime_put(&mdev->dev);
 		goto exit_drop;
 	}
 
@@ -251,6 +260,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 		/* MHI layer stopping/resetting the UL channel */
 		if (mhi_res->transaction_status == -ENOTCONN) {
 			u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
+			pm_runtime_put(&mdev->dev);
 			return;
 		}
 
@@ -261,6 +271,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
 
+	pm_runtime_put(&mdev->dev);
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -277,6 +288,12 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 
 	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
 
+	err = pm_runtime_resume_and_get(&mdev->dev);
+	if (err) {
+		dev_err(&mdev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return;
+	}
+
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		skb = netdev_alloc_skb(ndev, size);
 		if (unlikely(!skb))
@@ -296,6 +313,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put(&mdev->dev);
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
 		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
@@ -362,20 +380,41 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
 
 	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return err;
+	}
+
 	err = mhi_net_newlink(mhi_dev, ndev);
 	if (err) {
 		free_netdev(ndev);
+		pm_runtime_put(&mhi_dev->dev);
 		return err;
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
 static void mhi_net_remove(struct mhi_device *mhi_dev)
 {
 	struct mhi_net_dev *mhi_netdev = dev_get_drvdata(&mhi_dev->dev);
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
 
 	mhi_net_dellink(mhi_dev, mhi_netdev->ndev);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_info mhi_hwip0 = {

-- 
2.34.1


