Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A266ECCF9F0
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 03:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BmH3pcPhOTTTOYQXQB1oimv6NytBEUq6qCdsRdB4HKA=; b=tBuNV0eIZD0nFL
	+hVZcevf+pJQB3UHKT5TmlTCiIr4nkQMqsO/3hAA3LwH5PYAF5wHfJ7e4BFs6u96vTP8LbPAFp9B9
	k+xGdO4g3b+hU46IjVOjhFLTubQJw1m/69EaqPKz4tVpuRolC2Sr3m7U6vElGtMSEl+wA4SQvd6Qu
	kJZNd7A8Rde06tHA4khoetbmIGUCr08vghANmH3NuuiZc9GRoKV4gTcyda74uJjg8cW2ftbkXnPv4
	7YApWdiusACwZQTPoMt3vqVCOhEQZKODG30JtVHWUvnqkeTKpDAJ43AGBvoLO7b395zWHQHb86ftx
	PGWazZq7xcgPMX/2altA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUd-00000005Ivd-1euv;
	Fri, 31 Oct 2025 03:07:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUb-00000005Iup-00wp
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 03:07:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UHZwaT3115587
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BmH3pcPhOTTTOYQXQB1oim
	v6NytBEUq6qCdsRdB4HKA=; b=J/zyMo1unph/Wwd2N6m7bRTl6951Q1rt+ZT7Jf
	bPe9dA3bA1DmPLC283aYNcbjD8x5TbWTpMJuxsPuAJlLUbiGxu96/jwJVXpgQmQg
	opCHG7sErTbtF+3Azws5fgBrFbIn339VlyYn4xhHDnbNyfbj1Shx/ImmZmBh40hp
	ElhN/SPkRybBYkuWSGqgoZauH4xbIhhvQYEBs72VEp8G1Z8VgjZ0wdOxb4P5JujY
	52wtrETefORmBzuQOZ9Tja5nWwNt8aUQeebPrAmX10zVzImdIuMFq6xjSD9ukAF/
	CrCqCneIJccznH7IxkCaW2r+d+PGYTgM+0WcmtIU9G3/q1RQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b42qb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso1743824b3a.2
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 20:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761880074; x=1762484874; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmH3pcPhOTTTOYQXQB1oimv6NytBEUq6qCdsRdB4HKA=;
        b=IksUm3aaZN8M8YiofUa88D3djXDmWvrh/eQFrl37ZRX7V4KpHwAeXd3q6EcoRvogXl
         C61Zh0M8MJmdCMV1l2SBae1xrHPZ5LkO0mmxFBOw5N/9Pk2uCrBMCxHqg575CSfLVIEZ
         x9sEa/Y2OoBVf7Vf+2d1KxmfIkk4ArxEe18oA/nVMeGqh2fqH3vHhwgImP5bgL49WkWw
         UDFb9cChp6ylggbTsGC+2bd6UA8ShVYOu44xFkRaPdslwQTeUiXsZVu+3r2uzPAijJbp
         QsH/D1LNYu2jMxIVYXhAFC0qW8F41hXJK/njTStqrJyT96dLMR+so7i116A0ojZ3Gphb
         BiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761880074; x=1762484874;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmH3pcPhOTTTOYQXQB1oimv6NytBEUq6qCdsRdB4HKA=;
        b=k4YGitkGksHSHRom8zi6PJZBBEZMoAYmN8XqUEMhHhJgV/ROPRW870s6IouT2CCT27
         Grl9iXauVp4mriAjNUhENTwXD7DB134h1THk3TKzFLBJMyccGlKSB2PiQajvnuv6Y5Cc
         7wOwzAho4PEZhhJ1DnFN5IiHHsWZ70dBnttnwDYHjtHsJh8TU1haHBeK2zBkGFyW3D+f
         TBkaTkUiCRS/aouV2iBFwrSCq/bKSwX6RItaWZkJWx1MIRJo6iPOSZ3f6IC6snjB8ssp
         3m8TP3CENbhwAOISgJtluiWwIbecoc949JrvrKbPKnH4M1pQv69Cqmns32AMsrjsy/i7
         V5AQ==
X-Gm-Message-State: AOJu0YzU1RrgAUnKswn0FNnQosnV2kQ9P3N+PwUFsE5CD4fGgvncgTSj
	IdN3IYeU01S6AiceLSSIpGyzZyy9B+KhdMikMAqzOfK9EUyLyHHo+h+AUr8X3PYevIoHUU3DevW
	vg+Hw2ViZg04zimOYLfE+SqHzsmxZoEaEqE6zHgRT1sjrrALtXnSQbqUdgQOzUTWu
X-Gm-Gg: ASbGnctL5Hur54KkOWADkp3DVBZE26VASi/h4klO+0aONv5vk37l+iK/78AXtZg2IEI
	2WHoqdyYPlM2VjzzE++ZtNlRzlNu1Xlk7hatYWz2pKJ4sUr2RplSDwmpLgi880mWIqgeBplaLvH
	6vaBdNATbc5gjxmkCudur1yPaLLtrGggYHd1Lmyy5McaN6RAXgqRrWODwEFuz1tjL3AsdPaP1oS
	slicRV8EUVnJ9xXQVMBzuEjdfRomcz1ybdMutx9zgxkbuBeevt2ghkRGZz60QSQBgA9i0zPKorE
	GX1YITwN10tr1/7Jgk0sm4AF2rMfAyQWWbhz4YcBPmQaA+dzDqUD0m9u31LYO3HoH2VoB2FFF6D
	C19amDv2wjZiy9WxRMgI11xImdZMdZmVL7TJP13PKMWwRTecQnRllo/jR77BUI2nRDWoY5hcJHA
	7s5FX+O3NXEkn3WSILPZv3w6fe49NsdVo=
X-Received: by 2002:a05:6a00:17a8:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a77737e223mr2284016b3a.11.1761880074070;
        Thu, 30 Oct 2025 20:07:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWPTnPWh4mvc6Vms1nEPRjN5fCn5IDjmyLcVDgLCd1AVmOMfCBwxjB8u0zA4cxnZWTwkrPWA==
X-Received: by 2002:a05:6a00:17a8:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-7a77737e223mr2283972b3a.11.1761880073515;
        Thu, 30 Oct 2025 20:07:53 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db0a2663sm372130b3a.48.2025.10.30.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:07:52 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Address issues during beacon
 stats retrieval
Date: Fri, 31 Oct 2025 08:37:44 +0530
Message-Id: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAoBGkC/22NywqDMBREf0XuupEYH5Gu+h9FSozXeqEmNUmDR
 fLvDa67GTgMc+YAj47Qw7U4wGEkT9ZkqC4F6EWZJzKaMoPgoq24kGxEpa15+KCCZ63qG121TS1
 xgjx5O5xpP3V3UGFhBvcAQ24W8sG67/kT5dn/V0bJOJt6HMVcd2PH69sWqNw+6qXtupY5YEgp/
 QBjXbnKuQAAAA==
X-Change-ID: 20251027-beacon_stats-5a84c15437ed
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfXykRTvdhHS9pO
 SEt4AeJjhbEiiTHbmLq73CpywkEuYtf+62icMR86wTdItf+9x5ItYG5vEaNfuBrGFOE8El8k4d4
 ReTupH9ZFwdKr4aUkyEc98aU8CrHRAtiLR03F+fywk2KX+xVVSIdQdTBFcTys7qe+0+PmR8RPGx
 RAaVpxyXECE9UpBIWa8SrGUCwGpDk52jYBXPdvHsoXZz/nKn/RfidpnrRs36Ag5XIG/rP9B2mTs
 O8ls8QG1wGWoglG8Ch9Wf5rrrjmTNn9LspaeuhFtMa1hVHMhM/W3CruqG06r1zMW737MSyZe/VO
 v7ykVvJ6/DbJVDqOGWwFoMZHg6ObCxczLkEbKtG6FmNUWgV2e2Tq2Hdrx4O26HIaKXy24Ax9006
 80fB9RkOFlKo4lMAivrn4cqNarS7jg==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=6904280b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oz2bAxMnwZ808XUxOPQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: d_EtAwORdvQty4nUteKI9jK6n46YbXvt
X-Proofpoint-GUID: d_EtAwORdvQty4nUteKI9jK6n46YbXvt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_200757_813219_14BB85BD 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Currently, retrieving beacon stats is getting failed with timed out error
when multiple BSSes are enabled. This patch series tries to address the
mentioned issue by the following,

#1: Reset the firmware stats only after retrieving the complete stats
 #2: Remove the wait timeout to get stats for all enabled BSSes during
 beacon stats retrieval.

---
Manish Dharanenthiran (2):
      wifi: ath12k: Make firmware stats reset caller-driven
      wifi: ath12k: Fix timeout error during beacon stats retrieval

 drivers/net/wireless/ath/ath12k/core.c    |  2 --
 drivers/net/wireless/ath/ath12k/core.h    |  1 -
 drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
 drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
 5 files changed, 14 insertions(+), 25 deletions(-)
---
base-commit: 197498315de711140bcc4722fdeb7c1761777100
change-id: 20251027-beacon_stats-5a84c15437ed


