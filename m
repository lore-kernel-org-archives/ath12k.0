Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91DCC6B2D
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=k/SNa6ofa7YT3SXMGOw/dXDQS4
	qWUa+UF7a1m/eJa9DZfdcncHSE0Caqa912tG59W2RSZB4qLBpT8cWvMVdE6No9VtqR/OjJiA/qIu3
	JcdydktbkA/FE+2ZJ4uSByAGfmQjSUwqIvp3RHyI439GdsUvZlAbjHalCNhuLHC0g/LB4DFrgZFI9
	2x4GLIu5n3WrUFhXKTkqJgOILUiXl1vYE+QVZGBh4ec6rTHbyOCiXPp5/p+bDTsfaPDNF8s5L/5I1
	trqfL8O7UcYUi5iB2qWqT3pqwQsKa/FXTzJtSZmKCFH5q0YC8hNmImlRM6suq4CoAMV18q2+Ywz2f
	BTVk6n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXR-00000001qJ9-2CSd;
	Fri, 16 Oct 2026 03:23:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXQ-00000001qHt-3ZDZ
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=qh3FC2sI9zy7v1WujTTdsUk3ie
	y/EL08j7rAYs/Pw8TzRgE+bTWEgZ5yyLObz+OxDfg38YOuhpZJuSf6+TdJTw6YI9WM5HUg9aCZFxl
	0lrlVy9MVnndLbu4pxBTk15HtR2hrDVXT739bwLWbmTac87jl/oItxQevOQNb5HhD1rJG6H3CRanx
	2BVi7juUuA4eDQ2a19l6xa9Bb/7eDLftWvy5KqE5UjwGcEXXN3pSySTTKV7tpE6yi5H0igF2vLglm
	fzwN60/SHzqixkPC+aOQj8h75GDq8NCYO96j5qyfHxDDfqPisZ6Liq59jtIG55fcAhEdwJGaQjTYs
	28gppNeg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYXF-000000012iX-3Gtx
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:23:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCo7K557676
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=JWE75Mf3H5ggkTcH
	KL6JvNmkPzi5ayxxi8n675rcfS3aX3hLGdEo4WffSfbXiqA6q859/N0xixZYx3sM
	jPpPevJpqO9HglFL44Z+dcb3bDLK+q8z/6d2HbP3mCGRklU4ixQR5NtypDcmq3H2
	M1vW4bn9A4HADRXwrknJt4ydJ77L+aj/BGawS847xUPdk07ub/qjmKS5cP+V6XoR
	eWbwrJumyuopgyZpeCSmnFX/y6lCngfcVV0XXM8oRdCYX8mhU0Rpa8irBb3Hpaxu
	+ivcmQIp3WC6QRStiKbvffz74US5gUEoGl3Wv2RTneRyv69iQLZPkNidJ86sdqD0
	v/8hfQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88p99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:23:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12164294eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120987; x=1792725787; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=RGIphRfZ5hKGK2HpP01o7aa+y81q6dEvESvw5uIITMGny2BiTBRScfYTCBUM9gQP38
         6IMdQ0f45krSNA0zytZFbYnCWLKZM8TBhIH2x2XjupNL98Oc7wLKxa9CeVrxBdRLBKko
         IPx2p4+zaPY5JzAxt67+OLM5cWN+nu/B/HSQQ+ldDpDreDifkY7MnmJbYMDJERvQGTWH
         4rq0PzagmL669Md4vLHbHANr818u3v+XwNXPJoW5/W19ZWXvw0LkQ2BvEjU0OptqReuy
         4yr6jna0mB602sMMJiuKjDtr50HF8AytVjnsKl1xulvkqeolfWZ1OdX6GWf/R3IWfmIh
         gSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120987; x=1792725787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=wc0Gc6e97B8UYNnZdASCxBPkWW4+qXVurie65Qpd2jvuoKE8gl+woi0W8vspPQKz62
         EYXSMpC1pZrEvPSHur45IiVfSnNabJ66Zn91gajtnbYHm6j6o+CCJ6KK/dfFd9WUxqQQ
         pvEMEr1/fLtKjSLq2/yHsY6eKogGeuiu8qYMbosCgz64JONTL1Q2O/N72XDcOGijiIH5
         aPumlUE2EgmjUEJuYW1EqRmaZn8dXSYOjLoWhRwosSwC3/cLptyEPkctzqHhgiqaGL3n
         4TCTaHNBWuKmwP852tsesXcavz1LkgerTbhcgL+kFizJok2Rw2BjBfXB/blu7tjg3GXZ
         9JBw==
X-Forwarded-Encrypted: i=1; AKwUvBxv4+++x4yKlUVqXz/TcpWOnq7+9hftvGER6JkcSHTTi9/ziYgoZ4IOfqY3QyFg4WhSiQQe24U=@lists.infradead.org
X-Gm-Message-State: AFq9FYKsHewp+J7Q0BPKYE7ALw4aTzmvwY10tw93QcNhUaktnW40XjMS
	a4/arU2Na2LNtjp7pF59V/sXDB1+Qa7ot4XdHOUmhGC/WvizI3p1ES1e1cIOXCHUupIjVX4UgK0
	NfxSRCKxLUgqYa8VzmohQg5/NbarqQMGTZOlhoVGYQ01LUaYKxZXd0vIGrcGsSXuC
X-Gm-Gg: AYBFou1tiZfVpYgbYcfhHeJr4wFVwiiFXI6rMmEcKrSB1Gi5/a9br5wxLdNDBBEmFyx
	JLFb3jy/A65D9q6WUtnCmbWzMHehZWtnd8dTGSjTcuDk0jz/1ptfhgWGz17qaXkw2K8Bvdqt9up
	ouaZJSjPzvX0Sen5pTRT1OubQ4zEaE5h07uxffMGMEwdubnfiFmeYyL+xu68vvijZLa1qOQ3OWv
	9I+Mqzj+p2n16Q+WRGwDmYG19t30uVrFgbX2Fd0Z8fvR/D7muLVINCE73U1mWwWkpGPY34hbcIE
	Xe6YbHyUTxk5YTki6ziQTI95hbRiZq4GccPPrczP7ROpWFdSQKJyHikVoo/mrPZdobDXMLFzDz/
	DttFEaf6oYVXJN+9SawOVDAOm1krAnbqweMxn3OU5iDKMLOdQqRiRaT5+UauDgt604/pOsbKycl
	IzLUcGB/UNAwhyBNPnLGz12A==
X-Received: by 2002:a05:7300:e9dc:10b0:35e:9c54:d41b with SMTP id 5a478bee46e88-35e9c54d579mr8417796eec.21.1792120987235;
        Thu, 15 Oct 2026 20:23:07 -0700 (PDT)
X-Received: by 2002:a05:7300:e9dc:10b0:35e:9c54:d41b with SMTP id 5a478bee46e88-35e9c54d579mr8417767eec.21.1792120986630;
        Thu, 15 Oct 2026 20:23:06 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:06 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:54 +0530
Subject: [PATCH ath-next v2 17/17] wifi: ath12k: Add QCN6432 AHB support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-17-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXypJqWpeG1Pk2
 cXcIouIGROPlMTHIUVDj03RZiT98u3VoZTBTNtYc8FtDA5Wv/KdVH4Yir+d0tp6GWhf8H9RgtI0
 unzBcftGpUbudbeQUFhNa9vqQOdcU/A=
X-Proofpoint-ORIG-GUID: Yxu-7cX8WzB2ziWJk1WZmAClKuIcOPnH
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1989b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3HraXvTFQWFd
 rCjfs2mCXUxEVh3GFFoywUy4SCNuxNAII3gQcY+b6KVDFdmnW1WWSTIqaHGTjuQmwuSbqzwL/mw
 mEld4uGqRAEax89+3rL0S5HhYFLSt7e/z0SrZctc0tkjiQY33ZjHkqy51gsdt7U65Zb00rQkWCR
 6PFFgwsj13Zx5aNV8u9NBgmxVMNHmr2k1CLBrMgi9DJ3StQsVpwkYeUbp+ACxHIasGJgnu/hA1S
 F+nUtpTYaFd7mhAVVU5y69kgygGDkqA7yzwd5yOiawW66kseZheGgj2T4HgaBlgkHROJzBZI0Tl
 CQf7kF4TyTKnbryd3VM4Wq+t3gMfSiz4MYtEM9IVibyOLxjELulMr606gBAIwmamYFezeG5jEQ2
 kMsOH2ByW8ldGQvA4x78819KzRh2N4wH4KZZo4qgh/uFAsHsVip6cYthaVeEXgwMxJKdG1EbK7I
 2X9LWLd6JQeW4hgjctA==
X-Proofpoint-GUID: Yxu-7cX8WzB2ziWJk1WZmAClKuIcOPnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042310_352773_0EFC7085 
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

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index cecafc12e8a8..b55590c64a2c 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1233,6 +1233,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1289,10 +1292,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 889361e637af..ae5380eb6f8f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1


