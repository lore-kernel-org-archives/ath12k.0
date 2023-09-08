Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BC1EE8016
	for <ath12k@archiver.kernel.org>; Fri,  8 Sep 2023 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rs718GFyibSVlq7liFiHfj6WbfXyXvPdkgBrmoOcXzg=; b=CO0u70r5V8UKbt
	niGNlFL8WRN0dM4t6+vLVXH4zCcr0bkIce75YHU5YDP4rqN+h8LcNgOlcVkn7vy2FPLHsHdlETKol
	TY3dznYaGHm80KGQWoqgcRLlrwVGfsNHh4B3sHtPy85NSBAbVsrjq73QZOrnC90GRKzXNnbliyCfg
	/nKbjkDdkSin5DNWFuGc6u5G+boPUGKawfJpIZhJMXYkxuQKMpFWKZQJXz0WjtWHYuVXvU3PZMNeI
	DQJq1uyZkkanqeeBiZoKAx0obwYrD2DO8/xStv+cQA5m4W34P2ylPserkHtvEyyKVTBTCZ93NA+zH
	uRe1MO+Rs14tL1G17Ggw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qedLt-00E03g-34
	for ath12k@archiver.kernel.org;
	Fri, 08 Sep 2023 15:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qedLr-00E03I-0X
	for ath12k@lists.infradead.org;
	Fri, 08 Sep 2023 15:24:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388DRQH4013605;
	Fri, 8 Sep 2023 15:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QLo0EFyFPxzA4JvWtjk/HHXA7tZcvSdwzsoHQw9fHY0=;
 b=aamT0pZFrHtvHaNYfn+/k/4gMWfw3h9poez0Uh87fy02cmSfIk8wd4maTwravV3FQXEJ
 tuUBDT62QcYzkiLt/hNp/L1k20haSIINGzJX4d+j18lRxMQL38ha6wfWFijZyPjLPDOR
 63voquv0TaLbVaU7IDueSibFn7lhx7tDgfdmGFcN4vDY14mLBmmztvqFdVtOjonKrJvx
 b71Ps0rfd4ewwz3mBDdGeqOAPK3FU9EK1O96jYQTHWG4FcCPw/qH1/zq5wqvkDNRdKYj
 gQ5PICdks7PGlvtCXKypLGspYZ2pcM97ErMLIyRKHL+I7XS+dzxKwrpCqdSL+pbT1HO4 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t03228g83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 15:24:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 388FOrSr011231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Sep 2023 15:24:53 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 8 Sep
 2023 08:24:52 -0700
Message-ID: <3870f85d-d769-40c7-851d-295ad9fd8708@quicinc.com>
Date: Fri, 8 Sep 2023 08:24:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: change to treat alpha code na as world wide
 regdomain
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230906090355.19181-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230906090355.19181-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vt6TOBZ_6alwD3OtgV5ZyxWtBW10aAML
X-Proofpoint-ORIG-GUID: Vt6TOBZ_6alwD3OtgV5ZyxWtBW10aAML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_082455_356761_670CB1A2 
X-CRM114-Status: GOOD (  17.55  )
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

On 9/6/2023 2:03 AM, Wen Gong wrote:
> Some firmware versions for WCN7850 report the default regdomain with
> alpha code "na" by default when load as a world wide regdomain,
> ath12k should treat it as a world wide alpha code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 9ed33e2d6da0..4ebc09b35892 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5390,7 +5390,13 @@ static void ath12k_wmi_htc_tx_complete(struct ath12k_base *ab,
>   
>   static bool ath12k_reg_is_world_alpha(char *alpha)
>   {
> -	return alpha[0] == '0' && alpha[1] == '0';
> +	if (alpha[0] == '0' && alpha[1] == '0')
> +		return true;
> +
> +	if (alpha[0] == 'n' && alpha[1] == 'a')
> +		return true;
> +
> +	return false;
>   }
>   
>   static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *skb)
> 
> base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
