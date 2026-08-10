Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90257C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ndecEpN+n0XznSr43JboGJpcwJUV9bTfXnA5oOtPSY=; b=fuy/4vopA1jWQqyLLxdNJ7aIa1
	EQVkjgW+zijnU4JU8jlFhQu8yVhPRdPsGWNvcXVss+vHChI/ezTS/UEoKSArAkWgDeAFE7Wc3YBpw
	BMvHBYC7gxXwQ0rpfWiYJOoErfUkfpAOaU/pw8X3Ewdf6Z/AUvNmmBrLvL/jPWFbovSc2lNVRioFS
	qPRbTWulgH93J8zpdrGyBDWDRzLOv6Yn2FA7Pw/FBs+CwBs45bph9YYpBhvLEYb7PTDaG0dqAC/Kb
	pQZDcplcsDpqDYNZfX2352iNVD/tSVqnXrejExyGxMNHCRchqjuTt6moj5IGLfdP1muhRk6uw3uHk
	XetH0G3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN20-0000000BTyI-11RV;
	Mon, 10 Aug 2026 10:14:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtN1y-0000000BTxk-1eOO
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 10:14:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SBAH872890
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ndecEpN+n0XznSr43JboGJpcwJUV9bTfXnA5oOtPSY=; b=RXVe7XjTUaBgAQHL
	hi/tmi5wGaZsUzEmogZ5aYQzNlRGUz5RYuWydRzJDF7niW1PVB2XXioXy4YhzDsy
	9+cJbvxnnLVm+KoRTA2r2wJwPeJVdesREIIg2OvZJkVWfphJOMT+PPqqRyHJnOC1
	/+HOOHXIvkf+rtZki7PcLbbVAR7ApUFZGf1iPlf2BWTnXDx8dJdaODgYuX6Twmub
	XrF+GMStT8pPke7E/BlqMiOYnA+k0ESGQUhsfNBvk1lTsnpmm9HvZv1VM1me11oN
	Cc2T3Vv+L6ugVLOYhmO1aVfXjG+GH50c7NT4R8iP3GIIdpnW66ESGei7ADcaddVM
	0xFtIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v58xuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:14:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso35362435ad.3
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786356886; x=1786961686; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ndecEpN+n0XznSr43JboGJpcwJUV9bTfXnA5oOtPSY=;
        b=PwO3pKr5C6+OZo6LZNA8z5qhLBJUXdG05WJ9IZHf8ZpJUzqET0VH1PT7q9iLAhT8WI
         wseLrQbBhFkkI32j2XLBNhpa3TzmISINNzqy88HQR1NevrrZqhfcvNHYT1d0To5afCzH
         sc0yIFIfl3STg/McobKqHNTnkxG1B65fs6uYP33TVFWrGMk6aHTX8h4i7Xji5M52ld+4
         LZNn6VCzQaDKJw1oib8vitav0egHKrXAd49FrcDDhtYNKWqJVwxdSPCbkfArWp/qv4CZ
         PqGDHXXGciIFUOVqCgY5pZN1O9U6Iew4cIZb1KyCUTuDoAkSmFeUHskZTKWQuYbAsLi9
         9KRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356886; x=1786961686;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ndecEpN+n0XznSr43JboGJpcwJUV9bTfXnA5oOtPSY=;
        b=ceMWcIJj5hBeYZofEzW9JTH2n1nzEP/BswBcBs9yDbTTeBncA4nvSJDtM1dupyn2Bh
         TBBOJuaIqYzSjlFgzzcRZUY5uaGP6n8C2ARhneAZoZyY6U7B6g15GecWPiyX1OTmWsSl
         ZvXrft/mjbmVByRGnmie2oV3Id/oQ8fu3CndnZC2icCK6qoHFAsxXF+Qm6BXgdWmUYyH
         4oeydWjtquXm6xBOXz967aMEBJeHgrquJ7xQ5w0Bc9WIUlAqh3qxoXom924/J20Yf0Ke
         ZG4KHvLLJbUcupsdSjMayufV1aozVPym++Yx6ssK/to7rmoDY3vU8WZjaKt3fRNpnkgU
         V0qw==
X-Forwarded-Encrypted: i=1; AHgh+RquNrettzxXKe7WP1nkFrGIHcZv0Ny+h/5SKuEx4BG6vnrPpRNb7l2Yb4nQLcpZjJmmUz6VC9w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxO0Gw8ET6hkS6At7w/bJCTF++scY8WJXICBFGbquZ0PZaPFJ7N
	QK+qF6kjryd1QvjQIwOuGpoAs5ZH5D/RKKjZe3tB3wOYvziIiib9tXR9vCM7eOnNDvU25pZil/O
	d0hbjsbmRtn4d2gh+zoDlKoEYzMsqmgJ8Azg+lsN2UH6ljOx3D2u45z37jUq4uzLD
X-Gm-Gg: AR+sD10pijJT7aDcnD5uQSm3XDzWZ0I62Cbzn/lyUFoYZWM9GwS96XExYeK2adi6Edt
	sqpzVv882feZflKi8QYulzKYd/Qk8HtNjqsdV3A7eE3FnDUkhoW6LB5o93mPIMi1Bl8KYNaC2xs
	QMhP22TWnDOvfMUXRx4kYgL4m/NOBPfAbvqW0jQdE96go5u9IfHKOt0x5f9R55WAIZYJlSlmCnC
	K2nDshI/Iiy3YiE25ZovISiN957H0IGRqSe+RmYQQumi0XfvCWVDB3NzpfQZfQSKGgNFt9dMuRR
	AeJlt/QU9Q4jM+EqdxxS90WuZTmyVSHR6ED0+AAQ2fcc2puXEmCTwviQ+4aRwZQ/qEJ4j+YmqfX
	if+Qqc0o1IHnFOinVviuJMUCn/C6Ub+2JA8a15qJ6
X-Received: by 2002:a17:902:f60c:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d0ca7835a7mr500883695ad.16.1786356886369;
        Mon, 10 Aug 2026 03:14:46 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d0ca7835a7mr500883095ad.16.1786356885898;
        Mon, 10 Aug 2026 03:14:45 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8d6074sm44784271eec.12.2026.08.10.03.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:14:45 -0700 (PDT)
Message-ID: <59d20ace-66cc-4a0c-a09a-e669becd2657@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 15:44:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
To: Linkai Gong <gonglinkai@kylinos.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4OCBTYWx0ZWRfX7meJy+eFj49g
 4gibgsoc0Ur5LcPMkXuTZIJqb8lqX+fPdjri6plI+2kywLjOs627Rr1YbHzgUtukEhMCO2oeAdV
 ugGYj+euXguseTvMTELwNX1BGJFGLXk=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79a49c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=m_MqYSANrp1KMMaA_BEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: R4BdNIi8ACyGZwHUrKXR0PJNtcC6bU2m
X-Proofpoint-ORIG-GUID: R4BdNIi8ACyGZwHUrKXR0PJNtcC6bU2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4OCBTYWx0ZWRfX+eSMo43jYagf
 sqWUsqZuYWnqcXKMKUbvWJCtH9Z/xMi75koNq3RzkDZ1kN2yGvQmg8+TgXXHfrzXEf39abpsCPR
 35o+OZBOR6t69XKWrjV6RvfKJ6dJA6Aw5fIrxEUSTYoI5sqXE7OCBPGyO8sM7PkkgpOY1IgkmWu
 9S5IDKKTZbBDuoDqSTVrpNfs/6n1HNfavrIREZ9HiRr3v5FEBjN2KgR+G6OsP2fKRG9sr5dXAkj
 8xAv3VrhyCRJbp6wNCStwUTuLhFZWWR/2GNo6RxNHuo5VYWK5K9mMLhCWDA/TX/kke0//mKtT4y
 e+9LDx7oaDbTiI0//oYT5S14Y+4XTmop+jn0181uL6JzSLhyj+ubNeAh3iMPAvBurt24G4aa1Um
 G/7tf9KZYu+1J9OGcu6ysawKhg4GofBev8Wj/QACFrjCGa4Ye5Btgq0yJFp0XsOIl3QBcZYNo38
 sI4F/nG3qPGG4NacsSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_031454_464067_9E4A2D12 
X-CRM114-Status: GOOD (  18.08  )
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

On 7/31/2026 3:08 PM, Linkai Gong wrote:
> ath12k_mac_setup_channels_rates() frees band channel arrays on failure
> but either leaves the pointers non-NULL or clears the wrong band. Later
> ath12k_mac_cleanup_unregister() frees the same pointers again.
> 
> Clear the correct sbands[].channels pointers after kfree(), including
> a copy-paste bug that nulled 2 GHz after freeing 6 GHz channels.
> 
> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
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


Above two hunks seem to fix older allocation-failure paths which
already existed before acc152f9be20. In current history those lines 
blame back to d889913205cf ("wifi: ath12k: driver for Qualcomm IEEE 
802.11ax devices").

So this probably should either be split into two fixes, or the commit
message/Fixes tag should be adjusted.

But unless there is another reachable path where these stale pointers 
are later freed or dereferenced, do we really need a Fixes tag here?




> @@ -14365,7 +14368,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>   					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>   					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>   					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> -					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
> +					ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>   					kfree(channels);
>   					band->channels = NULL;
>   					return ret;



--
Ramesh

