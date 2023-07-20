Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846BBEB64DD
	for <ath12k@archiver.kernel.org>; Thu, 20 Jul 2023 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoVNrpI3L009gJol6zOzaWF+Ze/pKqgNy7DeQFqet9w=; b=jvlGLiFjKcDFIt
	AmLdj4ZiekhWZmmSK1x2+MlvgRlLfsBXWlTHADgy90tQMUX1a9dkIihEc/VOFF5tj0NK0CX0Z/SH2
	ueKLd/VnhPySRE4tVsuRXPp8koyBqr2prKbdiZOf4gpEUN7nr8shfhSY5Rw4Kac/pM5L3ViFOvTXC
	t09c2qpcIQUttm+Gmr8Gsm0PjoArO0DoNsAnd1jXvm188/eXpnEzjhLIFPXmAvtfQ+yRW27uXI7WR
	faJfWm6pVtCHG4HzrNyS0Dfmg5yjFONyP/T3Hx5br8xX02YeJop1ZVtVJ5zZclE9FcLHLMp5RkakF
	kdWXGvrZ/VyaK4kJLz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYzI-00C0Q6-0e
	for ath12k@archiver.kernel.org;
	Thu, 20 Jul 2023 19:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMYzE-00C0Op-17
	for ath12k@lists.infradead.org;
	Thu, 20 Jul 2023 19:06:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36KERRFv016048;
	Thu, 20 Jul 2023 19:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9hwi9amcRzhIQkdwXEvb49n910XXW4BispPgXA3B7GA=;
 b=Mt1Q+iF5Z4EyfBPT0lFkH1EwUFECkC3ISgjWizFNpdtwV+HydS48RqVm2waXhkUJDikU
 luYqzmaZ7mz5XL4jA7y3QK6qgha2/GFPx6NjIRWXzo1s/gV/n58CHlZ3vGVoOROZ/eol
 628InASV/P8QUpxJsR24H1WKK2LEs3ia73mqY4DN1C15uLsdt0j/zt5+/sMhBftmrL0o
 0sQdO6hmuD4VHHiDSg/TOBBzc8uchnzpyDoqrhbmjnzAJWCHb6Y0RWBNRQbMoB90CAkG
 leFxxs+0rZzGz8cYLcgWNZAtdZgD9Xeg5g5SvJarBb67xrlpVx0x0LvP2syktoQNe++n SQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ry6pv0t23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 19:06:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36KJ6lF7018229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 19:06:47 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 12:06:47 -0700
Message-ID: <f5092088-29d6-414f-94b5-880d12dc428b@quicinc.com>
Date: Thu, 20 Jul 2023 12:06:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] wifi: ath12k: configure RDDM size to mhi for device
 recovery
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230720025232.7701-1-quic_wgong@quicinc.com>
 <20230720025232.7701-2-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230720025232.7701-2-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rWVqxOwh7XA8FDb-rYXkUnrCjXCyAEif
X-Proofpoint-ORIG-GUID: rWVqxOwh7XA8FDb-rYXkUnrCjXCyAEif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_120652_518730_BBF352A3 
X-CRM114-Status: GOOD (  18.35  )
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

Subject nit: s/mhi/MHI

On 7/19/2023 7:52 PM, Wen Gong wrote:
> RDDM is RAM DUMP DUBUG module, it is used to debugging issue when firmware

s/DUBUG/DEBUG/

s/debugging issue/ debug issues/

> hit error.

encounters an error.

> 
> The rddm_size is needed by firmware while MHI enter RDDM state, add it

s/, add/. Add/

> to support device recovery when ath12k receive MHI_CB_EE_RDDM message.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/hw.c  | 3 +++
>   drivers/net/wireless/ath/ath12k/hw.h  | 1 +
>   drivers/net/wireless/ath/ath12k/mhi.c | 1 +
>   3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index 5991cc91cd00..c69cfca67f7d 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -907,6 +907,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>   		.hal_ops = &hal_qcn9274_ops,
>   
>   		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
> +		.rddm_size = 0,
>   	},
>   	{
>   		.name = "wcn7850 hw2.0",
> @@ -964,6 +965,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>   
>   		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01) |
>   					   BIT(CNSS_PCIE_PERST_NO_PULL_V01),
> +		.rddm_size = 0x780000,
>   	},
>   	{
>   		.name = "qcn9274 hw2.0",
> @@ -1019,6 +1021,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>   		.hal_ops = &hal_qcn9274_ops,
>   
>   		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
> +		.rddm_size = 0,
>   	},
>   };
>   
> diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
> index e6c4223c283c..7d82b76ad021 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.h
> +++ b/drivers/net/wireless/ath/ath12k/hw.h
> @@ -186,6 +186,7 @@ struct ath12k_hw_params {
>   	const struct hal_ops *hal_ops;
>   
>   	u64 qmi_cnss_feature_bitmap;
> +	u32 rddm_size;
>   };
>   
>   struct ath12k_hw_ops {
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> index 42f1140baa4f..91b2abf6da44 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -366,6 +366,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>   	mhi_ctrl->fw_image = ab_pci->amss_path;
>   	mhi_ctrl->regs = ab->mem;
>   	mhi_ctrl->reg_len = ab->mem_len;
> +	mhi_ctrl->rddm_size = ab->hw_params->rddm_size;
>   
>   	ret = ath12k_mhi_get_msi(ab_pci);
>   	if (ret) {

actual code LGTM, subject/commit text nits can be addressed when you 
upstream


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
