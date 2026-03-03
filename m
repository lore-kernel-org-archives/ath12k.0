Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D8EDA698
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=; b=QgGWPblmNuz94dO3NuHilud/pK
	UYoJLhbCSP5gsIFjjMh1xb5zHN37/+LIHPWWOacXKetRGc6kpXHWe8/Ry20OapHRr+rNbmJvGa6BW
	SHL9ah4GOD+vPlPRb7U2OnxsZozvKAPt3hot8DWecKG3pXggLC9/vgSXUmQy8FiQ+2fam2DEwYqZ7
	14gYYb3g1a3C+xS6hRI8TIO44EycXvWWSN5uvs555wFkHReyyycTw/TiTUAcn/WfmSrWACC+D+/CN
	8ICMqX8+p8NG2b49HZN5smisYiE2TSrm7fe75FvgzsX1spc4BUtEST37eI1QA6oGV4GRT6W5n6svq
	jJ4rENSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSbK-0000000FYrs-22k0;
	Tue, 03 Mar 2026 16:28:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSbH-0000000FYqG-37Zf
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 16:28:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mjAS3951822
	for <ath12k@lists.infradead.org>; Tue, 3 Mar 2026 16:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KYInzzJjsnnU1zrSS2VPuJ
	6KrmGRMortrB9S+4pnuA8=; b=hD0AiqE5rRSUQro3xKz4TZduHfTaFPIKLOs74Q
	2mtGoArBTujZj1syc0yN8Q5twKRpTwQAFtYPzY/4tMdlBYuVwbnjEMFwVAfTuZYv
	/V0CE59OX+OetbaSoZYK1KeI1vvq0HU9o/3Ac3ZxAeNAe7v7JhlpdVK1734rXe1V
	bQVyx/rSjc0l2xDteMKPm2CJwIgFtE7NzHvNVZDWUURgsWHVUemjrlK6h2dVCAMT
	wZQsLywuMp9sS9ItHHFO/2FkyQRf6miZWUD++N1QDbWPs7idT9tkQPfDlHe4QB9K
	Tj4v2cAh0lJ7PyAFxBXcxNpi/DGs0xgFU7VBp8yvcnH5I+uA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n9qcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 16:27:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1276e71652fso10218941c88.0
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 08:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772555278; x=1773160078; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=;
        b=NXDwUka169qmlEPtFJFpcBZ8LhXvY2joEYjYqCYWHjioFrEN78JdI11vfCkxOvvyMV
         uXCLQwBSm2kAoIcn+M/+3fKCycf/WvfZlWC9l98cxxvNjehZ4L/l+ryY5RyNzxZRrVyT
         5NnQuJrpQWtksDgE1KHu0Vtvl9qi9yxfuZBsMw2cZPir62yYutR5fzkl8gVXJjknfq9C
         AIgas4/EyQoqlrEVTYiMXZk9Zz0SSyrUGM3mSFJW+BPtMxWG0KYzBr+oAzifAfMUKNAr
         HTwgIHUSJRM+8LCYukpjZeqa2GyAkjZvXGEFH1NNe9hfp8YS3Rc0lE8FgFvefLCGNPJM
         feSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772555278; x=1773160078;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYInzzJjsnnU1zrSS2VPuJ6KrmGRMortrB9S+4pnuA8=;
        b=IfHJ7HtBxhaPRoyT6vd4ebPnujdix4RMUswWjkTTs+X44777t7PkodMe19zXancOUt
         z0CogsRanHkQZpBGKkz+aAQK/Zpu9SbgVlVwYhl0Y0yZi+ehxay/UpDNv2Kfz58RNVm8
         rF2viA4kHhtfPb6FDsnfgLyPN9Ajk2RvT5pQ6XdFlGiALQUJj5yZ2xMBdbfZOwIZTBUM
         kBuqM83orbSi96a/WIJYsJg/xsJrl3KgBjK9K2DmtQpMG8rdzhXj7qAZxh6SD2BrDj08
         rMf5bJ9AM8z2f8Kc2yBHNCDwc81EzE7976HcmRTyTIPBwjfgZu8sof0tRYcPqbyn8Him
         zSiA==
X-Forwarded-Encrypted: i=1; AJvYcCUpjpyOakpWu78VWA2T4a0xroQDd+Eze33K8gRwTpnxD3ikofGwSnPDJ9i+grWT8bYsNVwzcdI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEMhjJNsCt0kTk/n/tbQirok9QbawS3L2omXdBU7sNGquhty7
	ApTyCGS8EJc57L9V2fjw/gw8Xq/+R9zqdIFPJQh4Pf5RKlHp9KAYH8/+WLYFJEHN3lrTnJdXKOi
	iETBdLir8mUtUT6zAL7GpVO0T90N++KjyAy3iLe9STU6PQ66yh8e2BIumSZd18kOC
X-Gm-Gg: ATEYQzwwurkLeEpzP4jMcg64q/EzmLDXZ1G8YuNk5mMRajY7wWKqCb9IBCbQZ5pYx5W
	vqBGNsn3/aYhLSpcoITduitnv50hbuxu9iToZQ79Pkq5rJAqNxJiVh7Lxp05OOy3IkxMjt5MES8
	bM35IDm5vUQKeXfnJwqyVrZZ/sLswQjvBSOug41b1cu4KSCghy0CcjUlTPA/gMYKrLIo3PFaYtd
	9/FzYrFPhHsK7eSkl8Cj7te32oa2BwI2qMegqQN/uTbayXMTA8lwJSiQOi4DR/fOwnEkNab1UM1
	v89B1rNW9IHNTnAh+CDkCcOpJ9V+pL2MEKBr5Ygk07LHww8iXrYTUTBwJCndDR9WVw7IatTRkX6
	HsdMbMwSuAOmlSq9NdEW2RMmc6NOsCO8deabwC8zA/zlynZwsnM7vxtMVCw==
X-Received: by 2002:a05:7022:6296:b0:11b:9386:8265 with SMTP id a92af1059eb24-1278fc7e36bmr6954133c88.42.1772555277497;
        Tue, 03 Mar 2026 08:27:57 -0800 (PST)
X-Received: by 2002:a05:7022:6296:b0:11b:9386:8265 with SMTP id a92af1059eb24-1278fc7e36bmr6954110c88.42.1772555276815;
        Tue, 03 Mar 2026 08:27:56 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32633sm19601264c88.9.2026.03.03.08.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 08:27:56 -0800 (PST)
Message-ID: <79e82568-e951-43f4-ac87-2319245a5490@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 08:27:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260303
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a70c0e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=bNXkL-wRCx4twWDb0eEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 9cEwLidc1c_53z0-1l6-BAj_Ux0eG6PR
X-Proofpoint-GUID: 9cEwLidc1c_53z0-1l6-BAj_Ux0eG6PR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEzMSBTYWx0ZWRfX45jyaak61RBc
 dYDHUT2F7H8Ly2XMOOnwjyMmhWM+/20oM2WMM/Rox22npGoKiX47b3JSIgk7rS4oHiE7FvnRp44
 XgSMJfZFo8c0zY2ZHT7W9+yvlXISmh4pmkAZ/dt58TTKDF0sggtIgRltZUbjDjE95ZR4b0zJ2+p
 09Huwg/ycZHZPg6bFfLajktvct9XyxLFWpR0ANRojopRg8U9GA40IPtRjzyPI/ggm0ie3QRiPm7
 kkmJvP6TPVqoMBWA1RvcOjvVQ5IjNIeXkUblMNM6fpuwVcPykQH9weMWLLdqBo2VUPpHA940eIl
 xNxIsVvfJ0gu4b2e45cHCzHB+xX8wfkocCxL6tFfXNDDKXCjtbcTra1kg3GwQzcJ34CSHAvDiQg
 FCYgfk6pR2Y5qs7K0x1zRNo6/RthEh/LR5GtqF9xMRYCeIa4S2dIWKP03JteIm2J0jv3c+pHmeT
 qFlkRtpmnX1Ely1SreQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_082759_927924_C11A813E 
X-CRM114-Status: GOOD (  10.88  )
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

The following changes since commit 8bf22c33e7a172fbc72464f4cc484d23a6b412ba:

  Merge tag 'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-02-19 10:39:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260303

for you to fetch changes up to cf7cbf97c630c3414302945617b8ac405e2b0dd7:

  wifi: ath12k: Remove the unused argument from the Rx data path (2026-03-02 13:02:05 -0800)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #1)

For ath12k:
Add basic hwmon temperature reporting.
Enable monitor mode on IPQ5332.

Also a few small cleanups and bug fixes across ath drivers.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Enable monitor mode support on IPQ5332

Alejandro Colomar (1):
      wifi: ath9k: Fix typo

Baochen Qiang (1):
      wifi: ath12k: fix indentation in ath12k_qmi_aux_uc_load()

Bjorn Andersson (1):
      wifi: ath11k: Silence remoteproc probe deferral prints

Karthikeyan Periyasamy (1):
      wifi: ath12k: Remove the unused argument from the Rx data path

Maharaja Kennadyrajan (1):
      wifi: ath12k: add basic hwmon temperature reporting

Ramya Gnanasekar (1):
      wifi: ath12k: Set up MLO after SSR

Zilin Guan (1):
      wifi: ath11k: fix memory leaks in beacon template setup

 drivers/net/wireless/ath/ath11k/ahb.c         |  10 +--
 drivers/net/wireless/ath/ath11k/mac.c         |  28 +++---
 drivers/net/wireless/ath/ath12k/Makefile      |   1 +
 drivers/net/wireless/ath/ath12k/core.c        |  23 ++++-
 drivers/net/wireless/ath/ath12k/core.h        |   3 +
 drivers/net/wireless/ath/ath12k/dp_rx.c       |   2 -
 drivers/net/wireless/ath/ath12k/dp_rx.h       |   2 -
 drivers/net/wireless/ath/ath12k/mac.c         |   4 +
 drivers/net/wireless/ath/ath12k/qmi.c         |   2 +-
 drivers/net/wireless/ath/ath12k/thermal.c     | 124 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/thermal.h     |  40 +++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  25 +++---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c         |  57 ++++++------
 drivers/net/wireless/ath/ath9k/ath9k.h        |   2 +-
 15 files changed, 255 insertions(+), 72 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.c
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.h

