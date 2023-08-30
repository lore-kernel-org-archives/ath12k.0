Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E35C6FA8F
	for <ath12k@archiver.kernel.org>; Wed, 30 Aug 2023 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu1owYXdhlNugE/Haxp6iqCFrU8L3y1QjqONgt+awQA=; b=IpsDtZFIaYYwKV
	6DHiIR5zH+ssQ5MiUHYSMFaT+TUnMexquIAEaSggDN9JUTk2FvU52BfdeDnKwd9dAT8E3kjvGpZar
	IBpcTl2jEVyvLV+pJnS/uxaM0vazW6zMrvHrKoVth51FeC6fqRqqbYmyJc5LNS3bAzO6x7TUeteCO
	/5CbLp0KvJEpT2HDTnDhvyyuAu5hf1HHC2osfqzVZe14ZSs0wdmAH4Zyt1eOJ2RG8ME1lOePjHLPB
	iv1NZIuNvs703kjSp/BBYSg9wQUgU2BTmhc2//kjUfoQRsJ89J5jKbUCyPkuXhhkhy/1CixIA9Upg
	kp32hMvojwSm7BOZ95Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRjr-00E8Dt-1q
	for ath12k@archiver.kernel.org;
	Wed, 30 Aug 2023 20:24:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRjo-00E8Cy-2r
	for ath12k@lists.infradead.org;
	Wed, 30 Aug 2023 20:24:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UJNZeG003082;
	Wed, 30 Aug 2023 20:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4yxvoqNIOy1VStdPAKHxN6XviU4lL2CZh+DCGyCRMbE=;
 b=QRucubIDl6zCawmaB1Ic7tgCMFCRzk9G0vE8+gSoj3RYM3j5vCKvMpBBjqux6pJ3CTy+
 dVO00+vi8pp0w1cmoyTTAyjd8q/9PW77DC0Ndq1ljI9/dY+6IyrfkOEarQIXtnLXBH3t
 0klw2vZZULcXN7nl+qHt6X5cPAnH88bnl8pR7bY0ttjnQbYkLfsdPfT1mY+A95Xmv/J5
 du0FWSJgGfFPnFsu61DsuYzWtjLT1AAT/qmitBRIWOR2GpcG08zBiyBTXiqwYpTUaDoA
 MefkvwTAqqLI6JRmTPW/9l1oCNEdtdeXMcVtbKEZWEwu1IxL6D3KtOXstr3MZuWudj4E vg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sswbv1r54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 20:24:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UKOO9O007306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 20:24:24 GMT
Received: from [10.111.178.80] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 30 Aug
 2023 13:24:00 -0700
Message-ID: <b5e9d24d-c9c0-4c4e-a7ab-88695840120c@quicinc.com>
Date: Wed, 30 Aug 2023 13:23:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Set default beacon mode to burst mode
Content-Language: en-US
To: Sidhanta Sahu <quic_sidhanta@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230830194617.26400-1-quic_sidhanta@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C1EhgVfjo69fXksZWESwMJSReRmwsNjJ
X-Proofpoint-GUID: C1EhgVfjo69fXksZWESwMJSReRmwsNjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_132429_046092_A1C61265 
X-CRM114-Status: GOOD (  17.66  )
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

On 8/30/2023 12:46 PM, Sidhanta Sahu wrote:
> Currently, firmware does not like when beacon mode is set as staggered
> mode for more than one beaconing vifs. Beacon mode for multiple
> beaconing (transmitted) vifs are expected to be in burst mode. So set
> beacon mode to burst mode by default.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 1bb9802ef569..b16cbc3c906d 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2314,7 +2314,7 @@ static void ath12k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   
>   	if (changed & BSS_CHANGED_BEACON) {
>   		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
> -		param_value = WMI_BEACON_STAGGERED_MODE;
> +		param_value = WMI_BEACON_BURST_MODE;
>   		ret = ath12k_wmi_pdev_set_param(ar, param_id,
>   						param_value, ar->pdev->pdev_id);
>   		if (ret)


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
