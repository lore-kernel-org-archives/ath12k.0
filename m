Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160ECC27C4F
	for <ath12k@archiver.kernel.org>; Sat, 15 Jun 2024 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AtUIj6+jb5pJN+Yhpmk82WIhOJoGk8n1f7dla6Xlm0=; b=Q60ZpzDERciZ0t7AgBcEm5PzQm
	ZRrcfdh8StM148hr22GVtgkYPpMZsGZnGTEl4PBnB+y6qncBirXqUq5E5EKIIsrkTdWmssz91B5vI
	pkLvCX4JVCzOv7aiqYTiprPBszEnnbVA/6VevKxaOhqcKCWesWvNPhkc4d4bFdxpqENz4VI6iBc7E
	er73LtgCisJSsw7DmxP5uJi785cQW0zi/SpS1y5VIcxNSiD29dRVTtIKhosCD/tkSL7LaOKzIwOIu
	7iN8O/wJp7zQOejG8JCwY11/alAi4SYTK0Fq3dDtNlBbgBUNDouPecYESS4keoHMmq+OPZBvIBzGO
	8BGJPJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIc5k-00000006E8M-2PCr
	for ath12k@archiver.kernel.org;
	Sat, 15 Jun 2024 22:41:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIc5h-00000006E7r-00Il
	for ath12k@lists.infradead.org;
	Sat, 15 Jun 2024 22:41:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FMZqK2010384;
	Sat, 15 Jun 2024 22:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AtUIj6+jb5pJN+Yhpmk82WIhOJoGk8n1f7dla6Xlm0=; b=iR21zgFOVht0G1Ui
	XjJS54b5VR0MYNZs30FiK4NRDdgMwxvqkAd9LJtztyJRyuD/0dGEiHN7z4bTtyLM
	Y0YRf9IuFGfzd6RiPosAdTaleqeXTXoIL9zhy9Tga7Gdl2U7MaELRh+79E51f8AN
	cBbumSku2iAJWaCOfSIkn+MGpe5F6GUU73xffHwxE7OJd1O63akblDz8KRmQ9SYJ
	n1dbe+Lx8MSzcIYQQFFcezmOXKGu+DK48so4afTR8r8o80BHqr7R4XER5A535slH
	jKhlz79puLB7UQH3d3TzDH6YC0hdE5Z8UJFJv82063Ney1ph4EXqAKrRmFUKl6GS
	u4geGg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0an1bm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 22:41:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45FMfc4W017091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 22:41:38 GMT
Received: from [10.48.243.167] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Jun
 2024 15:41:37 -0700
Message-ID: <b26cbfac-b9cd-4682-86a4-4686c3ec15bb@quicinc.com>
Date: Sat, 15 Jun 2024 15:41:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix potential NULL dereference
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <4428a7ab-eb67-4f0e-992f-35577ea2b564@moroto.mountain>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <4428a7ab-eb67-4f0e-992f-35577ea2b564@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aC2NQg2k6GFhXZI6RfdtvCdTC5lHxb_t
X-Proofpoint-ORIG-GUID: aC2NQg2k6GFhXZI6RfdtvCdTC5lHxb_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_16,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=735
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406150173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_154145_265116_5EF96270 
X-CRM114-Status: GOOD (  16.69  )
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

On 6/14/2024 10:32 AM, Dan Carpenter wrote:
> In this condition if "sband" is NULL then it leads to a NULL dereference
> on the next line when it does "idx -= sband->n_channels;".
> 
> The condition can just be deleted, because if "sband" is NULL or the
> "idx" is out of bounds, then the correct thing is to at this point is to
> return -ENOENT.  There are no additional sbands available to try.
> 
> Fixes: 70e3be54bbdd ("wifi: ath12k: fix survey dump collection in 6 GHz")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 509c02bffdae..e5456383dabd 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -8314,11 +8314,6 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>  
>  	if (!sband)
>  		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
> -	if (!sband || idx >= sband->n_channels) {
> -		idx -= sband->n_channels;
> -		sband = NULL;
> -	}
> -
>  	if (!sband || idx >= sband->n_channels)
>  		return -ENOENT;
>  
This duplicates
https://lore.kernel.org/all/20240611031017.297927-2-quic_aarasahu@quicinc.com/

