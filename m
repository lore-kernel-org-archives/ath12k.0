Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F1FD3773
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciOAPCiiBYAFoSPYdBWAJh+twKO/zxGm8VVRYLtvQWc=; b=aGM/hVSb+bIjrtnKAVXN9jeyfo
	eba6NZdAe/Vjuu2FAawYxxzsPnmxaeWdC4X5BvCzGSpAe4fh6hfrTHQ+36QrNlkewJATmr2sTswBR
	to+a0NiSNfJXWIYmJA488szzdPGCu2FWdLfM0+CaXRwHfy76kLizr8EV9h86XmQTeH2sV3txXVgpy
	NC9Jjs/u6noadARNVD3/zBssW/vzvx9oPdSk4DXLWORtBl3Rv54XqAXw1e2t/dYDfisiJ+PNmfYoy
	OOE3RWJDWIgfIeWBafyRpLmTfwQQJzxeRob4485es4gKmXWpWgGzT4Rktpw++mc18DUWbHFivKi7i
	/f66GiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIVE-00000004d76-3rYS;
	Wed, 25 Feb 2026 17:16:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIVD-00000004d6m-2YQL
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 17:16:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SK8u1025009
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ciOAPCiiBYAFoSPYdBWAJh+twKO/zxGm8VVRYLtvQWc=; b=afza419vUROKRJ9+
	xxfq+nVzU/gZ5q3sBjbOLijUdd4f1j9L7WDW1qPA/3FZ+3Lnd49yIqiKdLWS1Slz
	mDIlAzUN230CKO2Xopj7JN+/sag3onwu0IwdFZziS8a761kIq4q5cS6dINuyK3TI
	zHNbfP664Gz72f62xs5ducN6/OryVVNpG38DRa55hMscO6swGqdoRsndtXDoMU/o
	CF8A8rR36GK5b+MPBb4uhQJUuasEFuMtzoRzrfn+uwcs5+j/aXB3ORl7PuDsBcRh
	L8hqeWNzib84ylL3+U7Hc47V9YFEsCb73duhSgSPzBkLaZKMcyvs2uYPt5y4yzEe
	Nfvzug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57tpsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad60525deso442448965ad.1
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 09:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039805; x=1772644605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ciOAPCiiBYAFoSPYdBWAJh+twKO/zxGm8VVRYLtvQWc=;
        b=CMV+9cGXxmIWRFasr1KZH4qSIDclt9xnuSfE3yGwLgE54Vh2aNn1Vqn80gIcmcZLfr
         x+E+4J8xN9C0i5PFyEOIly5UHfEZnk/FtmyXA5YYOwKoBzN2NoeiRCyq6uBSzrD3M2L4
         zYCn+by1oR09bAFnsJsFF2m2ujG8utcRA1L7UCGXwX/lwq5FEPO1lEBSxN8UMFJW/Gwx
         n4R8TJ+Kr8W41H2qqcDUoVygTbb1EeMrNiDVa0Y1i67t+l6CLOBa99F5ahQ8WEhrJLgM
         XklOmPebyIersWM2EhmmyAJocf5padDauxIXrH6nHID2kFq4XmjS33E/NVpfYjoYD1Gp
         D+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039805; x=1772644605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciOAPCiiBYAFoSPYdBWAJh+twKO/zxGm8VVRYLtvQWc=;
        b=rKbCFDknsxyYJKnmE/ahUXuyIHWffs9GbmPk+6rDbAD0jYpi+ZiHzQ0QVF6UyaDIqx
         JT3j0TibiC5PLKEiF/q5SNNPFKVkoO8177/F4uMYSsxZFy9pj8O4suhmJPIrJd9xucIS
         plfVdiIkYaZOnG2X8rgJ9dbmFD+g0IaLdAzghTg5/g8GOY5b8v4Jhk7lQYfxcE2e8O/P
         kfpt6JopJJNkcjuZMPHcbdZU6Xo3iA5GzoNBVLA7POfRoNnOUC8ZvDaqQSvhVBSiSusW
         qt5tq+lgOJKEMNDBkolN5MSKVQ5CZCBNC37iGvDzlLKfRB+GrksfpM+/lGBZ/wWZf+2k
         MHuA==
X-Forwarded-Encrypted: i=1; AJvYcCUy43eaK4lkHWyyw9zXANiXn27EW+nis0IvtTuNWSlhNqzdpddPO8vP2eZ3WzqjXIW7hnd56BA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUBfVZwL/itMu2DJGEe8ltsHUe0JZIyo+yCbTsZgNwOm+BNy8
	RBM+9RvDhy6WEizWp80fwTK/Dlv32sqPgarA5qxhH2qYlwvT18Ds03gXjM8dOGVALus7o4t8AoD
	0HuLSVvacurd9LuxBKfQikdq6Wd2rtdB6r2i91P8MTvDvFWf+zZJiotBXVsZ6sWFS
X-Gm-Gg: ATEYQzyDRhVVncJQRvNnhEgzF3HvAcS88CA4kbPmL9gMHIKJtpZ6PDaWPAc93beyZ32
	hxLm+2AHAX5kjuipzIyQJiJcD5n/HmaH0KROX+SCwLQlTkAKMfsTErF+vmmvdqktNviSVC3FzkS
	fuSXxkZDJRQJbLtoKzSv54J2NeTV3Fj6RWcrOQnNMgA9QqacxR2EMXpakT1aTgXmpDFj/BCNk4m
	iwWxPvvevd5D8vXHPBKHnsyEZsXPy2nFwECrE4MpOUX494xxCIk4tDq+0QHiNmv1Fs6k1o07FAb
	NHI33jlGh3wDagfX7dbeD4Qg1nxrLmdhXIdbLyXQ1ycYkZfoe1NlqCOsXass6hbi4dtQ26VJipD
	3lWKaoXQn5hyXK4GbEkmSH9MyVdGsiZJMzkQXQSCLUhdEwY0aCAN2cfUFOuTETQ5dMqCQyAyu6g
	==
X-Received: by 2002:a17:902:dacf:b0:2a9:4450:abbc with SMTP id d9443c01a7336-2ad744e0d24mr157392615ad.26.1772039805138;
        Wed, 25 Feb 2026 09:16:45 -0800 (PST)
X-Received: by 2002:a17:902:dacf:b0:2a9:4450:abbc with SMTP id d9443c01a7336-2ad744e0d24mr157392265ad.26.1772039804563;
        Wed, 25 Feb 2026 09:16:44 -0800 (PST)
Received: from [192.168.225.142] ([157.49.193.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75054aa3sm145895395ad.89.2026.02.25.09.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:16:44 -0800 (PST)
Message-ID: <a2278722-d370-40f1-b9a2-6bc13aa04a2d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 22:46:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix legacy rate mapping for
 monitor mode capture
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
References: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260209054924.2713072-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699f2e7d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hSb1S3R1191yeZY/11SCyA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kvUqLCy4jVkouz2hCqIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: gnWa2S1OBi3e1F-DR8WxyAVXGLHMpN2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfX/beWdAqqJpIm
 mhVkiKdSrTWuz15K5wAL/gC8MBAtszfkDjmvTmRRKOJTOP9qzlY84W6CJyQwB8y9ezmAJofi+K4
 My/POh+lPmmIGqcQMNsMTMu7WkjCn0lP+BljmvjyRIYsNZIuZqPBXzU+faRWPwX/uDvOVUatTWS
 6s+huGsuzX+v/v+Crc+lPSO9YOXy/hn4JfhqAA1gPMEYCbPEVlxwpbl4c5PyEF7AsquhXixSBSA
 WqWPDwaT8GoKYiBEhwHW9xKqCsAt/2GgHdC1WFkcQwuv9EnPlBUu8u38wwiyl8qI0E/yyPeiyi1
 zdfI6WUqVLReQBzkbnPF7NkJDDj0Mb+YfrqMpOFr6zLywWvu8BjeOFgHqQ6aZ8Wb+jj9TgsGSFG
 o81XJ/su/uq+jCpXjNZpnHxPr7Us7ZTo4208Qoboxq8JRIYhaCBVSmogLNlFlhqH4a+sNDGqif/
 OaD0tZeB4usGhmMGPUw==
X-Proofpoint-GUID: gnWa2S1OBi3e1F-DR8WxyAVXGLHMpN2r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091647_654074_F006A618 
X-CRM114-Status: GOOD (  16.71  )
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



On 2/9/2026 11:19 AM, Thiraviyam Mariyappan wrote:
> From: P Praneesh <praneesh.p@oss.qualcomm.com>
> 
> The current implementation incorrectly reports legacy CCK and OFDM rates
> in monitor mode radiotap headers. The rate field displays wrong values,
> for example showing 11 Mbps when the actual rate is 1 Mbps. This occurs
> because the HAL layer uses a unified enum for both CCK and OFDM rates
> without distinguishing between long/short preamble variants and proper
> rate mapping to hardware rate indices.
> 
> The root cause is threefold:
> 
> 1. The hal_rx_legacy_rate enum conflates CCK and OFDM rates into a
>     single enumeration, making it impossible to differentiate between
>     802.11b CCK rates (with long/short preamble variants) and 802.11a/g
>     OFDM rates.
> 
> 2. The L-SIG-B parsing function maps hardware rate values to the wrong
>     enum values. For CCK rates, it incorrectly combines long and short
>     preamble cases (e.g., cases 2 and 5 both map to 2 Mbps), losing
>     preamble information critical for proper rate identification.
> 
> 3. The mac layer's rate-to-index conversion function does not properly
>     handle the precedence between long preamble, short preamble, and
>     OFDM rates when matching hardware rate values.
> 
> Split the hal_rx_legacy_rate enum into two separate enumerations:
> hal_rx_legacy_rate for CCK rates with explicit long preamble (LP) and
> short preamble (SP) variants, and hal_rx_legacy_rates_ofdm for OFDM
> rates. This separation allows proper identification of rate types and
> preamble modes.
> 
> Introduce a new mapping ath12k_wifi7_hal_mon_map_legacy_rate_to_hw_rate()
> that converts HAL CCK rate enums to hardware rate indices defined in
> ath12k_hw_rate_cck. This ensures the rate field in ppdu_info contains
> the correct hardware rate index that matches the mac layer's expectations.
> 
> Update the L-SIG-B parsing to map each hardware rate value (1-7) to its
> corresponding CCK rate enum with proper preamble designation:
> - Cases 1-4: Long preamble (1, 2, 5.5, 11 Mbps)
> - Cases 5-7: Short preamble (2, 5.5, 11 Mbps)
> 
> Update the L-SIG-A parsing to use the new OFDM-specific enum values,
> maintaining the existing rate mapping for 802.11a/g OFDM rates.
> 
> Refactor the mac layer's ath12k_mac_hw_rate_to_idx() function to
> implement proper matching precedence:
> 1. First match OFDM rates using the IEEE80211_RATE_MANDATORY_A flag
> 2. Then match CCK short preamble rates
> 3. Finally match CCK long preamble rates as fallback
> 
> Add helper macros ATH12K_MAC_RATE_A_M and ATH12K_MAC_RATE_B to improve
> readability of the rate table initialization and ensure the mandatory
> flag is set for OFDM rates.
> 
> This fix ensures monitor mode captures display accurate rate information
> in the radiotap header, correctly distinguishing between 1 Mbps and
> 11 Mbps, and properly identifying preamble types for CCK rates.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

