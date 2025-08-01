Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89527C87FCB
	for <ath12k@archiver.kernel.org>; Fri,  1 Aug 2025 10:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0zwqu1x1rcnd0XEa/yMRr8onX7Hhz45yypxYggbRCbI=; b=u4PLVgLjKWqSOqxAeWpuSSFdNd
	tmvAM4PI6mmnmLdzzQRIWhY/lqww+CCmRprdl+ruWnBMV9V1d87KDZdCX5qs/gsZ6FPExfwbw9kwJ
	x5w9nNAZD5nAXQWRbnQ96RXhdYPZFjQ5PniE65kw+0UrUFrVHNlc6z9aM2Nv8OsF30gPxsgUqEigY
	/9L0uX1sCnmjQ1RAqahwl41csc5vQ8sOO32zsj9AWW51Uc5gGo7f6sA71tT7O/iE6npMSjunnW6vo
	esxHZn4K003b9JBldmqfO69JYW9gZ2zTIamFJscpc1roqMUSbtDmxlP3p0/pLQByIUslPHt6XwpMC
	UAreDsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnKY-00000005UaT-0fAx;
	Fri, 01 Aug 2025 10:49:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnKV-00000005Ua1-1Dj5
	for ath12k@lists.infradead.org;
	Fri, 01 Aug 2025 10:49:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719g8A4006749
	for <ath12k@lists.infradead.org>; Fri, 1 Aug 2025 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0zwqu1x1rcnd0XEa/yMRr8onX7Hhz45yypx
	YggbRCbI=; b=XuYoLeyLiAIcvG3bmLK/Qamgq4y8RcludCHj8NUXO5fY/1UCesC
	sfmHHe2xA2U1vuKsaVNgksSspiJ/tbrAUW/54q2kGtk2jVMj0J1lsEB2+9aSXXUm
	rgdFDdEk/7BaClloASXMNqVczYumqUS7p7lTX5jt/YRKpyeWGEiOIoctgLbiHxoH
	qXuziddh3pU/WzAS2ubR9WvHs/knWDkkpiCPVp7RoC8UUvLPGGw3qAf8dsJbx2qF
	O7VYKB/t0AWJsazOuj9DOfnwmiULAoB8KvHejGVlYldPYLU+D+8qIZJepSPGjhco
	s///vzdH/9Zg/qWpyZksFvtxAsBsh4kULiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 488u6507vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 01 Aug 2025 10:49:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe28867b7so10887045ad.2
        for <ath12k@lists.infradead.org>; Fri, 01 Aug 2025 03:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754045376; x=1754650176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zwqu1x1rcnd0XEa/yMRr8onX7Hhz45yypxYggbRCbI=;
        b=u+FyC3t0v4URBjYVgIoaMRvSA1vhJHc3UV8UVxx9Po6xiOoVCtgs087IsWXjDMu64H
         5016rEff4AyGRbwAtuJZc51F/Q665Qc0E2aZnst+fecNaH9RTBI/YSkZRB5OKmgWA4hf
         zAFyDimfPQDGt45cVE8j64kezNQd34RUgyTdvnOAe3dXwJLJOLCrUmvvxZpu5Np7gsGk
         boCxbLDR7cjdhQ6e3/0ii5FS8olZkYqgh67yymrq3pnc3aotUf4PgXXkVu2EajW+bKe/
         XIYA4u6y5Qm+NB4HUfH7ruS7M924vWcAJVjG6pAuNbjWkeEn/EQMU4sHHR2aZMDW81uc
         oOcQ==
X-Gm-Message-State: AOJu0YyNUaOZzJ9nPnqK2j+VRTOGwYvfISEx/yb0PlFiZB7g0bNYumw1
	HyF3ka7D+YZB2YtyPNbyeFYzUWaoIkdyVkwiQQ6N2v2NsEWQsY+F/dDd1i9o2hN6z2W+br5Z70P
	/rwoUyzRgCzwIdZz3MccCX8mIvkh9cUWl0j0p6hAfynX16YiRbySQu0PvlD7s8Uj27YNhGuZx
X-Gm-Gg: ASbGncvBT6tJBKABTIDr6sd87fx09Z265j4yHUSEI6TxinkQchGZ4XlcaleQ7Bluh2C
	b8N8l4JqolM81BLnHg5514c8YmxdmvYLhqZ9v4s6zMqhVtG+31jzCIvCOyNMLEoiOav+0Jtpd0t
	dWHEaDbNCnr7afa8MVYLlgJmzEbJKKq5Ox/NQxwfynH87lBfsbD0Tw5W5qPDvuihd7lNC809zJ/
	9xtE5uggzWooqIGmrXNsbU8H4MpBPhVdYzmL2hEO7u5AGz70PO2Ca+7rDmw4MIPAj3mIUV4DCUJ
	y6EGXy2LLeBz/hNvqt4cT3UDB92KOw8hAIHFHhGtxRHkNKtcjdKKrNIZ5Qsrx5DtzyYYH9mDwDj
	Dl2uOnPPinepcI68I6lRrImI/kC1GkT3WFAsqDtKm4AUjVgs0WsObtUpWOhnki7gOK2qW
X-Received: by 2002:a17:903:2290:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-24096ad162amr164066715ad.23.1754045375852;
        Fri, 01 Aug 2025 03:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYRXawaJosGiOStHumhD5elD/FU0pTU8c5keF5JRHDkJ+yjdgKA2BiktC1eFfIzCD9+5Ukag==
X-Received: by 2002:a17:903:2290:b0:23f:f3e1:7363 with SMTP id d9443c01a7336-24096ad162amr164066265ad.23.1754045375302;
        Fri, 01 Aug 2025 03:49:35 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aab53dsm40066065ad.170.2025.08.01.03.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 03:49:34 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations
Date: Fri,  1 Aug 2025 16:19:20 +0530
Message-Id: <20250801104920.3326352-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0ioTHwf--619NwqxnXSWfIQLRgL-G3mK
X-Proofpoint-GUID: 0ioTHwf--619NwqxnXSWfIQLRgL-G3mK
X-Authority-Analysis: v=2.4 cv=f+RIBPyM c=1 sm=1 tr=0 ts=688c9bc1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=c750zNxr8p8rmOZqGt8A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3OSBTYWx0ZWRfX1+BYW5fL0quq
 /0D+99/HrxXYCdqItfYk0dkIdkgMRo5jyvrgZdzJWVZJJGFFPg2n0MlBvx/MRAg5vsQPf3IAWh6
 8RHNLSCHVu9xIIwfkdDrA+ADAdcArkgm67X8dZVvE8zPw1x9TctKICQAnN+0uHTk/Tk8uyoWs+R
 tOzS6Xrt+ZO5jg3vpnV4KXI00lIgfh4Y3n2j2XtnE/uO8R32H4e37tXHdcl5Wg5JdZNHgNPIf7k
 aKwMZ9SPtFEsqAAskjYfCCp9FA9O9ujrUKgtxghZPnfFbZxzNqrVppTtZhNUuGrc3Nk22PWduvE
 vEIgfzzkYmzzAYaTXYEP5hFElKtca6zAPnUXGrcv8K6uKdp3Nz/61jzexssWMEhpRboWA3db0Bf
 fqnp5s8GKV4G7gGRYgoBnwQk/8uYISAdnZfINrn9Sf3TdGNbzSiYwNRQ6HeauGSmzLvHugeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_034939_448492_8EDAF759 
X-CRM114-Status: GOOD (  11.58  )
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

From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>

Currently, when updating EMLSR capabilities of a multi-link (ML) station,
only the EMLSR parameters (e.g., padding delay, transition delay, and
timeout) are sent to firmware. However, firmware also requires the
EMLSR support flag to be set in the MLO flags of the peer assoc WMI
command to properly handle EML operating mode notification frames.

Set the ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT flag in the peer assoc WMI
command when the ML station is EMLSR-capable, so that the firmware can
respond to EHT EML action frames from associated stations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 4bcf9525bc49 ("wifi: ath12k: update EMLSR capabilities of ML Station")
Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index da85c28ec355..742ffeb48bce 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2423,6 +2423,7 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 
 	eml_cap = arg->ml.eml_cap;
 	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
+		ml_params->flags |= cpu_to_le32(ATH12K_WMI_FLAG_MLO_EMLSR_SUPPORT);
 		/* Padding delay */
 		eml_pad_delay = ieee80211_emlsr_pad_delay_in_us(eml_cap);
 		ml_params->emlsr_padding_delay_us = cpu_to_le32(eml_pad_delay);

base-commit: 0f79768f8d665b43b77967d38b5df6ccebe8cb57
-- 
2.34.1


