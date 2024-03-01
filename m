Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1233EC5475B
	for <ath12k@archiver.kernel.org>; Fri,  1 Mar 2024 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSI7a+FME0r5JfS4mRlk0m3zVoz17Jebk108aGve7yY=; b=gk33EJfIZ1g02vLl97BOwqHW67
	LFV5BQlL1xzkDh/SUUXLljhwGzJ0uL3GED7bTGtGoQHsH6PEhYyXD4M3yFt4/sFY+8z9LdcwMXen2
	Cg2e+psdK5aTq8udwkDNJQdGfwABQHgr7c4MvQskT/Ccfu4c3N0JKG1TCYNRovarXZiO0wvtJEqQE
	QafgbkakBeJkgeVdV16QAnZPFpPfPwO1hXa0C3xKPszQKj8thDKuPrfU4PTMZlpI++Tqz8RRKWFKh
	Qt9Ya4OJkIn5ICFWvVS2KT5LqDx42mioqyio7QmsFmnZ4TdZYPmH1U9+pIW7lKenNbOEiD0vrpCN2
	+Tf1nzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg68O-00000001D9A-37wL
	for ath12k@archiver.kernel.org;
	Fri, 01 Mar 2024 16:53:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg68M-00000001D7T-0UQQ
	for ath12k@lists.infradead.org;
	Fri, 01 Mar 2024 16:53:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421F1HWv011155;
	Fri, 1 Mar 2024 16:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gSI7a+FME0r5JfS4mRlk0m3zVoz17Jebk108aGve7yY=; b=D/
	1LtdOwt/q5kRjHFOSXSxtp4OkTIEGgpIX93cHAw4OJ0rp/rma+QYp9ycAH1pSX+g
	rqBP/qrMveMQ8f/cUI1BvvxdFAMP8AQ0QZwIwJDn7HYnEQb4myyX4eYDsjpWt782
	6sB2f9ZEBrc7KkcBcEAFBenrOFuEHmSnnbULNu9cZYUkIkY42dnefxb9/R3Ugg2V
	B62s1wH40G1CV1QkqCjrJQgkJQzbM8ZKqDqi5SCEikuzcSfXiPG0ev/ySM7Sckhs
	rW9sYSycN9MOg3YMPEz5wlDULd1lmosynkdZUqPS3q+9humEzFdhZS0HD7wHrEK0
	UlJa0rncrYzwVIBgciSw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wkh9rg8n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 16:53:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421GrFLO020600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Mar 2024 16:53:15 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 08:53:15 -0800
Message-ID: <6a91daf9-76ea-4379-8b12-1b9cb23b3869@quicinc.com>
Date: Fri, 1 Mar 2024 08:53:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove reserve member of wbm completion
 structure
Content-Language: en-US
To: <quic_tmariyap@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240301091936.12054-1-quic_tmariyap@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240301091936.12054-1-quic_tmariyap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EPY_dc2vQcVFAaJkaDEmy_gLL8kYu42q
X-Proofpoint-ORIG-GUID: EPY_dc2vQcVFAaJkaDEmy_gLL8kYu42q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_17,2024-03-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_085318_359486_16285E1C 
X-CRM114-Status: GOOD (  16.21  )
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

On 3/1/2024 1:19 AM, quic_tmariyap@quicinc.com wrote:
> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> 
> In tx completion, status desc obtained from offsetting the address
> from wbm ring. Having reserved 8 bytes in status desc offsets the
> address twice and read the values from the incorrect address.
> So, removing the reserved 8 bytes from wbm completion structure.

Why not instead remove the addition of HTT_TX_WBM_COMP_STATUS_OFFSET in
ath12k_dp_tx_process_htt_tx_complete()?

That would remove an unnecessary operation in the data path.

> 
> Also this patch is applicable for WCN7850.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index eb2dd408e081..d01fc0b0c9a5 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -387,7 +387,6 @@ struct ath12k_dp {
>  #define HTT_TX_WBM_COMP_INFO2_ACK_RSSI		GENMASK(31, 24)
>  
>  struct htt_tx_wbm_completion {
> -	__le32 rsvd0[2];
>  	__le32 info0;
>  	__le32 info1;
>  	__le32 info2;


