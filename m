Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A32C53200
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=; b=XaPRNFUsYhADdTDbFcGmXj7EpV
	M/7m5/Zk2APlX4o7vCVa+R9yXETT0KYyrwfKA/7hG/dxyM1woLkhUyVYd8XJzI0VwWy1AQIcI6/U4
	tR3FZNLFKeiJ0bHOQlNIRvIBGk1qID016+dsrguEOchA+5sSxzqhUCEss2ym9yjaEJ3txhjuhQ3Px
	4HSlUNmasRhho078fWEuNF+NFYWbPrZD3iEWuk3WB/0sLVQiC+oPT1WehOelgBgurx4UY/ct/AML3
	fuhPB8gyNxAoYluJtlUeIkHUYKCTdXW6S8LTizI0yfuOBydZ2AMuFpxcOU6w2lzn2c5c3ZBf4V0X7
	hAA+wYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD4-00000009D7W-2ca1;
	Thu, 30 Jul 2026 01:05:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD1-00000009D6X-3i5f
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:05:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0faI43372569
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GZIFPKJkDGS
	nuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=; b=fGTIPuRBu8BIytQ7K86BoyH4pzn
	P5wQhZka+UQZ+p83p9YcIMsizwNpg2QTtT/XzFQjLbLMU2X3y578ULVzYVm1IHRA
	9WoN/+Vx/uwuhJBPZp1JXc7jKtzCmUC9kUkWurqoXBlOiMgXJu4GaTRQFkONv9nW
	aZ/hAahfBdSpbNDMtA9T+F0gRil7cFPiBoI/bKsiz5IaqZvOu9XF1VtxkLUpuHNz
	wOlaV6Gzd9yp1qhV/3zw49ZVUd84/arSBErCZFPQI9TRjcO30tnuE62AWb99KvLH
	lbgXmKcwyLbTLR6nVG5oLBIfhh7n6NSTwEcgtWxI7SiogTUJMWdLEWmaUJg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqutyg51a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so2717492b3a.3
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785373514; x=1785978314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=;
        b=JI/hBN5AbhluPp0UbZQFjX915MmYiNDk63/7OpMM8I14PJCswff0LFn8AX6qFELyqS
         Wmge4ZOPs/kWfOAad/j11av7DRpsskdN+QQEdUIDEoiC7cfPs3C3O/dM2eMzycUjIEQ9
         mw9I8bw/ANQtPU+kxwKJKySuF74LxQ1+/WEREaShC4LJGqSI5367LI9tLmdBvJ2iXPcd
         wQdbKyOQ+Jad4KJmhPh8IRUtDVg4aQWrSRyNgMWyb1Qh0fQTlgfuDJWnlVMdr7mJOJYT
         L6wBUpa+jcwjC6GZojjMmitGGX9+dGN++Vo/FyS1vg5y4eAf5gzDjnRNc4k1LybS/30q
         DsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373514; x=1785978314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZIFPKJkDGSnuUkEjLb0SYepjsgYlAfbbIULDJ3tKKg=;
        b=kAdCp1Hi5rZcXvvY9DNdM9XyFTmrMrh4IuxhN/pl+Zqd42VQsJfiBrRH8mhTDcGeXx
         BAyCE7xIHgw2+GBB2HNtkqGxW2fBEJ/T26dst2oCiOlSdtm6y/GspQxA/LZLmjN0w6Ui
         lskaJDL+rxRbICxG0gFUmFDlOWFZsOgD9Kaaxic0SG9fLRTcP6U7bp24GbQyYsz4gBSd
         saW7r+MlQZ/dJfC+FrDE3gBQ8P3yXQ4hMCn3mueK4PXCTQJKb6AvjSd2A+5nRXqpehQA
         vDWx8BrtXfDR3FhXQ5Zpu+qLDtFM6Uy/FSOjrZx4HAwUF1sxQmOfwlsKs57kIvzRXNFz
         I6Pg==
X-Gm-Message-State: AOJu0YyxZwpmlfav9J4OMimwHe9ePJqikw8q0rW0zVs8DUcxT9bMqcbK
	kWALcChdjXjImxqVifoPmj8b63rUIfQb6j8byvDMY641cB2xP3wNu0euYe1sRcBVAfcdYresiQq
	GWQnW6QsMO9BoP0Ttn1/vU143DXttczqaeT54MZu0Lf0Ff9AzNNJlKAQ2peu7CIqB
X-Gm-Gg: AR+sD12OzqzhOEhMQJIJdA2jTZslTAQa1dFUy+RsbAgz2lgp59jboHSEmH+C3Wyhqaa
	uCf0BZ8CmI59A6FeHH8RcA2bAPGE+oIR4EuIiZ7fjFsQjuKD4fbE4o7/0URKzN7+J07kH38+RRN
	JgJutbv6rUdUVVtd3uxJZp8gFKhx7PLRmZ8hDFUZerzy3bJ+YoTccEAhREpyWJbDLTFGZR3apVi
	X+vifXcG9JLqhs2pNMU6lNGQh3yHdqrKr5jo2BkRf5TVMTe9LkJ84oHBqtyhF8gx1YEdeuDtpln
	IQd0sHdiEg7rn8o2PrRrUZfE+Xa27/ndQbs7V0nes2GskVq7ApyiZLk/DWF5vT0Iitbf5W/byLx
	99S2z/yTJF3S12kmTPe4ZI4MfY4vj2ZAYDNP48X/bwXPEW3gH47mADoY+Xnk=
X-Received: by 2002:a05:6a00:17aa:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-84ebc448067mr621123b3a.63.1785373514267;
        Wed, 29 Jul 2026 18:05:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:17aa:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-84ebc448067mr621080b3a.63.1785373513822;
        Wed, 29 Jul 2026 18:05:13 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2168563b3a.11.2026.07.29.18.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 18:05:13 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 1/3] wifi: ath11k: fix sporadic WLAN initialization failures
Date: Thu, 30 Jul 2026 09:05:03 +0800
Message-Id: <20260730010505.143458-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfXyjxekXkxh37B
 znjycD4zJR1sB4QDtH1jXw1KJkRbDIyaM6/4P9NfqaveheGpnrQmOcHXi2Fh34c5PnZmIu5D4jt
 kWXQZfQzIDxEelyux+qoFIDrXtRbTKw=
X-Authority-Analysis: v=2.4 cv=e8c2j6p/ c=1 sm=1 tr=0 ts=6a6aa34b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=izyCnyVwb-cPu2P0njQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: jjE7t4ZHAVug5q7A97qRkRAZz5rzv8CQ
X-Proofpoint-ORIG-GUID: jjE7t4ZHAVug5q7A97qRkRAZz5rzv8CQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX7l+/LNO1PNI1
 W3c3/2CmhJzL/358gGpAlFU7w4f9xOfVLg5Nkw9+CAQSBJQaw+wPhf8O5vmFbOkM1gF5SG5b2el
 vm4iKprLwthNDRYn0kuOhiM4+o1DlvbS5RkKiwJuRHOduHcFcP9KlhzuhZl1g59Ef6YqqUXxboG
 wm4Wvo3R1fWa1oyF5AgEeo5BwOweFQHU30GDKkG87D8NP2S7LggmkP1OXPxopKlNp58wcazgVh9
 JSsqY7eq/KtiCEqUMRr/VS0NArpjXUVjT1/9rXoisapGuHZLLbAi2VsufZ5hu67dlVkD8v4zYBj
 JOb0vdonska5ux3+Kw3Rs34EIzZOhb20q1FX/l3wOR9b4kyFScwsLJn9X+C5AevjWzumZUrPqdg
 +tDFqf8hp/XHzpm882FIL5hqKItcBslRAEnNd4RmgSye5xuiRzydp6cPpc2/EkfTIbsVXVfX6ZY
 zx5LaP/yKrW2zVO7eXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_180515_929727_8B9D408D 
X-CRM114-Status: GOOD (  14.18  )
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

On WCN6750 platforms, reboot stress testing occasionally results in WLAN
initialization failures after boot. The WPSS firmware reaches the running
state successfully, but no WLAN interface is created.

Analysis shows that ath11k_ahb depends on the QRTR SMD transport for QMI
communication with WPSS firmware. However, this dependency is not
currently expressed in Kconfig, allowing qrtr_smd and ath11k_ahb to load
in either order when built as modules.

If ath11k_ahb is loaded before qrtr_smd becomes available, WLAN
initialization may not complete successfully.

Make the QRTR and QRTR_SMD dependencies explicit and add a soft
dependency to ensure qrtr_smd is loaded before ath11k_ahb.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
 drivers/net/wireless/ath/ath11k/ahb.c   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 122726f84492..44b520d2e66e 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -14,6 +14,9 @@ config ATH11K_AHB
 	tristate "Atheros ath11k AHB support"
 	depends on ATH11K
 	depends on REMOTEPROC
+	select RPMSG
+	select QRTR
+	select QRTR_SMD
 	help
 	  This module adds support for AHB bus
 
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 1e1dea485760..fb5640882b98 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1312,5 +1312,6 @@ static struct platform_driver ath11k_ahb_driver = {
 
 module_platform_driver(ath11k_ahb_driver);
 
+MODULE_SOFTDEP("pre: qrtr_smd");
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN AHB devices");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.34.1


