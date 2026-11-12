Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB060A262D
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gCRMHLfA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=boIAdVD/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UY1mprCa;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WlSC89U8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=gCRMHLfAiZ+1jX
	4GLPaV4G4IQvK4taxMKcC9q++A+wJg3IDQQRnB3hZVLbxr1EUxj3C95jM9mCxXnKfj5oNgOchpPCX
	YgW9PuRumCfZw7t/qtZKaDMBB7AzAw6i/UhCOaRJfOzKBxtqIIuLp/Qk/LpbNJ27xF34dry3yh88D
	f4lSETgbr4UWSriGFFspu7+Of/QKBXJ/z671k5SR25+yRWWB/wltAUNAQ80ORuVckwU4QyuKgRMep
	U0MARx40LxMk/YebMKPfpchsL1iLwgss1ZxwlfXy4BmHmFul+USP77XaRDqHZHNSdxMUmDeGEJb5D
	AaMUDdvrhxD5V/0g8wMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQGQ-000000098zz-0LtX;
	Thu, 12 Nov 2026 08:34:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQEr-000000098ID-00Ec
	for ath12k@bombadil.infradead.org;
	Thu, 12 Nov 2026 08:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=boIAdVD/nk8nM66eMbhcf6iJXG
	FaFZFjftTvJYK/TNWxGQ4z13VtJZ+1IA7sYNiRObRLdTA8r5hzvrqDd2ONIT42Ni64zYgNeIlF3u3
	wRNEHGBYGwgbfyYaGMtiJpPDMWDV8B0sHjPekpGrnywQbb4WgTQIbJn48W8RT+tDaTsiOxGqyY00G
	Zzv68VlLjVI7j9NwqDsZjL1oE1fMyEftCjhDVzxSYxAP7JuBD8uC/qR0lesY42UHIcEacQoy9jZbF
	d8tHBuwJe0VJ6rNf0I7Mw1KhGvOVJ2OcMxQ9VZILDF5FZ37o1YrU2sm0cj/iWLLYIPT0bTnkfaYkw
	4d2VCfbQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQEo-0000000A3On-0l9r
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:32:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZPJR4092381
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=; b=UY1mprCalcSCyaMg
	MmkNtghlBAC0H6EiCe6XvvllNqmTib3KbZm9udLxwwIKi473iAeZmCO4NbKVBY8J
	2nDvywiAotO5zhBeUFWdpag7pZeUttW9/qsCyd1SE7nV7erVjhtJ2Li6HFQpc8CQ
	99rg4kAo0xDPHs3Xh12jSSaAkPxQJYb46l5CHLVtiDsUWFgDd3kylGzYV1TDH688
	sPLUe+PsICH27xpQZl7JGizW7J5ZKyR/n5QLTkR86tOQmcn3rpiHv5Ec/ucNcROj
	nhB1iLLxYlVO+qKXc0J+54Az4Qu9uodyKQMLQzYwuxusREkSNQQBrWqpdX+tYMog
	5ZFPcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so5045101a91.3
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472371; x=1795077171; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=WlSC89U8EacuepzlHSceCBTkN/gsOcKZo8hmekfN1FFXDDFVoNHKqwoWKfCnLPhuug
         YB0D2mWmeYTpmcwQzBtv7g0FQbqi+PRoQ5L8+GsbSMsSw+k/1mrQ9eQS/IytkfeL87Jb
         lByAMH82XAzyciQm0td5tiTmDFmYp+V2ZoPXWw2gERE771xibcD0C1+eDyTZS+pGz6lM
         ffRc0qs+SSw3PPNemruUGg5w0opdcmkca0YQ9Nz3B5DfTrfmb1e5bbzkVWz0iSYMU5Mj
         2rp0NJtorS2nmjZ0svBZ6LcUSeqT91adJcPM6fNzWoMBwYTHKbHZTqEL14X/+jfiJzng
         0zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472372; x=1795077172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWx0aVWngVCT03NNmotvkbFgmOVbHYzPWzQqFjJs7B8=;
        b=BdKX5KNezRD5zTC2zxHlIvfH5BF40Xbel8nf1urjk2E7HR1wJDQ3ZCa8mXwhp+gZ6w
         OUXAI1cCW6XNvcYCSdKMFfzGrtwmk403/PtDIs5ANZqbabNhdTGbUBGAPKCwPVoMFM1N
         xquHh+MOdLIk5xCplft6hFyE5NVDKuHQgZ89UPy/2gdskn/f5MGP2pHVT514JGALuZwP
         9Ms0TCIKr12p8YsuLJCDeqXPv3EMNW/RxBjpJQbP4uk7bxXMlLnkY2ceiI1rGfUqYwpg
         gu2AJbbEbz2uzNW0Ee1OJI5NZhS5zE8ddXHhh6dc7qFgdAfrIOaRZdSwm3jO5AcNIxY3
         wvvw==
X-Forwarded-Encrypted: i=1; AL+hErEv6SELXm+/9BP75M5+7R62+Du411Laj1ceej2o+65+QiEykQoxtCIdsatTWlnjstSXqfbkt9o=@lists.infradead.org
X-Gm-Message-State: APuU4Z+2KThEhlY28zbqEYfBk+UmgkMOG80MavwL4eQxmX9nzCy02S6S
	zoml5XKC44eiF0nj4qfzuMPY+/7V9qiUL2IBZnOexnbUCOCbpBKLng5CrYn7+aQtS4QWgz57tG7
	5atS+nxODZMVTIh2hx0nrAybyLNTtD60qEexNoyNLwlqN8KDUkFOcJLqKAEEIMDrm
X-Gm-Gg: AYBFou0E7PI68fOTqTw30drtzEfUkPk09IidhyWTsEbuJ9puAQ2Y+/kouCsCAXFqFAR
	1VAIMDQj+gE2DBjMm9o0gR8PCNn6pat/VKUkm9ZJWjoeUptfFSgxtrYBGEs30XcmwXhRfpMJoRw
	Z29atQM4Gyc2w+MG07cWQW9ucEeqRAYddQC+/XUxYd1x/sTgxMPJu8oyA1NlbrrwlNxXSF5LZHh
	yA3Oc3xbi4KBb88sMn/dmhQcKLOjKCpUyaMlZPIzVWMv/ihvlPcdSUiPLBHELPrOvUV3hz+0jW9
	C8EG2HY/ZQjd6Ooz3KqHgCXtPjjSrud9+r7Cz0gAxaROd8pG2QJhOP6XlgZoNukOimndCg9gdoB
	w13qAoh7/Jyg2WsVRydQt6bGqDCsKX1gTvyUh9cDk4tIxuReIWj34oHdeVzojATJ40oWfgfQD7N
	FTtE9XO86D6neSDMHPGzxRWJQfQeF+Juoo/xUapALEKynYGnPeOoxvTWwMxdpmeFEsaGv+inVrI
	g==
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031302a91.49.1794472371405;
        Thu, 12 Nov 2026 00:32:51 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b182f26e76mr5031273a91.49.1794472370879;
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:50 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:02:19 +0530
Subject: [PATCH ath-next 05/15] wifi: ath12k: add Wi-Fi 8 directory and
 base module scaffolding
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-5-3f30fbc2bb69@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX/j24n4Ywj/ZC
 9FQbUZxZeyUEusQxEtM7ZazBADcEJfPw3ipCyRQs1gBmFcWu6Yp4z2ZTZgrRVBhLNc71o/5q1ci
 YZx0EpGxWKrG94PCvB+jVCx/Szd1RlQ=
X-Proofpoint-GUID: hHHXkMfQ1z4L_2Bn5A1-emRXzBQ3lgrI
X-Proofpoint-ORIG-GUID: hHHXkMfQ1z4L_2Bn5A1-emRXzBQ3lgrI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX474gc7iabGj3
 3RYozIg/RdISSVR6/6KEJTnB7swp87PvKEoVyCGV6ejF/w0Yrabp3v1VDXqxB4fKOll/ic24TW8
 //cvkB2L+iIu2yTZ0Y9Sh/xMUbhEa+FYStHGU5TizaqzxGq2he675gnvH+yALWD2lP83C/iifYs
 FPjdt5ngJYfZY5kVp4IRiJKC3W5ojcwIx9iqgc+0rVr/Xb9gKB2lECDgPN58hEPVvCRVHPLsYv6
 sRfULeozdKg8ONoY7htpCLNFBHqMtPcehfu7r2K+W/civ5Pz0a1nOyFCbkSeAAn/tNhA5xtoxvb
 kpoX8LFHIlEQcltYEwxB3Tv7tjkxpfDIKlPA0mGqPiRVwXfm8U4Ul6Y/8cKMe/kBm7uNrco5k9d
 Mb9Ao7xnT7bWizoqyhgLrYxIubrWX/zuluMYVo5CIyxs9rtRwf7Mb2YmA+gZo0i0LT/zytDjgvx
 T3X3QxG03tSQDCv/k5g==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579b4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7WpiGM8nEZjQw5yEjS0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083254_379341_06FF9242 
X-CRM114-Status: GOOD (  18.48  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN9575 is a Wi-Fi 8 target with a distinct hardware family that cannot
share the Wi-Fi 7 module. Add a dedicated wifi8/ subdirectory to host
QCN9575-specific code. Introduce Wi-Fi 8 build rules, base module source
files (wifi8/core.c, wifi8/pci.c, wifi8/pci.h), and add
ATH12K_DEVICE_FAMILY_WIFI8 to ath12k_device_family. Keep Wi-Fi 8 PCI
init/exit as stubs so the module builds cleanly and remains bisect-safe;
actual PCI driver registration and hardware support come in follow-up
patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/Makefile       |  1 +
 drivers/net/wireless/ath/ath12k/core.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  4 ++++
 drivers/net/wireless/ath/ath12k/wifi8/core.c   | 31 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.c    | 18 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h    | 11 +++++++++
 6 files changed, 66 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 861ec85eebed..332110d72a1d 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -25,6 +25,7 @@ ath12k-y += core.o \
 ath12k-$(CONFIG_ATH12K_AHB) += ahb.o pcic.o
 
 obj-$(CONFIG_ATH12K) += wifi7/
+obj-$(CONFIG_ATH12K) += wifi8/
 
 ath12k-$(CONFIG_ATH12K_DEBUGFS) += debugfs.o debugfs_htt_stats.o debugfs_sta.o
 ath12k-$(CONFIG_ACPI) += acpi.o
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a8e8a55aa718..2a4b5e5e1af3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -956,6 +956,7 @@ struct ath12k_mem_profile_based_param {
 enum ath12k_device_family {
 	ATH12K_DEVICE_FAMILY_START,
 	ATH12K_DEVICE_FAMILY_WIFI7 = ATH12K_DEVICE_FAMILY_START,
+	ATH12K_DEVICE_FAMILY_WIFI8,
 	ATH12K_DEVICE_FAMILY_MAX,
 };
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
new file mode 100644
index 000000000000..b8c5b6d3a7bd
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_ATH12K) += ath12k_wifi8.o
+ath12k_wifi8-y += core.o \
+		  pci.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/core.c b/drivers/net/wireless/ath/ath12k/wifi8/core.c
new file mode 100644
index 000000000000..9253ef9d9cf5
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/core.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include "../pci.h"
+#include "pci.h"
+
+static int ath12k_wifi8_init(void)
+{
+	int ret;
+
+	ret = ath12k_wifi8_pci_init();
+	if (ret)
+		pr_warn("Failed to register ath12k Wi-Fi 8 PCI driver: %d\n",
+			ret);
+
+	return ret;
+}
+
+static void ath12k_wifi8_exit(void)
+{
+	ath12k_wifi8_pci_exit();
+}
+
+module_init(ath12k_wifi8_init);
+module_exit(ath12k_wifi8_exit);
+
+MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11bn WLAN devices");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.c b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
new file mode 100644
index 000000000000..3975081d167b
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/pci.h>
+
+#include "pci.h"
+
+int ath12k_wifi8_pci_init(void)
+{
+	/* Wi-Fi 8 PCI driver registration will be added in follow-up patches. */
+	return 0;
+}
+
+void ath12k_wifi8_pci_exit(void)
+{
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/pci.h b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
new file mode 100644
index 000000000000..efe02721e470
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/pci.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef ATH12K_WIFI8_PCI_H
+#define ATH12K_WIFI8_PCI_H
+
+int ath12k_wifi8_pci_init(void);
+void ath12k_wifi8_pci_exit(void);
+
+#endif /* ATH12K_WIFI8_PCI_H */

-- 
2.34.1


