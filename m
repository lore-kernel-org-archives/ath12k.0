Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2091EE49A6
	for <ath12k@archiver.kernel.org>; Mon, 21 Aug 2023 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UzEBEb+oo4bDf7TbYYWPNxLnGPU2TtHNUaMQtM386Q=; b=KA5THLTOFNK/AlsDfwyRTr5y7s
	CLoSDJRdGkjJONQT8e9Cd5+u/n1CUf9ZNLcaaGSTl4sL0NsTNicJCimKtvywkgWGnoy00oqB5Ce4P
	xEx6jIdOpSMAJ63xEph2HTQ6/J6jvukwjV1smUPXkijCxPTxxQxetKv7eAzCv3SU54kyXd4akjyHr
	n/vTpES3lnZJ173MKfsJ6m2+W8qx7nRfshdq4SpXpc2P1R1nWEjzrsO6GnNGtUM5xDf/FXW0wRg8d
	XQvC7n+S+OySeYcs6uR/xn0THJyKSNFX73mn8YQ8kLq1MRUAIxYvXQzi3oQFLVFpEr98e9dqzwrV8
	7b20fEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6oy-00EGpq-1p
	for ath12k@archiver.kernel.org;
	Mon, 21 Aug 2023 15:28:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6ov-00EGpP-21
	for ath12k@lists.infradead.org;
	Mon, 21 Aug 2023 15:27:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LDmDDe030491
	for <ath12k@lists.infradead.org>; Mon, 21 Aug 2023 15:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pb49fzBQGigvvp0FBntYXXn6ZuQdaLQX0SkYuNn/j3Q=;
 b=XTCn4iRRabn6ftpD2vBOUM97z6LmbXp99OfHhoS7rYjCwGKhHKXoBm28YJ9jNgmoz07G
 MzsSXSm8WoFt3dMkw42mN1DHh+fQdla7CEDP4bE90FAXYdBCkAsCAbqQ78Hy/hlVFX44
 55BbYdxBIf1zx8j/cu6H4ta0kyNXZkgonaIcPwqS6GQmWOrU1g5BWBeESzMJpMHpaLiL
 k0lFYPCUvvC6hirLuhQfIOFFvJoMCwY871CFl86ISGQgGfTC928Lwie+ZGZutMoM5tHN
 r5FAjD13nnULjBptIgu0Jjk2ZMp2S29gOjv9qQwEbc/2j0iCJTrfRF1LDxK6JpcE6kWc DA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjp4dc1jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Aug 2023 15:27:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37LFRsGQ023803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Aug 2023 15:27:54 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 21 Aug
 2023 08:27:54 -0700
Message-ID: <ab94c255-8ac3-4b2a-a7a5-af40058ad6e6@quicinc.com>
Date: Mon, 21 Aug 2023 08:27:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: fix undefined behavior with __fls in
 dp
Content-Language: en-US
To: <ath12k@lists.infradead.org>
References: <20230821130343.29495-1-quic_hprem@quicinc.com>
 <20230821130343.29495-3-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230821130343.29495-3-quic_hprem@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ir7pcfBziBFifXP8d1C-nC4CLN5trG3K
X-Proofpoint-ORIG-GUID: Ir7pcfBziBFifXP8d1C-nC4CLN5trG3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_03,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_082757_809188_D906EB19 
X-CRM114-Status: GOOD (  21.99  )
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

On 8/21/2023 6:03 AM, Harshitha Prem wrote:
> When max virtual ap interfaces are configured in all the bands
> with ACS and hostapd restart is done every 60s,
> a crash is observed at random times because of handling the
> uninitialized peer fragments with fragment id of packet as 0.
> 
> "__fls" would have an undefined behavior if the argument is passed
> as "0". Hence, added changes to handle the same.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

this should be in the last section with the Signed-off-by

see 
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/dp_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 5923c7c9eaff..ea8dfea22be6 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -3238,7 +3238,7 @@ static int ath12k_dp_rx_frag_h_mpdu(struct ath12k *ar,
>   		goto out_unlock;
>   	}
>   
> -	if (frag_no > __fls(rx_tid->rx_frag_bitmap))
> +	if ((!rx_tid->rx_frag_bitmap || frag_no > __fls(rx_tid->rx_frag_bitmap)))
>   		__skb_queue_tail(&rx_tid->rx_frags, msdu);
>   	else
>   		ath12k_dp_rx_h_sort_frags(ab, &rx_tid->rx_frags, msdu);


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
