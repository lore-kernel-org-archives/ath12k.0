Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA8ACA5FE4
	for <ath12k@archiver.kernel.org>; Sat,  3 Oct 2026 23:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=; b=uAxqsORyYQp5LgZ8ODLRp7MhLC
	nbyElcdVbvkte/0QzcKCPEpljFgwqcvWF20cvy8LitMSaAr/7Aqt4rXE2j6Dm4pi6apx89VULnNQt
	/ylSi+Obn945sjLG5GSH331sjoce0u87jaUsjWu2cohS2KBcogdmmIrxQNOAVAC5u8Fl2oVsloRpD
	uX61NeFqJ7hRkvofepbqkWBQ0KrkL0vxgNAf/xys1u5XerjIP34PqvcVvPKH3tWfm59FVIxYQCN+U
	Sz+DqVvvc2QHBXZkuy2aqZiwThslvhpYog3NsLatG89/SRC/0cqwY4eHr1Km/tVSPRjnqd8tC8h1U
	e/KA9Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8p9-0000000E9bC-0t6T;
	Sat, 03 Oct 2026 23:07:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8p4-0000000E9ad-1uVA
	for ath12k@lists.infradead.org;
	Sat, 03 Oct 2026 23:07:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Kpawv1307223
	for <ath12k@lists.infradead.org>; Sat, 3 Oct 2026 23:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=; b=lSH13pZttf35mQWf
	MYIc27VMxijuPxdMaVIx80xKijECK978t9wicQaocmY9EuUTTxXNa+DjmaEHWg2z
	4/Mon90o9C6sJgl+OEf18NNtRe0DBeWKRfhXhflcw7NnUXGrSNxQPfOWtW6V898S
	d9Wf/vSiNs3eSqjDa6Gr47DD17uR6HL+6pKqQ/i9tOeNgkSFVbYx4uY1JAm6hLg1
	hRjYMkhlQpoHiGPblOaJGxXPeThAeW8UWHYabzKBqDwtgjRZOaFQ+XGW7dBeWAyo
	64Z4Hjc7gAvEFgxAajLCMVkLc85QeFKmJQjt95gxH+2yFm9qus599OpzaQpFDgz3
	tET4qA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx31y9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 23:07:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso564748eec.1
        for <ath12k@lists.infradead.org>; Sat, 03 Oct 2026 16:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791068837; x=1791673637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=;
        b=PgVfo71OshU2L+4Bixol4RYXGJ8iyBWBoK5TlKQAZQz66wv51py0WfDoVlfQ9hEFR8
         OSd7kaWTpztil8FpNd9+/lAB6f3zWQrlNS6P7enNwtjE7KOkmUjb9q44nl0s9g2KEEgw
         2Bl51ZmQeX2pAhFxp4+c0+WIFagaKQTPA0TyXeLpp7OpJ+3B1nwEOttFV7mMxTPVwyzP
         HsHf/GZ3vPww5/OB9ZffjSRrkEEoVWTkVYV0t2Z9LPkxb1nxDcZP+pJr4rmFDxXG4QbC
         +3vN06oDPbSoNcLHPli2xB9UFXDMyzIH6py5n4TZpuCda3FUnec9JANOi04jdLC294Yq
         hiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791068837; x=1791673637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ui0hYY9c2dDrMn8vS9nrlZOGWWpwY017RHY+Hel6dAM=;
        b=2cwDSn2HIKg9knJKF0DNhnXA20LHXBTagy3+4uRHA5dFvzlN+Jng+MMmuYmvBV0wms
         R/xy74vhnX3FLft7tl14OrV0D0S0W3B8fibpmjBrctz/7tdp4mhR2FfobpJCc1xkOTFP
         tkSFY1Pjt0d+j8b/8VnphEjTwFhLo7zNDybJynVpMCZ7uf5dto7czYeu6UE5j16GEN3H
         M32hxQiX5m1aCFM2cRESBqJsOIun50ToNE6zfkPB+acJP8Qf8c9k6hsCZNFBp0lv/ova
         coB63PiYK//11Jo2i9eTnbc6QDcFrBx5OzSX3oCQgrMkiLsr2VjRZHa6/tkGiXe9+k1J
         kJoA==
X-Forwarded-Encrypted: i=1; AKwUvBwjZB94I3LE8a57rbmJbETp8NC6UQK7eu791ukcnaZPLZBlUVZDgVFBz+kHD2tjds6ehZQLdq8=@lists.infradead.org
X-Gm-Message-State: AFq9FYIFyl3XnIwZVjT4dYSBjozqvjS+64kaGY5Jub7/aj4ERxQ8j0uD
	Avvf3/Tieo9c9XLtPT/YcGNbUO7CaaOQozwdN5YKF1A7mhHg//jm69OJQwbIlcDZZ+xRWjvdSw4
	XqqIJJaOid5/EpYDXgh/2rXQv4Uk/fJDAJIX1IlkLn1IlyA/EXq0tHwYam4ji9H+D
X-Gm-Gg: AYBFou1LWZW8laXiPWP+DQEeASY4mkRN3FgYzH+RnM5oKOBc6+NqzlWaYeifzASy2JG
	boBZwh/PqyHCFxDHC4M8lZt2oM3qNMBTpHj5CPrAIQPtuL3u8QDqHvUFbagJ0Yu9xfRbXlS2DFS
	Sa0ei77C9Nj5+JJCcfbl6TWk9VMvcqGu8UO85bBP0FLT/YveflPz3wrVjQQXH9o0gITNpwrAn4s
	5M3LXZqELOWwt0LtPimhSskVK4c8WGEVxo9jWcMbd/w0zr2R3Z55nV0oA5lycYOTAvef6bzBcVn
	IXGTc2EVy9h5xaL6iZf+PyrA0ZCqJut0Ym3FCipgDFDfDjBmoknZ5ZXIoLYoRmHiqVqGlnrlTzc
	8n5unnBto5UQ9QN6zZVfxPg5n25z4jgHOknsfShsbozVmxYBeVCx0S23h4Q==
X-Received: by 2002:a05:693c:69c5:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-34f150c28c4mr7992618eec.20.1791068837104;
        Sat, 03 Oct 2026 16:07:17 -0700 (PDT)
X-Received: by 2002:a05:693c:69c5:b0:34c:45da:9b5 with SMTP id 5a478bee46e88-34f150c28c4mr7992596eec.20.1791068836529;
        Sat, 03 Oct 2026 16:07:16 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271612e9sm25294eec.12.2026.10.03.16.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 16:07:15 -0700 (PDT)
Message-ID: <dedcc778-3459-4f08-86b2-55aac20d3e3e@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 16:07:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac18aa5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=Byx-y9mGAAAA:8 a=JhsGp5YEgYEiw4z---oA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 8cWpUHZIz1NLnb0WSK1yHkIwdC82ZPIb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA5MiBTYWx0ZWRfX+UqdTyurlzC9
 oTJhUB4eZ9TKtkfp3BVvVNiy+KGMV2Z0PpHnu2Q38hyHbMmf0huqNOE9+ysNZippoUkxcACUf+D
 o4KttZkF1bhVdHH3eTDhMnVAuWNiVtY=
X-Proofpoint-GUID: 8cWpUHZIz1NLnb0WSK1yHkIwdC82ZPIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA5MiBTYWx0ZWRfX0YY7+cqfCoVz
 5sjYiPD+5+WXvn/N90efzDRgKHdxI/eCpRWtzigseHDKnFfMiciYKaYVR8SPhiQVHPE/IYDSvPb
 2d6+fh2KZJRmVANflxm/2SXq6EhxBXZlntIfNjUTZwrvMY0Nzwb/mb+/KTC8LgdXKb0sIt2GRYU
 qNqp4D2JV0yRn5jP6P1N4s0IuMOIo+kaNDYel4M0/0WGiQZ7sz0DsYyrm5OAefPiSdDUmlfK4In
 SljngKZCalU8Y1CXMMqGwQDbyo7kpxlSIfS9V6FwF1HBelBf22+JLnmzcGjTU/h+BdDo1ZMSMJI
 1ZizkI32AaB+Bb3LR4uJ9k+kRj7ycOL42haEPD8jAlvNf0bk5vcB5CAHsv+vNMuBxcs9IzGz7Sf
 tPGv+MJceN0gkeYo8A28ue31T5UviX8a6uSse3zMnOPBZyvq+xAgcuyI589k5U1hR9U6vWk+PhU
 hbbLmGqU7OLjim7Mgpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_160718_503111_BE2E3737 
X-CRM114-Status: GOOD (  16.60  )
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

On 9/26/2026 5:12 AM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b772181a496e..f84f1828275a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
>  	const int size = 32;
>  	int num_args;
>  
> -	if (count > size)
> +	if (count >= size)
>  		return -EINVAL;
>  
>  	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);

Documenting this was reposted as a standalone patch:
https://msgid.link/20261003095913.575108-1-yaojiale02@163.com

I'm taking that patch through the ath tree.

/jeff

