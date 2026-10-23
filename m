Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3A60A6F5E
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8YrnPfc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ku8H1n9z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG4b6Nmn;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j93WACDQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=E8YrnPfc8i8NyQ
	kFA9FMSj4bXyVus0A47G4WGomQP9MXj3cTPKCAXEOUXeOMNCqWhzygvEFlZ5+c80TobdTfWtXvDE3
	jciPAi3zjqMNYQrdijPYGRudkya5IA9qdr546Q7P7Ii4qzzvXaedvS2FJKHXX67Y8r9i7eHvN+T9Q
	+TcBV9RarpsqR6HwP8Q/UX8QoqOnwDJ1zv8SFc7j+NCx5+stBuqMo1N/Gt3jeuFE1KB0pgb8abVan
	5nwGC6jmBq21zievbKFU8cYfUeeY+u3ZJ3yH9ocUawBAZs/YG4X46rq4+ws4HWHze7JNZPEMUnYRk
	JgyD//mytXdPzlDjdMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hj-0000000FgFh-12yi;
	Fri, 23 Oct 2026 07:01:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hf-0000000Fg9A-0AA8
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=Ku8H1n9zKQbCfsP/HwmZhyoHyy
	tfHiXmXfmRBftdzeG97qlWE5REHHLc1MIWFL0uuoLx9L19MRh5pKaL5T+G7QGlotmAQlr+UX8v74T
	4YDLH7hS/TwJSeovdYQVnROgnxb7tAV+4dEPfJ6ixNEAppXsrMmyB+SnMaSJXStssOnumzbAGTK0C
	4qaPBF7OxZ/geEnqzMCMQXN5KVl/iIXWB53A2laRgzb6f6kwkYSUjmmeiRtzRvKRsyG3ovE4NNOOJ
	ue9DkVI4pUjsRonHZKbm15aQ+gMYttGBNgo/dlg3HE5yCg0I9kAL1Gl7JsjBT9pYrWwVZ51hdqcDK
	IKvUeWDg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hb-00000008y9u-0zA7
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FX5J428679
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=; b=BG4b6NmnRohcPN62
	vIJc9NTestJcMDNEerSQGmIUwVtj2y21qAjQD0vg66T4Q3LtEpeoI+HxJn6I8xpj
	L1rDMOYFeydMKmQqyNyd4SGKwLz74bDzAJMMQbvWL9QDcp3XJyLheTUMD1QFI3+C
	uBy6Nda+9S6yHXhZgCMI+dWEUZc1LhLj9VSiHEkez0zo8yvPcr2An5sPiG2gXV7M
	cMqp+/Us/X4yKF3gXoRAcJ148/r5rAqgMWflUcLwU+wwLioZMsNzmLuHAhfog1zT
	6tWrp0GvrPLj6uiQtz+8HEV97E3Rk6HmuNoOy91kzgKGUVMYfwfoqIeiymIoiVYi
	OeqhIQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2bdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so759403a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738900; x=1793343700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=j93WACDQMVH0fTzCCL4U9CwIc1O1vh892MM7Oete2z/jfvmZkEs7ar9+pxeS1MQ1aH
         VbjQFDssH5xOXwwfCkumh8JanpOnexr6o5XV0fIvc0y/wKYfd5fPZ9IDpRRPtG5rUnKU
         UtFGT6cE2WDiqzQ7syK+5k5j66ja69FD9VwswRi65Cp3oSa9ruSLH7Oezf0BjoRKkh6x
         9oixNMbMrYl081UBx5j68n7KY0RuTx0ge0jpNpe3rdXkKMQxq4cbBorAe6rudpEHWLRw
         Gb+8ETmAAr51nzQKgiezNuR9Tw97k45IkVK/9LFFGJFICxC4wPbS/BB6ZRJ9hFacKMMY
         JVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738900; x=1793343700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H3Ce4+vKYoYWvdI5qu3qKu/KamdGmH7SUP3e35shDE=;
        b=H/CnRoJltKv5tYgo9lw6YZwl+2tjhamKInImV2tAsLcgIhe04UHdOIEvc6RIzuPYg6
         uQULkjBF4/4M9UwOgi8zxPTB8OXajsqSKkF0P5ON3IqeQANesD9uZg3eAgWRksboLLNJ
         nvFfdrSuSwl+dXX0/uYddH3NPjVD0xId8y4q/XTIF/zxPzEu854g/XqVvW5EZctAsavh
         teKkd7KFjGd6GQrJ2oQcPyQ1xWK6uENFCi0MRnXg6ctf5DBpQHH1uc4WsKYZdMiBpmBu
         8VvFgFa2hl1Wr3xP4Vp4HkMzh4pf8tHr77lPKvd+C6hDp7Ue/FP4FJONVNmAU7yKLel7
         L/rQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0QLbRnL82kChrfGANKpqSJTxJlVHXSrRI8egEusEtox/19TPIPnjZpgG0YPIN3ippkA8c72U=@lists.infradead.org
X-Gm-Message-State: AFq9FYIFrJr8NjB/22voYD/AybUHfaq+V0t84FcR3sN5Tg0shfs2j0Fl
	eankXJxroE7OfGJLmcJmsHZbJEX8bFoPJ+PlZ2JYfC/ZvpKYgcV/5ghzGe47hKvSgtmyDoBa0//
	3g7G1D28efPbKTOuCmGpWjtbTmgViFkXBvEinqvez5hY1y8shvSIJzIdwIuC4WkJ4
X-Gm-Gg: AYBFou2XmuZmchRFY4eN0yl2asvauhcqr9+XtBbslm98h9Gs6G8rze/79+0goXwJSNb
	sz79ivESr2quoNWmhSsFvCsjsZF87w6AaMcR1u+8Cje4aeeOoPf6IeTcgcwRqu7iJ2xBngXhzuc
	o/lNEX8GTPU8A9/dz2AM3xqLoge2nZAAgU1rQJ8Na4BKcAUi2xa7EaGWA2QJZsK471ZYCfbGvtc
	ksY8agTnbzarz8d2SfmmUDkpaRSvobTAZDbpvlMbZj2mQ6gxRaiw6uEYyKZL4Z4cMYLi2lqyISv
	45xPr32haJnMyh8CZqWR/dFIrrWgVnqRnxdfnSiTjJiRLdGnoAz3v2bkTBjorV/1+wHDhKeo91w
	zKn5PxKLWDuaqScnAKqx6nhetkzMW53iMxsOx3nAvsI39+iaW/9xgbDgRr15DW3QZmDnPiWWEC6
	7682e2cVCy6E686yhGuztP4w==
X-Received: by 2002:a05:6a21:f10a:b0:3e2:3bc5:bb8c with SMTP id adf61e73a8af0-3e37669af6cmr853655637.50.1792738900392;
        Fri, 23 Oct 2026 00:01:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:f10a:b0:3e2:3bc5:bb8c with SMTP id adf61e73a8af0-3e37669af6cmr853625637.50.1792738899810;
        Fri, 23 Oct 2026 00:01:39 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:39 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:09 +0530
Subject: [PATCH ath-next v3 06/17] wifi: ath12k: move multi MSI vector flag
 to ath12k_dev_flags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-6-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX62Kjw3LGvpnV
 GytAIS+W9GCAaUcPAGgRTNSiikMbLDgHrvvl/oRzNl9TtZ8VmLU+7TjBhRZLxElnUqNoJkzWQUz
 CDdg4e3L7wxDIJSiZrCImTh32xc4vLgCuFvUtst1if2ARn2QU29FxzPc5jPVuHQRyv9czmSut0E
 +ZMEpKQvfcMh1NQ2McR7RLxWx6G5r4E4pSLSDlXHo17HlXIyqj9zQ4WbdP1SzkiJFdmBIupPmmr
 HVZm89LHcrNpOyUj2+BOaCXySpCQn0MgCESk9cFXm1JVJj9qvt+sS7RGaAaWptRf1Er6OMLUpM9
 RtoSC3PN+zgV2MPQVVDyTANBceE20cIOLDw+GmBnNjKe4EzpFY8MNVrJMkbe9bmvoAwystq9ld4
 XjRZSC6yJDjGEHuOeRTFoDMrKfKsWFGV25lPsEpjhnrWidZYveLyX9bIwOz1rZx5T1WRB3OqzB3
 lF2OznM5f/clh4WCrnQ==
X-Proofpoint-GUID: YWtvZfUOqaP_fpAl8NL3THjAhNYMrqTH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX47J11nbB1dP5
 y21sHyrKHrNuK6vwkiPNpBzzQS/2SmKXdNo65EyrYN3pFGeJH1uhcrvsXlN4K/jiQH46abNoeQ9
 ulbOUbBswT7Spky/K2rtJoTXz7OGxWU=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb0655 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jN1JcmgayTw_7mYEAw8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: YWtvZfUOqaP_fpAl8NL3THjAhNYMrqTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080144_214747_7EF28A26 
X-CRM114-Status: GOOD (  19.83  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN6432 uses MSI vectors, but although it is a PCIe device, it is
attached to the WCSS Q6 processor and registered as an AHB platform
device. As a result, it does not have a valid ab_pci context while
still reusing PCI IRQ APIs.

Move ATH12K_PCI_FLAG_MULTI_MSI_VECTORS from ath12k_pci_flags to
ath12k_dev_flags so it can be used without relying on PCI-specific context.
Rename it to ATH12K_FLAG_MULTI_MSI_VECTORS accordingly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/mhi.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/pci.c  | 22 ++++++++++------------
 drivers/net/wireless/ath/ath12k/pci.h  |  1 -
 4 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index d87c59f68c12..eaea601ab32d 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -278,6 +278,7 @@ enum ath12k_dev_flags {
 	ATH12K_FLAG_QMI_FW_READY_COMPLETE,
 	ATH12K_FLAG_FTM_SEGMENTED,
 	ATH12K_FLAG_FIXED_MEM_REGION,
+	ATH12K_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_tx_conf {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..56e697fbdad5 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -86,7 +86,7 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 
 	msi_data = base_vector;
 	for (i = 0; i < num_vectors; i++) {
-		if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+		if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 			irq[i] = ath12k_pci_get_msi_irq(ab->dev,
 							msi_data++);
 		else
@@ -248,7 +248,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 		goto free_controller;
 	}
 
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 
 	mhi_ctrl->iova_start = 0;
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 736e40492b41..e6fe891e58b1 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -341,13 +341,12 @@ static void ath12k_pci_free_irq(struct ath12k_base *ab)
 
 static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -356,13 +355,12 @@ static void ath12k_pci_ce_irq_enable(struct ath12k_base *ab, u16 ce_id)
 
 static void ath12k_pci_ce_irq_disable(struct ath12k_base *ab, u16 ce_id)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 	u32 irq_idx;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	irq_idx = ATH12K_MSI_IRQ_CE0_OFFSET + ce_id;
@@ -427,13 +425,13 @@ static irqreturn_t ath12k_pci_ce_interrupt_handler(int irq, void *arg)
 
 static void ath12k_pci_ext_grp_disable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable
 	 * in a uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -462,13 +460,13 @@ static void __ath12k_pci_ext_irq_disable(struct ath12k_base *ab)
 
 static void ath12k_pci_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
 {
-	struct ath12k_pci *ab_pci = ath12k_pci_priv(irq_grp->ab);
+	struct ath12k_base *ab = irq_grp->ab;
 	int i;
 
 	/* In case of one MSI vector, we handle irq enable/disable in a
 	 * uniform way since we only have one irq
 	 */
-	if (!test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (!test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		return;
 
 	for (i = 0; i < irq_grp->num_irq; i++)
@@ -626,7 +624,7 @@ static int ath12k_pci_ext_irq_config(struct ath12k_base *ab)
 static int ath12k_pci_set_irq_affinity_hint(struct ath12k_pci *ab_pci,
 					    const struct cpumask *m)
 {
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab_pci->ab->dev_flags))
 		return 0;
 
 	return irq_set_affinity_and_hint(ab_pci->pdev->irq, m);
@@ -762,7 +760,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 					    PCI_IRQ_MSI);
 
 	if (num_vectors == msi_config->total_vectors) {
-		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab_pci->irq_flags = IRQF_SHARED;
 	} else {
 		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
@@ -773,7 +771,7 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
 			ret = -EINVAL;
 			goto reset_msi_config;
 		}
-		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
+		clear_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 		ab->msi.config = &msi_config_one_msi;
 		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
 		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
@@ -1152,7 +1150,7 @@ int ath12k_pci_start(struct ath12k_base *ab)
 
 	set_bit(ATH12K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
-	if (test_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
+	if (test_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags))
 		ath12k_pci_aspm_restore(ab_pci);
 	else
 		ath12k_info(ab, "leaving PCI ASPM disabled to avoid MHI M2 problems\n");
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 47c8760536e4..3097afb03432 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -100,7 +100,6 @@ enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
 	ATH12K_PCI_ASPM_RESTORE,
-	ATH12K_PCI_FLAG_MULTI_MSI_VECTORS,
 };
 
 struct ath12k_pci_ops {

-- 
2.34.1


