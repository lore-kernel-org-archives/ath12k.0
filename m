Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4422EE69193
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhY8e9WMw3LtuvmwOUonOFh5kzu++uTPDYZjxS7rYfU=; b=vt5sAOR5VJr5O2sibWMeiAd1Ru
	PveZFiMKJxHwj5J44as5B02atO4MrmuwM7q2PFtGNSGSCtFL4sN/GBd8BAkKdmn2+HpLSPURay58h
	jEWjuu7aV5OE6oDryZPnzkwa6Z8J/yb3jwzrqAvG5H9M6m6/PjZVb2iBT+bKfENhulcN3QDLFfyEc
	x10It8q295Kw7T7itQ4R2yGJXtu7aVmn2kqO4RJG/DomhlawG/tIqfmvtY+hQseav7UJ8vP3rkUeN
	TicyfG+ckCW8JbwNrBIHXv9fIPvAneJXimHL1hbf0h+tJ46gOD9tllFFdfhNf7FqML72Np7b9iX8Y
	uk6pLwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEas2-00000003JsZ-3sey
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 21:07:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEas0-00000003Jrm-1FaO
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 21:07:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMIXuCm003632;
	Fri, 22 Nov 2024 21:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhY8e9WMw3LtuvmwOUonOFh5kzu++uTPDYZjxS7rYfU=; b=L+tzG9l2u1gL7dDB
	sDBi2B3YZyHpJj8KW3VgX+yiA7lU34r9il3ZFilFCCT/QwefCFZNi8hI+QEo8bkK
	hBBWZbGKEGgeTv9EnT1yBI2cr+u7K8G/Jy1r66wbZpfRHWbjwFzZrHTiCIFkjWuI
	oUYP2rFlfo0WrZm7IGz7KhAnmBEJHHD7z+KEWVeHspxpB1yYaRdyZEt9u3+dw7Fp
	hU1vbk19MouxfT16nwAqxGaMvp/vkGab55+jFkbgXoiwfPpRpYIbtIAOvFRiX+hv
	5PtdqJVz3pAAu94pZ9+zaGTgNCZO9XMoSC9tosNZTOTj7J2ZCa1DJUwKkZUxK/qQ
	fmTsag==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432p0d9wc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 21:07:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AML7D94024568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 21:07:13 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 13:07:12 -0800
Message-ID: <75c641d9-26f5-4d42-bd48-14b1606ba4d9@quicinc.com>
Date: Fri, 22 Nov 2024 13:07:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix invalid data access in
 ath12k_dp_rx_h_undecap_nwifi
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manish Dharanenthiran
	<quic_mdharane@quicinc.com>
References: <20241122174252.2067375-1-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241122174252.2067375-1-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4F_fRWRxrwMsqKFecAngmYgvDENK1rQJ
X-Proofpoint-GUID: 4F_fRWRxrwMsqKFecAngmYgvDENK1rQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_130716_456768_9357FB9C 
X-CRM114-Status: GOOD (  16.00  )
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

On 11/22/2024 9:42 AM, Tamizh Chelvam Raja wrote:
> From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
> 
> In certain cases, hardware might provide packets with a
> length greater than the maximum native Wi-Fi header length.
> This can lead to accessing and modifying fields in the header
> within the ath12k_dp_rx_h_undecap_nwifi function for
> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
> potentially resulting in invalid data access and memory corruption.
> 
> Add a sanity check before processing the SKB to prevent invalid
> data access in the undecap native Wi-Fi function for the
> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

One nit...

> ---
>  drivers/net/wireless/ath/ath12k/dp_rx.c | 42 +++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 0fb39c174475..26ff9a346dca 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -2474,6 +2474,29 @@ static void ath12k_dp_rx_deliver_msdu(struct ath12k *ar, struct napi_struct *nap
>  	ieee80211_rx_napi(ath12k_ar_to_hw(ar), pubsta, msdu, napi);
>  }
>  
> +static bool ath12k_dp_rx_check_nwifi_hdr_len_valid(struct ath12k_base *ab,
> +						   struct hal_rx_desc *rx_desc,
> +						   struct sk_buff *msdu)
> +{
> +	u8 decap_type;
> +	struct ieee80211_hdr *hdr;
> +	u32 hdr_len;

try to keep reverse xmas tree format



