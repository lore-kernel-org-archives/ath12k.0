Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3922BD25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=o3Gl05EyZ8kHTzfz2J28+Smf2V
	F/4jhN4Zi8kyxSypgsxIKamRRjcfo6ppN1Yhy2hxCOu37w4d/1/m2dwK3oEMW2ER1ZE8IAXCTm9Nh
	B13VDyFpxqXL1cnxCELhBHA2WyXSkk2nv1lUt4eV8SC1jctkD8BST6uA1dpqPyKkkmqCFH/iLsvUI
	suoebKJUb8TyM2wVg6YUZZJMUVG1w04PJurne8lskfyZajq3umcPN6FGmJCX2beHhknkF0U9EyCOL
	/J5elPIsB2pki0ny+vrlDdjEitPLxzFBfGQq2kbxJKgO1rdQm3+W0/+EQ7sNQAL5jOEy2VfmXvIMs
	QCU3Pg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUa-00000004tvu-2v2V;
	Mon, 12 Jan 2026 07:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUY-00000004tqr-0HG4
	for ath12k@bombadil.infradead.org;
	Mon, 12 Jan 2026 07:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=kljFhgu5l7cANy7+w4076iCPZb
	/S97RmOctCwFtxJZK5nfMA1MedIzpFuy60lhh0tGd4+ySs6obFVLK46llVcvfFcGMsZVpq7HXRRgo
	6qJvPfDturuuOk1b37v3iuvFSX1Nxw0HXjXLCQ4x31jyMdxaN5JtXm+77La/uYqWVg+kC9fWe774Y
	TURyUUe3R5jq37WuZJddIDM7zlVqEeKyAdAAk0vtYY7w/b+SeElzi1EQqRpF8CH7OSp4ZTYMisVEa
	j/QSxFAMaMvfrZj8/v6H70dbpmyqdKH5fJYqY/i0CbgleYKYa5towW2epvI/MiH9G5Va0I+MaG6xb
	K4qjtrnw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUT-00000000B1b-1dHs
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMOQut138153
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=; b=IWv6pOCzC4Qo0SZ4
	NEuNEvUq8KmkzEYJbVCkALhzTy4hgOwOku70/S3cbJ/oQzVz+pIK0YDkmrmO6JVh
	Jh3EDA/O8EhjWiD7eZAYAkU+att83wEgujhXGB+jLOA3a0NOcJP33OUYGbs8WFpU
	mR6p27E55QTCHAZxZs0O4XMmWIz12kKBBz91H6Offqkm9kVqWBPrh8NWh3Ugjzcc
	OojkAi1ivQEOFzf36sQ/dRkPTHw7ud8ZYVN5Zajaew2WOH4GgqQf4/3To2qFjHtV
	yeQLBOi+KHSmwkFs7zR3dkIcTSBEKHe4Q/ryxuTVIHyaOt5CsRsFbAHOEMFPyYwp
	hqWfXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyt154-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4313996a12.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203447; x=1768808247; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=;
        b=aNz25745Q5QGtPWHAAAQccAU5sT2gaXgkSj+rkwTWkHwhYE9ukDjngb9OCHY34kBgT
         v3nEhbHEFQhPs8SsM1Gn+ucaOCaYb4/EfB461Jt3me261M7JZbf55zr+JamRi1opExTs
         iVrmzOi6Sln+dfpSD6HJroDkZnsrosf71E9ZErnM/X5e35P5ZmzNkjFM1WiG12U8yNcN
         21UQO22BT1v8wAmnMkSRQSaLs6Sg/mJog5zcFI1y/liArCiLYMnXd3/IVf2I6DJKFroS
         ZoKVUwhhwHkwYPDkg0F8M+d5/JZzYeyzEOU7mPD6M3kZbx4C0wxB4ROMLVGT3wlicKvl
         77Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203447; x=1768808247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RjNVQHclYLWfxtu9pN9DpjLIUxji9CjBRXoyJoIynas=;
        b=qgqfA5hrIXAYDeGJWJUke+LmjclfZsye3Gj4htm7mCO2AWEPDUZTRM1hM/PLn9keXp
         thLDObkbKrDoZ0icrJBMbVfr9wIrP/twMpl11rHby6mYdfY1CftxjFrOjSe6RqGG58Ub
         kT1SmtmSKcabQHB4KAet3OLqdDVxT0dJGS84qBvQndbfm4geyCs/PD6GKlRfRYnlJwiY
         ccbyUYDZvZEjcBNv6t8W9nyMO3yvCf9fwZZ/ba9vcayq1etEyYVNop2iU909IZRTNGZP
         VFAMu2TO1SNOXl2ZZZ6yhEwUEZTSilEvWmvPi9cqV3NeYkmt3G+qXye9ypQJl4v/07KA
         zyCw==
X-Forwarded-Encrypted: i=1; AJvYcCUW3aKAZXjCduzYLuMTkcBAk96XCOhp66IlMnulH3n1o+IBSp97j1wfRpBB+1v6i87pNi0ruTE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHhsz0mCEPYWHvmQl+8SF8iZ0xXUUA84wAtcy9JRrM2R+DYZFf
	ZumIOqgUinjw00BqorPFMulcRkW320K4NXoyA5+eos79wUBkKmLZfplYZejZrqafMQKm1jmTawj
	APhWGBcznlmYq6gby2v32Pc/R8lQ74WyKC2QcwHjfAZt84etjzjEIU5ii499v5iPIYrsAFMSrXV
	4=
X-Gm-Gg: AY/fxX621oT6ecUDRBoWJbHHClL4umQ6dtHuEMTSv1rYSfAw1oRwrtZs1VYLnWEsYnn
	4+XJv+XbfSsfdf0dLyau2EjTqqvV8NjIYNlhEUyGrcJGjRf8wkQfwPtD8RzAM7MppRH5QFNGCrI
	hOyOdSt+jLo9OeJjIFDJ1Egq3UvpM+zZ1OIJW6+JnZ+g67AAX/PKNfUotjnqnmcNKLFduYnzjer
	DrHH9emZjSRgL9ZEQLsFbli5JNIE7HRKoFS3yM9giZvRoKP66DOZPQJivqDeHqfiG3ZsH0vEjKk
	HiaLHY0NRZLrikNo3VCga15g2YrUj7ILX/SN+KIKdOsVK0lAv5E1rK3EmTEQQ7AlKrCvd8QmAUy
	cm2vjPz6bt2CJyrulblLnFN68fowV2w88NbG+cyiPvW1oXY2iryCEloXJCr+qEAI=
X-Received: by 2002:a05:6a20:e290:b0:366:14b0:4b12 with SMTP id adf61e73a8af0-3898f9bde9fmr16362766637.78.1768203446561;
        Sun, 11 Jan 2026 23:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/3b+RCzW+/Dbq7svVhbYRRWrlgi4ZmsYOV1KHNtRuTJUDGE0XVcdRer7wiWjxrySVZh8KvA==
X-Received: by 2002:a05:6a20:e290:b0:366:14b0:4b12 with SMTP id adf61e73a8af0-3898f9bde9fmr16362755637.78.1768203446080;
        Sun, 11 Jan 2026 23:37:26 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:25 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:38 +0800
Subject: [PATCH ath-next v2 18/18] wifi: ath12k: enable QCC2072 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-18-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: GmT6zu7m3-Q22u3sIFboGJUvvMNaGF2N
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964a4b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ef0WcUByH-36KoXH_5MA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GmT6zu7m3-Q22u3sIFboGJUvvMNaGF2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX+nTqZAobUgvs
 6KfFsHK09xPHq8omiT65mQYy+y9IV7vXldlcz0ULYUlmpUIrZFhI6aW14biD0jGAme6z8sElLgP
 1CKTOG65iibFF7gFqEmMOqwSsUZAvudQ7DQ4RJZ0TJaFPX40+xQBpl/SjJ/rOjGTvJpRr9NOgO6
 xdggDr4ScSuyMm3opH7teM5w6rQskS9nDKk4/yh+IlLD/sbsRGUC7+fQ9XP7qTAPZ+bDaUNzD3b
 o+xszXKEERQk28vsR9otmHoHUwcp7LpqMuaAza/jsaUhYcNjIX/ithNIAU7BOyAfqP4QBEebdS4
 +qSuAdGgAb1543+f1YaCgAaulQ9AMZ6gfA8whzF25TXuLExLMgYBJC+cwZUJuKJt6PZrFC3r2JR
 4E65KI9EGDt5EEfur5qQ/Rq96nKayj7k3EF8TeBnUyG90R9ln7JSYGoKnGt9cbt2QHFg8UkpLdD
 beYoTHjjvTx3lVAbGKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_073730_850472_8321C7C2 
X-CRM114-Status: GOOD (  15.61  )
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


