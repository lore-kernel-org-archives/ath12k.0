Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE58C2BD09
	for <ath12k@archiver.kernel.org>; Thu, 27 Jun 2024 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVOVBfdqQprsKsyswS3jcsOHHYDMlcUGrezJBVaWUcc=; b=J2OnWa1vZDV8+ZxtL4UN4x1j5y
	ue18+eHoz1dglJ29IDC/1V4BfkfE+8eOCC3dwvec0kTFRhkGTUqnnzNuE2MTF7Id73LcEmmszy/Xs
	LHYaheK66+mtgt317BApcwtWX5Va2vUFlRIjbR+plMZrEdRVl3WO78Re09Ly9wQ8/qzQy6EEQ3Bf5
	0UFl3WL/wzQAtLKdW1IVnQojHukcx8LbbyQ8KZhKePxam+4YNgw41KGrBCbXR30IkZCocXXfQF1Xz
	rFNDSxuslf1k3QhIFbet2a/xPlIcgKSIyI23NEk9BrQgkCpV+Vdz6xB4rpbhQZ+DhBHMGvEUSrRgp
	dEDytJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrL7-0000000AvZi-3paQ
	for ath12k@archiver.kernel.org;
	Thu, 27 Jun 2024 15:47:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrL4-0000000AvYa-1lAH
	for ath12k@lists.infradead.org;
	Thu, 27 Jun 2024 15:47:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RCIjFE018101;
	Thu, 27 Jun 2024 15:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mVOVBfdqQprsKsyswS3jcsOHHYDMlcUGrezJBVaWUcc=; b=ktGRnu049WE5saie
	rzSIurgzc/cMcZeqVKqggw81BrXnJ3QoOiEvH4VG6WHeaJarhuLxL4fvakwSH/83
	tWxKW408lUotCnWV1opq+3f9/LIFSF6AcoFMPh91hZpEapELD22eUQ1UVadxpUd4
	xI9fzWKQfn3C5BxS9dYWeHNHl8/CdGdCvIF6RGwTLBe/gnqJl9kMe6dnTVT6aF7D
	WWedktK83nNOuo+MRaddrxMUnTFIlFN30VHVRLUJ0yz7kxnc/PHAeFmP3J7DgQLT
	/qLf0ehzcaHmC6NVURrapKb6fiP+bX0EqHHpzjdy8LmP2ul20h4NXNlPEM7WON+/
	SCRBeQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppvce8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 15:47:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RFl6qm031416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 15:47:06 GMT
Received: from [10.110.11.227] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Jun
 2024 08:47:06 -0700
Message-ID: <1624b548-334e-4391-a8e9-ff2aa5d81f80@quicinc.com>
Date: Thu, 27 Jun 2024 08:46:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3]wifi: ath12k: Add firmware coredump collection support
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
Content-Language: en-US
From: Sidhanta Sahu <quic_sidhanta@quicinc.com>
In-Reply-To: <20240325183414.4016663-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MJpB4J0aNsjN90Sbrwjgc08ROZ716MmF
X-Proofpoint-ORIG-GUID: MJpB4J0aNsjN90Sbrwjgc08ROZ716MmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_12,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_084710_625499_6FE25AB7 
X-CRM114-Status: GOOD (  16.32  )
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



On 3/25/2024 11:34 AM, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> ---
> v2:
>    - Fixed errors shown by ath12k-check
> v3:
>    - Fixed SPDX comment style for coredump.c file
>      Changed Kconfig description.
> ---
>   drivers/net/wireless/ath/ath12k/Kconfig    |  10 ++
>   drivers/net/wireless/ath/ath12k/Makefile   |   1 +
>   drivers/net/wireless/ath/ath12k/core.c     |   2 +
>   drivers/net/wireless/ath/ath12k/core.h     |   5 +
>   drivers/net/wireless/ath/ath12k/coredump.c |  51 ++++++
>   drivers/net/wireless/ath/ath12k/coredump.h |  80 +++++++++
>   drivers/net/wireless/ath/ath12k/hif.h      |   9 +-
>   drivers/net/wireless/ath/ath12k/hw.c       |   4 +-
>   drivers/net/wireless/ath/ath12k/mhi.c      |   5 +
>   drivers/net/wireless/ath/ath12k/mhi.h      |   4 +-
>   drivers/net/wireless/ath/ath12k/pci.c      | 185 +++++++++++++++++++++
>   11 files changed, 351 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/coredump.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/coredump.h
> 


> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 391b6fb2bd42..f0cc4959faf5 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1121,6 +1121,7 @@ static void ath12k_core_reset(struct work_struct *work)
>   	reinit_completion(&ab->recovery_start);
>   	atomic_set(&ab->recovery_count, 0);
>   
> +	ath12k_coredump_collect(ab);

1. Can we confirm if the operation guarantees that the coredump has been 
successfully uploaded upon its completion? It would be helpful to 
understand the expected behavior of the system in the event of a 
successful or unsuccessful upload.

2. Is it safe to proceed with memory cleanup operations immediately 
after this call? Understanding the dependencies and potential risks 
associated with memory cleanup post-upload would be beneficial for 
maintaining system stability and avoiding potential issues.

>   	ath12k_core_pre_reconfigure_recovery(ab);
>   
>   	reinit_completion(&ab->reconfigure_complete);
> @@ -1220,6 +1221,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>   	INIT_WORK(&ab->restart_work, ath12k_core_restart);
>   	INIT_WORK(&ab->reset_work, ath12k_core_reset);
>   	INIT_WORK(&ab->rfkill_work, ath12k_rfkill_work);
> +	INIT_WORK(&ab->dump_work, ath12k_coredump_upload);
>   
>   	timer_setup(&ab->rx_replenish_retry, ath12k_ce_rx_replenish_retry, 0);
>   	init_completion(&ab->htc_suspend);

