Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FC3C5AD4E
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5/9h6TwDFEnLhuVtmJol2cvjCYtLCULJ7w8r4LoK4M=; b=XBwRNB7NX69JR5Fa8e0BCef+/v
	xhoZ+TbBiCC/Hfc5ESS1TvRGVs5kBdnO67mvmzseVryJMZV24ul9loYRWR1ENCS9TxJN7J+4mdiiU
	AvpkuPnBq+OvPBKFt7wMsrvbfN4nYtSU1E3sStEIw81ddbfy2ykHGfxR7JPZpszpRlTKlpSx0EOy9
	G8QhNQ6ZalgPovWoBdruuAAwP8x8kovFRdgwhsUsHGf/TSGx/0mJ9cNBv/RdmAF4skZ9omOJ3GNHI
	Rhn00jvu50pa3qviihk8kuh7slB4W8v+vIrodW+Zx3oDPFXo+0ittP6jE6l2DsJRtHvOT4iNjuS7Y
	LXKrM0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMRg-0000000BQ35-3ZdS;
	Mon, 10 Aug 2026 09:37:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMRf-0000000BQ2V-0CLv
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 09:37:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S70o890382
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5/9h6TwDFEnLhuVtmJol2cvjCYtLCULJ7w8r4LoK4M=; b=Fojhgnzfc2Cb7AbR
	NB0mRi6OjW4ePezuAGbnc4C0mv9B4p/dKHa6TdCRdplgSN13BjBn40bakQyH/Xr1
	FycpwyV1BQbBNd+EUexLDQZjVzQ1ka35uomny6MF6IBZn2yNHyq4dZeSQsCr+n4V
	M+G3eZoVjtNWTQLU3x4U4ls3FXdM8hAfiInNjJiljxSIg8r57ETW077H5ettMKoc
	UaVD2j0Ekq6scA+Ne8Yhn7VWAVGKa0MG8O/p+X+ps0BR3qydCd6Vcr1bGqdHU38I
	tMF8ErBXNgTIMSnmQ3FxAZXxKeN49i4fpqa2q6kqwO1KCtI1b2izoExxCaKifORM
	GkR/6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v48qyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 09:37:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so3048885a91.1
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786354641; x=1786959441; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5/9h6TwDFEnLhuVtmJol2cvjCYtLCULJ7w8r4LoK4M=;
        b=HR0UYRPsBoUbTf8mugKaB1cJrqA/Pk0aokxn+OpmvmVHGR4rX+MvHb6YBVT6EeNdO7
         Tm1IMqGzaf2JHybYFKha5460OWEL4RqZmE2dn2c4t4uxqwIeroMrPUkXT72STw8qwyNe
         wG3bnEJsSSqub70xeGE2NlNYG+TXlSyG1TiqgKviFM/7NFiQeWVavF8nM35uf5D1i44v
         FLQa1RMu2gV3iM+AykJqZXz++Pirsp3n6Z6GGR4q/5K1VYmNIPUfxt84FYA54qXymEzT
         ogcAR2aiynauWFSN+1g+otfHqEHP2bsnJHpaAkolXTeXoup9DuQ4ieIK/9zzZk5VtMjG
         x7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354641; x=1786959441;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5/9h6TwDFEnLhuVtmJol2cvjCYtLCULJ7w8r4LoK4M=;
        b=TkvR7ZYC2s0Q+c1VeL7B/+e9z21+Mz5q5vfRUYt1bHWE8jeAotV1uFmJ5iUsqD76NY
         hgkyRWdjn6WEYRw2mfa/Oi9tCLuw5S54YNE0vwI+n+tSeXRgIvuQsnot+4qzShEYhlGr
         3vNKDTnXmjRyPrYWWx/g7zz1TTm6Jl2tvgVOiVM4/lLoF3qpA5qGHAh9148Gwrofnwsz
         NWP3F1e+0G/1ncu5g08xOiCyuGIePFpHLvQkvD00fWuKTnCC8obTJe3VM2S+S0KTF+F6
         cF2r8QvcYs1olvFJKXZZCQDHJ/Hjs/KG6BrSSBDlq6ODIu5byMr9ZCEdyGuZ1qtZG81B
         KL4A==
X-Forwarded-Encrypted: i=1; AHgh+RpMXs9V4c1byQsZblT91A7WwnQzpb31qRLvJFfNSje9I5XPfZWeQykG8TEKbTqrHqLjrC240/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLZQ6vUD/gNpDpOB/g5OwAlhQQ5J/F2cx611pKBHTvQrTPREGK
	TdhLT45zKYFb5OsHAY9YQ3yUhotRKaH7ZmB3AJoI1LnpLEMa1D0hhzDORyu9dzXrmNDb6wsnMnX
	lEcBkOmyfoVkOtzBi8Zp2R4S1eIA6Dw8NYGmleru0+/4vDF5+fSKXJvKR1HkfoLND
X-Gm-Gg: AR+sD10XaICvw4gLejUkJCtRvjPsgzggM0WGfYtfxlCvPDqvdVaXv0Bqgv3cOl6h6RC
	YmuMvSewDPDHbFe3u0rDi5JW6szdt3TIlBpfPUf0z/ViW5kQz1Dfp9rQPWi2MHGHHYOxi0kUACs
	2mc6r7tZPB84JoF5/WEOmMQwrIsb1PJXZfbL61lvzys+lJJO5y5W8UGdAR5Ao4+tBcRjwlj9A5m
	AEVDYq18l5sHb3pX2KfmXb4jbBtE+6n4EneQMDYB9irBm1OR2JmbP+yrSnf0wCJ9KRB6FgJPEe/
	q167wUVXWTly2m3ca9HBKZyqieFTEY+KQUAKOYT1fuMAelO0VqvK/4rndiGV/KE85QXw8O+W/83
	V6xBF1Q7QTO3/VOWl/hWYyFoLn0wUdifVGEcjAQad+29Z7m9R90zsj15FQJ4Vwc2MjCJi74GL
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr43326183a91.4.1786354640872;
        Mon, 10 Aug 2026 02:37:20 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr43326144a91.4.1786354640404;
        Mon, 10 Aug 2026 02:37:20 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dab4sm12066088a91.3.2026.08.10.02.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:37:19 -0700 (PDT)
Message-ID: <bd5db1a2-90f3-4cc9-8cd8-c18499c56a2b@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 17:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
To: Linkai Gong <gonglinkai@kylinos.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260731093816.1771338-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 48aIqrAclXbZPkCfVtKtjwcRI_V7JjSR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfXwUiTMlFEdMwQ
 uuiT268uGOLUTHG0MfHwZBMY6SFq2fYUutpdxNvh00EmZWE2v7ivJNVlvkhsg2rD7hXKXDpyqHD
 he6UKQAAKLp/f1sF9lSSMvlxIc5fc2U=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a799bd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UmHtXT4VRqcp-Ls_mGYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4MyBTYWx0ZWRfX+R8cx+8/Rgzp
 cdx7iGmzO8oPy5TcSaWxY8g6q1Ze7YQEEzW69E32mE12IihxApDLu1L5m04lfzluwkw+FGSR/0i
 sm9pyAERxPFGnkHoNvLwzePs1QjBM//4/OYlhlplOhwDseYofeCbE0p7eJ1FyyEHrQeRYJuP+/q
 84nNIGpXW1/UWKmcgAWibKB9JaTPCWim9v3zulccQ7UR/d3aakaNeSYF2KrqRHWkKmtddScHosw
 UcDMts2kPGW1+KMbRgksyMmgkqBUx+dMAIYppFY/CU6iN0xitVoUBEiip2hSSKKMWUovqXlDHXS
 EhfSNvCu8b359OyonxGIH87o9VuiWhZ3kNznYo5SjdKxUQxHPw4/8+0MzKCd7CKbIpunfh4CsRL
 vK1uFELiEG4sGR/zWGQDf7asJC8jGzXDCy+h/Oe1VTBOEgxPDOJ9SzMXV68bKl6ajotoDQRQ+N2
 oDrOzvWYEdg5xwST17g==
X-Proofpoint-GUID: 48aIqrAclXbZPkCfVtKtjwcRI_V7JjSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_023723_200903_D9D0D123 
X-CRM114-Status: GOOD (  17.42  )
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



On 7/31/2026 5:38 PM, Linkai Gong wrote:
> ath12k_mac_setup_channels_rates() frees band channel arrays on failure
> but either leaves the pointers non-NULL or clears the wrong band. Later
> ath12k_mac_cleanup_unregister() frees the same pointers again.

The radio that frees its sbands[].channels inside setup_channels_rates() is precisely the
one excluded from cleanup_unregister() — the loop is for (j = 0; j < i; j++) and the
failing radio is index i. The earlier radios (0..i-1) all fully succeeded, so their
channel arrays are valid and freed exactly once. So this is actually a dangling pointer
issue, not a reachable double-free — nothing frees the failing radio's pointers a second
time. Please reword the message to something like "error paths leave dangling pointers + a
copy-paste typo; harden by consistently nulling after kfree()."

> 
> Clear the correct sbands[].channels pointers after kfree(), including
> a copy-paste bug that nulled 2 GHz after freeing 6 GHz channels.
> 
> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index a0928890671a..5468a8d2d5d5 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -14275,6 +14275,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					   sizeof(ath12k_6ghz_channels), GFP_KERNEL);
>  			if (!channels) {
>  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  				return -ENOMEM;
>  			}
>  
> @@ -14325,7 +14326,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					   GFP_KERNEL);
>  			if (!channels) {
>  				kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  				kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> +				ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>  				return -ENOMEM;
>  			}
>  
> @@ -14365,7 +14368,7 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
>  					kfree(ar->mac.sbands[NL80211_BAND_2GHZ].channels);
>  					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
>  					kfree(ar->mac.sbands[NL80211_BAND_6GHZ].channels);
> -					ar->mac.sbands[NL80211_BAND_2GHZ].channels = NULL;
> +					ar->mac.sbands[NL80211_BAND_6GHZ].channels = NULL;
>  					kfree(channels);
>  					band->channels = NULL;
>  					return ret;

actual code change looks good


