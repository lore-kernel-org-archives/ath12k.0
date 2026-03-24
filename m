Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21F7F54AC4
	for <ath12k@archiver.kernel.org>; Tue, 24 Mar 2026 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=; b=tutWeK3U7Fy5HO7BEaha+foe6J
	pW8P9GyQAQiiKK2eZkwqjh55Y8bbIRfFtNXA5Vy69Qo5nic4B8JjDb3CscnKfbkJYK8WDYoRzItwS
	6Y4RB87yWfGKla3Gy/X8KOTntwcMusjOZLuqSRFA92ijS1EWI6G5q6Xk5/CgqnMBUR127PjW/nYBz
	XmpeVNqlN50SBTl2+lFhOHHthaQyjWaYWqHUiBeprX6k6IVLCXW7s7tYYNHlOEp0hTOxI0RN2YH+e
	U4BWlLjjsgF0O0IkIlamceRSSBTFhGw9BjWv5ZtX5Dw6ffQSjREa8fqvAnu+iRSUjNm6vQgGVwTy2
	xqXDn1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52iA-00000001dfE-1sJx;
	Tue, 24 Mar 2026 14:26:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52i8-00000001ddP-0RUn
	for ath12k@lists.infradead.org;
	Tue, 24 Mar 2026 14:26:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wSKe3039644
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 14:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zFfpdhBbsrdk8VoedMBkIm
	KgB4/G1LamNSITgtRYBVw=; b=lx+RkNfO9S5pfauFJwNbAf+vhR3/y4Y/rrvv8s
	UuwGfafxjzIYcFIE2tc+aItnHxIiFaAXatokxH9slC/4xMZoEaaO3rJIEz45Hg5R
	Z5x1irMyRou/cWGXvpwfivl54NgM8qBN6HsNgViOV5h+WHCdAJOo/jgJgF5ymKCq
	Z0tlr5WrIySWH5Wi0weFQnBKfTZHcp/WO5HGHb+6LC3OUciZyD2YO+rRVhcQivoA
	7cOr6/KxwsY8eLPfCcEnaAsyP9V4w+AsAmwcTjOUXkrdpKfD8AY0dX7xjldITi6P
	3dsb6lwg4mN9uFg9qhRmhuVgVdkSuW92SYv8TjsO/GwPbwfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0h02r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 14:26:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso1174651eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774362382; x=1774967182; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=;
        b=DUtlk1bN3+gt2DLr/uPFE79nLH5RaP1CRiZvebYsj/OgH0VVmpLWXivbnT0AGXrSN6
         f2Nn3a/qqhkjI38Rsn482+ffoxzYRnBnXXQErJzGYByNyqZWxlbpCPK0Wz8QhyTx1MoB
         aNZhVAceEouOptiB6URtMI47O9Su4r3zhyZPdPuGXkmb3Ju6eDVLQKA4+5cXv8MbdvJB
         XR1TnURAnYQ8j2sGaRUSRbXnlOlpJlueXR9XNEwkshsNYlH2zVrT1nxzrG+js7rivfX1
         2cbZ1r369z2K+4hcHSxYI7kur3dCjDCfjANzIOQoLSx1fg2OfWla2dNzUBK1kwKWvXFn
         uckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362382; x=1774967182;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFfpdhBbsrdk8VoedMBkImKgB4/G1LamNSITgtRYBVw=;
        b=SGXoWOvNVjNnsSom0gh7YPRPDG8gf9WopXXvb2p35L0k7nN5tPZON7YKrHGSbApfrH
         x7uZ0Sj5GfAUI6StYkhjHOmKz89odbDePbcvk/wC17BIrvjB06uiti7mMkowj0gT2ZAp
         snh6n1Pc0NaRA5xanhPu/AdbX31zSHbZtQ8DJJbwK5awUV+Vj/yjJOCpJ0Csq8Vi2Ffl
         exeMd7x/XqJSvW8fzcU9vtU2YmKUnBRIOnlhhaS2zsxRW/9YsZh7lfECSxwghI1mF23y
         3eKszfh5hIG2WH0Yh3cM/kikgJXcvM/ZnQu4fiw4HYCzsM01EZ8cRpwqoxy/xxqQfrDS
         QNfg==
X-Forwarded-Encrypted: i=1; AJvYcCVDiEWnJH87ukd73wHhylH4lPp93hDK2gzP3M3Fbc40XuVVba5ISuiPhrUkchoAwXuDwFOhlv0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGKqjfb8Dd+sal0RPWpfN7vBqHPVMsjneWhmTL9QNOkBlmJx54
	bB70plktD0cX6ctLe1NA/kfpIsf6/wXK64KuoQ/BNKIVmCkOyRz3lSK9O4nrAi4u2daTf5ELiBI
	u1GnvySMsevrI3BiG5lyOcWi5z8Ng4hGcmkFt8mMNy/0U4BbT+QVCYFyzZhUQAl5C
X-Gm-Gg: ATEYQzz1ciKSgH1lsUw6litT11kbhxwjKc6E+npxW5+SS15CvkLbmkRFtquvoLYZ4ml
	qQHQ8zb1XoidkLr5fuqqcXxkLNLYeYrgDAyH+tWHmQmlvNwMNDmNNJH7e5vbu1ZUSWfDDgAXD5u
	GyEVgQJND8v68UranuVVWKe3g/4PHeDUsQYvpXbuDSdicLj+1M/kJ93qjUjQEIpyLwuDsjG/VUv
	Qg1aTeHvcnyFuSDseltPsQgPMnG2CYAJ39bzQBz3N60AMDuC9jgUNmRt1jhnbz2YZ1zANF9WnYh
	HbTWtMVge7FDlLXecbJnE8G2Ak/JlaCotRJZR6twbsdFMDYq8NjIvJcEHqSIb61sP4DzQKhUV55
	mG2Z2vOy4NntjuuR1p1ifTZesu5YoJiSyn/Ytj9iEEeK+bmuyyVDKcL6TXw==
X-Received: by 2002:a05:7300:d706:b0:2c0:c5e4:6057 with SMTP id 5a478bee46e88-2c109711608mr7572336eec.19.1774362381741;
        Tue, 24 Mar 2026 07:26:21 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2c0:c5e4:6057 with SMTP id 5a478bee46e88-2c109711608mr7572309eec.19.1774362381155;
        Tue, 24 Mar 2026 07:26:21 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm15307555eec.6.2026.03.24.07.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:26:20 -0700 (PDT)
Message-ID: <652ea26a-dcac-4491-b3d1-8344b2969750@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 07:26:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260324
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExNCBTYWx0ZWRfX2n1deufiaHx1
 XmHUK+TcGJHX8ucNG9bWx0m3ueVCJOntRE8ZhOHZt4D2f+oqfhfqdGViTgmSHNMiZM5whMO43EN
 jWiAvaA+ZEOwzp81C2Eg1pArIwNPu/2bvSYfv924cPr2FfvoRDHig/AL+yeCb9ksuRvfPH4URw2
 peowpP2j7+unqR4B/QtYqKywSGpenhps8xrNFK40n4EdHMsKEzqAAcH92fbHTVeKAxQuD2OIUUm
 9ggneau2jTuKp6iu/LNOC12VwNkjKULHOIkjfcRzvKmRfuWuaeQRxTciEHbwENDKtTBhwklo+hW
 IXQMnkH/KssMVnwjBBni2tg0MMUmcPjUyk/k8QPXFgupa0Czr51vKnh95igDG0/t2WFzJR5UXZ2
 HQJ8EaU3b9L08wvFqIOi0gDnsjufTMTi09dyLJlRdH0HKIUlpfq0ZqTRIL4aSxJbhewh23wOLYu
 LIMLt7S6efl2p8CkAGA==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c29f0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=9AVruJRcYE4s2g_FswIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 9BMHhogNT6l58fp65neNVe2dnayqYbeq
X-Proofpoint-GUID: 9BMHhogNT6l58fp65neNVe2dnayqYbeq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_072624_257743_474E1AC2 
X-CRM114-Status: GOOD (  10.73  )
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

The following changes since commit 44d93cf1abb6a85d65c3b4b027c82d44263de6a5:

  wifi: UHR: define DPS/DBE/P-EDCA elements and fix size parsing (2026-03-04 11:50:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260324

for you to fetch changes up to 7bbb578fc43e7dcb8690cfc98844bd67bc311e8a:

  wifi: ath12k: Remove unused DFS Unit Test definitions (2026-03-16 08:34:23 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #2)

A few small cleanups and bug fixes across ath drivers.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Use .mbn firmware for AHB devices

Gustavo A. R. Silva (1):
      wifi: ath6kl: wmi: Avoid -Wflex-array-member-not-at-end warning

Jeff Johnson (2):
      wifi: ath12k: Clean up the WMI Unit Test command interface
      wifi: ath12k: Remove unused DFS Unit Test definitions

Johan Hovold (5):
      wifi: ath6kl: drop redundant device reference
      wifi: ath6kl: rename disconnect callback
      wifi: ath9k: drop redundant device reference
      wifi: ath10k: drop redundant device reference
      wifi: ath10k: rename disconnect callback

Manish Dharanenthiran (1):
      wifi: ath12k: Fix the assignment of logical link index

P Praneesh (1):
      wifi: ath12k: Fix legacy rate mapping for monitor mode capture

Sarika Sharma (1):
      wifi: ath12k: account TX stats only when ACK/BA status is present

 drivers/net/wireless/ath/ath10k/usb.c          |  8 +--
 drivers/net/wireless/ath/ath12k/ahb.h          |  4 +-
 drivers/net/wireless/ath/ath12k/core.h         |  2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.c       | 24 ++++----
 drivers/net/wireless/ath/ath12k/hal.h          | 31 +++++++----
 drivers/net/wireless/ath/ath12k/mac.c          | 67 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 76 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c          | 58 +++++++++-----------
 drivers/net/wireless/ath/ath12k/wmi.h          | 14 +++--
 drivers/net/wireless/ath/ath6kl/usb.c          | 16 ++----
 drivers/net/wireless/ath/ath6kl/wmi.h          | 11 ----
 drivers/net/wireless/ath/ath9k/hif_usb.c       |  4 --
 12 files changed, 180 insertions(+), 135 deletions(-)

