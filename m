Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C82E7719A
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0HOMgigLyZ/I1O3LKpmTlmtbe7AvWiz1ycqz9rOCPM=; b=WdduLu4R0Ad+Thcm7uE74qP7FP
	ITB65Kce2fHcUY57LZV54Mn6J7DWTIA2NBArFVcI/wsWw19ONKYg9vYpUgtTLYaHPvx/oNfL9g36B
	MkKVFdbdUUReDx+/FZIdRwJqhDbavtnsjJOPd6bZtGPxyEyNMWBCGx5ri+RnLAgaEGPmiLsLCqYwA
	ei/DebDhMLxGxoTQ6V30rQB4usqCgSrnJ/WAfWsKEpn6tjoO3rsd8ELvFOujOT9+ZnYtw48haG3Ju
	sCc0AoU15rRxs03Aaq392DhT4jl5HD8EZfvZvXuXdh0Mx4rHSZqHE377Y47tr6mrIWQOMhmARhvDO
	FK3bJsAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYhn-000000097rO-23SW
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 16:14:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYhd-000000097nl-2pTC
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 16:14:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkTrL004881
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 16:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0HOMgigLyZ/I1O3LKpmTlmtbe7AvWiz1ycqz9rOCPM=; b=pOAsTNFjHJF3NIc6
	7kwbwfF+Li5RFysy/r866Z598IblwihdwejigA2nTet9pTmUS/TCDQzYyKkJsYNo
	eBxw6WS+M60ppYkRro/r9J7PhV8Ey7ymTv1hOadmjexYhotl+jnGOT5jHeL+VQgS
	hJIpYNjidVMU6BeMMTgd2QvST6JMXQa8fEscAvNpde2tQ2wgqasqsY15g8Nm55ZR
	TLvy4QZKoR+WRs1MrpJWf5gN2BXkgE6z40/fp2jT7/0AnIP41RDsSTWlKmOHJAQa
	pyndAmbEozHhC1EGSzYUA9usYbUzQFn6Pmj3Q2Wn5pocTUm78xbg8GKjogb0sFAK
	x0r53g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441pkus1t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 16:14:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so24384834a91.3
        for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 08:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352878; x=1736957678;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0HOMgigLyZ/I1O3LKpmTlmtbe7AvWiz1ycqz9rOCPM=;
        b=TlZmEzst/RRsM7HnRJ4w1xnMwrVSZE13vbhsD5ahmqceUYiA3+2IDsaTq4pt1TtCfl
         0LkyUaPq6RBDRsLu/uMFl4iPsmhg6XRsnm0V8B7+gGU7/rbtBp/1unhW7sB37h4vEyH4
         z253FPrJOFJwkSAvCvzMCRDiTETXmM1hGuYs/MXdKb+EkL5vyA9mMpzs8Jp6SCkNfqpp
         oaAq4/CpQ6XI/V/FTNWKbvBHINnY3p/FD37ABtC8wtFUz66b+fIRMaftrPbjqSifkne3
         T91cSpZ7Kp/wq5I/8gtixvsmx1JMiihfBr5+VkbmRItjImGRnuP/7AuIfexblHaMhwE1
         DlQA==
X-Forwarded-Encrypted: i=1; AJvYcCUNFaBT8Iu4F4UFnz93fmTWVlu0DGIki6kTh2IHrRdf5tLm8j35kECh90hkvc2ODQMr88fn4oA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwH1Tu1bwM7ZCiB1NMU1VBJtuHwn3tJmK0RojKgP9Gg4dOZSBLS
	/0V9Q3dNkLu5i9NXhQ43jqEEAjQcethilqvgIrmPNTJpmnh9VnDH5iXaZrFlMC6XqAuxOUhrcA7
	0tCUwRApQY52TlupLnkgtqGP2S/uil4bR3mwHT8TR8FMFiG+nBk++N/wUukVcgLn4rwR7
X-Gm-Gg: ASbGncueSpyaDUpZNWYHSt0JCMXkIbrGddzCdPJzl9CVB93zwsihyXisXKZ//QAicpd
	Z+napu3S+ne6howfN7sq7DOmvwGPGsyrktmQBM+vi8/+3KqJf+rTf8wmf4JpLGzTeJnOUgS1HfB
	TXqe0VnD9TKq6LxIFMO1lxb9a+PKgZN4mLkOiasPfWaJXtJtZxSMKK1VxIl2XNgXwLw4mQqvG+0
	iwkOrIckFcrL60bZC6teA+KxvtHy1FgEd+lT1qIfiz6qK6fcQR/Dizwr/isyJdY9LeF29uOAHsI
	NF5oWPpYLu+gliqvGjSK2Ebdyp21NoYoCJ9HXOjCu+0dzNW5aQ==
X-Received: by 2002:aa7:9a87:0:b0:725:ef4b:de21 with SMTP id d2e1a72fcca58-72d21fc701dmr4821513b3a.20.1736352878325;
        Wed, 08 Jan 2025 08:14:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnzfKDtqLHMnAErCg2v3Qjwam1ikQiQe1USLBqrbZAttkwVkMvJW14pQgEvaw3NtFgpldIpQ==
X-Received: by 2002:aa7:9a87:0:b0:725:ef4b:de21 with SMTP id d2e1a72fcca58-72d21fc701dmr4821475b3a.20.1736352877905;
        Wed, 08 Jan 2025 08:14:37 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb0dcsm36413670b3a.147.2025.01.08.08.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:14:37 -0800 (PST)
Message-ID: <36a016f4-8ab4-41ee-824e-89c015717736@oss.qualcomm.com>
Date: Wed, 8 Jan 2025 08:14:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] wifi: ath12k: report station mode stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241225112315.49881-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241225112315.49881-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fwVWpVFVyQEEexFuN6yrqeMgjysw58A1
X-Proofpoint-ORIG-GUID: fwVWpVFVyQEEexFuN6yrqeMgjysw58A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081442_312220_128D6A09 
X-CRM114-Status: GOOD (  10.72  )
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

On 12/25/2024 3:23 AM, Lingbo Kong wrote:
> Currently, the transmit rate, the receive rate and signal strength of "iw
> dev xxx station dump" always show an invalid value.
> 
> This is because ath12k has no logic to handle this relevant information.
> 
> To solve this issue, ath12k parses the information passed by the firmware
> and passes it to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct value.
> Such as:
> 
> Station 00:03:7f:12:03:03 (on wlo1)
>         inactive time:  600 ms
>         rx bytes:       4642228
>         rx packets:     23796
>         tx bytes:       933967
>         tx packets:     8761
>         tx retries:     66
>         tx failed:      0
>         beacon loss:    0
>         beacon rx:      8925
>         rx drop misc:   191
>         signal:         -20 dBm
>         beacon signal avg:      -18 dBm
>         tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
>         tx duration:    0 us
>         rx bitrate:     1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
>         rx duration:    0 us
> 
> v8:
> 1.rebase to 09fa3b6974a1

Unfortunately this series conflicts with current ath/main, so you need to
rebase again. And since you'll be submitting in 2025, don't forget to update
copyrights.

/jeff

