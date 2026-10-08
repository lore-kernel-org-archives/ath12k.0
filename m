Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DFACA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=KxytphrkT8zah/00rXv7V9Mko3
	Qj7mjgX4NbQOlvhQKjnKzSJu0/NzxcQEkumUtXZEV24EM4EQNUUUDdxioywIHKc7mUKjWXwxEevcf
	y2SGKmz0CfKwgPGrsYGnNbqKRKqkkIURTENmruHlzmgwztmP7BwrzVlhKHcOB5LOtS2jIoB6Q12sW
	Gy/meEmI8zAd7z8K9uxPhbSD105skmijjHP2U6NboBmpnzGpDSLijnW6M1IM9MRWt7v2YO4Oiv14q
	/cDYDh1HCmSI04k72baN7zt2iRTQruhE7aWKUQO4LXeMKuHbts7tfkxpAh+nXpkxNaXIUKGn9OT7Q
	0kTgbDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJA-000000046fh-2nxR;
	Thu, 08 Oct 2026 10:25:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJ5-000000046aE-0ToH
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KPYp3308217
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=UMjrj6v8hNX7CWat
	WiTLVS5mNV8efyUwlvmvzdcz/YL1iP9+pSaAwsfXotPoh9V7eJRffcYBT7tzC4F7
	8lK4nXymRYzSl1UjhtQDpnVXhr4z5Na9J0yKUcJlpuflu6GecNvN0Pp8Pp+WCLmR
	OmFq4wOosynl9yJbO/PpqugU20Cdi15KGT7a7vknQlhEHIb2cDgPviQf7fsn7ie5
	M8w0OaapkK8Nt+4kDSa6r6VZ27ZRfix1EV/rn6b9dfo1PAfLgCF77ZfQxykbyMAl
	mrpgB97y916qSDxCsfFf5JOW46xAm100Z0nOpZod019ereT/VnIIxXHHm/s7GGmd
	sjTvZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sga16b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df7bc60df6so35904505ad.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455098; x=1792059898; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=Tr0uDxKgdRmCchv2ssnQmZETOrWyzYndpN1//iw0lzO8BzxPY9QmrH2cVg4rXbx2+3
         Hv3HBd8eP6E/bhvcNFACdrw0vmK/tB1mqMVhnhSQNkiu4JraWVGqgUSoayV/G96Y+767
         mYwV/uLr1BRRe/3a9ZB44y0P+YpOs9OteAoUg/TC8TC2V40PPuKBU2m7sU7/x5Lgziy/
         VKd2MT84PHLe5mc83OE9xUwZGT7lqiQucB8OfFkJqFSlSx9vjTVwJhKaKwgbLUjqOnL0
         D1PV1TkU96T+VyFW23PTWNV6BeJlrwhHYm22sGZM6eR68E+oNUroipv7DkZgDl2NoSP5
         sSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455098; x=1792059898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=2pzn7LK8qi+lmBQU0shd1r6wxS6xvIpn067P1U8BtpeVkzHuRUeK+WrHWn32cJtau8
         o33zpzHP0bYGwLBlFQyRtHIu6KwT7I+DMvujBoPN9YwafnMrlRNlLhd9lZPvwV7xg8eL
         PfHg7TABIcTw2fmS2TvUDHON8U5Cvw1IhzXVSheX9n2HV6CjAYFHEWnPHXJZtXLriFGt
         L5vBzKz/vBj8T1eH//S4e+93H6bJcBIviokfqOU21XyKfiSLxE+W2QKsN7xPTlppz7QA
         yOIpjkq9ZLiqudZKUZxmgdm6Qw5ZR/7uCTF02CrUoxdz9vLjzmEFy9MNKPVWsKLNmwSv
         4h3g==
X-Forwarded-Encrypted: i=1; AKwUvBxbF70EbvUS0ch1OqrqZbR56VAN/iU+4asYLbFJ5F8sj2xem2G66il7Y++9cCejgu56iH84e9U=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2R87NqLTd8PO+ypH9cylQUmzgaet3n3Bz5IWpOnbPbssezlqk
	fI4d+18QTLQtss5ZCx8ycJ6z6MOZ4Fsr1S07QHsXPE+nXBK2szvRuIPnolHHELJRlNN2Qg3icWc
	1++0C7SralOzyQtN8UC1YdlDH83avAJOmCljkBR3VoIBo2gio3vW67y0SsrE7ai7O
X-Gm-Gg: AYBFou0GtLLWJ9VDRxHfAld/Y+vQmsT/hd0K5QGIKoSVEyRVvMpINpXfBUIS5cbcxJW
	DpdUfpFFjmmqJZYJ1GKg3vRDN2FIk7LICN0R9dsE1XLtVzyvSisbKP7grYPcNYyvJ+f0kCBT2Ah
	HHA0h1skN1cKdJyvwdTDHkbrK6hYbj2zzXZGmWjqkpR1o2q9nnDYdzbDelPLspmWgJIklgGlw7T
	kJWteASaBUMlnL1jlWSpviArcm2k/rKJKUe/ydso9aw8kbKVze2oypqFPrFx5SA1I57e6gr5q00
	9xCmc3p304IRI3pKoxAFGlpH8OiDF086fVJ6uj83S8c0YV/sxqjeA2YyE0myWYLqLv2ev76ap1d
	zwzUPkQ7PWWqJfmdhWCfLGJZGIvSYpDkLeGDFMbutd/ogCrZTKLvb5yIckemch1grW8H0H9ZNwp
	J+eJduvD0oxQr0ZSZ/l4+aeA==
X-Received: by 2002:a17:903:acc:b0:2e4:beef:9039 with SMTP id d9443c01a7336-2e5ffabe9femr40299725ad.1.1791455097919;
        Thu, 08 Oct 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2e4:beef:9039 with SMTP id d9443c01a7336-2e5ffabe9femr40299505ad.1.1791455097428;
        Thu, 08 Oct 2026 03:24:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:56 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:06 +0530
Subject: [PATCH ath-next 10/17] wifi: ath12k: move MSI config to pci.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-10-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: m7fTUR8kEinLnbHynnzWmRDdGSQpB5zj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX+iXx2bEYgSBW
 QmF8gMLQqBTwacHMmnSSLvdYH+NohX2RMOvrucyUNCIAyixB7aQOuRMJBGpiOWKRkn63ARr17M9
 yI0UOFXB4rci8/x+zCnmV1T0t1T9gQA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX4k7yHkoRS1pC
 OTUcdEG9QtgT4XXQ17goFRzd6tcbZ/Af6LYGnE7FCazAONs7hnuE88OxrwwzbsBo/iKBbY7cJlr
 SWsw7rR98PflkDWq71y/Dr9vuiTUJ7LUxRPaQfGlIoNFDMDW0fruPOu6fGFvSuLRMoKmOyvYFmS
 yFIvPJky6Q5Chzq+MhLk9htNF8JbL3KbnBQfUgeIn8gH0+QfsslzZdUH61B9k/gEIaGzJvyfIRv
 ic8PELUAnjW4Kf3fFopKEbTpql6CbA9VBuhIxpc6d+I+9U1PctlmnsT2XjJ8g3PzqNcjz9DX2ot
 IuJWuti45lpw0mwVr7uP9oTA9l57l/XNFG35soSLmOW9cBUmSGGYfrUNORQ7MaLSp8KADkLCQ4A
 qnPIGB2jXD0X6TNET1loiKTMCq5EDW79ENDGHn4J8WaKn5G/IqwTetoH00JZO32UJxw0Mh5RdpQ
 rRn61JyWaJWQu8Vpf/Q==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac76f7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: m7fTUR8kEinLnbHynnzWmRDdGSQpB5zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_032459_175898_19FB0DC5 
X-CRM114-Status: GOOD (  15.01  )
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

Move the ath12k_wifi7_msi_config array from wifi7/pci.c to pci.c
so it can be shared between QCN9274 and QCN6432 devices. Rename it to
ath12k_msi_config.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 19 +++----------------
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index e6fe891e58b1..fe0939ca890c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -40,6 +40,20 @@ static const struct ath12k_msi_config msi_config_one_msi = {
 	},
 };
 
+/* TODO: revisit IRQ mapping for new SRNGs */
+const struct ath12k_msi_config ath12k_msi_config[] = {
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+	},
+};
+EXPORT_SYMBOL(ath12k_msi_config);
+
 static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 3097afb03432..55cc875f9ce0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -96,6 +96,8 @@ struct ath12k_msi_config {
 	const struct ath12k_msi_user *users;
 };
 
+extern const struct ath12k_msi_config ath12k_msi_config[];
+
 enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index bb617bb6b71a..783c5d020f07 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -37,19 +37,6 @@ static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath12k_wifi7_pci_id_table);
 
-/* TODO: revisit IRQ mapping for new SRNG's */
-static const struct ath12k_msi_config ath12k_wifi7_msi_config[] = {
-	{
-		.total_vectors = 16,
-		.total_users = 3,
-		.users = (struct ath12k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
-			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
-		},
-	},
-};
-
 static const struct ath12k_pci_ops ath12k_wifi7_pci_ops_qcn9274 = {
 	.wakeup = NULL,
 	.release = NULL,
@@ -103,7 +90,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCN9274_DEVICE_ID:
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
 		/*
@@ -130,7 +117,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case WCN7850_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		/*
@@ -154,7 +141,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case QCC2072_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;

-- 
2.34.1


