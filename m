Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CA3D68BC9
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 02:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=CF8zRAxOMXhc1q6hVC9UhSeWQc
	rEe0CJG+1+hMDlN803pRrNiejCAkQAKpvp4AirRHPGTDX8FDQ6EjewLleDR9Eo9RQhAcGh87IOAxU
	OW4I66u9eeuZYJobuNwHCPfANR4uotAM3bSMsdQku4IoUsqE60MBAwWnjwPAGRYD9ojh50ZlibD9M
	4e11bwoSvZadJYkS/HWT7TCTNqUFX3Js2WWVkC8mto6apKtjzX/J2411iSttUZAFUyCsvUqIXDn5y
	I1waTvi76YZTGNMymxDDtQk9NPjlp2fzsWmCWqq5YlQvSVC77X2P7YcdkzMTLyU7PiL8+wWK0nXgN
	m88fuKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Ju-00000007gv7-0u2p;
	Thu, 18 Dec 2025 02:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3Jt-00000007gui-1MZT
	for ath12k@bombadil.infradead.org;
	Thu, 18 Dec 2025 02:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=oKNovQUj1jIsLCjirXn3Le0Bi+
	xuovvD13CsW4rBfoPP4+JpPGVl+OMdQHvejwXdyphMRGMwiQkxXn6TTppFsBy1ppv+t9d1v7NgSYf
	0aMSyf/Kf7tJ0aDIiE3p9+4/ln1zSpH+LWxBtiyKWkaawG4od5cpcddQLVhn0XYuivXDE+lE0U/Kc
	53QZqZJDieQ0WqoxnZesw0hEXlB3gLDhZefTzbQPDWBCgMw8dE3J3YfKJCtKSARq1KdBS7RgKT9Bg
	5Wx2VC8FAdw6ejhV9zvlfAtuvw1wGY/xABP29cGcnM7KImHCtplcC1emgIA5CPFkQXEDK2avdFEGQ
	VjVXsjFw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2Ni-00000007ssG-26i7
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:05:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YX8a4147950
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=PXvDgeqPYDyaysA9
	ZuLLXZh3E2tsXlhbOOWVuyyu+KxrD0fhZgBEsekVdOFgcms37ZXqPyDitDdWbfaK
	pDffECQYWJqg8uJ4mfm6ZLyymsXNt6Z/uU5hnJzDMGNX619or6TQXa5fzgmNfVFG
	/+krUin766ON065YoabISsWoyP3ybM9EeTUwn4v/C39QC7Ye8gPtyx5Y+IM+ZXrh
	svkA8/A2QWw7JJaqZfSRUb9inr/6M+Ic5pe6HJpMSjAnNRUNxBH6iZROqvznn8XO
	+2XwXGqwLCV4R3B7EaYtgsft35mGl9/vZGoSrt5qWwCVv9vy/QznkPnjC2mwrTXe
	PYJ9FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u798p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so3654885ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022942; x=1766627742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=;
        b=FNUSHY18fWsj1HWamTQGGv6xjra4OCguzIYlkJ0qQMTVITVLdkYAU5eXmNRx0aRXjD
         HEtCgs3O4EgH+i9upm4+16mxnpkJou59L5xfiUDjMnF6vgJbg6z8cs9DMqOyPjxJLPRi
         bMFNrk4gXbRISuUgJyOv7I+/Lb0m8PYuDYR6s3FwYT+U8OlTV3N28RfLbs1UQg6Lti8w
         0usdiehsM3qryBlGTb+L6ornVnwGPZei8sKFwPE21fRz/TPWwYVuYFLxdRJfpNCN7iI5
         JMCKw+bibysNjRBBQYnjRxVDOSAsnVcRGDAkl4TWQBInPAC0xOyrGsljkTIfnQOHRpIX
         pmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022942; x=1766627742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=;
        b=hhzgl42tml6EUf0qVf1wfEPHB16XK0xwvaUGGLkPLTTOUvQYvPdv/WTWqsPSPuvOTW
         8wrzDRtXgEXsWBw7cSEPxM2cHHi7EAfq6qtvq4dH8nok1z4LLlQaMjCar2Dr1uJwa1ft
         QPQvXXlta4L2AoleT6/yz7emkjJoPhtWvF0DaLsSPuDc+dpik5qvVv+OEHEShhZc3s5L
         zFm6Pr81hQqWmlxkP7HnQTggnYdxJDqhom7KV7RlmPCBt3ZFTqsGPlDVuryXybqV/xVX
         KbKgcMAVCGhVBpa90OdCpcVHacVytbkONXhK9NMK2bYD2oeMkWniKjnMs1JoKQgyo5Ep
         q3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQUqmlqLUaNj5zPQ2118YBJc4JExCvMEp1sjVNWt/nz+1gJ/NQ+d3CCZgRaSVhj6x4NeQX4eQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Anp++mHAZvoLe5elZhchYsaAMI3ZMB0N3hNcYRjwDphOVIcB
	3kfK9fXWevo/DRZCVP+5EMXg3/wmjRuHDIaqAqvoRT+q5cdfGluENe2O8teOrSV9zhfim/tv3AX
	ChI8fv42zsrcNuC3bk95UYH7Q4Zu5hdFkMcDph7AU3kUwz/zJ3hx+i41fZv8xV4ImK7YH/h1wnK
	U=
X-Gm-Gg: AY/fxX4yyra6mq8sKTfQkv3nLap9OTpQU0Ph2jmPZCYvapnelfo9EPs4uSr5f3pdIRR
	LwsUBeVPW0KYddegATl29nTgQ/rwLcHoWut9U2W4O33SDsFIKbtVNAF5pQ9CrDCeaqCsxGPhioy
	Ngjq4NyD+IvzeQRkbMxi6bsVU9K/jfio7NaWr9z9p0ZJvv/roktBVviNrH2xEQtdSwHbZMJMwCs
	jAvPZKgDyzELrVY2lzSkJiAwcMyV8TRYvCOsJk0AU95xx+2urifxTdgBthpuh9ep2B/bgL9BO4w
	Myq1ZsXnVq2rEInjd5Wv/Oy8/bMGfOaJw/woXE17LicstHGBmbU19lNCTrFGHaMaOsA6qG3YkQx
	Tjv5x1KKWlnHQbm5y2HbOfi/aIFaYEQ0WtJfJphqvys9z8xCihxgzytl7RMJTLQk=
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr192675755ad.20.1766022942401;
        Wed, 17 Dec 2025 17:55:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJSmu9dm9C9vNb3njKDwE3EVTmRL+9bdjclw9GoO4vF5hRs+uJYgJAyFTonJNTLy0K9uZ5Rg==
X-Received: by 2002:a17:903:2cc:b0:295:888e:9fff with SMTP id d9443c01a7336-29f23b5f44dmr192675655ad.20.1766022941960;
        Wed, 17 Dec 2025 17:55:41 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:41 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:33 +0800
Subject: [PATCH ath-next 19/19] wifi: ath12k: enable QCC2072 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-19-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: jw6f2biPVZUjImZcP8-RnIpOtbZdmnGx
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=69435f1f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ef0WcUByH-36KoXH_5MA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: jw6f2biPVZUjImZcP8-RnIpOtbZdmnGx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX1vdYjXZeT39v
 aWau1PvMV+n7CNt0NA/ZseDfBAp4jQnBNHpgaoJWAgl3SwJZOSkGKNpDxBLFSAUxELVv9pijHNW
 MfY7am0WSWQzqn/NoU8GGfehATjGG0DrJH6bGcTKP2cjhZa8x+ysTBfO/u3hCVyzu4exdXLss1X
 d5EL8XhKftJFat2533MuOg9USghINpDrR7R0dm0LjcVYF2maD4rmsrXs3mcPMfFjEyhQpHj/5fM
 47L9gW4BQkZW5Vqo1AF2VzOS0oGMq0D5ivIEjpVe6QoVCr8MUtrEpDFUB5RZjQ3yAyeEHbgAFML
 8hWKeOrv+LzbTx4fKt50LLxIdUOX65dzwml6LOJ57Zqzhge8+4HPM5keXR0vHeCUu6j6Z6x9931
 t4w5WckxmuIf8MCorIc2OeN83M/wgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010251_842974_6E425A16 
X-CRM114-Status: GOOD (  15.05  )
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

QCC2072 is a PCI based device that is very much like WCN7850, the major
difference is that QCC2072 has only one phy hence does not support DBS.
With previous patches handling such similarity and difference, it is now
ready to finally enable supporting this device.

Add QCC2072's ID to the PCI device ID table, to allow it getting probed
hence enable support. Also populate some necessary parameters when probing.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index 6c477fe97298..6c96b52dec13 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -19,6 +19,7 @@
 
 #define QCN9274_DEVICE_ID		0x1109
 #define WCN7850_DEVICE_ID		0x1107
+#define QCC2072_DEVICE_ID		0x1112
 
 #define ATH12K_PCI_W7_SOC_HW_VERSION_1	1
 #define ATH12K_PCI_W7_SOC_HW_VERSION_2	2
@@ -28,10 +29,12 @@
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 4)
 
 #define WINDOW_REG_ADDRESS		0x310c
+#define WINDOW_REG_ADDRESS_QCC2072	0x3278
 
 static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
+	{ PCI_VDEVICE(QCOM, QCC2072_DEVICE_ID) },
 	{}
 };
 
@@ -152,7 +155,16 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 			return -EOPNOTSUPP;
 		}
 		break;
-
+	case QCC2072_DEVICE_ID:
+		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
+		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
+		ab->static_window_map = false;
+		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;
+		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;
+		/* there is only one version till now */
+		ab->hw_rev = ATH12K_HW_QCC2072_HW10;
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown Wi-Fi 7 PCI device found: 0x%x\n",
 			pci_dev->device);

-- 
2.25.1


