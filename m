Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93AFC0219C
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+kGIu2+0jELvTgzM8FnuszxLPQWE4otgI+EIZeKUbc=; b=Q2ZjHRyiFG1mpooZYBypgn9TQm
	VYKcRl3Vj3g06pTEMf1mMAm52OzhJChooE8LiPok0A+wnum/lBkuj5o3wkyObdJuwS1oz9jxO6lb3
	xZJgS1kxFXysNLvWlRzybKHpweNtWIMiTF2SB5jpWyjO03yeoiLe7UADkbY6+0qOzDKruYn1SFy8h
	dF4GGvCZePq5Z3mUMpjc0JOKZ9ladd2yXR5Ik4oZ6/ZxCVUjkAM6roZIRXL8iLTAFicptUuvC3Ogu
	wGkF/q2SCpg9N6WHwUfhogn926qENxU8V6I3EeGKR2zI/212HKfzOayBQHNyTUO6Nl0sWiHCXPhVs
	1Woz+rqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSNZ-0000000AX8C-25ko
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:43:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgS3M-0000000ATDo-243x
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:22:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517B2frC003172;
	Fri, 7 Feb 2025 17:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+kGIu2+0jELvTgzM8FnuszxLPQWE4otgI+EIZeKUbc=; b=K2psDz07oKR5loFK
	TftjcpQOoJfntlOBNe78+oFtLIsMF/sStTz6ar0339ZsArcdUYun2gZSNAWJ3cPr
	4a8P6y73bP+Ka6HKs6oqHOdFJITzQsU8fl4+FxRrnKRmvvQtMkgx0Lx5ZwzzSei+
	9wzTGjZygMwVm4wJpD+tSt2QJzMPs9XhaUcGVlGjK2cAQ+kFj///VTviLLYQOLI+
	wqpHavnF1dIhSupWRkHnHOS3KgEu5sJMQSV/ewY2IQ7v6kwAoZmHL7oG+/ApKH5A
	GvzdsdaP8tlCQZsP0CbWUh8LLGV5CBF/ftscXFK2dblaeOyfRXiDhdnIKl/JK6YW
	sHGmQw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ngy10x3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 17:22:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517HM7tE020993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 17:22:07 GMT
Received: from [10.50.26.45] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 09:22:06 -0800
Message-ID: <4b4ea75c-8af2-6021-34a4-ff382a42d413@quicinc.com>
Date: Fri, 7 Feb 2025 22:52:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] wifi: ath12k: Enable REO queue lookup table on
 QCN9274
Content-Language: en-US
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250207164703.3818135-1-quic_nithp@quicinc.com>
From: Nithyanantham Paramasivam <quic_nithp@quicinc.com>
In-Reply-To: <20250207164703.3818135-1-quic_nithp@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6yw3jbf4lMoozL_2aEq2ka1N6kBJ2CBm
X-Proofpoint-GUID: 6yw3jbf4lMoozL_2aEq2ka1N6kBJ2CBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=866
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_092208_549881_8F3EAE8C 
X-CRM114-Status: GOOD (  15.65  )
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

On 2/7/2025 10:17 PM, Nithyanantham Paramasivam wrote:
> Instead of storing the REO queue address inside peer entries, REO
> hardware module prefers them to be stored in SRAM which could be
> directly accessed by REO using peer_ID/TID based Lookup table(LUT)
> mechanism. This feature is expected to improve stability by reduced
> interaction between host and firmware during both MLO and non-MLO
> operations.This feature is enabled only for the QCN9274, so it does
> not impact the WCN7850.
> 
> v9:
> - Rebased to latest TOT
> - refactored the common code to function
> - reolut size variable added
> - moved ab to front
> 
> v8:
> - Addressed baochen comments
> - For this, added changes for paddr/vaddr alignment
> 
> v7:
> - updated copyrights
> - removed memset
> 
> v6:
> - commit subject change patch (1/3)
> - tested latest FW
> 
> v5:
> - Rebased to latest TOT
> - updated the changes for ml peers
> 
> v4:
> - Changed Read Address Name
> - reo lut support check added for qref service flag
> - Instead of [PATCH V4 0/3], had [PATCH V4 0/2]
> 
> v3:
> - Added new patchset(patch-3) to enable the reo lut
> - Edited patch names
> 
> v2:
> - Rebased on ToT
> - Addressed review comments
> 
> Balamurugan S (1):
>    wifi: ath12k: Add support to clear qdesc array in REO cache
> 
> Nithyanantham Paramasivam (1):
>    wifi: ath12k: Enable REO queue lookup table feature on QCN9274
> 
> Sriram R (1):
>    wifi: ath12k: Fix the enabling of REO queue lookup table feature
> 
>   drivers/net/wireless/ath/ath12k/dp.c     | 79 ++++++++++++++++--------
>   drivers/net/wireless/ath/ath12k/dp.h     |  7 ++-
>   drivers/net/wireless/ath/ath12k/dp_rx.c  | 11 +++-
>   drivers/net/wireless/ath/ath12k/hal.h    | 10 ++-
>   drivers/net/wireless/ath/ath12k/hal_rx.c | 19 +++++-
>   drivers/net/wireless/ath/ath12k/hw.c     |  6 +-
>   drivers/net/wireless/ath/ath12k/hw.h     |  5 +-
>   drivers/net/wireless/ath/ath12k/wmi.c    |  8 ++-
>   drivers/net/wireless/ath/ath12k/wmi.h    |  1 +
>   9 files changed, 110 insertions(+), 36 deletions(-)
> 
> 
> base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9

Please ignore this version due to junk version histories added.

