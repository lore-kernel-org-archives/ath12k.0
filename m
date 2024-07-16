Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1119DC3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUcto7EFJnJbd3Vlf+1/ygQaFeJzw/melNmMoRsS8P0=; b=dUUmt29t9YGibOVw4J37AKqNUO
	oczoBz0mRNscPuY0GCpOjih0JlgFiRHCX6AP36qmvrTTfT8neQYncJ/kltwyYHtUTEdgIeu5zLhUk
	6Xsap5eBe5lxwB61BYu25VV9AdaFYs7/+UIXHbjw5+JAsR4OV7IhkyYB6DPATChRDXrAqMJpyWvpE
	K3uRqaOBrestFHTt4xkKYtv77BKPe/Vtme9pcYkirY6A67FukIf6horJw0IyHBymhnu6ZfW9FYzeV
	mu5omQuyOLdDQGQeY/+j5Qb+BfeL4/szq7fjAdNNFp0uFPYFHatK05+zwwr1cH+btWwTK5j7UBbXZ
	aqBAc7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTijl-0000000Ad6e-2MzB
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 14:01:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTijh-0000000Ad4L-48EW
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 14:00:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GDgMpH006921;
	Tue, 16 Jul 2024 14:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUcto7EFJnJbd3Vlf+1/ygQaFeJzw/melNmMoRsS8P0=; b=WlCbj9X/fv89LO7N
	P0+XgyFv4seKkTIEjaLTCbzDu5kib++lgknhV8YABhe29yyGN2DnCgeYb6Y0o/5t
	tCVm4S3tRnTjmvHhHVDP9XgwE8ZXiSeQjsqkNjHx+sCjxr4wy5iqSi61R9QVROBE
	0I8aAOhGYNS3aZn+QUfKiN1WuBfrBsdLLYEI41aQgTqeTpF1gcDB2kVaPBX6EW3V
	fVkwB73VQbMbTijZ3sBozhMhKCCJYB98cLLN5tsRci5NIjV5XWAFxCm3xCyGo3lb
	lcJ63kcCD1YUguiC5LZazM4sX8WJAAedenoJcs5ZSQf4aIqFRTwlwsmLmH+/QbKt
	EhDHoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bjv8q55t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 14:00:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GE0kg5015060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 14:00:46 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 07:00:45 -0700
Message-ID: <a7950e7b-2275-4b6d-b8e1-4f50d0bc28e6@quicinc.com>
Date: Tue, 16 Jul 2024 07:00:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] wifi: ath12k: fix build vs old compiler
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        "Baochen Qiang" <quic_bqiang@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>
References: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <3175f87d7227e395b330fd88fb840c1645084ea7.1721127979.git.pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6Q3KmPlUQYOvDOqg88Z0B9mftQCV-To6
X-Proofpoint-GUID: 6Q3KmPlUQYOvDOqg88Z0B9mftQCV-To6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=896 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_070058_051453_D744286C 
X-CRM114-Status: GOOD (  15.49  )
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

On 7/16/2024 4:06 AM, Paolo Abeni wrote:
> gcc 11.4.1-3 warns about memcpy() with overlapping pointers:
> 
> drivers/net/wireless/ath/ath12k/wow.c: In function ‘ath12k_wow_convert_8023_to_80211.constprop’:
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551611 or more bytes at offsets 0 and 0 overlaps 9223372036854775799 bytes at offset -9223372036854775804 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                        \
>       |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:190:25: note: in expansion of macro ‘memcpy’
>   190 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> ./include/linux/fortify-string.h:114:33: error: ‘__builtin_memcpy’ accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Werror=restrict]
>   114 | #define __underlying_memcpy     __builtin_memcpy
>       |                                 ^
> ./include/linux/fortify-string.h:637:9: note: in expansion of macro ‘__underlying_memcpy’
>   637 |         __underlying_##op(p, q, __fortify_size);                        \
>       |         ^~~~~~~~~~~~~
> ./include/linux/fortify-string.h:682:26: note: in expansion of macro ‘__fortify_memcpy_chk’
>   682 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:232:25: note: in expansion of macro ‘memcpy’
>   232 |                         memcpy(pat, eth_pat, eth_pat_len);
>       |                         ^~~~~~
> 
> The sum of size_t operands can overflow SIZE_MAX, triggering the
> warning.
> Address the issue using the suitable helper.
> 
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> Only built tested. Sending directly to net to reduce the RTT, but no
> objections to go through the WiFi tree first
> ---
>  drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> index c5cba825a84a..bead19db2c9a 100644
> --- a/drivers/net/wireless/ath/ath12k/wow.c
> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> @@ -186,7 +186,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>  	if (eth_pkt_ofs < ETH_ALEN) {
>  		pkt_ofs = eth_pkt_ofs + a1_ofs;
>  
> -		if (eth_pkt_ofs + eth_pat_len < ETH_ALEN) {
> +		if (size_add(eth_pkt_ofs, eth_pat_len) < ETH_ALEN) {
>  			memcpy(pat, eth_pat, eth_pat_len);
>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
>  
> @@ -228,7 +228,7 @@ ath12k_wow_convert_8023_to_80211(struct ath12k *ar,
>  	} else if (eth_pkt_ofs < prot_ofs) {
>  		pkt_ofs = eth_pkt_ofs - ETH_ALEN + a3_ofs;
>  
> -		if (eth_pkt_ofs + eth_pat_len < prot_ofs) {
> +		if (size_add(eth_pkt_ofs, eth_pat_len) < prot_ofs) {
>  			memcpy(pat, eth_pat, eth_pat_len);
>  			memcpy(bytemask, eth_bytemask, eth_pat_len);
>  

Duplicate of https://msgid.link/20240704144341.207317-1-kvalo@kernel.org ??


