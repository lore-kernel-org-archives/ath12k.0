Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8BECC6B2D
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=i2/9c6/T9yX2Rw0PSeq1ah3vfk
	D3YbJ+j5EBxd58cqPEqxMh1yG3l3mIJ/tCu60hAKrCS7/bSNMTgXVJ5u+X6SPdoH6DHeTTtfQoPz5
	l978d+H/2S79Lyke1ernWQiFwx8mipXglZMK4T/0EX39oSZbVnlua/7wLE13fCOOnXdnS451mlxcM
	ARfRaK+lgjh6MyqqnVGXyXsPaq61ZH7AK/jRxfc6mfg5B4OCwQWC0aSu5B8vsn3m7J6Hg5SuLbQYh
	7v7xZ2xxWn8Wm6IpbJNW0O2XBMXXFgxHeSW19hA5rO9wLMQvnKVG1rxNIL6gaFZS13GX+wrg/tsU1
	1AmUomOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWv-00000001pp3-0J0g;
	Fri, 16 Oct 2026 03:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWt-00000001pnR-3Otf
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=bUoS2A50t7HHkEPHSgbSgr1dU6
	pjD3NHcjS27242i36/OXK60FS1So/fD23+y7GyksnZM68nRu52oHAHRa7924PBWsLiGnNo87SL6XL
	Z5kIGBHu91EzqPDnR0pQsR6NpBJtG9TIQtlagoDXMcXm7RG8UqfGvipPe9wX6KmX2KWobpOx9ludP
	k2Y/FhihtHUa1r2LkZoL3tdgAeOyLc3bIZ2vBZ+SZpT88q0RSPtxhAdIFcFXvd5oSHVfMUThqmyxJ
	iUwWA1JAhJkxXMK3j9DDgX+yQpNR7gMyx9W6jK2WgMbUgwizv0o1UyHBlVT1QFYYlPhqtoiMOr5Ge
	eO6VOcvQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYWk-000000012YY-0bZA
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G23UiT3202292
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=AVei3o0rrTWrsVxr
	W46F6cdjgt3FILt2kZ9zKhEjv1/RcpUmshgO9L+dHNvJaMj8x8Nd7cmFZE+r77mj
	/iioxgUCbRTUzFILr3jiPv+vMaZBrpaoEzHqMQa8QjTo3GcIPr3+teIxTYYxtHTA
	vF+Syl2RcojLMnhp7PqORRkJP+modeeJmaQ4KCtMOGOX13s7z41Apt7Ic5mT6hhv
	D3sGd0baTlv76j+VTICyRDJLCnzeY+gt8Trw8CGGD2EyR7ky4JGt8us5wP5XNehg
	g34SnLYISys1dl5C2K7ElguY9kbgSlj2P+Vcf5uULIbNYTzg//oFWiWbDuLlXzMh
	OjT80g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39u10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a04491c56so572473eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120955; x=1792725755; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=XkKUjaOI4T2XDHzsBcvo2Zi7pj5CPBaS1Xri0iBJCQzXrV0A4SRbi7z2U6+McV5Fh2
         PZblNlykuMg+DjNmdb8T8+pzsKPIWkOciXbMlAWX9AadYAAshfJRYsHaLHzsaAelLH/n
         9I5C96uh8d+qMVaGmGWBDtgjiMZMpVvEFFufFXV5H/Y4H0FIoVpBGZ44rDhoy+LV6GTy
         2A10gJlyZt4PbCFNKwVqAffvHxy+FZkxExJs/0p/q5Or7hva4pRLscV/OSQxDTh46HBG
         enOVLpfEl/n1Jq0p8b9gb5er8MICciKXteufZHJE6n87AnzkSd5ubcYeeF8WsMXTW4AS
         2Hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120955; x=1792725755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=1jD9+A3LXHLKJN6PIp734Nhx2yR3/BFMpNz/NaNr/KxRlhDBpqe0vpD0BqBt8cC4ui
         4xJwUUtrLW1pvXXwedAm3GsAe9YJgdADSKXop3ajhl0w392OI+kUQmZ0thdQU/wnuSyi
         P/8VY9FgtnStHNhp4chAroilDg2zXt0dY9VikS6CDnIxj7YTJhsoR4bJeAhtJZknvf/P
         nkTZgqbrjzARhP3ULa1NUbVlmO1N8fDYqU/ih9hRmZLFtsx4oEvhfIpTswCD/23VpYK8
         sNBPsqBC0TDhetGhcDzNm7e3EIYEALP7AMsKzSNQtohurQNmBV3WPeT9qH5XZh5rzDDd
         19yw==
X-Forwarded-Encrypted: i=1; AKwUvBy8MFkOqLivDhm+K6kKJItTyDCA/oZ5s2ikP3VQW5cBIeZaIKEmEB/wRE7N15RanxERPb7bDbc=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZFgMOLGdE85mzgGfU4OaixVZc+RQtNIU9n7113NTbWBUeD3Sq
	GeZng52KGObUxfxD++4QefGNFK+YVP5dRb0GnBKELVJC/h09kaRFDlu6dO+xG7yksNWVJKsK5CQ
	Rx4mQpj4vHFLzDx1z/eG8biIoQ4KCvn/bRutvoEJ/Mlerg48xZacKgNlUsGnD7/IM
X-Gm-Gg: AYBFou3F8oelFyw5YjF1u4e5F0TRsEOx2kc/J7hE20p8Wu46ekgIflB4hxe32Imc5Wb
	WRM97utdvcpB8L6PdCb4EcPok65zljqbI6dmMjcHRe1QlD5I4/tv3iueRdJr8WZiEi8a60gfFQT
	DCxDnL5+kAe2vrLLlE/TozPf9r0Nv0h3SB029Rx7FJ4TtUun3LzvgecbINOiVh9WTBIeXCD/qHN
	3Y+1LjpMD86u7ZVIyazcWdSHS4ZOt5PEpcHdTQwcv+3LfsmG5/UkxrJn975Vem5cdFGhlqe2hAX
	o4onBwMpOIkghhhdkd6E9/jlnPqi8kIRGvx0btufdwwQZo7MBLWvbGDfBB9/Xb4iSt85IaXwB3a
	3MO2rHKlm0OzZ+li3xSawjtxFNZwRavYCUaB2lXgSWNzI/imXOC5a6uwl44aVLZbGwWg0x0Rvme
	42WazLHE/VZ/I0Rp+e1cGQ1w==
X-Received: by 2002:a05:693c:808d:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-3602f1757f4mr2286961eec.21.1792120955105;
        Thu, 15 Oct 2026 20:22:35 -0700 (PDT)
X-Received: by 2002:a05:693c:808d:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-3602f1757f4mr2286935eec.21.1792120954568;
        Thu, 15 Oct 2026 20:22:34 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:33 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:47 +0530
Subject: [PATCH ath-next v2 10/17] wifi: ath12k: move MSI config to pci.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-10-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2zY1bMsgbwVc
 trRe8EmF14M8b8q48LT2Wx+9FGTOqTYow+YQc3Bnsf0YT5l8xJtGq1FwPREhIUyXxe7s9KRKClS
 gkdZn+17C4IgIy6UrNEUpEoju55hzL8boceE24jALxLqH490r+uGo1qMoAMqmyntXJ2kC5XjJUy
 p6sQCySu8ymNIX9ZRwXExV+qCwE7d/Rob+aAcFhejxKop3D4EEQLpuxwkSfboHJyDqzpdgGW/xJ
 FiqQA7/j/Z54GYiphE6orpZrMsS1IWBoZ8DxCoBSlwzycRPA7WJXdhJhM1xxBLimUbjpn0/iA58
 EpMSfx7WAlizxjacHxm5nix6MIZsQDq/SIZu8CstB9N2FbCQqUcupC3RsclIobkBTqzxfa/w8MV
 IyuGTZKKZSK+haZz0QJ7sLszlVauRPsVMhLcHQrciNpaEcdWJPqG2fwiCt31gADsaAd0P+feeHQ
 aS64w+q0174K5APb3+w==
X-Proofpoint-GUID: 4FcRsQZq1PuOFFSjy03I1lpM3hhO4jn-
X-Proofpoint-ORIG-GUID: 4FcRsQZq1PuOFFSjy03I1lpM3hhO4jn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX6sauk7FDD357
 q39uRPD1uF2waO/hzdk27cjhNblHxPjnAcKa023WE/JZF1bR9x1+peXlLBROWTMCqpF9ZMAkw7G
 BH6aWlRKPfTOfWBvrC63G8Ti1QsCMmQ=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1987c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042238_808663_4CFF2592 
X-CRM114-Status: GOOD (  15.98  )
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


