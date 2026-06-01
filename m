Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9811ACD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FScdfpqO3IaIfAtuZmXNQ0IdFjaWTAtehJV3qDW9OTo=; b=EuvP5aSn5mr6WcB0VNZYuoUZME
	7A8ztIrVYIs/OlVTgoglmt8eb/Sc9fRW7fC386O+OSur4gTEx93LN/VdN44kC+1IosI3ys99N+bqM
	rjCLCgB+vTTlwdk6yfRCLlbIoxpw3pLjWp5Xa6RERAuExgBBmwQmQsrDkNO2zainKWerMrnwai9Ui
	XS3WZTGkK4HLovSa04qJug2KzWEHG6s0yFTPegeytWaxK1DRJYH9FKXdB2P2gpxx5rbQQLjWo5qpa
	ftrd2+RJopxlCJJzukYMYx55y5lsVxXlfd29m5AP34yeBgMt4dmBrZpCZFfeBjpN3MJEVTcUSYq24
	R9F8vlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsp7-0000000A4MM-3qua;
	Mon, 01 Jun 2026 02:56:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTsp4-0000000A4Lu-2tgy
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 02:56:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6510e2FY155261
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 02:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FScdfpqO3IaIfAtuZmXNQ0IdFjaWTAtehJV3qDW9OTo=; b=XE+R3HVjXK8L+Q4E
	Ibf19pbAe6WFh+c+jFwBkbhaK77o2cXtIi5yIJWX/YftYkSzWa4uh/onjdXOZnVH
	YKPtvOEmUIG//2NejwnabjdIJ+54xcNmN9kE32XthYnHskLYVQN9jNF3rbj5GhR0
	qCBW00dHo4yv93vJ4emLVzVjrvlKCuduXe6D0vQZgYSi2oVeqDFJoNtGPrCyDOsA
	QswE9aoSO5s58SuIPM0ZIa8HNJNY6Khe4knFzSRcYF2YIUom+yeTfs/+FVTvYI9O
	S9gRSm+WbppLQ62sjw6vH5PaxApbMNXt9rawLQGWDzUnb8ka/zflHusK6gLnm123
	8IyqfA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efrncdb5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 02:56:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec338so3761444a91.0
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780282572; x=1780887372; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FScdfpqO3IaIfAtuZmXNQ0IdFjaWTAtehJV3qDW9OTo=;
        b=Tnv/QoFOy5/wSdZlmY4ifxWu1NVTdPRLF9c1ArPW6DW/Oa9Tcd08BZbVE/UpennO/D
         pWHMFPiMF+enpXitByQX55n8WjjNlvh8aYSYXz11raRUMzOxEiTRDvw7e94LTL24Oxem
         rnY3ssdP1nVMfI+yFM691t40eVRm81T4aZx1NQ2wZ8SkktYNaE3lofGjsLBg/TU0W1Pb
         GR3d356ZgIMU8wpjpZZf6bY7gwvBK9BqP05zOYo1cQaB88VWcnj7gmOazHRGeEwZWrdz
         WJaLxIRjcJQZepSh/CSu6zw8354sFa7x/sPTcmRafObNh2qXweVHt19qKciApnAo3dEV
         jOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282572; x=1780887372;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FScdfpqO3IaIfAtuZmXNQ0IdFjaWTAtehJV3qDW9OTo=;
        b=rjgy2v5hlvXgqEkQ6wanyQaa0/0+I0it2l9k9eMMXqgDPB8vCKcHgqV2MvOI1/5CqD
         b8/uTuuHp21oZ+taC/QtiC+jw4GEdP3oPh9OA4anHElGrze4t0Si4Ct0/G25WoUN4Zhx
         iAZntjeI+pPAKsfXkSePNhJQZ0Ip/rfg6AU1SAgU0yPihRIn54pF2eRHcUtt+8S5Lc1H
         gPvh4CnfSFpCtGkymuY6DbIEPZnz6OZSkELDtjL0pH1UdBYNr5lNmlRZuo3gIZExwWQD
         oKbab8sLefKT+BT8AgM+2PX52VEGnlCxYJYE8rBhJOyIa4YmofUqFp08R3PtWJtoUNWR
         N/nw==
X-Gm-Message-State: AOJu0YyzghiWzLK4Mgv/HmzLxZu2DJqndMcDIXzxDwvIcP/gHHTIoww2
	HLRi0/IkjupQLzRWfjKh5Wn5rji650V114/y64xxsMDHwXOlp3lzjH1eDZ4stkRqpmYvqVKSI2w
	NHGjR8CS7Gxzf1g/FaCUHfqk1hi34uwNpZB1ImrovmZ27ddO9O2GQMXlBLOYH0+v7
X-Gm-Gg: Acq92OEHemAjSPNHQXXzDt2no5oyCsEmy0SKHYi5xqpntzb6G6ylkeC8CcBm3dYEvPi
	T2+WFWBwGVVR+XAzN+Z2JW5B/bU1BvbVAnoTSd62jPZOGLjXUbfMksuJYdQsrH1jssyuqhzp6xt
	QGOb1JW73/Mi7QdoFCUZ5rBzX908jrlWgCSCuzimCVWJJJouReM0rjW7ck1KubdiYvpO76T3eEm
	mW3mAkQ10TJzo0AvIZa+E7SWyeBWCLxyDHqIGsHe0OxUQRbEPM1o+5c4tJaxEC2r3lOOdAZarpp
	7Urc6IcJGQNgshhIuLh8bbudcVSIUPfFyx6jKA8RqdWVJMLjpeGG2pqW3+gM3ouy8/3izygCOzs
	74rWBGxTED9zxDbvf2DXqCuAlZ0ENEy5ZJ+HnaDmt3GZFzePU6HauGQFFtz5yPncasDTW284v45
	/ET0x/bpaByvLRDWRmmsXYLQ84Eynt
X-Received: by 2002:a17:90b:578c:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-36c68485445mr7996430a91.25.1780282572524;
        Sun, 31 May 2026 19:56:12 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-36c68485445mr7996406a91.25.1780282572092;
        Sun, 31 May 2026 19:56:12 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc5f6b9f5sm9066905a91.0.2026.05.31.19.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 19:56:11 -0700 (PDT)
Message-ID: <eb631b60-aab0-40c4-a99a-2ba721c862a2@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 10:56:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix NULL deref when MLO link
 activation fails
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4N1H-LT4UdlPSrfz_MPYYIHEPF2OVdwZ
X-Proofpoint-ORIG-GUID: 4N1H-LT4UdlPSrfz_MPYYIHEPF2OVdwZ
X-Authority-Analysis: v=2.4 cv=FcIHAp+6 c=1 sm=1 tr=0 ts=6a1cf4cd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CYK_csWaTfdBfrBFt_cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyNyBTYWx0ZWRfX2e4IZBjTZEk8
 HEHiHX5Gf08Prp/PlB9u6L06BNP5cnnY+sCHaRex7ZjxFD0vMeWfQuXgXEgCeUiQ/NcDblQC9aR
 4+nKaKVFL6PpozHP2L2ZzLwnoPqU/2iI5XMDSJe5tMlLxvFs8Zw8f65IeRK8ZYT2ToKBrDBdzbb
 lTRVmmaoIY3/JzEm/iEhCCrUEgAYSHxWBoNePw/7gmVAOlObsPVlbxnag1FIUuws4YYywvsEIwQ
 /W182HeOVKj765zc/nIk5aHuj6+oypiXBvP305oaDalswhQck5fXLQ97uGPGiaq3k7CaTY5d4g1
 BtP8FZHv1hYqwDOXcvBx2c3Bl53YodC7CNIdbggFyPhhh7Y/fu27h3JzKNXbzvcbezOPe5rEhEi
 AJKGyhHA5G5Y6Yth2xygdWiciMlk0qzw3H68vXVHzhwpGmCl5784Q/54f+RXJVEHQk+VY1xgf2j
 JOdnAtGC75IVBT3kzKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_195614_815048_8032CAD5 
X-CRM114-Status: GOOD (  11.40  )
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



On 5/12/2026 12:49 PM, Wei Zhang wrote:
> ath12k_mac_op_change_sta_links() adds a link to ahsta->links_map
> before verifying that the link's vdev is ready, allowing broken links
> to be processed by subsequent operations and causing NULL dereferences.
> 
> Patch 1 fixes three error path inconsistencies in ath12k_mac_vdev_create()
> that leave arvif state or vdev resources inconsistent: a direct return on
> wmi_vdev_create failure bypasses err: which clears arvif->ar; and both
> failure paths in err_peer_del skip the DP peer cleanup and vdev rollback.
> 
> Patch 2 uses arvif->is_created (made reliable by patch 1) to guard
> against links with no vdev before allocating a link station, preventing
> broken links from entering links_map.
> 
> Wei Zhang (2):
>   wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
>   wifi: ath12k: fix NULL deref in change_sta_links for unready link
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


