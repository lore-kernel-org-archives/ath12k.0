Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BB1C88E42
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 06:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhYkT4c8bqYuaFAAd9Og1qwa8NpefLNuln4Q611IPFo=; b=hf9hjKeDS1RHuozZqjJoVQhMZw
	d2OHRyxtaQlS87yYED+7znK+AjTwKGAMicrvZBFwTbXmgYm8EVlA6b9jKE4+woXMkaNdymN7+WtYm
	ByVAiwOojhy02jb31IU4OT1NrXQKPCsyGMPLXKM818q6o1gyp1eGgDbpDOOp7jqF4OlYkZ9GtmPex
	rWvH7EXyu1ppvycic5Vsd00vIYYf5as8a5dzMme/KpffQOy+kT356xrVMLhdmaNdpwnL+Hm6xU789
	CZeny+UHtDOpefr6m/JP0bVhjLzMv3qUZN/QSyURnsxe8BJclp/Y96VDd4AFpnkpCzxkmKlTPW/E3
	Tamk6iPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfW-0000000Bxb0-24QU;
	Mon, 26 Jan 2026 06:01:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFfT-0000000Bxag-3zzT
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 06:01:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PHnTXM032778
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 06:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WhYkT4c8bqYuaFAAd9Og1qwa8NpefLNuln4Q611IPFo=; b=B1IHYIUNp0yOLs2k
	cd0jl+KXHa3h3dmJHpEA/d4mAf94W1/O+mEmn4XSdF9l1/0kOLW8Mc/XypIpnSwv
	HduvcuK/QJDTLYmj4ITp6tvru8Ki9Y91e474vZWHRhh+Dm06NQQWBlYEZozq3HHz
	USxG24li9ILBytE4Z0efEevd6irhV856vtNgknKfvDk/Hzk5Ylh8eLfrlIxLZoBX
	5zaz3Ntz7V+JuX3rCiCwpCWDCXunfrS8Q1aXG+YMgklNDomjA3OUXvy53AVP/C3E
	E6MNl5zjd21yrbOLgqZgDS/UZ+15ym+9jlqebOd3jdIq4XJs5vU3qiV7Rqljrjzq
	mzV+GQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uuh91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 06:01:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8232bde979bso607951b3a.0
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 22:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769407302; x=1770012102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhYkT4c8bqYuaFAAd9Og1qwa8NpefLNuln4Q611IPFo=;
        b=eBM0MMauBsXKL/Qsn0pAcgHXhkvB6KywAGW9ccGY6kbojiOBwDwyZYIhVvfGrB2kJf
         bCa3JhhKGIczs0CFxGn1VOhLzVcwob5CGuM/dWnQNHCwdn8MxADDXh3I99eE9P+3pnC/
         xvHfD4iM3vHvj9oJNStqRko4R5eZ/oy2EjecoYLt2eYErHn7LAnj5MiO3lTeubaoYtA1
         B9dooJqvU4RvG3wnmp/EYjxRLRYcGjEf2q2EmNp6PQQmSdpjr+vF/4JV5oY9aAgqEu17
         EhdvHLaTji5t8KEt/KDB8FNFAVg0Hvm7TOLtOcs5b5kdAf721IzowfxwP1/zFEa4TYJ9
         mr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769407302; x=1770012102;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhYkT4c8bqYuaFAAd9Og1qwa8NpefLNuln4Q611IPFo=;
        b=kpv/wDGKCf7cburi14/rTz/igXOS4yNedGxNq6JapndQvr26iNxPPMlxLI9y4exGss
         oTmiQGbGysSXdVLduwRe+JXx7XyAhDqUdQ21+gzUGq9Rbw5pcY0l2LwGWOcS7if4OEpn
         maS4uxhxWsNUbKNMMSLLBvk+Bdmq016pE+6okdoSywmOyxzrJfJ/cU35I/gsqQ2sFl4l
         cxQfeEpJVvltPavk+hymhLtjSdiTtoxOZFzHdB0Xi1eBiQOHsmxw8l+TQCI42ZW2keS+
         h5eQTnbVXJZ0/AZ8mhJ4LdM0gM/GXYC4oDY4mUcaONnLURYmN5diNwAm9xqEK7SzeFOy
         tWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlwStDrQndyUL+rZfHhikFFm+c0Bq4sc2TpmNcsADnm6R9IgIaaROnZUBMp/bI6wgCsuw405g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQPx3zpChsUVGCANe1nbveVo2K+ug8ry8dQOgygUX9D4TW+ks1
	IkNqCq379iv1rYwJ/YqyCBhFMrlfNupIDuwdxPdOB1JpDKgijdqJa7U7KHqmVOA1rAkuRHlfvq2
	urfrlyt1cmvSe0LrRZ5UtfUmKCJR8WCklxLr+e26fM3H9MtmYgSnOmTOyxYznDGZI8X39gj9r
X-Gm-Gg: AZuq6aJWoirn97PuYLQv4eBSnwr5o6+3X5OtawpPWPL2TRhxeXJv1JsCz4R0xYYESrY
	lbXIU4X1pQwslVgG5g6aK6A94mnfC9k6atRgy9uO04cNA1uYiEcjGiMKkLivQ8/crFKoCeuYMCs
	AGL6NKWP0tel5FCrtpnaK/p29g9g0YyFxKiO9AgQ60YgF3p1M2NwiM4SyQ4S3l/YwiuAxcOpY1x
	ywciURKLGi8lyYaYvv7dV+oyUW+k4iuIu03k4AKYSUdmazcCfZIuxjvydpJuYKI3x8EQhKE/3ac
	orWuaOjSAs4PzHQQJw9CACxSqLKWUACYrh+tFn2gnnxO4BjPpT88J8EJNGbGenTi9YFWBPEvWtx
	oX4tLokSSvE7AFpj73NruSVT6sL6AsIQaM1hf1AK+6h+mwtrvwVOq/wEkYFcMYQ2qUYJbyOE=
X-Received: by 2002:a05:6a00:4c14:b0:81f:31c3:2e38 with SMTP id d2e1a72fcca58-823411d8314mr3094662b3a.19.1769407301633;
        Sun, 25 Jan 2026 22:01:41 -0800 (PST)
X-Received: by 2002:a05:6a00:4c14:b0:81f:31c3:2e38 with SMTP id d2e1a72fcca58-823411d8314mr3094641b3a.19.1769407301035;
        Sun, 25 Jan 2026 22:01:41 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e8e0sm8449355b3a.57.2026.01.25.22.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 22:01:40 -0800 (PST)
Message-ID: <e580107c-3b19-49a9-94b9-09d06e5e7a30@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 14:01:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: Add support for RX pdev TX
 hardware queue stats via HTT debugfs
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123071253.2202644-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1MCBTYWx0ZWRfXw1pHzbelatjw
 3xO6CONO+1uiRmmJ8CAC0QWA/oDPWW3zlI3F8z57JxhIlPx8NFqbp58gMANzmDx8amM9QMRRoax
 21rhTrlYSp8hiSlnwBlGk6Vi6mLaobM55uUj27v+9ETgUsHQciqvurj8P9Vmt11qz2drhzQp4va
 FrL/90i5QnltkT5rjfOGPIMZRozFP+I8zzvCu4x5mp2OFOYb1zy7xWrdvGgnafQbEbMC/CSkMFV
 5a5tFZbs4dgXlhmlt6ceqoWgIMb7GSYF3Ts8lfSkWOQ/SbOj+8azwObozx9fI7V2E11kmspGUSu
 O6oB2voHA1LbCIoeOciQN0qPzK0W6AtZMW7TNjx4dbf0KwRERdJpxoeHbu+aaNmR7Rf3aDJblBv
 VOve9zTUOlLZtZLd1lWHSbieaq5kEOpx53HIIEnDFd8u9c/bj9CFUlWH7fdM/8njYgMoHc9as9t
 gdvx2yG/+XQC8aIMVxg==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=69770346 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OlFMsxEj8GJKrJqdkKEA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: -h0-A3wM1SYCK8W_k0w6IbjCR4rFl88y
X-Proofpoint-GUID: -h0-A3wM1SYCK8W_k0w6IbjCR4rFl88y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_220144_020937_749B4767 
X-CRM114-Status: UNSURE (   9.33  )
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



On 1/23/2026 3:12 PM, Aaradhana Sahu wrote:
> Add support for HTT stats type 2 to report RX pdev firmware and HTT stats
> type 3 to report TX hardware queue stats. Also fix invalid buffer access.
> 
> Aaradhana Sahu (3):
>   wifi: ath12k: Fix index decrement when array_len is zero
>   wifi: ath12k: Add support RX PDEV stats
>   wifi: ath12k: Add support TX hardware queue stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 197 +++++++++++++++++-
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |  81 +++++++
>  2 files changed, 275 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 758064145fe77e06d07661b27dfa9c24fe0309a3

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


