Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B017C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 03:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEy1aj9e7j1XBrCy4RSYID7t92LIQPNNk/yjIcPRvzI=; b=LBVzG14Wi0LU4hhwiThJENpdmN
	KjW+DBylPwG28ZvxTapn74jVhZBUZYjiGKXL2Hm6W6cYj+WhS/WsYV8LEnhQ6guXZKlGWbOQVaZXj
	dcpLzQuSXbCUe9MllC5MlqOXNGJBwpHrB96sfw34+sWTeNvW4E0yklnnvUSaFZFiD5v+xc1XstIJu
	v4k2scM2VHg1SBmoNNtiZGya1n4stLRQs0q+70PyZrOhoQYtG+Yi/TTfg5DbG9nxJNW4Cv0FPI5gy
	Bio+8o7RBlH1ne4OpkeNAW8tjQaWNGVfmkh3X9asK778dpya/r4hsKx0Lx4Gs5nifv8gvHDMq2was
	MWZNK8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykNH-0000000BrDB-0WrF
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 03:29:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykND-0000000BrCC-3wqC
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 03:29:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M3FPLS010241;
	Mon, 22 Apr 2024 03:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qEy1aj9e7j1XBrCy4RSYID7t92LIQPNNk/yjIcPRvzI=; b=F/
	9bb0UAKdsaGPYwB6aE4w4Bk/0+VusfRvcBOae4I1AjQE97fasS9Mxgy1OjYsriIZ
	m4vfikVRm75OTwu6CHUGekgA3p76Ol+aRGhKS+NIzh0B6evFRVU/Q6z1hz95RFb4
	oigZcyeMrfJRb7ejTBFKy5ozTnqbwhGqfQJL7F4w6Ng7cK4LSHU5oRoCPhwu9qeP
	s0jG3r9RmFa6q+H5WAzCRVJzO+LifTCFG1DZxtCdPgnPMxUxjXwum9J4IuGzon1b
	H+xpnb3j0y8IOf+wWFf2CUayLylsKL0TprEpK9HUQmZSUossWnSEVoE4VrwoVj9v
	SSWkOrf+9rN6dbG0cTkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnet783p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 03:29:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43M3TQEw016606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 03:29:26 GMT
Received: from [10.253.79.89] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Apr
 2024 20:29:25 -0700
Message-ID: <3040df8d-bb39-4540-b84b-9d049487f494@quicinc.com>
Date: Mon, 22 Apr 2024 11:29:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] wifi: ath12k: ACPI support
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240422030545.954-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <20240422030545.954-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jmyYoVFr6OZrYgJiizswlqm1W4GguPJg
X-Proofpoint-ORIG-GUID: jmyYoVFr6OZrYgJiizswlqm1W4GguPJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-21_22,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=642 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_202944_023514_27A46894 
X-CRM114-Status: GOOD (  15.43  )
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

On 2024/4/22 11:05, Lingbo Kong wrote:
> v9:
> 
> * update the Copyright of acpi.h and acpi.c
> 
> v8:
> 
> * rebase to ath-202404181528
> * rewrite commit messages
> * cleanup and improvements all over to match the ath12k style, including
>    error handling, naming and so on
> * locate new place to call ath12k_acpi_[start|stop]()
> * move wmi functions up in wmi.c file
> * consolidate WMI functions using WMI_PDEV_SET_BIOS_INTERFACE_CMDID into ath12k_wmi_set_bios_cmd()
> * ath12k_acpi_stop(): don't call acpi_remove_notify_handler() if we never installed the handler
> 
> v7: https://patchwork.kernel.org/project/linux-wireless/cover/20231013114434.81648-1-quic_lingbok@quicinc.com/
> 
> * adjust the length of line
> * add cpu_to_le32()
> 
> v6:
> 
> * remove code that is not called
> 
> v5:
> 
> * rebase to the latest tag
> 
> v4:
> 
> * revise commit log using imperative voice
> * delete guid_is_null()
> 
> v3:
> 
> * remove unnecessary cpu_to_le32()
> * adjust the order of the macros
> * apply jeff's advice
> 
> v2:
> 
> * put <linux/acpi.h> in the include guard
> 
> Lingbo Kong (4):
>    wifi: ath12k: ACPI TAS support
>    wifi: ath12k: ACPI SAR support
>    wifi: ath12k: ACPI CCA threshold support
>    wifi: ath12k: ACPI band edge channel power support
> 
>   drivers/net/wireless/ath/ath12k/Makefile |   1 +
>   drivers/net/wireless/ath/ath12k/acpi.c   | 394 +++++++++++++++++++++++
>   drivers/net/wireless/ath/ath12k/acpi.h   |  76 +++++
>   drivers/net/wireless/ath/ath12k/core.c   |   7 +
>   drivers/net/wireless/ath/ath12k/core.h   |  18 ++
>   drivers/net/wireless/ath/ath12k/hw.c     |  10 +
>   drivers/net/wireless/ath/ath12k/hw.h     |   3 +
>   drivers/net/wireless/ath/ath12k/wmi.c    | 143 ++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h    |  41 +++
>   9 files changed, 693 insertions(+)
>   create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h
> 
> 
> base-commit: c416602943dd36fbd13af7496430723935c867a3

please omit this patchset, forget to add commit message of cover-letter,
i'll add it in next version.

