Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DB2D66B87
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 01:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=; b=iO3fwqI9CCsCPrwpQlVVJ7ofFu
	Z34BRKaNhRTtcVm3f7rsNZ256+w5e16CawWCN1iDW8CClbtR32HJTjEjXa0SFj5Kck6wfrN2ndOfB
	EUHlz6/mao5vLZgrYvlZXJkhz8GJji/QEnqZQKW0I5oQG1LEhh50xvsefTb5gBKP2RUcio9CQ1Vpv
	YdwriSqUP6VsIp89PYTZPk6wBWAhc4Xw+86PaVY+Flmx9nOeYUr7SLFbUpK5Z4aha8jQaXM3/qZeK
	ZuMEtA8xNBKtBmnq9K1gaq/hciyO4Ul9OSuVsvpy8OGcQq4VqFeFJ1wlG7AvMHH5ogHJzEdaZADzl
	veJGyivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3EU-00000007fl5-2OeJ;
	Thu, 18 Dec 2025 01:55:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW3ES-00000007fkW-0teX
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 01:55:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Yj8D3717112
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=; b=f5ZZjfiHJMHD2zAr
	W1VWIMb3ByzbiVagw7SequKoRRjOrdRxsA2yBr5JFyZaxD+B07G3EnOp68It55xn
	rOyZmOETyzRVG8MZq33SA56o/cfW9KjBo25M4bB+8yFxHvtTTk3O/UGB7/BhR0Ci
	MvUfzQSomyU8mbyyLSU5b7p9V85ja0QPA6tbUH+3ad0SlGzyZ0/iYKYAPDvcTPdz
	I7ctBE96cb5HReDJX7xAvHNyTg/GpomKF8aK5GCkhatXIa71gANP0jAZUJxRgWDo
	SpRYrwGfUpvgXgnV5+L0o/eArHnHHz+o1ia2fLZ+ZU/Himt9V8muO48NlZIDOK62
	uuND/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40n79arp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 01:55:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso3683375ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 17:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766022907; x=1766627707; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=;
        b=BC43BHYKtGBHwGGRJe3ts+e9mQAXY43TTJ1fyo8dwDOWXA0d5BzTk6jpcXackX9a92
         c5UTDLZ9i0c/cAmogQI18NTMIF+XFBVsJ6p8+9x1D9JwzDa4xlPit8mLjxS8JUX5Id5F
         rGn2ermjOkxT3WuQa9/vMAm9D7j8IIS9mhc8UVxBQA0iI0V5E8DCJhIgs10/kNSSmsAL
         65csEJPyQo0AL5WAcV2RQGz/NjbOWY/IFGMMOe5jge7b2pJIBE3rSOPVMjvR9BT8tDrc
         XvrZuJlpjwckt2P/wAOOkfqDKi6GfpazO3aYXBw+r2aoxnJK5GVQOmMMmWfn/pTB/oaj
         kR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766022907; x=1766627707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/upX7u/ox6ptfKPVj84C91zINBCjJs8pyXWX07cFxbM=;
        b=ZCW5pcFixuYvQTILE9iPC4GL2lEiPcs317Apb4B8wkKvBwvA7wWOnXLTaYhuICTFeM
         Ta4EQfDTE7ziB+pGG5SzAAtk6v0bYzy0l9/qocx1SY9WINrSD3v1AXGyY0Zmf+xBOyi7
         ggzJRCa2uQabooBjRJSj2vg+cwZQ46CLH0gOrlQ6pzv1i/pWrCfhG/ioFaRD9XAX6Iro
         PA0AnV1KOkx9TMSsNkc2zvLHAih82oUc1Sex2i36bHM0fKNJ91vEqdqYzew77TFt7C3d
         ISpElABATMUIJ51EOfMLPegwFSumqtDHTflV8OB9qlgv/IpgchKLNJnFLz0qqAp2JzYv
         A+SA==
X-Forwarded-Encrypted: i=1; AJvYcCUz6cuWkMqYCiiq1GXLBDC8gTtnfS/ihECIoL4vHl8+edRaEsI0UfJ2XfAC3D6p+XNv5Dy/9P0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOPxdR4vtpnKLoWUiwJl9Ku0sX0YtGX/2AMQdN3AGXpsjIlQLh
	tzLFXRBQqpTF4gi1HwchnyPYvc+zreL4l+TNN4RBEjgxm7qB6nO+hhOTrTS0GvGvmqrf5fbbP/f
	4FkBKvYOKlLb2EY9EbSHLFbTM5U+Fc5L2zdR/EUGA2pZtHki0LpzWlsinSJJzcB+MUeN+D/MsR8
	k=
X-Gm-Gg: AY/fxX5lrJVLVn3O1q+eH/eMQQIjGMuCI8L7hP+S6Zidc/BY00kb8GL1/ERVAm8R+xc
	gvoRXeGVLxh6DipFOMCcgHyuyEXGfpSZY+vfwYaZAQx7I8I7zvSPja2X3p9G/03Ob3TSIHuFUmh
	LdN02odh5AGfLxUSD+FaXzuOF+9Lb9i5KWwcgIEQzyjvppyKR5uGOlUZTV55X3HHR7wjwIVwUhx
	ph2kz2MWGTlJTn48CBZU7UlylgszX8vVVYIGfpJW5pvY5bmY79ZFUwBa+pry9tx4f8P09P5t7WF
	QX7y+6wSIIPcZmAOzCzaEFhwP++R5eddsgxwFGtHE9XfkkhAIW57SfBWlgk7m/Nc2VJcaQfssXu
	zM2s0018YULaOY1tneJwuSeb+LSEcoHsaG0Uqfi/t+dztwec8PfKx/z1yHGsvMMM=
X-Received: by 2002:a17:903:2281:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a10e191134mr108645205ad.38.1766022906747;
        Wed, 17 Dec 2025 17:55:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7QhesR5V/o10Y3N2o2l+EIjy+4iv99E6ChHjfBebKH7Oi6EAVuZApjK1p4qRrSOQXvP3rqw==
X-Received: by 2002:a17:903:2281:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a10e191134mr108644995ad.38.1766022906171;
        Wed, 17 Dec 2025 17:55:06 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d087c812sm6548175ad.15.2025.12.17.17.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:55:05 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 09:54:15 +0800
Subject: [PATCH ath-next 01/19] wifi: ath12k: refactor PCI window register
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ath12k-support-qcc2072-v1-1-87928cf8e547@oss.qualcomm.com>
References: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
In-Reply-To: <20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: et1W32_RvXfJzZUwV6DXdSXJGJvPcv0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAxMyBTYWx0ZWRfX3i6wpX/fjKc7
 uSjHo3d1NKB96yg8/bNqsNTphP89f3TS82jKPsyPV8gCXfLIX8tJho6iTAtA0wi2rOtfYgZ5Jsz
 faQQ34zzg6gEYVp48Ll9M5AIv85yO/suMcoMY3cg0tsbhshF+fs3MY53nPCs6ueIWUddYpb5UNc
 BpxHXgA2k79GNyWoRN7DBCQWHgjo9qcuQgezeBVB3ZE6MfkKjjO6ZKM4maCcmZSqE6juiA13d7B
 4PfdaNS5dj+vBNBG5HDDhvU5BBu0LtajrWGfRCXku1nQmkGzrKeU9gmO4QJfrkyOmQwedyqXHAb
 VGnchALbJPvsZV+m/9r1SIkjrk0EFm7cm6C2hwRMSgvry9HcBMtDkFcHuC5Y4SSRDp6gk4QsdDq
 GB/mPB/Lziu2R9G2aTpEiBaMd7ZUcw==
X-Authority-Analysis: v=2.4 cv=TZebdBQh c=1 sm=1 tr=0 ts=69435efb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-0iOq_zPj34lsyxnQQ0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: et1W32_RvXfJzZUwV6DXdSXJGJvPcv0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_175508_263830_A63BBCCE 
X-CRM114-Status: GOOD (  17.26  )
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

Currently offset of PCI window register address is defined as 0x310c which
is same across existing chips. However QCC2072 has a different offset
0x3278.

In order to make the window selection logic work for QCC2072 as well,
change to initialize this parameter per device at the probe time.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 11 +++++------
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 12 ++++++++++++
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index a42c4289c6b2..4bc30d86c1a7 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -23,7 +23,6 @@
 #define ATH12K_PCI_IRQ_CE0_OFFSET		3
 
 #define WINDOW_ENABLE_BIT		0x40000000
-#define WINDOW_REG_ADDRESS		0x310c
 #define WINDOW_VALUE_MASK		GENMASK(24, 19)
 #define WINDOW_START			0x80000
 #define WINDOW_RANGE_MASK		GENMASK(18, 0)
@@ -125,8 +124,8 @@ static void ath12k_pci_select_window(struct ath12k_pci *ab_pci, u32 offset)
 
 	if (window != ab_pci->register_window) {
 		iowrite32(WINDOW_ENABLE_BIT | window,
-			  ab->mem + WINDOW_REG_ADDRESS);
-		ioread32(ab->mem + WINDOW_REG_ADDRESS);
+			  ab->mem + ab_pci->window_reg_addr);
+		ioread32(ab->mem + ab_pci->window_reg_addr);
 		ab_pci->register_window = window;
 	}
 }
@@ -145,7 +144,7 @@ static void ath12k_pci_select_static_window(struct ath12k_pci *ab_pci)
 	ab_pci->register_window = window;
 	spin_unlock_bh(&ab_pci->window_lock);
 
-	iowrite32(WINDOW_ENABLE_BIT | window, ab_pci->ab->mem + WINDOW_REG_ADDRESS);
+	iowrite32(WINDOW_ENABLE_BIT | window, ab_pci->ab->mem + ab_pci->window_reg_addr);
 }
 
 static u32 ath12k_pci_get_window_start(struct ath12k_base *ab,
@@ -178,8 +177,8 @@ static void ath12k_pci_restore_window(struct ath12k_base *ab)
 	spin_lock_bh(&ab_pci->window_lock);
 
 	iowrite32(WINDOW_ENABLE_BIT | ab_pci->register_window,
-		  ab->mem + WINDOW_REG_ADDRESS);
-	ioread32(ab->mem + WINDOW_REG_ADDRESS);
+		  ab->mem + ab_pci->window_reg_addr);
+	ioread32(ab->mem + ab_pci->window_reg_addr);
 
 	spin_unlock_bh(&ab_pci->window_lock);
 }
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 1cc4f0e050f9..a74b09d23a6a 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -130,6 +130,8 @@ struct ath12k_pci {
 	u64 dma_mask;
 	const struct ath12k_pci_device_family_ops *device_family_ops;
 	const struct ath12k_pci_reg_base *reg_base;
+
+	u32 window_reg_addr;
 };
 
 struct ath12k_pci_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index dedc88858bb0..6c477fe97298 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -27,6 +27,8 @@
 #define TCSR_SOC_HW_VERSION_MAJOR_MASK	GENMASK(11, 8)
 #define TCSR_SOC_HW_VERSION_MINOR_MASK	GENMASK(7, 4)
 
+#define WINDOW_REG_ADDRESS		0x310c
+
 static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCN9274_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN7850_DEVICE_ID) },
@@ -104,6 +106,11 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
+		/*
+		 * init window reg addr before reading hardware version
+		 * as it will be used there
+		 */
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ath12k_core_get_memory_mode(ab);
@@ -126,6 +133,11 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		ab_pci->msi_config = &ath12k_wifi7_msi_config[0];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
+		/*
+		 * init window reg addr before reading hardware version
+		 * as it will be used there
+		 */
+		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS;
 		ath12k_wifi7_pci_read_hw_version(ab, &soc_hw_version_major,
 						 &soc_hw_version_minor);
 		ab->target_mem_mode = ATH12K_QMI_MEMORY_MODE_DEFAULT;

-- 
2.25.1


