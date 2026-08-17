Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11490C5B572
	for <ath12k@archiver.kernel.org>; Mon, 17 Aug 2026 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYIbWS+0szvbHvH1b9Rs+RyGOF4FPIL5Yrhzv6pLsEI=; b=LZgBP2DKIqj9a2I62/q2iEPj3I
	yi4zygI/Nk8QUG3Bhvo3d0mcM7r1xqsFeugO7rpFzLXPsX+UTWswT+vmuXY2DWhIIoyIOsKorUUIl
	AuW8tlWOMZBQTYr26C1BKzJ+sSrVtkdU3SGUzNMcdApqjIjwQ2KekW/XgRMXvzFo08KlnY4tTb0XP
	K7kIGzq0hkUQ59lqUvuQFa4WwwLJPT9jXhzL/SHL3okH7aUY0Ip1qFSM8U0vCcwMcQYgNXoKkqkGd
	V2GN1waAQjqchjNdrAaboFHHxLm4MfHZiWhtE7HOx2O3pEk1C4IPkTrawMFdbOKaSON13oI7saYVt
	L1MrrNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvotD-00000005Ouv-1GqY;
	Mon, 17 Aug 2026 04:23:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvotA-00000005OuG-3Lns
	for ath12k@lists.infradead.org;
	Mon, 17 Aug 2026 04:23:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H44N541175217
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 04:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYIbWS+0szvbHvH1b9Rs+RyGOF4FPIL5Yrhzv6pLsEI=; b=Op+sgt18SxoJlgUQ
	jIF4dtjcFLc5NwlJUKY/R2ChMCKcrS4epmYaqEvkzdP/HbBGTOe4JFqK4+l5NTP9
	wq7uRpyeoOeDktGnA2rGi5S2o3a68XPIBUWDtqqvGRyvRllInXa9Vqy+cxwzUuoJ
	rpkNIMQq4lJu9Lgzfu8oz+O3vkKTlV1lYX5sHNCQWKmMzb77YkK76OxIYhhDzPX5
	LyOdLkzX2eQlg/4LGIkNjoL+pvfN2b7xdV94ACiK11eLuYcvCTF/SG1fOjI4iL5V
	2ueUPZgR2q6LclWBo1VRbYwKUZdTNa7TLXkbQiFhskcU1uzBHQG6B/iXZ4WSk/mm
	ikDhlQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txy81nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 04:23:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee5bab340so3970426a12.2
        for <ath12k@lists.infradead.org>; Sun, 16 Aug 2026 21:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786940635; x=1787545435; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYIbWS+0szvbHvH1b9Rs+RyGOF4FPIL5Yrhzv6pLsEI=;
        b=YSc0/FNnHTMBlCu0aEKtwewBRT+yAqxVxcXAk1xDK4f7tJuANcHnH/r1H1eIodJI1F
         /N+xPCT+DHqHOSp/8WKWqAFP8gNmBMadIYhSGbzTTC+cvRJkSYRL//Y8jV/7p6ZBW9B5
         lFtwEMys/D26TEbvfr7dIte6WnwDLSUnbiSVx1Suw1U8tiPzze+rVchGeCydgTK8CPeY
         EDYc6PnrS9F2NzEaXUovRqWTYnfJdnb6CjsuTpagtntZrWXmSpc3nxiB8yqETm3tqtRI
         HYZVluwd8oIZeI99e00AYB9+xIlZXvQKtJ92kTYSvQtyoZe5RHKiZ99BvVDCb7VGIFNV
         auFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940635; x=1787545435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYIbWS+0szvbHvH1b9Rs+RyGOF4FPIL5Yrhzv6pLsEI=;
        b=bVWqGs9SOaj8kEaoLLIyOsYSqXqy8020BQebHSkpogMbkGSqll9GGD9uCBEJ2ia6yH
         5BigjlK13K3hORChqb1WK2v2isvbHAobEnNn9vBuV++z+J03tE0LeJ9sryDN3VF3gmQ9
         +T5dA1cEsni1xjQMwzYGu04rAJd87EzxbqZ4QjorrAx+Vw0QrxudyQn3hHU0pl+bTPUU
         Zt8VYacKIgTXF8qunWrEbmukamzyDNYmLd1JvKkgBiDQlMMM3jrxNfBGLfnmZk+YsOHj
         FpK4VJUziz1e5BJvNQb5XbT/Ov3q5UrITmM6wpbyzdrwcmA5gRRDYb6uQy9qnihkz7bM
         NZVA==
X-Forwarded-Encrypted: i=1; AHgh+RqLgXEqvMQ1N6znpOKyF4A5qBJ5h86gnPx8WiBmCnQ5BUPQbQfbrrfnyTh/jskRU2escH+C2U4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg/N22XYjYVnvdRKgBFNWXkUu6GshonD7plwBrFehtY02pzSEw
	5KnA5l6LfnGTcyQijWpoejCFL+i0TfawF/s9KG2vdslTqvOHmxsOOkLibNvON1M/Q1BMlZ5Ujfw
	pk2mlv57ub+DUfydQWWUdTopBqPpY/Bgs4dphuZMf1rjkqA7pPSlPvot8dFISGmJ7
X-Gm-Gg: AR+sD11OR5CmXV0swYD6T40ydFo8L93NmjqbPc4CVP5BoLuRdlTJOAUYCZXLGg6IjWb
	SZrr0dC44Gb1cFszXoqmi3Jt8tz7mlvqO9NCiZyVxuLneMRooKA51nGvIYETMGxZ26H28ZX/fhc
	E/RasUEt6YUyxDAnUUDuveP0Jl+ZBPrvAQ18hEXi4oCwj7S66oNddAJbShaoItoMpLkDVAPQCaG
	9K7gt+NEz52BxFcRLHKJpZkaW5xQWlgQb6MSSBYaXCkYyyxB+zS5WXmR0GO8yIQvp4aANi1ecr+
	02wOeEV+YKqRyXZCMicPZlfMBij8IFnv2XULma41HKONu4eYW9KoL4rvaAgJQsAvayDuySTsx0H
	YCUmm4gIt6RhajoBhKw2ilOY37fgUlHoCtuQ3AdnV
X-Received: by 2002:a05:6a20:4321:b0:3cb:82de:b952 with SMTP id adf61e73a8af0-3cc71a24c51mr23219954637.2.1786940634968;
        Sun, 16 Aug 2026 21:23:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:4321:b0:3cb:82de:b952 with SMTP id adf61e73a8af0-3cc71a24c51mr23219926637.2.1786940634486;
        Sun, 16 Aug 2026 21:23:54 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e272sm1281142eec.17.2026.08.16.21.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 21:23:54 -0700 (PDT)
Message-ID: <6559e362-162c-4046-9fb7-947aa8a8a228@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:53:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: clear dangling channel pointers on error
 paths
To: Linkai Gong <gonglinkai@kylinos.cn>, jjohnson@kernel.org
Cc: vasanthakumar.thiagarajan@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260811020523.387433-1-gonglinkai@kylinos.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811020523.387433-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX1jKHqds9woSv
 Dhiy6On4xOQpCKlUEnRbMctHQ2RsDhRJ7zgx4kBOuQg++y8/ydykA3vG4NH1dZKGU2WEP9OixuD
 gN6Uj+0CWGoXy63+tCgQqPJytN+m1xw=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a828cdb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m_MqYSANrp1KMMaA_BEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMCBTYWx0ZWRfX7HBp8Yk9Lax4
 XwGzv2uwNl6h7IUVOUWvVKDyaonYO3lv+ek+njrYrCmRpCS2JWG9/CywUqfdMk6KUqeC6xiMEh9
 F087TXKSThGHDnR5Xoi23BE61nudgfl6SUGhHoHUsqZLRBx7Ls8kNgnpSIyY/L7oDkqKhv3hTBc
 HhuudtcjSrq6DGInid60522g96omWpGqkXEzLxkw9rPN0HvoX3EPauTEj1D4FHVexQIF78P2p+g
 Z0pK8Ppux08f4eiJOoVfC9r+mO+hwRG+RyxL/cJABxF3xAb5Gvpwpe8bkLxByxv7DGkbHwRQbbs
 Tirsm3cb9RoFooKpcMhCcxwyNeA/8U3+7jWejjQoRW+agY8kKcGXIy6nBWqETAZ3Gd0z4c2mhhd
 FGKcNEQIk8fVKCsIvWE77/6P3mlyx7thG4y1YyjO3GPYyugDvQ7WdDa5y7jPVE175EjOImBpNUR
 ZfrHfa03GGh3jgg4zUw==
X-Proofpoint-GUID: VUD8VA5ILAYP5uE4T4gTp3Xc5rlhvjv_
X-Proofpoint-ORIG-GUID: VUD8VA5ILAYP5uE4T4gTp3Xc5rlhvjv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_212356_873292_7A1DF1CE 
X-CRM114-Status: GOOD (  15.44  )
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

On 8/11/2026 7:35 AM, Linkai Gong wrote:
> On failure, ath12k_mac_setup_channels_rates() frees band channel
> arrays but leaves the pointers set, or clears the wrong band after a
> copy-paste typo (6 GHz free paired with a 2 GHz NULL). Clear the
> matching sbands[].channels pointer after each kfree().
> 
> Compile tested only.
> 
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
> v2:
> - reword commit message (dangling pointers + typo, not double-free)
> - drop Fixes tag
> - note compile tested only
> 
> v1: https://lore.kernel.org/all/20260731093816.1771338-1-gonglinkai@kylinos.cn/
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a0928890671a..5468a8d2d5d5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14275,6 +14275,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>   					   sizeof(ath12k_6ghz_channels), GFP_KERNEL);
>   			if (!channels) {
>   				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>   				return -ENOMEM;
>   			}
>   
> @@ -14325,7 +14326,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>   					   GFP_KERNEL);
>   			if (!channels) {
>   				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>   				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>   				return -ENOMEM;
>   			}
>   
> @@ -14365,7 +14368,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>   					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>   					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>   					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> -					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
> +					ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>   					kfree(channels);
>   					band->channels = NULL;
>   					return ret;


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

