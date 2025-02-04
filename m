Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B92C02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hayHRKWt3KgTH36kTGY0tB09nAi5jZ+X1aXPPC8Jm+4=; b=BXbL9Ax50/keGmTp+P1tJDG9oQ
	RaJyTP+OCfoAtC/q/hzul+smY/4lTL0i+yH+RchthUjbRucgVKUzhGgsox/IOiwEKzsmL8T+LO+Ga
	NMUHFfqxVwHyo4X4yXvILepBz4qYcjOvRHP2RrWVSX1AYVM6k5fhS9LgszWpR/SPtRB7YJiDlLHxb
	+LhVK1K+VzZ2Vi1441N/PXqEXde5IrlLbYhBlo5bKF00JBDwRerm0DakEOyCf1uZ5Z+ynYIMnNWSq
	htRiNtS+lwBLos4au4aji0bd3w/CdC1NJg3PPinABU88NLIpVXW1gjLH/nkxc+lMD9gMALKjSF7Ij
	nYAmIqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfG5n-000000009NT-3EiP
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 10:23:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfG5k-000000009N7-3hAb
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 10:23:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51456Vsf024376
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 10:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hayHRKWt3KgTH36kTGY0tB09nAi5jZ+X1aXPPC8Jm+4=; b=jLi0ChJIfFSaqRTo
	U8zKG6GW4fh86fBHmxsOOe0PfMqBFOJ0RsFmFEObsBg6z+3w1kJXsiOwyf3blsbZ
	CaQbF9O7tv5Pab0r+ElwOqtCrA4nndHMW3bJ6YG97xRu+HlFFuwsrsU5y2eAvKm2
	d6/FXo4Fh2C053yZs40q7hdLXYd/2JHLnezsTH22df6bXYRFGrzeeELERbCAk2hW
	N4NAigo9wZTzsKOcgHOGLL9UccMdVVhmJGwWKc0Yi8uOOjo0uZ6uPJVHjSRsrkww
	rKrTZq+XTF7jtboxx8gAbxTrgaA2N2u/BjkC0j9gRkvIeXzo94CZFwEkbsL5xCWU
	IeGo9g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcf48p06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 10:23:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so10609106a91.2
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 02:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664619; x=1739269419;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hayHRKWt3KgTH36kTGY0tB09nAi5jZ+X1aXPPC8Jm+4=;
        b=fZmrG1wnW7Rv3MCvjos4finQOW+hbdP8ri0x4JrlnTfqDVl9gPwmrFoK/5/K+gvZDr
         Ta0+zluGYFuAbbMCpxLpQQ5DOqyLKnMQUsDr5eIMNfiEyx23EBdAJtLBlakGd8R7dEoe
         E8tnCld/lGzZbqcRq0ZAFw5YeTMN8xoWgnaFYRItiCEOvw2DpunlkRzMqjku74bBedPX
         5+4nSzP6VC7OgdpvsEEEoRhHRvLUoEzERXHpwXkvljVDy88faKkGJsQH0y9k/6IeQ81x
         LUdHamUWfhlu/G2WjO0PmDaU/NLVr3MOP9Kf2I0RUMo/AosBt1YbPR0KiQW8+0kyjR5I
         2ZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7p/Jts/AAfpZTTTvCEpy2JMInltICvpWjgGIdR2nMqbSbWNDmpZgW8S+1TpTOyePhqfSU0Xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAeN3qGjqxfpJkhRW9YEtLFXxe9VWUno4l+bUoEywXPzNqWCTk
	C3K3vMnhvzie/VC+sd0wIUyVBGQACiedafiHmxqPFNj8617w7igPlpcIvJlWb85dfGr5geisLAB
	ye9zXnCbPygk8+034DcDVhbNtiPrgKs9GDSFGrKUpbviGBCSGSf7LFCHu1jsZ
X-Gm-Gg: ASbGncuha9rgUvH3BbnrAHFJPcc2becqEqHpTUD9WnQpWHgC8T2fC68+rggZnO7X+9+
	MURUAFHB4Xbd3WOyOy3iZR6tHvY1GoqonEMnkNS/v2K1utAUcz0iDnLsnDZwe/lhfET2TSMozMF
	s0e/LLNX9llrdWFiL2g/rJhBxDAMpORzvCuakCzIU66C6XO5k4zMg3eQNAd9fmY+9MRDg8O6imW
	mSkSd1simT/qZY3XUXdgdFybyFFsJjZhzcbv16w4A3anI8mqkoaUcCDNAL2XUsUEdbs8Xgwpv2x
	Qv1SDlWMAfPIr4EsSKQUp5z2UFIbqZIrX5BV6nM=
X-Received: by 2002:a05:6a20:841b:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1ed7a6b81f3mr40738753637.26.1738664619022;
        Tue, 04 Feb 2025 02:23:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIdD5AiG7u15rXf2GHuHDUY9fbuc3P//5L0huLyjmG8JXN8JnwvXSF0P2RL0jsOL/hgtFu6Q==
X-Received: by 2002:a05:6a20:841b:b0:1cf:27bf:8e03 with SMTP id adf61e73a8af0-1ed7a6b81f3mr40738723637.26.1738664618630;
        Tue, 04 Feb 2025 02:23:38 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856840sm8243100a12.41.2025.02.04.02.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 02:23:38 -0800 (PST)
Message-ID: <076014d2-eaaa-44be-81fc-a8f1eb0c2ac9@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 15:53:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
To: Nicolas Escande <nico.escande@gmail.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7JKQ60C6EZA.24H639LLIG2U7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q4qWXVFPwDfRlXKurVyS02YYTFao4frU
X-Proofpoint-GUID: q4qWXVFPwDfRlXKurVyS02YYTFao4frU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=964 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_022340_945876_03D2F57E 
X-CRM114-Status: GOOD (  13.94  )
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

On 2/4/25 15:32, Nicolas Escande wrote:
> Hello,
> 
> When applying this series I am no longer able to start an AP on a DFS channel.
> (I don't know specifically which patch though)
> 

Thanks for reporting this. I think non-DFS channel should be working 
fine right?

Anyways, I'm able to repro the issue locally. Let me investigate further 
and come back.

> After the initial CAC period I get the following kernel message:
> 	[   45.248441] ath12k_pci 0003:01:00.0: cannot install key for non-existent peer 3a:07:16:d8:00:08
> And then hostapd goes in failed state:
> 	wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
> 	ACS: Automatic channel selection started, this may take a bit
> 	wlan0: interface state COUNTRY_UPDATE->ACS
> 	wlan0: ACS-STARTED
> 	wlan0: ACS-COMPLETED freq=5620 channel=124
> 	wlan0: interface state ACS->DFS
> 	wlan0: DFS-CAC-START freq=5620 chan=124 sec_chan=1, width=2, seg0=114, seg1=0, cac_time=5s
> 	wlan0: DFS-CAC-COMPLETED success=1 freq=5620 ht_enabled=0 chan_offset=0 chan_width=5 cf1=5570 cf2=0 radar_detected=0
> 	wlan0: nl80211: kernel reports: key addition failed
> 	Interface initialization failed
> 	wlan0: interface state DFS->DISABLED
> 	wlan0: AP-DISABLED
> 
> Maybe I missed something ? Is there another series this one depends upon that I
> should have applied before ?

No known dependency as such.

-- 
Aditya

