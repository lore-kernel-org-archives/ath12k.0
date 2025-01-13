Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B25CC02181
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP/6jxT+j3pmnNWgCpjYqwaAtqP2fxE+DnE3V/pCOi8=; b=H44dxx/iom5HCW2wNORzn0ra6r
	RjB/acbz4NE90KmgAG2PtdPZrpYed2s8SxMMDMmix9JvkCJHIitzMxh4sFg/iWYLSIyL1yDLWPAm7
	M4tjxuTM41viFEZ+arCQlQM8mq7b7EpBM5UpSd6Ixg1cOp3n5T3xRMN9gobMlxS/VkPUPHYiGSdQL
	Dx0xZ96b7aKh/Rpc24jUUhcGVD4zsCO/L2knvyGJM44o5AbzCqTHqaQX1qczpnWEDwtTBN5OTmA5A
	d9XuzD8bdVbxIAp4hv06dMdEYkXnKCh6s3oOj8Vcyq5BGjkhJa78l9Sh5iQhPxRc09m9O8G9VBVjZ
	UaaMK/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGZu-00000004ZQQ-16vn
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 09:17:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGOv-00000004XZr-2ySA
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 09:06:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D5U1eB011889;
	Mon, 13 Jan 2025 09:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oP/6jxT+j3pmnNWgCpjYqwaAtqP2fxE+DnE3V/pCOi8=; b=W3eG+CxIHDoufzeU
	n06nc87aC7O4PBfUrvqiu4oC9RQLddX5Lp8SrmTQJwy5BKC1rahGG/y3JSDyEHgS
	x14Lmb5kIGrC5FhJRGePRetf5ztJrBNRA6h6/ruN2BpYgAWiCkcGJmlTqD/uw6pH
	jv8wfIUXsl98FYcaSF6fqf/rMEBflJ+UNG0DSZ3Eh+PDJyq6VuazdPbWbDWQ4DHv
	2FgVM+/Q0WG6qhtK1ylNwHLwDR69PSv+SidVHK46gf2oFz+qOXLWifrLsf6VRoLj
	fBuc7qDdBXCOLWfOzXYNh1Z4psP5xLJ8bD744ig6GkGOYlVtbLY3MsWDT68i92dC
	y5qPng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444vqygg0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:06:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D96C6E024813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:06:12 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 01:06:10 -0800
Message-ID: <4dadf825-0b9b-4109-a8a4-9eecc9f1dd5c@quicinc.com>
Date: Mon, 13 Jan 2025 14:36:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] wifi: ath12k: Add new features to ACPI
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250113074810.29729-1-quic_lingbok@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250113074810.29729-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zB1717-E7_2uNFgCCVACuMIGPuACXRYt
X-Proofpoint-GUID: zB1717-E7_2uNFgCCVACuMIGPuACXRYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=890
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_010625_905779_BB3547F5 
X-CRM114-Status: GOOD (  12.27  )
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

On 1/13/25 13:18, Lingbo Kong wrote:
> By reading ACPI tables, implement a method to obtain the ACPI functions
> Bitmap, enable or disable specific features based on ACPI Bitflags and
> download board data files based on ACPI board data filename extensions.
> 
> v4:
> 1.rebase to 0c5fcd9069dd
> 
> v3:
> 1.change some function name.
> 
> v2:
> 1.support functions for cases where CONFIG_ACPI is disabled
> 
> Lingbo Kong (4):
>    wifi: ath12k: Add support for obtaining the buffer type ACPI function
>      bitmap
>    wifi: ath12k: Add Support for enabling or disabling specific features
>      based on ACPI bitflag
>    wifi: ath12k: Adjust the timing to access ACPI table
>    wifi: ath12k: Add support for reading variant from ACPI to download
>      board data file
> 
>   drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
>   drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
>   drivers/net/wireless/ath/ath12k/core.c |   8 +-
>   drivers/net/wireless/ath/ath12k/core.h |   7 +
>   drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
>   drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
>   6 files changed, 217 insertions(+), 48 deletions(-)
> 

* drivers/net/wireless/ath/ath12k/acpi.c: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/acpi.h: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/core.c: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/core.h: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/mac.c: 2025 copyright missing
* drivers/net/wireless/ath/ath12k/qmi.c: 2025 copyright missing

No need to respin just because of this.

> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256


-- 
Aditya

