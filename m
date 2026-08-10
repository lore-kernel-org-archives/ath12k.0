Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3518AC5AE49
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3V8Tl5Znh1yQfGva/IB+DLL7AbXu+gndyFgeBKeWSQ=; b=KccyA+ROU4f4TDmnz6xNPcTB8R
	AjtghnRpXac5AtKxUvXDWAn0sd4ec7FFCq5qu6chxqxPXqNpgK0OEw4O/KwwyJyxOpJEzcmHw2M/U
	+3J08DJujOlH0X86hRDtOrhZS3/DEsWEwuF5NL2QoQfcO7fZRx4AYmBu0Fg18Gi5YHD+DH9+TpsUh
	qWCBY/GEbvlA/D30dO9FNRSy1x3TWthUPHQfgxreWKJPBoPhRb5PXa1yH+PiksPrTpQKjtyn5VKEu
	NOOCWa7UvHWpMe32uHHtM33uU5649GFBawxk1Mnkd/u9Z/SyKv07aeGBHm6P5uiPbmsx7sB9XPWg2
	GRaX/AEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFm-0000000C3cS-3MzL;
	Mon, 10 Aug 2026 14:45:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFi-0000000C3VR-3F3K
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj7VO1343271
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h3V8Tl5Znh1
	yQfGva/IB+DLL7AbXu+gndyFgeBKeWSQ=; b=UpdVbQi+PGR5YO9tjdNZxS/ixNb
	JcebA8a2xI8wZL6q2UwKpKed5Be7ZH2gBnzpR/emYmk8pS4AMOLOXq18I0dNZe/y
	HdxvDMy7OEGqU+h55bx4KjGG8CCVJ53DYd8GyaTNtGoHFugdHWCFTHA5g4oo71/X
	HVXGbWXZ/Zveuw/YbY1WuUrMxL5QTpFIs+H8JI7k5Eec2EfVD7rA9yn26FP1cvbD
	NSnz091Zpkw+zD1Gfd9NvOr+T2Vf2Xugc8kGIcd/PMQGmN7nTWAnMk0VhXKX1yiX
	4sMwFnns8VWOPHFyFE9Q/Y98S7o7s/g51SwPJyiFCrZYsMrvj1AKqPZFbSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a07w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1862747a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373121; x=1786977921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3V8Tl5Znh1yQfGva/IB+DLL7AbXu+gndyFgeBKeWSQ=;
        b=UsLsCvzK1LKXMTjgRnrFfVxDVRiC+CzLHPFtuwC608vl7CmBGFqVcT3moOUkaQUctc
         gn0Cer/SNucJnQpTfOahypbqUYbzai+hUJ2guE7a8lAy5nJKxTTBPC8YN3rC/5UX2VQB
         c1da/XkYGc5rkd62K8vAAIdan7xTlJm1RK64ltQcZF05ZyfLnGl/WK24i1bFBzmMVeD9
         vQ2W2KAOH/DmK+OJeT0ka0mNeDDEwNIUdI+adiC2+pPHOhy4Sz6K9JJmj3+3VNSJTe9m
         jdl2UI+pGNTszm6UNAtXXCweQ/wLDr5ofGvxEfq8lyOfVgqa8WP32ZJI3RjPJ+4uhRN+
         GQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373121; x=1786977921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3V8Tl5Znh1yQfGva/IB+DLL7AbXu+gndyFgeBKeWSQ=;
        b=DgSc5uu3OHEaAfqQ2iyKnOZubYGBfQt+oIZReUZxYYWPycLKGk4qp7K3CEhc/sfGRi
         OHAT2754yErcvW3MryL6M9LVoPpUkUSBrXVM2RqzlTT0dpnApm/qNpWK0q+LtANZENAD
         wyY/INdvH3Vw5uk9izwM09v/+6LfakNC4d0drSut7NXs2t7BSGD6CrfuxpGKNWCEWcBS
         qrG8Od1+sifFqjw1O76O4cvhoGE9KcpaFPf9whfpOAsUjIsx7XHBCXS84evEmwDL3uxr
         IrYNxPeAjpAR6LxS8/p6cfmKcs21tl7wnawYFdyZIQ6fguUAIeKoWjm1EqDGX2HnysGq
         qByQ==
X-Gm-Message-State: AOJu0YxbBHkvCymzmDWk9GZ1Og22ZHbHWfZKX6pITExIHOzok2dmPl+a
	MlrXq9dvzXOa9PE/ldRODjU7YDPyVCml8ejM2Sk7Q56F7hAOeNDmQ/6nDeHTm+9nvQL2cVSvgeY
	xOxbuCDgCpc64HqAJBvbWb+vL2MspY+AuIPdvMWkyn+QKkM6EyrhRoKoso5YVZtXAtnn6x15r
X-Gm-Gg: AR+sD10wdikQ+ysAAgyfjXo7SS7rBMUafxZpE+/bMC5m8O2eVgy85rPb9R6y5og2Ij2
	K5p5gYJff6edfAbZcR+w2RKnCez4CzL6rtCFDUDewkx9640pKYcmjoUDZKp8wGSgBa1J68W2mA6
	3tbMUuRAW1Y4C/yOYaszk7r7uh8WvaSTntfJaZZpoTyEywCRz6XGUvstFOXsG0mXnwSgkJUXyCv
	X1uCNLNP8KbGj7WxwNP+895BDg+MVqySDN6Fu9TeCIgLd94mqQgN2rwc770uuNyasZguceN4nDt
	na50LEj/zPys7fp3eRC8yJOrZdkOfC2XciCgloze3nkgrrEC73wR96Gge6KlCjaitPEBixX0zZO
	6PK7Id9lSq+G0fz3CiRfYrZVqLxnL2UZq+y+ZLwqE+wqEEVL+xUEj
X-Received: by 2002:a17:90b:55c8:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-3928479c13bmr8221074a91.20.1786373121214;
        Mon, 10 Aug 2026 07:45:21 -0700 (PDT)
X-Received: by 2002:a17:90b:55c8:b0:387:d5bd:6231 with SMTP id 98e67ed59e1d1-3928479c13bmr8221052a91.20.1786373120762;
        Mon, 10 Aug 2026 07:45:20 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:45:20 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 8/8] wifi: ath12k: add WBM SW desc fallback counter
Date: Mon, 10 Aug 2026 20:14:44 +0530
Message-Id: <20260810144444.2033607-9-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXw/yNrMg+YjnK
 Ub7iQdUVjYoBr1pPLPZmPGQeSMYjkInQTdVddTWrdVQ1NSs6AwpT2Epg+9VOhxdbXEY5KTGb9zi
 gFkBbBnwbXD9US/9Lk8tBgroDVGsk5Q=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79e401 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7LnAo4KMM85IVg6JStIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tim79XlmYyq9Rv8FzjfuYvvkEr_7Tuow
X-Proofpoint-ORIG-GUID: tim79XlmYyq9Rv8FzjfuYvvkEr_7Tuow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX8HGpuVg0wAl0
 FLxdjh355qgkf6DFIGuKp+yhFt09H+mYW3ad9+Lss6e+3exfNm/oN4vzmFQ5TFA/i8BMzQfLTzF
 sY+lOdEDiqK+fvTILru+IliC9H/j+KLll9qAfXpbqs+xP7qhL+nzDfYY9HNfT4VPMVXba9rdAsm
 jpyT8aL8TxgFMu5Q4lOAPsew0oelooaOU2xKrAnVJRJZA/MjiSWYiJlcgitKTNxTmHXzpRr9HQd
 e77N9Q03YpqtbjAmariD2wvyZetIwaRuV9Wp6TrTvhv9/GwtChSzjICtQQp+X8vVZG3A9p45Kna
 e0XROnhaWQEE84sI70eZ4pMiEAY+M0askjezoEEZ2y9+gKmY0bgniIkNMVuOh3rAx/ecfnQQ1d2
 lCo/UmUgPmmZRxUtIFgiWOgq1ffjUJcwQ/JPI6a48jAWEnEELZtQGINRzMccoAce+NM6ETkz+DY
 tuc5pKge/WupRbeeiyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074522_984911_97FC05BD 
X-CRM114-Status: GOOD (  15.39  )
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

From: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>

When HW CC is not done, the WBM RX error path falls back to
cookie-based descriptor retrieval via ath12k_dp_get_rx_desc(). This
fallback path is taken before knowing whether the retrieval will
succeed, so it is not a drop event and should not be counted in the
drop[] array.

Add a dedicated sw_desc_fallback counter in
ath12k_device_dp_rx_wbm_err_stats to track how often the HW CC
fallback path is taken, distinct from actual packet drops. Expose
the counter in the device_dp_stats debugfs file as a separate line.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 4 ++++
 drivers/net/wireless/ath/ath12k/dp.h          | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index fe513b3489bc..d2d89a7e340d 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,10 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len,
+			 "\nWBM SW desc fallback (HW CC not done): %u\n",
+			 device_stats->wbm_err.sw_desc_fallback);
+
 	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
 		len += scnprintf(buf + len, size - len, "ring%d:", i);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5cfe2096c633..289aede6dabb 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -442,6 +442,7 @@ struct ath12k_device_dp_rx_wbm_err_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 drop[WBM_ERR_DROP_MAX];
+	u32 sw_desc_fallback;
 };
 
 struct ath12k_device_dp_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 60489cfd4e54..d96d8301565c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1968,6 +1968,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 		/* retry manual desc retrieval if hw cc is not done */
 		if (!desc_info) {
+			dp->device_stats.wbm_err.sw_desc_fallback++;
 			desc_info = ath12k_dp_get_rx_desc(dp, err_info.cookie);
 			if (!desc_info) {
 				dp->device_stats.wbm_err.drop[WBM_ERR_GET_SW_DESC]++;
-- 
2.34.1


