Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C3CD5BB0
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=rHxVxsuRz2XD0pw0cQVQSnFXR9
	5x1cXCHpykBnmyVxbKmsvWO/2ELUxCljRlLBj0OHVf6omY8ALZeJ+gYFHNVKqPQZBn8FtCkDODXgY
	2TT6wq8CJTvFNT0X+nB5Lzj2TEY6m05PTB8iWztdWI5GcKd7B8T51rKMFZC8e0wMyMqEXYLPQqKFf
	kn/aIAbptqaTDfQ32af9jPVwDI5ehicIYPL61XsfmlV1EujPb0FHrbjgMID1HUA9t1bG+wCegE7Hc
	XqWegbPTrkoCl8dNF9vnEYiXo1jMnuvEvXvE8Oslu63iutUkT6AVKyGnWvbJpjFYbaYMI5lo/Drnt
	sFxQSE4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhJ-0000000APYP-1IKF;
	Fri, 22 May 2026 10:01:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhH-0000000APVu-2yAh
	for ath12k@bombadil.infradead.org;
	Fri, 22 May 2026 10:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=V3anYL8p4jur9jzFECdHR3gtdn
	BYWkUC/YuZf3TpULGBWVEMdwWYTeRJeLSGabkqys/gSxnNAK/Hv2anjd+4nscU2T3LDFBVimjW8HJ
	C/wTZOHdCBgSOccqiHffdB7LvxXc6Z5pHZW+4N44jBuXQ/HvfLpDbdFu0WXVMzyC/w2QUv6hWGJGC
	uct9e1CaVt45P/0F39GV62JAUUKnTgcf7MhJKGPoDpzWz1zlCph2LRJLdm9aB8RHnum8k5eY1KFw0
	xX5kT9PApIx4HAq0iy9d1tyC6WCO0Xfvf8ny3rZYO7XHybrE9D8eCahXIb32HYr7qyBwXGrhZBtBk
	YNDXQqyQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMhD-00000003vDY-0Mqt
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 10:01:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8VZMY1658219
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=; b=aB4/UNTxbpSN1RC/
	1dG3EFP85XnO7MT7R2W4Qs0lipz9XHR4AqH5O/T458jYczzhH9G7qHfvZjAgUgBI
	VvxFvf4a6EKgKH3kzJIOIwANo/pZpIXHy1nU3aLqbcb9+0nQX1kzj/o7raFPvblj
	gcVKLOBnnpwt9+bz2NHLdKvGDNqK/EecVXNA8U8lNbFf6RF9oWMOsYUEbcHiA49x
	etdmiOPpYg4zrKLhqZGR/7ff41oKhdoS3aUXrE7zX5xpQD8I+ztT/YobcKmGa8CO
	PnYbS/AukIu7j4O8tvvolAql4or1OHnTNVsqHw5BpQFqMxuBVzAmhDLM/qfd5hI3
	Vh2QxQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkn86j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 10:01:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83f24cd00f8so3887535b3a.0
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444093; x=1780048893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=;
        b=RfIVkRYbspgBGhOKaXE05AO5D/XLHUiMbJ/tjvpCdlXidyHYe/l7XNV6nM0GjkJsDx
         y0/oAfJK25BMU4Qd7ghZh5bubI4eIzQmZ/6pj+X47k/B3L4sUnR0C/VrfgwJndnsFQ1G
         +o1jsIo9DvIynDeE4pcZJAs1hnHLXMRWbjkX0a+ZTwR8VtBhCcBruvMjBZ7Ds/oOZ6yh
         /odOkfRNW31DaEkod3xrGvMwR84/ay8TeFz8LuFTKzDByoHKQne8KnI3PFyEaVqdvpR6
         /xohqNIZl6/pbkIQOUbbnExLkiGjKXlNd2JoT69VzbvxWUcGXvuBtKnyA/BaaS+Hnz1a
         N38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444093; x=1780048893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bR4ejhF0h4W2ccu0JEwLdaUkh6Z3ndW9f2Ipfo1SaM=;
        b=DfYM1doRoufoF+ythiByVSs3OFwr8uUL7RKgnAYcAdfcY8igBGDEti8vrEjUCd4RZD
         vAndFMPsNyCLw5M4/U12xZnCffnrY/ghVEflPN38OIVj73Vg+MYO/mrpS5pSaNgBhAgT
         AFcFRK/0zv7CeiI0lJjRGvmtjF4G39TLESRCnO0PLLBKV3jxlJqf5LxiBs22krpQYhkI
         80azAdsD/ydor2Fn6PAG0zza24JGbEydCJdWzMjBDsjLtZjcYvyyj3AKiD1SreMPRWnj
         BuLzrW0LdMusFBU3Jcok8KCXU3tCrxOEJeGH8+0cN28ipSZs5Zn8Tg2cZ4NqkM30I0pw
         ozuw==
X-Forwarded-Encrypted: i=1; AFNElJ+belMiMRZHLFetfppTWJXqo166wDGlRgXGRS6mPnb0vBl/Zz8y51tiddZb2RPH5o0uTpELfDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEw2UW4T7rzAS+FOY7BW327O+hqTOU0+RKfbinQ1lkII9Yf+1b
	xpyarIHkddvWC0l+3Mb58G0r82m+McrjASFHv34TV3EXdz4eivHI0B/t1DbTuyXr7+iKAHvjwD4
	00G6+P7JG1evPA/MShkI7Yv4O5teBTi3lVpHdIZ/78c5Q9CcBo+IfcR/bO9rFBShG
X-Gm-Gg: Acq92OHdpdrJ3LNZqYo/dM9UOvfb1vMYpl7CB2UrBGKLc9UU+LO6e7KoP6aSGVFM8zE
	Cgzn34mJrbS1vxlMxzmc9RRqNc09R+R6/PItoZbUNpCNGCVAmnyB6EN6KARBT3EGYinOlHw1sJx
	9ZeDLtYcIqXPk3WhMLpi1i6zs7n48exbRBxgv+TPIJ0Tj36hF6Ly8LWpRWiG29ljA005gMyKlfb
	ECSCGa2X2Zl/KaSZxP2ayIkE4dgiCJ2JABdOw0v5gByLAYwfqZmBXt67Syz5D0IgJD1Z62vYnc/
	/YsBUrh5+1pikWcmWDbFhk7eITF1RdxbUnjys/mfHlzfCmE81Z6rg7LP8owZwEa3vUp6FgAyCWT
	P0U3J6TlSHg3XuytG2iZPYNVeEPCkeE2oN4TBJorl1NI2jVyAIIPm352V
X-Received: by 2002:a05:6a00:1988:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8415f158d1bmr2990114b3a.16.1779444091966;
        Fri, 22 May 2026 03:01:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1988:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8415f158d1bmr2990025b3a.16.1779444091299;
        Fri, 22 May 2026 03:01:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:30 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:36 +0530
Subject: [PATCH v2 5/6] net: wwan: Hold runtime PM during active data path
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-5-fbebf41a82bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=10149;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vGJb93aYUaQ8jo1tSvCSFnkGptC5OIX1Pw2nFhM0VA8=;
 b=5HBYYXQJRnjFECEDyTxAMsVcYHphefIrjpOXjPGckvK/1sqC+W9+kiVtG9bbrgpJFZpJ24t7g
 QTVXR1LTohwBnb5K2h0l2+2Ptqd/7bRJefIPqDTarqjhDq3aBiTiykq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX11ZqZ7E6JVST
 k0djbxQBwD4Edti4YgD9YY6rwAtpKjAVboRPY/X9Ftu37tVBG6gAg0joLIttRl4NkZaYgW2MWZZ
 E9sxwETJv1IVkjSFsNu5w66hnJtoIMEeLyZbbnkboJwvetZHguhHudb85uJXL60iznT03VZEbsP
 v3TEg3C1fHLpIewVFzlZsdb8SBx7Yo0ariW9BiPc9d7Jn8i5R6TwmuuMcLF5C70SlE9tzi0UFY+
 nVT97iWWT6fT12R0W5jYDVcmA/FiXzmPekVXCrCGHhrNWb3kmIYl0RSOq9Yqfu4lAKmz2Iry2GH
 3GNeDeW1j8n/KOy6VM4Rj7O8AxAr1x/QukR1RKE4WK7r3oHR2b8nsDHtgvfFILNBZAdqIHLcRpW
 ppWAlmJl0MnCT9PUHZiqZer0l9xO3AwPPCo/ixmlnRfqLVvivnXHu6LOFrf+Vc4/45X4jY9w6Z0
 DhMcOSVCujeCV/gj7xg==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a10297d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2zpQ2AhS3inu96TDYMYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: iDuLpgYdsFDXd1u0YVl5l4gbveowbv3G
X-Proofpoint-ORIG-GUID: iDuLpgYdsFDXd1u0YVl5l4gbveowbv3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_110135_958827_8CA5BCE9 
X-CRM114-Status: GOOD (  21.05  )
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

The mhi_wwan_ctrl and mhi_wwan_mbim drivers do not coordinate with runtime
PM, which allows the underlying MHI controller to be runtime suspended
while transmit, receive, or RX buffer refill operations are in progress.
This can lead to stalled transfers or failed queueing once runtime PM is
enabled in the MHI core.

Enable runtime PM during probe and take explicit references around TX, RX,
and buffer management operations so the controller remains active for the
duration of each critical path.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wwan/mhi_wwan_ctrl.c | 60 +++++++++++++++++++++++++++++++++++++++-
 drivers/net/wwan/mhi_wwan_mbim.c | 44 ++++++++++++++++++++++++++++-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index fa73861db6ad..0fe0f24c0df4 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -4,6 +4,7 @@
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/wwan.h>
 
 /* MHI wwan flags */
@@ -79,6 +80,13 @@ static void mhi_wwan_ctrl_refill_work(struct work_struct *work)
 {
 	struct mhi_wwan_dev *mhiwwan = container_of(work, struct mhi_wwan_dev, rx_refill);
 	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+	int err;
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		return;
+	}
 
 	while (mhi_wwan_rx_budget_dec(mhiwwan)) {
 		struct sk_buff *skb;
@@ -102,17 +110,27 @@ static void mhi_wwan_ctrl_refill_work(struct work_struct *work)
 			break;
 		}
 	}
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 static int mhi_wwan_ctrl_start(struct wwan_port *port)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	/* Start mhi device's channel(s) */
 	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&mhi_dev->dev);
 		return ret;
+	}
 
 	/* Don't allocate more buffers than MHI channel queue size */
 	mhiwwan->rx_budget = mhi_get_free_desc_count(mhiwwan->mhi_dev, DMA_FROM_DEVICE);
@@ -123,12 +141,15 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
 		mhi_wwan_ctrl_refill_work(&mhiwwan->rx_refill);
 	}
 
+	pm_runtime_put(&mhi_dev->dev);
 	return 0;
 }
 
 static void mhi_wwan_ctrl_stop(struct wwan_port *port)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
+	int err;
 
 	spin_lock_bh(&mhiwwan->rx_lock);
 	clear_bit(MHI_WWAN_RX_REFILL, &mhiwwan->flags);
@@ -136,12 +157,20 @@ static void mhi_wwan_ctrl_stop(struct wwan_port *port)
 
 	cancel_work_sync(&mhiwwan->rx_refill);
 
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err)
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+
 	mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
+
+	if (!err)
+		pm_runtime_put(&mhi_dev->dev);
 }
 
 static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 {
 	struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
+	struct mhi_device *mhi_dev = mhiwwan->mhi_dev;
 	int ret;
 
 	if (skb->len > mhiwwan->mtu)
@@ -150,6 +179,12 @@ static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 	if (!test_bit(MHI_WWAN_UL_CAP, &mhiwwan->flags))
 		return -EOPNOTSUPP;
 
+	ret = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (ret) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", ret);
+		return ret;
+	}
+
 	/* Queue the packet for MHI transfer and check fullness of the queue */
 	spin_lock_bh(&mhiwwan->tx_lock);
 	ret = mhi_queue_skb(mhiwwan->mhi_dev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
@@ -157,6 +192,9 @@ static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
 		wwan_port_txoff(port);
 	spin_unlock_bh(&mhiwwan->tx_lock);
 
+	if (ret)
+		pm_runtime_put(&mhi_dev->dev);
+
 	return ret;
 }
 
@@ -179,6 +217,8 @@ static void mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
 	/* MHI core has done with the buffer, release it */
 	consume_skb(skb);
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	/* There is likely new slot available in the MHI queue, re-allow TX */
 	spin_lock_bh(&mhiwwan->tx_lock);
 	if (!mhi_queue_is_full(mhiwwan->mhi_dev, DMA_TO_DEVICE))
@@ -217,11 +257,26 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_wwan_dev *mhiwwan;
 	struct wwan_port *port;
+	int err;
 
 	mhiwwan = kzalloc_obj(*mhiwwan);
 	if (!mhiwwan)
 		return -ENOMEM;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err) {
+		kfree(mhiwwan);
+		return err;
+	}
+
+	err = pm_runtime_resume_and_get(&mhi_dev->dev);
+	if (err) {
+		dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed %d\n", err);
+		kfree(mhiwwan);
+		return err;
+	}
+
 	mhiwwan->mhi_dev = mhi_dev;
 	mhiwwan->mtu = MHI_WWAN_MAX_MTU;
 	INIT_WORK(&mhiwwan->rx_refill, mhi_wwan_ctrl_refill_work);
@@ -240,11 +295,14 @@ static int mhi_wwan_ctrl_probe(struct mhi_device *mhi_dev,
 				&wwan_pops, NULL, mhiwwan);
 	if (IS_ERR(port)) {
 		kfree(mhiwwan);
+		pm_runtime_put(&mhi_dev->dev);
 		return PTR_ERR(port);
 	}
 
 	mhiwwan->wwan_port = port;
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	return 0;
 };
 
diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 1d7e3ad900c1..56e660ecfcb4 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -20,6 +20,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/pm_runtime.h>
 #include <linux/skbuff.h>
 #include <linux/u64_stats_sync.h>
 #include <linux/usb.h>
@@ -153,9 +154,18 @@ static netdev_tx_t mhi_mbim_ndo_xmit(struct sk_buff *skb, struct net_device *nde
 {
 	struct mhi_mbim_link *link = wwan_netdev_drvpriv(ndev);
 	struct mhi_mbim_context *mbim = link->mbim;
+	struct mhi_device *mhi_dev = mbim->mdev;
 	unsigned long flags;
 	int err = -ENOMEM;
 
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
+		pm_runtime_put_noidle(&mhi_dev->dev);
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	/* Serialize MHI channel queuing and MBIM seq */
 	spin_lock_irqsave(&mbim->tx_lock, flags);
 
@@ -184,6 +194,7 @@ static netdev_tx_t mhi_mbim_ndo_xmit(struct sk_buff *skb, struct net_device *nde
 	return NETDEV_TX_OK;
 
 exit_drop:
+	pm_runtime_put(&mhi_dev->dev);
 	u64_stats_update_begin(&link->tx_syncp);
 	u64_stats_inc(&link->tx_dropped);
 	u64_stats_update_end(&link->tx_syncp);
@@ -396,6 +407,10 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 	struct mhi_device *mdev = mbim->mdev;
 	int err;
 
+	err = pm_runtime_get(&mdev->dev);
+	if (err < 0 && err != -EINPROGRESS)
+		dev_err(&mdev->dev, "pm_runtime_get Failed %d\n", err);
+
 	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
 		struct sk_buff *skb = alloc_skb(mbim->mru, GFP_KERNEL);
 
@@ -415,6 +430,8 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
 		cond_resched();
 	}
 
+	pm_runtime_put(&mdev->dev);
+
 	/* If we're still starved of rx buffers, reschedule later */
 	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mbim->rx_queue_sz)
 		schedule_delayed_work(&mbim->rx_refill, HZ / 2);
@@ -501,6 +518,7 @@ static void mhi_mbim_ul_callback(struct mhi_device *mhi_dev,
 		/* MHI layer stopping/resetting the UL channel */
 		if (mhi_res->transaction_status == -ENOTCONN) {
 			u64_stats_update_end(&link->tx_syncp);
+			pm_runtime_put(&mhi_dev->dev);
 			return;
 		}
 
@@ -511,6 +529,8 @@ static void mhi_mbim_ul_callback(struct mhi_device *mhi_dev,
 	}
 	u64_stats_update_end(&link->tx_syncp);
 
+	pm_runtime_put(&mhi_dev->dev);
+
 	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mbim->mdev, DMA_TO_DEVICE))
 		netif_wake_queue(ndev);
 }
@@ -614,6 +634,17 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	if (!mbim)
 		return -ENOMEM;
 
+	pm_runtime_no_callbacks(&mhi_dev->dev);
+	err = devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
+	if (err)
+		return err;
+
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS) {
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
+		return err;
+	}
+
 	spin_lock_init(&mbim->tx_lock);
 	dev_set_drvdata(&mhi_dev->dev, mbim);
 	mbim->mdev = mhi_dev;
@@ -623,8 +654,12 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 
 	/* Start MHI channels */
 	err = mhi_prepare_for_transfer(mhi_dev);
-	if (err)
+	if (err) {
+		pm_runtime_put(&mhi_dev->dev);
 		return err;
+	}
+
+	pm_runtime_put(&mhi_dev->dev);
 
 	/* Number of transfer descriptors determines size of the queue */
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
@@ -637,12 +672,19 @@ static void mhi_mbim_remove(struct mhi_device *mhi_dev)
 {
 	struct mhi_mbim_context *mbim = dev_get_drvdata(&mhi_dev->dev);
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
+	int err;
+
+	err = pm_runtime_get(&mhi_dev->dev);
+	if (err < 0 && err != -EINPROGRESS)
+		dev_err(&mhi_dev->dev, "pm_runtime_get Failed %d\n", err);
 
 	mhi_unprepare_from_transfer(mhi_dev);
 	cancel_delayed_work_sync(&mbim->rx_refill);
 	wwan_unregister_ops(&cntrl->mhi_dev->dev);
 	kfree_skb(mbim->skbagg_head);
 	dev_set_drvdata(&mhi_dev->dev, NULL);
+
+	pm_runtime_put(&mhi_dev->dev);
 }
 
 static const struct mhi_device_id mhi_mbim_id_table[] = {

-- 
2.34.1


