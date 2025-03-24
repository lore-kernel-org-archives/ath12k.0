Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3020FC28B30
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn3OIPbJ2BfGNi6VepCZhcG7LpO0DMthtLBQHQq6hd0=; b=prJo0xULFB9qxy+AJWVlk2+hfl
	I4iwG0oXUekF5C1TJ1/q3n75QInIIjJ0Gxa8o3/zIWaBvcMbfFiU248A0IiCcZqS9lWEMutbFrGmn
	OTyWVrM43JvxJXxDSbYHZKzMsX3/mBK7BUoeJjfuPpR8uqviZkXIU9mBO+1DmTIEHG7v/yGvBuIcN
	CmP8xQWKuCP35SqHWP16pTbHj4g5GlbnKQEgJ5qVakM2azp4qQ7H+ZLwHgAsKR+nNgk9hXHFfG17v
	EtfV/3PG6I9GVlg5wDO7JncfAVNQTcFjspx5iNwZwBItInMIaccZva4XICWau4K7dANRBW/TytqIo
	PtnpKUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twY9D-000000026xd-3uA4
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 03:06:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twY8y-000000026tO-0BOS
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 03:06:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52NNBJWr026443;
	Mon, 24 Mar 2025 03:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yn3OIPbJ2BfGNi6VepCZhcG7LpO0DMthtLBQHQq6hd0=; b=bWcStMq6F/RANJya
	9F0/3VJkCUfu9gMYxBj205yBe5yBW2i2tpIb8T1p4dEqP+shVehnXpLJWqSpoc+O
	mEWOxl0lKrHsoQuIxS7vf8njfueMbES22dthUVnjtDlYmbjOPkSifUcEeHglIWcJ
	KveDtWEz826Y/I7/vZhuiGE/k47DQguF1SSKJatUVYWNqx/MD4yAPGAaVxSMAsuf
	24ODlqguJmVKwHFHBgNJ4oiX9c8+htB1UP/386tdneWqL9Pcfc4psXCzbKy/rX5C
	a1s0luuRiP9qB4kNLJ5/bOUctwqCr10gA3g5yO2jUaHhjv4Dcvo5Xymq80WuzZA0
	IUWHRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyjatw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 03:06:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O36LNQ010366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 03:06:21 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Mar
 2025 20:06:19 -0700
Message-ID: <bc3601ae-5639-4ee4-bbcb-4e39b542bfbe@quicinc.com>
Date: Mon, 24 Mar 2025 11:06:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250321162331.19507-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67e0cc2e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=iWmvWweA6ERdS6TH5IQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: aDGgXnktQTRB6GnI0YhZJFpmDJGqdpJB
X-Proofpoint-ORIG-GUID: aDGgXnktQTRB6GnI0YhZJFpmDJGqdpJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_01,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_200628_113541_BD395691 
X-CRM114-Status: GOOD (  23.80  )
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



On 3/22/2025 12:23 AM, Johan Hovold wrote:
> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> without an iommu (under OS control) similar to what was done for ath11k
> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> DMA").
> 
> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> Elite machines like the Lenovo ThinkPad T14s when running at EL1.

why bounce buffer is used at EL1? is it because IOMMU is not working at EL1?
or even because IOMMU is not present on Elite machines?

> 
> Note that the mask could possibly be extended further but unresolved DMA
> issues with 64 GiB X Elite machines currently prevents that from being
> tested.

could you help elaborate how it could be extended?

> 
> Also note that the driver is limited to 32 bits for coherent
> allocations and that there is no need to check for errors when setting
> masks larger than 32 bits.

why is it not necessary to check error?

> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath12k/mhi.c |  2 +-
>  drivers/net/wireless/ath/ath12k/pci.c | 12 ++++--------
>  drivers/net/wireless/ath/ath12k/pci.h |  1 +
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> index 2f6d14382ed7..9c929c4ad8a8 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -379,7 +379,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>  		mhi_ctrl->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
>  
>  	mhi_ctrl->iova_start = 0;
> -	mhi_ctrl->iova_stop = 0xffffffff;
> +	mhi_ctrl->iova_stop = ab_pci->dma_mask;
>  	mhi_ctrl->sbl_size = SZ_512K;
>  	mhi_ctrl->seg_len = SZ_512K;
>  	mhi_ctrl->fbc_download = true;
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 06cff3849ab8..e77c50fc48ca 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -17,7 +17,7 @@
>  #include "debug.h"
>  
>  #define ATH12K_PCI_BAR_NUM		0
> -#define ATH12K_PCI_DMA_MASK		32
> +#define ATH12K_PCI_DMA_MASK		36
>  
>  #define ATH12K_PCI_IRQ_CE0_OFFSET		3
>  
> @@ -874,13 +874,9 @@ static int ath12k_pci_claim(struct ath12k_pci *ab_pci, struct pci_dev *pdev)
>  		goto disable_device;
>  	}
>  
> -	ret = dma_set_mask_and_coherent(&pdev->dev,
> -					DMA_BIT_MASK(ATH12K_PCI_DMA_MASK));
> -	if (ret) {
> -		ath12k_err(ab, "failed to set pci dma mask to %d: %d\n",
> -			   ATH12K_PCI_DMA_MASK, ret);
> -		goto release_region;
> -	}
> +	ab_pci->dma_mask = DMA_BIT_MASK(ATH12K_PCI_DMA_MASK);
> +	dma_set_mask(&pdev->dev, ab_pci->dma_mask);
> +	dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
>  
>  	pci_set_master(pdev);
>  
> diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
> index 31584a7ad80e..9e89b64b3545 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.h
> +++ b/drivers/net/wireless/ath/ath12k/pci.h
> @@ -116,6 +116,7 @@ struct ath12k_pci {
>  	unsigned long irq_flags;
>  	const struct ath12k_pci_ops *pci_ops;
>  	u32 qmi_instance;
> +	u64 dma_mask;
>  };
>  
>  static inline struct ath12k_pci *ath12k_pci_priv(struct ath12k_base *ab)




