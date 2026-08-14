Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED9DC5DF6A
	for <ath12k@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv5W2yYX4quRxCJ1N4tZLLo22II075WOBsSrcOE1tuU=; b=KfcdrRmrtiqOAkMjAod70KTW18
	NxYVf5cclARLliSuVGjQYjQdrLzztSttejSFVLiq5TmrrCgvNzw44KKhRSyO+qRPtSb8rmp14q4Aq
	2tpiBfFaqP/nmRrZFMnV8hI0OuZzfz35P8OWNe0JzO5VsgWVe4QpukvYEC5R4PNhV6sZl/MlUdZMY
	hVYmfZ7d3bJiSY5EThMsQoCoSErB1p3qPfmD61eldr/n4H8LgE+tp4gjo4UapFDbe7P54sUrs0WT1
	oYiueorjRSXCyvQN7vMekZojQleQfvS8UJrHjUQY4Yp83aIL8QG4D3r8M5Ixm1cr5Ja/eOjdp13lg
	Ac9lzkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvY6-00000002yUw-0pL1;
	Fri, 14 Aug 2026 17:18:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvY3-00000002yUS-1zdz
	for ath12k@lists.infradead.org;
	Fri, 14 Aug 2026 17:18:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGi5lB2210473
	for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 17:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gv5W2yYX4quRxCJ1N4tZLLo22II075WOBsSrcOE1tuU=; b=OgDEK+UolCCSGYvz
	ipbRiNc3GilioDbbsXShI6CyAJfAJAQ0Ebb2zcruZU34lVuwCF7+IKZjV5LkHxJN
	IMOTZBPcMkfdUFu/6OSFdTtZt2mHpC9lpFxJBISfcfL3lFQ/CxV/p54C3G5K8hEh
	tiqqA++VwelsLNpmBqy1Cv4xzPpZdw4eqa77Yc5huPoMz7TH9UmRxxdosXwaKGj1
	ZShwN+96tsrxodIrCmVbsM9Q6pcvQUmgZnGYiSKh5EOXc9Yveu+4/b8YsZwFSdiX
	pktkeiOW9q+cfFjdcNNs2hJTjAkHS+VGuquQnb3P6gnsArcqn/3ZcbesaLvZFJhY
	H6BDAw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2063a1b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 17:18:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so13484735ad.0
        for <ath12k@lists.infradead.org>; Fri, 14 Aug 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786727905; x=1787332705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv5W2yYX4quRxCJ1N4tZLLo22II075WOBsSrcOE1tuU=;
        b=aeqKcTtAUB3HyIIsudjph8GeGtqsijmRb24t2w+IFTtdOHrO+Jt9LV2nmfFToSFCkz
         h9Nu+hKvjO41RQUH4E5vwNTsrbT6Gvz3pf2qqz2EmqiT0rhAtt/2eeGOwInntzoma89q
         7mSyuy2iRzgcXh6FI9XQj9YKJ9NA37tK6H2Wls1JbBSy94A9hrgSygFYXgi+MGaZqJD/
         Br3qkMzMVX7LTdJxsbSGaACB/Ql6TIdKUTHgcuZQf75f0A1gOIFbLBb4MGG3kiIvk1mH
         WhfwkUHRfiVqecDpHqWRLHxyjHO3uN41TYFKqHHlGBLD++FpXKMtGqljVg/L8STm5PlV
         jnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786727905; x=1787332705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv5W2yYX4quRxCJ1N4tZLLo22II075WOBsSrcOE1tuU=;
        b=YDn2jNuNpoXv0+d3nG2t1TTeSwhO8CF/8qaL0tMZ/6y3wCAEjDxvTDubWEFL5BSd4D
         bfn5slqtg7zu3crmbjJUT9PZXeScmSaJqUTS8ImqP9i5k/tu+aj5rTsoL3+dBmJMrhsQ
         OCsIIDrv3TdHkxzfCYYwH6gYUjDrplLggusjl381KPrAc1V6giqKar5XNKo/z8kNbA7I
         6usgcz0kDrcyehEShuByHPA6mtyYEUajthc3ejz1bV/WNlxPixM049xT9abCH95Rqoeh
         ZtFc+4wWCA6uHxtVgzGSv6/Z3gNFf+VzHDE5cTNCuOnqrlRaIQ5UWE3YSWi5C6EeqjNw
         WArQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtM4Bnp53LRMCCz9Fw6UXGeK2fK/qyb1tPJpvd+PMKLg1Oc3MUTcDQgH3EFbkW4MrgJM5+PgA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4wC8Iefnthy2I6ooKNNXQjZK5Qp6FLu0xYlwrAEBCWwTFIGt
	zq5squGPFuLQnV2CrcmNB6Fr4O2iSa1XI8QioLgRU70ISvpJLuk1BrdTIgqd7G/WHi79Rg7cH6o
	xkw5cZaJ9WitAZdPmpLUBvTXcbDLuNRXs9amgWTFrmCl8KRakbLvt9R5EISh5zIdn
X-Gm-Gg: AR+sD10zg4tdUrMlgyY7MWk7smu2/FAhPYNY6TlP0WBZBg1jcG49FV0dNyvHNLFDVxx
	TXrLIHn916I7I04hcz5jQVBDgFo6/sxOn5bwBp52AFSjKaacKgBJ5rhHvdKs7M5ontdoGt/NP2x
	Kz8nVL6wDyuSJU+I/jUMPn914fEZL6e40dNJIt+oNEG7AazCIS+k4cKMzgdPFqIndLD3vsp12oG
	x2ba9HsuMdATHB8X5sqL5W0nyv0f79EVkGYMWOPt0fENMY/N+N8jFO2O2XY6JEW3vgktVR0k5Mb
	mPfA8hsEQj8Wi5WK4QNfI9PDviRHbdLqHtD3ONIYtN7bkBR6mpHUsoya9hfBcB5T4C1eYUFM1Sn
	FDXp3lLyj21XGFtNeMtb+Mg+9pppu2I4l750bb8Bnt/6Wa9/xztpK0zGKMzsx
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr7984732a91.3.1786727905142;
        Fri, 14 Aug 2026 10:18:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr7984665a91.3.1786727904675;
        Fri, 14 Aug 2026 10:18:24 -0700 (PDT)
Received: from [192.168.1.20] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394e921709dsm3300855a91.0.2026.08.14.10.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:18:24 -0700 (PDT)
Message-ID: <edebd957-79d2-42aa-bd15-878f2eee2a35@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:18:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 6/8] wifi: ath12k: track per-ring RX
 sent-to-stack count
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
 <20260810144444.2033607-7-pardeep.kaur@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260810144444.2033607-7-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDEzMiBTYWx0ZWRfX6XiuJK7UuxJr
 vbe/WsMRfoVeUIInnDMoeua3Er9+E9l6sJynKfQ7ggIWtKbuO8OP6m+IJCM0Luuuau2kZdb0723
 bZKfS6hWR9RFy13IFQs6X8awuj89Aow=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f4de2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RhLGSmBNoTyMoNKgCAMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: eBhvSUWWnnNyW2L-hF9bmqc3G8wW07LL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDEzMiBTYWx0ZWRfXyxaQ2NzGawnm
 3v6l8+yDnr1tsjc8gQtPLkJo1iQetfnjAyaOUSCTi/qsS82wYKCV3HqBcMmTV56BAxfPhyRjvIV
 Ue4nIKQ1O/8BmpRvUWEXlzsF3ZXdB8l29+yU8rVNk4q/ZgAchbWbo1FzW54mOcd3/mOK00yhBAp
 N+a4lfvlAALkdM3h5b+Rvkpo7S76a33c9DjoryTlk72NrQWxOxPntI0GwLLptAM9AhslEQO/SnX
 8mGzKjgoZBVi23k8bf4q9EjzQyrVp8r8lACOxCbfmuSbOWdL61JiT16h0wmZfbj8ZZV3S+jJhpz
 4aN5t3pGX1alwTXqm7+nnXTgEe0di6Avk62TylSijubBPJNX5Vhtz4xbhhK2mVNrkVMOYZjRvQM
 NsOgwcL5jo5YxYddUKsBmsZ2vUt3F+intvltBCWD/Zftg+ue6ar0ClUunSBbSe7Gs+VLciYeYWA
 9GSKi+0Wcm2/0FEtW8w==
X-Proofpoint-GUID: eBhvSUWWnnNyW2L-hF9bmqc3G8wW07LL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_101827_643087_C58E9369 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On 8/10/2026 7:44 AM, Pardeep Kaur wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index 34c605b609cb..55e3b411d108 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1122,6 +1122,16 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
>  		len += scnprintf(buf + len, size - len, "%s: %u\n",
>  				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
>  
> +	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");

My review agent notes:
**Missing colon in section header.**
`"\nREO sent to stack\n"` is inconsistent with every other section in
`ath12k_debugfs_dump_device_dp_stats()`, all of which end with `:\n` (e.g.,
`"\nREO Rx Received:\n"`, `"\nHAL REO errors:\n"`, `"\nWBM Rx Drop
Count:\n"`). Should be `"\nREO sent to stack:\n"`.



