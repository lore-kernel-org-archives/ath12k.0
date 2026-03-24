Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D1F54AB0
	for <ath12k@archiver.kernel.org>; Tue, 24 Mar 2026 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cjGRWjPnaGlclXk0EfY1F1ko2cvnaYk4eZjxovYkm0=; b=viovd62+U40EZ7pUYoW6kUlKQg
	ultRlMLMpLHX31PJQMUpyJSLKM1aK83WXeW0mrb78Fiz4rQtIn5SnqvnUTSt3m74y+ohlA5z43vZk
	1aUtE7SwesDc2pH1sVMf49BN6m9BguHekgzGaDUuy9MggMCDt920XUqoZs3U3RUbbA1UBf51kYib7
	BuROW9+UgK85kacWIDHKf/1BfFziFphjCvAxW/JbqYGX2RoJxEBT9pye9hxS4FduYjVcVrWniYrO1
	mKBU1qtNWHfa8nA6CRC0r3lVFO1fz7rSTHjakwM6gO5W8Yp+VaeKNcBQlCzHm6P8DlWD7rF36AfXO
	lXOtJSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525b-00000001ZWS-1o74;
	Tue, 24 Mar 2026 13:46:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w525Y-00000001ZVP-2JEN
	for ath12k@lists.infradead.org;
	Tue, 24 Mar 2026 13:46:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OCqZuw127494
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 13:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cjGRWjPnaGlclXk0EfY1F1ko2cvnaYk4eZjxovYkm0=; b=dDUE34DfOvsrhZ6P
	V/C2HVTyAh9sGV68IPzecHZp/Bpg8h4zIncQOAmQI3gJUVT3hgVEHaXMLFh42eN2
	1oLKv9cnSDCu8kywp6KQD8yB6Hvmul7tIY9tx1xsfMsUKmFGpivwt442sU6ctPX8
	usQCWwCfivx9FHbCGciCbHsFHGzu/GXnUcgDlxDhsa2JrXE6tFXscybcJ52pCGOE
	uQRwJJHs8IP3m1fGk28Sot7bvB8n4DFTEEjArtYkzfk5rRCKr2nY0S0pzCqQ+2TL
	UA/ccSrmHAuBieVJtI4Xbt1oGvMWY7gQtEe4EwpxuiCoeh+Ka5tRdVjqzj+WqBSt
	yf1LjQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m063d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 13:46:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12776bebeb3so29795999c88.1
        for <ath12k@lists.infradead.org>; Tue, 24 Mar 2026 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359990; x=1774964790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cjGRWjPnaGlclXk0EfY1F1ko2cvnaYk4eZjxovYkm0=;
        b=gtmHvEYt0ElUYZdOXBagQ9lrmKTxhMTpQVayq9MAK4B7wMRIKYgEtIfBV11h9NwIb2
         wJpE04zavMFZkGdaWFld+AH4yi8jMJ0e2j1xnfON/bGBV7k6zdVUSrXkuy9YvuWUgBLO
         1UKq9X0ISRE36o34VV9Ai2Utb5Bgr2gLpWRdKjDFNoi6AUorEAfCNtyT+1iFHRIJB7Dq
         VxT4XIgQH7SMFDbmDBwF4W+ONwsaXXfgw1z8c3Gpe+ZlrEP8fg4cqc5d6ucgWbji9zWd
         wRWFr8fe8jxRgGd1vLx744YriLiRl6skylWWjIOyB87soYtbRCSuA0bInFyjpNGcNGRa
         3pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359990; x=1774964790;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2cjGRWjPnaGlclXk0EfY1F1ko2cvnaYk4eZjxovYkm0=;
        b=H6YnBHRv9c9+/YR785rKLL+1BtlIzzTqeeztioHGXu89XARUVBqY9G22A5bJrwYCcE
         pyv/1zBDNoBri5KGDtnZVfZwg8DWzos4pz2Qit8/putVEOFpoY1jW9tPjKoHvSa+9vu6
         QSz4Bw9YUPrU3ivxCEzqre7Kl7fQNR9/JzhqCuzla6v0rJ+McAFsq2ApLg4WMkzSXCw5
         BwOL577HXtYPX2qEIE4wA/Y4xV529PM+bbRPH6uR2tdq5VSi6lXLfbfbs8YqrnlwECt3
         gDFTqa4ZTOkZJ1n2X2YhvvfnPgdDckw+mReSEzcfkZ1Ai63fbaeMdzCKOsV/+MMu84Sy
         IXYw==
X-Gm-Message-State: AOJu0Yy4aJHePeK8lwpDkMeZ1NADcyKeEsIFicZhPbimyUNg4bYfliUm
	E+P8hWN8gVxwHENxmMercjLHd0GBOGCCKOtoRW0AVSfOrHU/x3ld5C24HHS/BR2qhU1sjHFfbNM
	q5uOfMOj5clA4+qTEiohKm6G7gSMfCQ6HbKiBp0jaCYgrLsIdXMmTfSCDceQMc9eR4sWLMh+i
X-Gm-Gg: ATEYQzwjgihGA0Ft8Vf+2NzD8cxmSQ8YJ4WWkCTkOpoyLLJi9jHlnm0Sn4vAXiOkjkv
	Pgu4/A+2e/lWWE1U06W5X+H0BwqKUCBrNSDj03tHNrAayLj4g8Zs/tyRDbgK0nL/oETNEghJ5Aw
	O0hgNm5PksnUCnOhYei2JbBEzRGaU3Lnrb5z5qCZd9WyJ4NNz5aNJV3R57dwuyyKyyNjTVWLs7z
	ThqE+iKPS/drJbnBNn8P1YtGc/Ea+gTPhoSbnVKXq75gLV/L2p78KGdxEjqpgZLxIsI1ZsbDb5x
	cyISWwinaAZHcGDAwU7QlvrU1ZkxDGtjzpc9riZqdtXO+3cnS74XrPJPaE0HWxUPKNiok0e4uIo
	QimxQwJflPWsClLDU582zFCgrMCDF1u1beJCR7gFhDTlWYdAVGb7erW0e5GGx/dJnGxO/D+1/sN
	WZ
X-Received: by 2002:a05:7022:384:b0:12a:68cc:3efb with SMTP id a92af1059eb24-12a7265d4b8mr9036290c88.16.1774359990274;
        Tue, 24 Mar 2026 06:46:30 -0700 (PDT)
X-Received: by 2002:a05:7022:384:b0:12a:68cc:3efb with SMTP id a92af1059eb24-12a7265d4b8mr9036261c88.16.1774359989675;
        Tue, 24 Mar 2026 06:46:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm11368447c88.6.2026.03.24.06.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:46:29 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
References: <20260227110123.3726354-1-reshma.rajkumar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Pass the correct value of
 each TID during a stop AMPDU session
Message-Id: <177435998906.2954589.15845096878767678898.b4-ty@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 06:46:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c295b7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vkfXM0Oplov9zySb:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bfulyJ3BcDXNzwfwHewA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: hlmOvFhY5MSc0ui-8oOgsvDgjulnJX09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwOSBTYWx0ZWRfX30fZj7o+Pdze
 m9P24GYpYw7wmIrRmwdNaYWykXFbAiNo+spJR+9x3H4uJQWGkq/XFRvqAQDDjdczb9mGmfuqQmK
 BscAGl1KXvNsgJ6N+b04FDOT0PwLOaiKUG6f8ss+2V8gImClcdL7Bs88oxgSLMAZ95q+0iyEOzD
 9RfrTj4Y/8ZOSyBXJTeGds/WbUu3FSclUYvG7j4mnF1uTA1vGLtzdlH46ICqn6BbcMu2yNE87HB
 lIlxDKZQhoKRNWLm4kDVLhGmSCw2m9gtemVmDrzs0QTgFGblU/zRmUetLanz1rL/gjbusfr40wj
 9mQe3tTjSadlyaFbmNO8uBkMvqm8hDreSUEiyws3KQhjm88MExLgpKlz8P4/brfSWf34NKm20AB
 49Q0EWg3lcLUuVgI2V3NN08lysEcDtR4NLkDPY0/T4WwfzSX9s6HMpRWe8paZL+IZ+iIa43HuFz
 MO4oLQsGfoBP5PSoKww==
X-Proofpoint-GUID: hlmOvFhY5MSc0ui-8oOgsvDgjulnJX09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_064632_608548_C0C388BF 
X-CRM114-Status: GOOD (  12.91  )
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


On Fri, 27 Feb 2026 16:31:23 +0530, Reshma Immaculate Rajkumar wrote:
> With traffic ongoing for data TID [TID 0], an DELBA request to
> stop AMPDU for the BA session was received on management TID [TID 4].
> The corresponding TID number was incorrectly passed to stop the BA session,
> resulting in the BA session for data TIDs being stopped and the BA size
> being reduced to 1, causing an overall dip in TCP throughput.
> 
> Fix this issue by passing the correct argument from
> ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
> during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
> which is the base address of the array, corresponding to TID 0, pass
> the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
> different TID numbers are accounted for.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session
      commit: 4242625f272974dd1947f73b10d884eab3b277cd

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


