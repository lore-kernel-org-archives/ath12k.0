Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9163DC369A4
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmNs+Dli57VD9IZqVjh4DV7yH/D+861TzD/ZVcimqfs=; b=0Fp7i77QVcVA4HE8giMN5VfN7y
	FL6dk9rclPJ9AnTuJrZqfhHKIyOh15MHUArxfN0XE9SY1T7qhFum4mcOYrWA0XR1SuutNnOuN89Mu
	8DnTwf7J6GM9BjoJJa7FEsC8RRXNn0BhBDHQcTU9cEY1aUzJjUfO/VVc4V4rC/O1F3PFUoixC6O28
	aNh/mqCM8fwQqclQSvYicOgIKAZONa6p3xsyujS2+MOij3epO63CSkfZJkHzLlgj3kN+tugdIHdjO
	8PryfuWGXeLkn14Y1Lw5gzh55GUyed8MPSjtl3MkKzSxl0UwnGH0cd5kAi3Xu1TcvGWspkbHShakN
	9/n7N3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Bx-00000002rrv-1Ps3
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:12:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226r-00000002qmU-4Akg
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GWd7010562
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmNs+Dli57VD9IZqVjh4DV7yH/D+861TzD/ZVcimqfs=; b=DbmQXOy0CSvJiPBt
	Tdm+P6p9sps1/NEvXsK9bGHZguauFuqPvd8z0wxyxNVkEOCEVPfdKsqbJ5YopUqA
	tV/nLZke/caYirmLtK6NX9p286O/KZ2nAzW9uM3Cto6THK5Ww433KYpg170A4Ldv
	E2xQQtVQjvniR/8I+C3LfNkn/M84iLF4KEhGk87cQocOg+psp5h4BLxVncObMwmj
	f93oQm6xtRl/XucrdoPJ3vYkNGwNPzQgA36ZSK8p7kzlpECMCqwXaAxHVnTwPhJ8
	lwrmJy0iljTbfXDhuMqB1BFINGTAJaTnUbuQmhABqWlhiwHTpQszZqE8mtfws1oH
	rpSkBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1ejtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8c34d03a1so5232242a12.0
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092415; x=1744697215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmNs+Dli57VD9IZqVjh4DV7yH/D+861TzD/ZVcimqfs=;
        b=MSXn9OAdyc+eNJi1AtH5KJgOk83BfnHfBfVv8AuZHwd1ANPqcJ2GWWbx6wu6NLWCtI
         EXz/4qr/1uczFzZaVsGUF4gNIcxt0KTIB+xY9j0YCue8IPO5qslwkIFeiiLiRP+KziQa
         AESnI2SRNpvqt3VFfc6I24LPR0CTs+oeD0Bt8fOQAUCxMwOSfh6NvcswqiQbCfnisSqJ
         rFnpW50tFF2cGQMh5QyIeDFzhgFiCoOqbGp9WtHdT4lnUxyzFg1A1u81+LUFWcO987bU
         Y73JrtNryXG1yDwwmQ2/F2cAuWOeYiIopS7spOkDQbaCBrnQkSA8z2OzzLgKf7bTgids
         MjBA==
X-Forwarded-Encrypted: i=1; AJvYcCWHnKLtshUyMJmmN8pOceV6ODI6haqEdAreIx7vA3ETHvseLQ7Xtk6xfZcMrDDM1AZb0fyCcZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzX4kMhszdZ9Lx+q4Efbgt9LblBe+L4R5hyHU1GJC0uuwYNmlI
	fYjv4u1IzBLnKCcHG58a4zWUWM7VuiKtY4iOjgmLd+4WbeWNES5kx+GNyH3ikqTs2rOifDm+UWH
	/cgz34hyzHzOQnRwlS0OwhrW+UxNV6rx2VmqdaMtDzRydt0qY4y+G1ke/0y1qpPISoVHP
X-Gm-Gg: ASbGncsIOjPSuYnRU++o2cM4jrIhwopKaG0YigGWE5RyJD9hmJ/ehAtD69ryUxCp+gG
	sr8mHDgOndojHreW5W1y7Ya8bo/8z2eELLDyoTyDlMFQH0tXZIq8wNCq/lOm3p5mpctfXjWNGJK
	QTEhP64Gpz6F4BE7hNi6BvvFXuEpYywM8aPpGLYeM6xh+SCy5Jd38lm9ZnB5VXawVQNtyIjkgcA
	enB1i4Qo1gDHhcC72Ll7yiwqj9n/S/hT0kx09Y5lqKgzrH+hsZzQgW9gQ83zrhu2N2MvDdvpo7k
	2oIJy8JBBBJYy1rUfqAvlqqXO9SOrQ+6/pBMMtPWei+oTYNYOG+QG03otJCOi5WGwX27bw7JIWo
	4xtzv6GQnspZhOK3wcUMpTFu02Tr6055SdQ/AEZZU
X-Received: by 2002:a05:6a20:2d14:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-201047a3028mr20649704637.42.1744092414741;
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWTZekfKLMCAEMlcaqVGQtNPhQy8cuaqM2WzkcJnwPiRfIo5wEm7mrFmj0K0CA+mBi9nPVIg==
X-Received: by 2002:a05:6a20:2d14:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-201047a3028mr20649669637.42.1744092414362;
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:54 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:32 +0530
Subject: [PATCH ath-next v4 4/9] wifi: ath12k: fix ATH12K_FLAG_REGISTERED
 flag handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-4-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: AyrKrvFlnr-ws4Ekm58JwnAEOggr4pi_
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4bd00 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=FkGa1SFpmQEPtfWTPJ4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: AyrKrvFlnr-ws4Ekm58JwnAEOggr4pi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230658_153381_D347444E 
X-CRM114-Status: GOOD (  15.67  )
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

Commit a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
ath12k_mac_register()") relocated the setting of the ATH12K_FLAG_REGISTERED
flag to the ath12k_mac_register() function. However, this function only
accesses the first device (ab) via ag->ab[0], resulting in the flag being
set only for the first device in the group. Similarly,
ath12k_mac_unregister() only unsets the flag for the first device. The flag
should actually be set for all devices in the group to avoid issues during
recovery.

Hence, move setting and clearing of this flag in the function
ath12k_core_hw_group_start() and ath12k_core_hw_group_stop() respectively.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 8a571a615313d2f1190fe9afae02dfd385ede7a3..cb2a99d110d5c9ec2c092fe1a2b776b6265c4126 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -958,6 +958,9 @@ static void ath12k_core_hw_group_stop(struct ath12k_hw_group *ag)
 		ab = ag->ab[i];
 		if (!ab)
 			continue;
+
+		clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ath12k_core_device_cleanup(ab);
 	}
 
@@ -1093,6 +1096,8 @@ static int ath12k_core_hw_group_start(struct ath12k_hw_group *ag)
 
 		mutex_lock(&ab->core_lock);
 
+		set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
+
 		ret = ath12k_core_pdev_create(ab);
 		if (ret) {
 			ath12k_err(ab, "failed to create pdev core %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11a8a5f5733352826c724c671fd49a..5c3c9267e937484cc5f5a7d8032fb3911b4e921c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11773,7 +11773,6 @@ void ath12k_mac_mlo_teardown(struct ath12k_hw_group *ag)
 
 int ath12k_mac_register(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 	int ret;
@@ -11786,8 +11785,6 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 			goto err;
 	}
 
-	set_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	return 0;
 
 err:
@@ -11804,12 +11801,9 @@ int ath12k_mac_register(struct ath12k_hw_group *ag)
 
 void ath12k_mac_unregister(struct ath12k_hw_group *ag)
 {
-	struct ath12k_base *ab = ag->ab[0];
 	struct ath12k_hw *ah;
 	int i;
 
-	clear_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags);
-
 	for (i = ag->num_hw - 1; i >= 0; i--) {
 		ah = ath12k_ag_to_ah(ag, i);
 		if (!ah)

-- 
2.34.1


