Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A98C55162
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=; b=xxelM16enU5e2v/xas1BX/UFt4
	Buht7syUagDl5MxLNSaDmw27S3pc435xBBu6VyDTcYIp0UxYWSvw+taAINj3aRGVIYlwzAm7RpOOd
	WVkgEhXdVM9y4zFZEIFEIb++Mf+pkheyfUU/hpmz5ANjg22+DdrQaTNA3UbQfDCNiCFcU8F0UafGp
	y9svt4OZNRNkGqi56J2/mqZgjw252ofStobQhFzJVp7CjMN0s5dv/t0PGF8aXDO7x/0h5vJ4wimLT
	c3JcrXKP7sV0DDS+t+1pIySejSfCTfPtwIRB5qLOH2E4YQKhsenfm8V6312zoxj26CY1lOL5yGQym
	agfcUoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD6-00000009D8A-37nx;
	Thu, 30 Jul 2026 01:05:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFD3-00000009D7C-3faV
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:05:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0xcbM3664282
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZYFFatroACJ
	PZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=; b=LF2JPwHNAcAcRwVXVbQLYDQpR/D
	P2naiK7e4f11l1YD7xBCQKmaQ8VqNdMYY8+YGg+s311mubJgqor8QIgBG1d8VRrt
	RgQiUxt9596wIjwRhI9+H+YSAdPcvFmteLemLceqWVK/TWEiUHaR99eYyZgkyQ3O
	7/nW/4W5s1CZKvir+XvdueqV4qpRRfgSDKgUE0psXABp8ncW2Swy1jyJ19FN1VxU
	MfBjLfPP5PkSt8NxVnTS40atlyUSSTF3hUedA0PdDiN2EXtVOMe1ms+1jzKNa7wb
	+ColVwaVGurZThRV3Iy/klA1tfvPTQYdub2RrO8qFt82Pc2uxfI2WmqY03w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqvjdr0jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:05:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so2631103b3a.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785373517; x=1785978317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=;
        b=RflEfF8/FEDJSpkgD2UWwTVqLl1FEkubf0oXEVi1QYkxgkGnOGDORlwq9etRZbR5lh
         H7bo8MMkpSi2H3fnmPpfKR2V87z96qVOp3k1RRduEEDsRc3Y0NsAPLGv6P0b46sIsLpX
         3XrUFpUbGaLDOYHUg0pwSWa9f/m/38ERaMbKkwcJlpGAVSf7HwdQNhwXljfArh9/EWYo
         26wJiS4W6wBjphxLCiRxpIYbvpovYgowt6qqgn7cL/Tke/iVWoAP2RofGSixaRlKP7Qk
         pE0Jyx55ZS5dqfBpJ24VZUmuUet8gxr+osRruEsk2LIySYy5erCPu9r2/3krnwnaY408
         DGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785373517; x=1785978317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYFFatroACJPZgrWGjCltvltJd9wtFIF3w6l6ozfvvM=;
        b=pOdO+41uuOZOH2UfSijUk54CeISUGBQsGSbVttBypJoC8N8hp3dpA+BRv8e4Y1TEDe
         M7oHZLwOq+K4kH3rYzcf8WIjaj2eJ0BJQgylJsOF1qEh5ybwBYALDJAeCW7jXmPM46nC
         wxPw1gbEaAwiEy27mAmwTvJ9lqTtfP5U9Yd2WB/MUhuNdX8r+7j2mVjeyv3MdE35b7le
         sVrDqHEYATVW26OL0/GluBwcgtRB8Lt3roB/2LVMaizIDNXLVsCBJIO/yPGGBTZpQiPZ
         bSqNPULZHX8Dn8HeDv6TlXBl7szBXqWwEMEHWLMxi4vNfdxchxAVxoO6uPyhph0Hms32
         stEA==
X-Gm-Message-State: AOJu0YyhOypbr5CLQbPgxezBAzTX3K9TAjmXdduA/rWtri58owIF18lx
	ohkoclzWKGLVD7Pw90+s0n4ugTzaYUX7fjg4wZcxuLwUfAgSbRewIH8PON8+Raz6KMqBoglyxoC
	KqqOw8WnsjlO79IJQX3l/rCdguyi7SK1X+VfI/cHb3WKm6CwMDZvVYllB8G0utuMF
X-Gm-Gg: AR+sD11XJeARPncdd0+ecAQ3oq+83oxZyvcHAvV9MpNkAMV/IRO1jh6N27iwERSfr3M
	rKqvwfCpfXPubXbfc5k+Dh2bDN7taOb00awg/1mrLmVVRLqv1cXiJUl8gZ1xwXs1f8iBDk56bBa
	O7LTNg22XRJgThuYptf4AtP8lxBDZS9FSl3AB9bRXSYkIm5PaI30YS+AOZDm77OC43Q6iWyKXRt
	0y/4bRaWVwdxHOAYXPpXl5U0nRHBrBWy8a86MAJrHeS2s4rrvYoBt+SZn5oDseIhCFKk0ANDEdg
	tfHMw8xQnOA4XEZYjwzbNskIdaK6DVI1Yy0YoPgoY6gR/MgxcanxwGAxtrSekuIcw0kT6qJDGFM
	aEAFQnFppRO1svYG8WkUpSONywhPK6OcPF74Oi/GTHNNfFxYuaL1F551ljr4=
X-Received: by 2002:a05:6a00:3495:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-84ebc1f5e37mr658362b3a.12.1785373516700;
        Wed, 29 Jul 2026 18:05:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3495:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-84ebc1f5e37mr658319b3a.12.1785373516286;
        Wed, 29 Jul 2026 18:05:16 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2168563b3a.11.2026.07.29.18.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 18:05:15 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 2/3] wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
Date: Thu, 30 Jul 2026 09:05:04 +0800
Message-Id: <20260730010505.143458-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730010505.143458-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RpD16imK c=1 sm=1 tr=0 ts=6a6aa34d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1dbm4JsyFlBaYKuhsR8A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX4lDqoZZpgq/U
 xyAS4e5kuZQNSTVew852vrFwzThmYH94c7mGk6u3KWZWgwrAL5Nhs34dkCT6dgBR++ALC8q0y5Q
 FLxCX20qk+QbLm8iSjQ8aY4Zvf4q+Tc=
X-Proofpoint-ORIG-GUID: zlfwvZPtexHL2tFCzuF5XAnrT3p89Cbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwMyBTYWx0ZWRfX+2Q/EI1JGmWZ
 dx9HfV8P778PgMvx9taq6oPrWij+Z2oUQ1dzL5fXB/bQq2xgY3zGH6APIyrSIRJ8EH5kaybVt7g
 vexxeF9Um+JXKSr2vCUPcUGSNxaQ3GIvmpj+Eq4Em/WwFKVuJY3WOhKCkEv4XXAk7Ia3GM3VKVU
 8iBjJ6NGHU05yYyJw/SUxsbFQ4SJklWn8gNepuNp2Zo9y5iGbMGTxHi7SVqcbUTgK+swp8vVKHu
 xoHbUdvKZ2vM+Enx8D0G91f48WV5pRfw47WUinTLlmr8m/h7e9AwXsxqezKIEOE7k0XwrBkNme/
 rylQv0V4PIq3WQi5bpMgAI4Cbyg0/xW3XU+kEpKjLLtv/Wwbu36jTkjMu0BGs9ynmqSq9T2VLW2
 5lYYhg0ZCogQRMDfEZ2gFIwHUgOgz4UD8yMYSisndczZRF7TR1VHiZQ5ComUlD2sRAnF8VFG/mp
 pyi7aDLQofRLcKVnmBg==
X-Proofpoint-GUID: zlfwvZPtexHL2tFCzuF5XAnrT3p89Cbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_180517_938037_7F5AFCD9 
X-CRM114-Status: GOOD (  15.91  )
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

On WCN6750, if QMI messages never arrive (for example when qrtr_smd
is not ready), WLAN initialization stops before the device is fully
registered. In this case ATH11K_FLAG_QMI_FAIL is not set because no
QMI event handler is executed.

When the driver is removed, ath11k_ahb_remove() still calls
ath11k_core_deinit(), which eventually triggers
ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
NULL pointer dereference in ath11k_hal_srng_access_begin():

  ath11k_hal_srng_access_begin+0x14/0x68 [ath11k]
  ath11k_ce_cleanup_pipes+0x184/0x190 [ath11k]
  ath11k_pcic_stop+0x24/0x38 [ath11k]
  ath11k_core_deinit+0xfc/0x1c0 [ath11k]
  ath11k_ahb_remove+0x38/0xa0 [ath11k_ahb]

Fix this by invoking ath11k_ahb_remove_prepare() before the state
check and skipping ath11k_core_deinit() when either QMI initialization
failed or the device was never registered. If ATH11K_FLAG_REGISTERED
is not set, core initialization did not complete and CE pipes may
remain uninitialized, making ath11k_core_deinit() unsafe.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 00402f49d26f ("ath11k: Add support for WCN6750 device")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index fb5640882b98..7f5f5c8d7c56 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1265,14 +1265,16 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 {
 	struct ath11k_base *ab = platform_get_drvdata(pdev);
 
-	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+	ath11k_ahb_remove_prepare(ab);
+
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
+	    !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 		ath11k_ahb_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
 		goto qmi_fail;
 	}
 
-	ath11k_ahb_remove_prepare(ab);
 	ath11k_core_deinit(ab);
 
 qmi_fail:
-- 
2.34.1


