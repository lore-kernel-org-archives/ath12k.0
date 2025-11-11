Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8812FCD1297
	for <ath12k@archiver.kernel.org>; Tue, 11 Nov 2025 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=; b=B5WRXuCYUmKvKwrfe30OPfMdf9
	PuhvEB2Dlg5RZnb2tVqXodhwu1h357RkarfnNVOd0uvx656YzmFNgzkxUb2VtEUULKr6SBh0SvP62
	JVSQAhGvTQCJP0A+kLpVP8/gc2/Z3LepTFJHm9WU6jj6cP+JqvoZRti/JtySYJoUmEtg6T4IbqTRl
	zYvW/AAW/CAvmyqeTokxBXCUEZObk8iljbTqLrgBGzU05hgJxqH0hyXlrN/647+W7aU5olPhrg0XO
	KPI4ioxIMdLkp65zs70LuPlhaXdxW4PrxuSE3lG8htQki1O/osL6o836SMu24Jo92gnXDFX4Sfl1n
	CvjhtbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAF-00000007X2x-0xYJ;
	Tue, 11 Nov 2025 17:28:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAC-00000007X1d-0arJ
	for ath12k@lists.infradead.org;
	Tue, 11 Nov 2025 17:28:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGIPX2117330
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1yTPDHSc2XG60aIrPablLQ
	3QyMPBQoJr8FY38lTVHzE=; b=XbaScViBdNyZlvJaRxBTh1MRQ0m11aaITfv+7j
	JNqOsNxBJdpg7A1YVGJA8sWWsLKnnxVLnytsRzfgGP4PTxTLQIn+SutyD/8jueju
	fMTUQyGf5FDGN8e3MC6GgFVVotukYEDuG/Zuztu8IB31nKmRu85Bbat6C3Ch7qDA
	bMCWfeJ6Aqxyb2YieHsKOYT2eVSGF2WeV5NJECQdHZ7ez94T6c6tZHEucaT3Mzs4
	OU0dLnUHLnUb2U/4WlNEdYm4IxcdY8XXyRDbeHNwFOI3o9gPhW65JrLU3Oka8Mnt
	N6ZdOpW5zQC0th7teoBD57uURh/aXsZT1bS6Oz+ceULJ14GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8k9e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3437f0760daso7817020a91.1
        for <ath12k@lists.infradead.org>; Tue, 11 Nov 2025 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762882095; x=1763486895; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=atyEeZU11A7VgvFh94+jvQK7EQLCfjzakbI6vZsE8hbwhgskfoRK7u435+x8NbM3Ft
         tCU/aq7+121psB9pHFEZr6vXW3elhvGXAAFCyxvwe3CqwJsQyHIX3QtVfK+VgbcyroE1
         TWEPH8MHAzfRtioQ3zs3c76j9NSXXKvoPRUHUnST5RrmahIT582rT3AfknmV9E89VGbU
         KmZzaHRsMDS9mQvogtmCk9ID6X0cEnx00BL1lmc+hmGCAQZca8wsqbotC+G053IpD0/3
         JP4EvrVgublo0ewQrWCAkRofOI1vpgDzKQ8E5kkwM2bJHt7fU7fe4oN9Qx/OBuHQgVKi
         l2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882095; x=1763486895;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=e5gKI5IwbtwFlWXHxhjksCLgpMVWhL+U1oFl1DHnnR2FPpjWiRYRvPtd/ObQL/IQeK
         In84CDaMM6XpFPaixQ9uHz+FLSNvPjYgooM9A/ZVj4ujNqXjTWhfCxmUV/3TNft9fwok
         OKbiUkAMqIcA2VGbhPi0+30ehqF72Rw1MMl8XJ7WJZy4oWH8i8AmSdeI31hyIxbZmv5Z
         Cit/veJpUtUpIGxOCjed1LunGwW8qpj6bulqtXiPn7MUB4PJc+7aQGL/YX0+qYunsvwb
         LgZqRb0Y52stI25MrDAwiMNc93dZ8BnoCz9oQk0FC8iFLE2KCOmBPrJTI4CoY1VxzjSq
         aXDw==
X-Forwarded-Encrypted: i=1; AJvYcCVsNLJw95RKgifZDNs0qF9Nj2p5gtYN0d7cTKdN1pYgFFnCrvFoxtIc3ePYNp7lnOvkmOZodE4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVmDSWx6IAaum/lyRDMmlRKLQJZrsTFWQ/0uJBhJomB4J3o3fy
	nyZQPTHXqS1UZ4xBgDq017yTiU6TpDurxZLNNvpJrpxV/W11+ZgjK1WZ6J3phUbaIo8+Ec87xYj
	40RZa93P9cdk89e+pHHO4Q572FV7B8APL+/lc0Gw0y+VKoO0+8viYLCRg8WW34QPZ
X-Gm-Gg: ASbGncvVVTo+wFLp+97il02vAC5mWO+fITg4CnWJznsm4+rMvXD8ogUM9ELH2QqjzTy
	QTJZGbyHbtRkaBnEIVB52MF7ac4VergjN6SEINSqbCf57XoHG+6uU/u3Uc1qevQxdG4okoEWU/N
	Shhc4/a4+T2nXqJud3HIdeFHcGskNvP8JErPWzNDkA/CRxZ3q/IrDAAakf5ZXIllT8KQX267UB7
	qzvxCQbmChCIoGttKrBlNsKZO2dLOgwOJknQzDk/fA0h9bLSwU9dsVcsAcmvsh8190Xbi037G0T
	l1sjVq7j9Quxz3KzFQ9Ke6ltLIOtI8DDLZxzBLtmS0PR+O0rs8aYNg8ZUCUQv66X9FGWBIdU7EW
	5AqCITRRxBW7/B2wk5lIbjvB4QiiysASITm8=
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119192a91.19.1762882095006;
        Tue, 11 Nov 2025 09:28:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbddsu6FdKyudkS0lKZNwLRY1hL64MQLZC+zahT2rFZHB4c/OuxDy9ljnq3D8WemPe/3hrNQ==
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119160a91.19.1762882094449;
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff8538sm15987444b3a.28.2025.11.11.09.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Message-ID: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 09:28:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20251111
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m-nuAHnunsKW3L7-TovPI-nNzmSzvwc9
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=6913722f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Z3JRDe02xMfDgAAcrXgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE0MiBTYWx0ZWRfX9oHzuXdFsxA3
 cx/tIbG5o9saUKBUiOg70dKqYk/repS7dXh/YJEIlHXinueLSFlByVPEj1vanQZrBXZ0qdkfu6M
 qLwW7fK/9yQnc8A5CPH1tvpk2hhc5YgktoXKEqpvrVkDS5NrCxJ9SWwV4GDJ6ju6eOCSgk5HiYN
 FljwDCYBY5fxj0MBdGUmJF5zOyyNR6kBmLHoCmU8r5eaYBZ3icixOc87FisDJD5tZiS7dxfGyMr
 7vDqwQC+cc6cA+YVjjf39+Fd9/jw2oRozXthmRgGZQOJXZRVlFBTlzxtzvB5QSWLwQGlXog5Q7K
 /KTsaqiKMnkEv88N3+VCs+TF2LrgTwdd6m5qfhhMe0MkWUKjtGxldGmExFVIwELrZYpFCCxP/lM
 kyt46y3RW5XNwAavgVQxwWjpbQGVQg==
X-Proofpoint-GUID: m-nuAHnunsKW3L7-TovPI-nNzmSzvwc9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_092816_211768_61C0B452 
X-CRM114-Status: UNSURE (   8.50  )
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

The following changes since commit 2f6adeaf92c4ea4adf5a91b87497ba13bb057996:

  Merge tag 'ath-next-20251103' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath into wireless-next (2025-11-05 16:29:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20251111

for you to fetch changes up to 2977567b244f056d86658160659f06cd6c78ba3d:

  wifi: ath12k: Fix timeout error during beacon stats retrieval (2025-11-06 07:33:31 -0800)

----------------------------------------------------------------
ath.git patches for v6.19 (#2)

Just one 2-patch series for this PR.

Once pulled into wireless-next, ath-next will fast-forward, and that
will provide the baseline for merging ath12k-ng into ath-next.

----------------------------------------------------------------
Manish Dharanenthiran (2):
      wifi: ath12k: Make firmware stats reset caller-driven
      wifi: ath12k: Fix timeout error during beacon stats retrieval

 drivers/net/wireless/ath/ath12k/core.c    |  2 --
 drivers/net/wireless/ath/ath12k/core.h    |  1 -
 drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
 drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
 5 files changed, 14 insertions(+), 25 deletions(-)

