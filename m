Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B4C3F6B0
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 04:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsOkLdAxPcYzx9cTiz8UCrFe+GJOntNpmVHC+ubRDkw=; b=BG/WmG+C2f/dAl
	1Esf7osS16IPMLb1oev3uQItgHzxM5qp+FZCJr4Xrs/t0ZgDGFJKIJuqbJPEudul/aBDyNMwpBrXg
	FyyazDqsKg7bu70L6gktG9Q8ZnfXXJSOyW9PfXvxI7S98M/VvvfT6JhH45Hv+1OJE+p2XlYPHBa/J
	Yw5w7CxEt7OesE0cl0qaKQnX2d700uPpLA123pJfzfUSje2OALRA181Yt2mSYnDXgVD+fdvEXIk6s
	zHou8Jm7RllaLGzfRQgX9MSqKMFepfx9NN7GYch2a5KMgz2IMdbaI+Sv99HzWXFFJ6eDq4Dx13b0J
	lGbMzrEZ3l0KMZYUJtpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWy3-00E9E2-GR
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 04:17:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOWy0-00E97E-Ja
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 04:17:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27I2UJh9017837;
	Thu, 18 Aug 2022 04:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WBd+uW8FDMpsYy5koucJjoPzS9Dns1rhA0zQckcX4Y8=;
 b=cLKeSLef2gbLQPdc2pgKAtvYWQXCmfWni1Ed/6XfHrOgNxJrC6lOOxK0NQA1jh5WyuuC
 M7oljIVeDMpgYjoEQoRsnNwxBgdxT4QQoTYRMKqWmBLMbQDNrfjDWxQo/gQJuyqZFFDO
 RjyYYIh/d38nkdKavV75XzMKvSPjKVqg2UnSRSIR3/9EFLRWO1tXLEyAFeQTUIrBoyGt
 L/zooHigLxPIr+1pOKG2j7WnZWH4eEmmCQhkxEtLmsOSU3nrC3C7qclB9SRDnBsqBNbr
 WjybnnYDXJR7fBf3h25m4y+03AbGrpdnJS9e9XPcRi+TPGqF+/szuXX6cbD1LOzdL6UR oQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j0wynkuyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 04:16:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27I4Gu0Q012160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 04:16:58 GMT
Received: from [10.110.78.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 17 Aug
 2022 17:21:48 -0700
Message-ID: <8a84fd8d-14db-97ec-0376-10b554aed257@quicinc.com>
Date: Wed, 17 Aug 2022 17:21:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 23/50] wifi: ath12k: add hal_rx.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-24-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-24-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ItqWJgslcVQFv3fGzxCiC-W2MluK_hiq
X-Proofpoint-GUID: ItqWJgslcVQFv3fGzxCiC-W2MluK_hiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=881 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_211712_808573_B050C2A8 
X-CRM114-Status: GOOD (  16.99  )
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

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/hal_rx.h | 694 +++++++++++++++++++++++++++++++
>   1 file changed, 694 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal_rx.h b/drivers/net/wireless/ath/ath12k/hal_rx.h
> new file mode 100644
> index 000000000000..883ea1be2525
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/hal_rx.h

snip

> +static inline u32 ath12k_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones)

why doesn't this function return enum nl80211_he_ru_alloc

> +{
> +	u32 ret = 0;

shouldn't this be initialized to a enum nl80211_he_ru_alloc enumerator?
(0 is NL80211_RATE_INFO_HE_RU_ALLOC_26)

or perhaps remove the initializer and add a default:?

> +
> +	switch (ru_tones) {
> +	case RU_26:

add default: here?

> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_26;
> +		break;
> +	case RU_52:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_52;
> +		break;
> +	case RU_106:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_106;
> +		break;
> +	case RU_242:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_242;
> +		break;
> +	case RU_484:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_484;
> +		break;
> +	case RU_996:
> +		ret = NL80211_RATE_INFO_HE_RU_ALLOC_996;
> +		break;
> +	}
> +	return ret;

snip

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
