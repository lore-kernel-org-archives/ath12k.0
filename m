Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A941061B1F
	for <ath12k@archiver.kernel.org>; Mon, 30 Mar 2026 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=Qc26rYnuAl55e4Ay48xvH96KB9
	mGpIsiAYh0uCQd1gvDK3NBpS8IgxIKyZTxrgr9PI4gv+Tr1uSwjhYcbhX1qbjJT7l/Er2ry+YiUAs
	oJGz1wd4akS39new/yZwBEbVtxc/QGGDDLz3Re4vQXag61yX77fu6RxsfWjsDLzoABd5oFbHz3sq3
	h2hCIi5ySkZMSSRvnX9ChIE1P1ubo9JjQSqyT3uZGnotfCT+a+oZzkCcVr8qlGpSEPwxGJSs0Tu7c
	fokd9Xt0GSjFuZlqHn0FAVe1LS6zmPioVhsq6+xgRmBWw1bv5ATyxHnyyq92dgowiUqBCxCwSH+w6
	eBKONqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JPX-0000000BrDG-1vyQ;
	Mon, 30 Mar 2026 20:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JOg-0000000BqTj-0u4V
	for ath12k@lists.infradead.org;
	Mon, 30 Mar 2026 20:39:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UG9s2u1402826
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=; b=ETAEACnauPpy6SGw
	6GjCMXQ4lCkR4iR2zQwYAg4wbKOLuSHa0+i7sPhr+gVYR4hbEQIMD62ZQlLsU7s8
	MK7I1Aq7fC++yavzQFAisOxdgNcydIYBieS8IfUeAyOuKLnS7zAl/bBJkvQbVD/8
	OHhfDG0ODfb1P7aLjsCZEh9AEfVR12ZZ9mU3+9yFJ1jzChABzg2u5XHDRYrUJSVc
	labKCTAMNzbwSLI7JFdO5FEf9YEToEWB1XtkXOu5NTapkirW9wFdXqjMr7i0+RSZ
	L8ersC3y8RitliWZvqeSEDtyL0DoVO+2WEct6ISM8kXBUFSVv5J9CKYbzgNvLQ5q
	1eKiog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4haa4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 20:39:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0b339b8dbso67356885ad.0
        for <ath12k@lists.infradead.org>; Mon, 30 Mar 2026 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774903180; x=1775507980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=O5kn9EUz75dEgXjuABoRjhqFW90Xy1GnyY0v8Iz26/QrA4lnJA1UVbx3UgfNxsrICD
         Do/t20NKf8HifiyKlEojA2KRIGiWt89gA272ziOBrWsmndhkLtI6d401fKO9iPPQwLS0
         LVAqQfpoaRCRkczqLBfIe/wIjVvYdno/s5JVyCJTqURclKryX0UgZXGG0ambQk8dQctA
         LMBJcejOWfJ2olVY6Dy8ObErsxQLWY2j2lnLb9G4HhxQNG/mnfoq3TNuRMsoickPAZ3T
         aB0lZ49QrfKw4jkdCpRMANEVugFVAyQJrqH/gWi+DpZpvwNovyyzCM6smfUle/jiKcNj
         7HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774903180; x=1775507980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/MVEIY36FHTkZc/aDnAH9tjdCOidmJdEoxNpNn+WXI=;
        b=QcVqWd5lz3czj6HCTF5JtaAKa4ruQVDE1BbRHqIznWNdLFmauxAgB9skyrV6XAXA4S
         4VdJShym9PyubJErVGCqLnWOkPRBE6/71bwwcxKh03O70bhN3/LXIgqgoLCnpw7LMdXL
         l3G18XrnMDcH1t/bjsDFwwhPW0qL+mzDEYCGNypOY98pA+9NgihfqOjV9MgVCUAXtdcP
         21ZmudRWbr4he+0E+lWk8+Bz5pxqs6DAXXP7d4Gywly/1xOSdqUlVdnEHfXRC1ydVT78
         +C8egdHK0FCFRCwIopD/Ee+LVSlJghQG2TGJ975IcmWjBbbCkrQEW+rCCM5EQtKiMQPf
         bwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRp+nRi7wDYX9IhEs53eI4Zz7y2cgcVrEb7Q/1vDdJVLE6H61yrO6HJ8gyOwQmnQwxkHk+lvk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzigWPRrdP3FXEAZSHr3vgKkfuay9N04vEEvgET7Tg5XAEyy95D
	nQ8y+YjsHGqEMK5rr1KvD7SLJTRrOViux3rGf2puITzlNMSxnsvpweJrDcZOyqmBgQoTHsyRwg2
	GnJWyUITtd57/jXN7fIwFDiknqmefzCL+69kObkk0+zzE1P7zWurWTa4+h4zsKGH+
X-Gm-Gg: ATEYQzxbTF3BdWrbTgMVG4dYPeXVdTDq3sneqe/bNFvVYZnzU1J41KK57U8+/3j+LFL
	mqFCFy+Qo0Ws50upVVSXTOjsgSUKo3vbRV1zkgN6a7s+WSE/ttRpBvija/6Ot6vzfyHnTKfJ5gG
	39CnmvylwqTL8HTudil1edeEUqwSFU74iiIwNVA8pQd05w49rU6If/sy36I3q+QuRI/8IutMNGG
	sw+lV/Z6sQ70W+2nzWQE8WuDrb97dHPHNdO2uZCzBGszOhsFO7pfXjvXtYHb3XoovS73EANCEWB
	bttKYgXCKKlNLCyC/maRHr7JvhDBK/wh4g7kOIdJRxVIIciU61+tXS5ibpDtKXFk9dGolqJy/WT
	eHDLMlAr2JEfpNGIb6wDjHNIc0FrGHRCRMhl9/BgvUHiS0XSKSR0cIg/E5csisdXaAmS5l7KEMp
	UxUG4VkNVCLcGwjCZCPx/iTbJB1BmuTLni57ZpZ2w=
X-Received: by 2002:a17:903:3d0f:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0cdcde5ecmr136744665ad.37.1774903179927;
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
X-Received: by 2002:a17:903:3d0f:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0cdcde5ecmr136744345ad.37.1774903179465;
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm113517195ad.78.2026.03.30.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:39:39 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:09:11 +0530
Subject: [PATCH ath-next v3 6/6] wifi: ath12k: Enable IPQ5424 WiFi device
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ath12k-ipq5424-v3-6-1455b9cae29c@oss.qualcomm.com>
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
In-Reply-To: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NCBTYWx0ZWRfX2z6+anWMZrMf
 4wr3htKv3XOX+9ZRGyOtk0BPgaQm09F9UMyxz7OqoUgiTF2rnrDQOz0VlvzfHQprCiXqNMjzYMO
 uFzSrHqFPgwPLy72+quu0S9tA//czPSgHpgDlOtaM3jv2QK33QpOmyhg8Hnyk3S5as57qOK5JmJ
 Ldq5bLilNttw7dzukdrlOiRxtRxg++FFmsM4dWShfQrznWid1XB5HMMgoDiCbGcuGHJSCD3lzPp
 mqS2FKoQezar2+gnvyz+J/A2ZweojkuPnkZgXhsR+GIHOf2OAoosLH9aiW8nEjnE5GDT3SvCaxy
 ku6gHwVmxHEVu4sUmzDCoZE87pCM9zxeE+11nbgvZsYJnNhgJrPN7CNjd2M4jOA6EubuhoC65fE
 hwPRw93o1GdA6rgXScALKNH8X8/8KVGNG3/vfgL4e+HEgswkq8nNctDwCl+5YYXAb2EII8lpp7z
 xWQCYEseFSV7B91pazA==
X-Proofpoint-ORIG-GUID: QiWjkwrmRpJQSAQKn3kh1PokLwN9QcF4
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cadf8c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=x73wdjvOoWb_6dWcbhYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QiWjkwrmRpJQSAQKn3kh1PokLwN9QcF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_133945_631392_2A021D18 
X-CRM114-Status: GOOD (  20.75  )
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

From: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>

Currently, ath12k AHB (in IPQ5332) uses SCM calls to authenticate the
firmware image to bring up userpd. From IPQ5424 onwards, Q6 firmware can
directly communicate with the Trusted Management Engine - Lite (TME-L),
eliminating the need for SCM calls for userpd bring-up.

Hence, to enable IPQ5424 device support, use qcom_mdt_load_no_init() and
skip the SCM call as Q6 will directly authenticate the userpd firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <sowmiya.elavalagan@oss.qualcomm.com>
Co-developed-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Co-developed-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       | 36 ++++++++++++++++++-----------
 drivers/net/wireless/ath/ath12k/ahb.h       |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |  8 +++++++
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 9a4d34e49104..2dcf0a52e4c1 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -382,8 +382,12 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region, mem_phys, mem_size,
-			    &mem_phys);
+	if (ab_ahb->scm_auth_enabled)
+		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
+				    mem_phys, mem_size, &mem_phys);
+	else
+		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
+					    mem_phys, mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -414,11 +418,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	/* Authenticate FW image using peripheral ID */
-	ret = qcom_scm_pas_auth_and_reset(pasid);
-	if (ret) {
-		ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
-		goto err_fw2;
+	if (ab_ahb->scm_auth_enabled) {
+		/* Authenticate FW image using peripheral ID */
+		ret = qcom_scm_pas_auth_and_reset(pasid);
+		if (ret) {
+			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
+			goto err_fw2;
+		}
 	}
 
 	/* Instruct Q6 to spawn userPD thread */
@@ -475,13 +481,15 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 
 	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), 0);
 
-	pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
-		ATH12K_AHB_UPD_SWID;
-	/* Release the firmware */
-	ret = qcom_scm_pas_shutdown(pasid);
-	if (ret)
-		ath12k_err(ab, "scm pas shutdown failed for userPD%d: %d\n",
-			   ab_ahb->userpd_id, ret);
+	if (ab_ahb->scm_auth_enabled) {
+		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
+			 ATH12K_AHB_UPD_SWID;
+		/* Release the firmware */
+		ret = qcom_scm_pas_shutdown(pasid);
+		if (ret)
+			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
+				   ab_ahb->userpd_id);
+	}
 }
 
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index be9e31b3682d..0fa15daaa3e6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -68,6 +68,7 @@ struct ath12k_ahb {
 	int userpd_irq_num[ATH12K_USERPD_MAX_IRQ];
 	const struct ath12k_ahb_ops *ahb_ops;
 	const struct ath12k_ahb_device_family_ops *device_family_ops;
+	bool scm_auth_enabled;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index a6c5f7689edd..6a8b8b2a56f9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -19,6 +19,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5332-wifi",
 	  .data = (void *)ATH12K_HW_IPQ5332_HW10,
 	},
+	{ .compatible = "qcom,ipq5424-wifi",
+	  .data = (void *)ATH12K_HW_IPQ5424_HW10,
+	},
 	{ }
 };
 
@@ -38,6 +41,11 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	switch (hw_rev) {
 	case ATH12K_HW_IPQ5332_HW10:
 		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = true;
+		break;
+	case ATH12K_HW_IPQ5424_HW10:
+		ab_ahb->userpd_id = ATH12K_IPQ5332_USERPD_ID;
+		ab_ahb->scm_auth_enabled = false;
 		break;
 	default:
 		return -EOPNOTSUPP;

-- 
2.34.1


