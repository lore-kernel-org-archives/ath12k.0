Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC899C47DB3
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 01:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYfh/w8TLV2rHhLSyAU63soji5PBAK3sl7fLfpp7pak=; b=1+cL/2MtGwFZZvdTb+oUlK++hh
	+WGs2T/vcS9JKv+f+hfPnyrDVbH5x8mHcTTDsuoR0idoct119LVP259dtnMwn8UgDgZdmadEUD6CC
	yYk+ORLBno3xJRK2QwstWscWY3zrjBOcz9xX6UuUBgdV93fkNKn+bbn+Q3/xDePqSCitpTsIgddJU
	0M9v3MVqjm2gleLLkLbCidsO/upCx9mLocP6jnqcrjNl3o87NNjuV6owHiwU6esKNLafPu52sCVpE
	HkkV5F+DFuP06BhjL6y/URtf5V/fJQMSoz9sVXXTwkw9fFFqTi5foj1tMP28WJ8ktqMDi2b8GyHz9
	e8ApJapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdJ3-0000000EtHi-1w3k
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 01:52:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdJ1-0000000EtHK-0lR6
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 01:52:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U18HJH012458;
	Tue, 30 Jan 2024 01:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hYfh/w8TLV2rHhLSyAU63soji5PBAK3sl7fLfpp7pak=; b=IM
	uOezrUV2ZE2etAHivLYSTRZ9Trnrux4VKMDxhbbuOqGgMHZMPZQ01+xX2688lyX5
	J+uN//pvyng/zzb47rwrQ3vPTsCc23P4x3VZI7tszIx0InKz5DhZhF1lLJZCVCSX
	OawhemVRAlVCCTHCwwPk+lQgNSEhhbt925LZ1HSrTAD/fsJKkXojri8RM0ZnELcy
	yhHJYZVvS5kQ3VLKKgCYqu5mgDbOFSe7Xfgm4gz8t6geNKSMCNj9fwPic3Tiz3y1
	dzLbE05EmGfRU4VrjBnUxr593r1zqksYNZltgad9C9oYIp+jdym1e6c0UKdLU+AA
	UZwAdeo8SOoY51N7OEIg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx3t9tuww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:52:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U1qr1d027528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:52:53 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 17:52:52 -0800
Message-ID: <5f5a1a5f-cb04-4157-9464-ecd3d8611c8b@quicinc.com>
Date: Mon, 29 Jan 2024 17:52:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] wifi: ath12k: disable QMI PHY capability learn
 in split-phy QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-14-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-14-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q1eBJgfOAODl9vh5Zg-ZSAjH3kjs1iPM
X-Proofpoint-ORIG-GUID: Q1eBJgfOAODl9vh5Zg-ZSAjH3kjs1iPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401300011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_175255_384927_A16E921A 
X-CRM114-Status: GOOD (  20.46  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> QMI PHY capability learn is used to get PHY count information to
> support single/multi link operation (SLO/MLO) configuration. The
> QCN9274 dualmac firmware currently do not support SLO/MLO, if two
> PHYs are within the same chip. Due to this firmware crashes in
> split-phy QCN9274, while bringing up AP with MLO parameter enabled
> in QMI host capability request message.

Does this patch need a Fixes: tag?

> 
> The QMI PHY capability learn is not required for split-phy QCN9274,
> if SLO/MLO is not supported within the same chip. Hence, disable QMI
> PHY capability learn support in split-phy QCN9274.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 1 +
>  drivers/net/wireless/ath/ath12k/core.h | 5 +++++
>  drivers/net/wireless/ath/ath12k/mhi.c  | 1 +
>  drivers/net/wireless/ath/ath12k/qmi.c  | 3 +++
>  4 files changed, 10 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index ca3777c684b3..0d4640ff8d6f 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1218,6 +1218,7 @@ struct ath12k_base *ath12k_core_alloc(struct device *dev, size_t priv_size,
>  	ab->dev = dev;
>  	ab->hif.bus = bus;
>  	ab->qmi.num_radios = U8_MAX;
> +	ab->slo_capable = true;
>  
>  	return ab;
>  
> diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
> index f0a319ea57c1..a984171e4a08 100644
> --- a/drivers/net/wireless/ath/ath12k/core.h
> +++ b/drivers/net/wireless/ath/ath12k/core.h
> @@ -842,6 +842,11 @@ struct ath12k_base {
>  
>  	const struct hal_rx_ops *hal_rx_ops;
>  
> +	/* slo_capable denotes if the single/multi link operation
> +	 * is supported within the same chip (SoC).
> +	 */
> +	bool slo_capable;
> +
>  	/* must be last */
>  	u8 drv_priv[] __aligned(sizeof(void *));
>  };
> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
> index 50b9e44504f7..adb8c3ec1950 100644
> --- a/drivers/net/wireless/ath/ath12k/mhi.c
> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
> @@ -385,6 +385,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>  				   "failed to read board id\n");
>  		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
>  			dualmac = true;
> +			ab->slo_capable = false;
>  			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>  				   "dualmac fw selected for board id: %x\n", board_id);
>  		}
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 0f0eaadc8418..92845ffff44a 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -2124,6 +2124,9 @@ static void ath12k_qmi_phy_cap_send(struct ath12k_base *ab)
>  	struct qmi_txn txn;
>  	int ret;
>  
> +	if (!ab->slo_capable)
> +		goto out;
> +
>  	ret = qmi_txn_init(&ab->qmi.handle, &txn,
>  			   qmi_wlanfw_phy_cap_resp_msg_v01_ei, &resp);
>  	if (ret < 0)


