Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29FC6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 05:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCqw94PUCilSkY2aF3k829SjMa0M4FjWQZSFehlYC+E=; b=gzr5LSKJRTxwo+
	gj6Py0n87xrkw9vGhm8q9eTv0AcRLDvaEGI2UkZ2n+CDTLfnwa28EUeLwWTTlArtmtCa0JHypgErl
	EvsiIUsvSlgxzL+oW5LfXyfrFmd20dMGyEMKeA5pUgKP8D38Zjf2F2oBFIAmT+hF5q++18puFmK7Y
	p1qOtNQqyP2v1zyMrergkc0Ilv3f2oYNMHKjOj05OJJc2EPZto0DKBvIZGehpN5cGEebTjf19AWZR
	PTeTcVmnnNmeXWaGZ6YB8PKE8pb6tdrtsQfIM5fD0a0xPUSbIF4PJjHUg7v2c9jl2XpedYFNNr2jC
	M6pzdfjTBU1aHPELgVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbEAK-00CsVl-03
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 05:54:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbEAC-00CsUV-1T
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 05:54:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U5DKZa004167;
	Wed, 30 Aug 2023 05:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Tr2kQL3A0sK5eKz2dvL/1IHT5LYq1UvdjCs6ssqj0kg=;
 b=gKMI3zyZibMYydxc/V45A25bXxKV4MrZF/KcL3ueQQppXjhuEWRBYfR5USPUzF48FDkU
 G1CmK8Bq+inftSRTuPXhaOXaXzqdoXs0puJfQgSmtDawYKlQpUEfGAwFsuFDCgCAyHDL
 W7lvMyCl6yh7cr+2CZDrJi78Ezm5n3LKvb59Tfn9a6OgNlAVagxOjW+nr/Io2h/dxfZ8
 O6ibXboc/VMdv2HJtLMNAdm0YWyO+rndrc59YaTRr+8oxkyu55eqqZ8uJ7kmWXceUGs0
 bFyXGBHeN7pjWrPqAWwLPI2Efn1obcdqTWsxv/A0RUlBUYMVF9bRI1CxkvO0fku6vJ+w 5A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ssv008e62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 05:54:47 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37U5ZHH9017472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 05:35:17 GMT
Received: from [10.111.178.80] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 22:35:17 -0700
Message-ID: <55a839a3-bfbd-43fc-b968-70d2a5bdee44@quicinc.com>
Date: Tue, 29 Aug 2023 22:35:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix DMA unmap warning on NULL DMA address
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230830021131.5610-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230830021131.5610-1-quic_bqiang@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J2hzwA-ng9Z0Ewv1G_aqq8gGrHNSASBS
X-Proofpoint-GUID: J2hzwA-ng9Z0Ewv1G_aqq8gGrHNSASBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxlogscore=845 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_225448_498425_0AC205E1 
X-CRM114-Status: GOOD (  16.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/29/2023 7:11 PM, Baochen Qiang wrote:
> In ath12k_dp_tx(), if we reach fail_dma_unmap due to some errors,
> current code does DMA unmap unconditionally on skb_cb->paddr_ext_desc.
> However, skb_cb->paddr_ext_desc may be NULL and thus we get below
> warning:
> 
> kernel: [ 8887.076212] WARNING: CPU: 3 PID: 0 at drivers/iommu/dma-iommu.c:1077 iommu_dma_unmap_page+0x79/0x90
> 
> Fix it by checking skb_cb->paddr_ext_desc before unmap it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/dp_tx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
> index 8874c815d7fa..c0ae2fd443cc 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
> @@ -330,8 +330,10 @@ int ath12k_dp_tx(struct ath12k *ar, struct ath12k_vif *arvif,
>   
>   fail_unmap_dma:
>   	dma_unmap_single(ab->dev, ti.paddr, ti.data_len, DMA_TO_DEVICE);
> -	dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
> -			 sizeof(struct hal_tx_msdu_ext_desc), DMA_TO_DEVICE);
> +	if (skb_cb->paddr_ext_desc)
> +		dma_unmap_single(ab->dev, skb_cb->paddr_ext_desc,
> +				 sizeof(struct hal_tx_msdu_ext_desc),
> +				 DMA_TO_DEVICE);
>   
>   fail_remove_tx_buf:
>   	ath12k_dp_tx_release_txbuf(dp, tx_desc, pool_id);
> 
> base-commit: a62b0aeb556839fb6abb9835874443b08fe95598


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
