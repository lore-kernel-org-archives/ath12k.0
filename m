Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC0C982FF
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+mrUpHrs5vfvIGvPD/26tzNP96x8VU+sQRx/PRjuHU=; b=EVHs3FkfyE71MY8NqIV4GxSfgy
	qeodr+Yzh4l58BDYgpgcTUsObdaC35IDFYvCzrxGM7m/aUMuPgkSvj7aT/we68Pw5BjtdsLUMcP3V
	cNsPrN649+rEIGLhqN7hJAjWq91PrSrYoRxJ5Y/5XxRXosc7YUZbKJKPWefeGH3SUXM2PKxapL3l0
	u54vVzRkQ9Pgeq2N/VLGR6Y+876y1K8dT0BPVe2FFkzJ/M4idZWtGXmUWlVPWs4h1P36bzXitgk0/
	YFTx2lVgQGytjkjpO2yXFiIXm+JRrGGsW9EgeP2w55UZ7yYcUZcu4j45qyftIXumGivQH1jKJD+U/
	39d+wZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zqm-00000005LEu-3TkJ;
	Tue, 22 Sep 2026 12:43:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zql-00000005LEn-1gmp
	for ath12k@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y+mrUpHrs5vfvIGvPD/26tzNP96x8VU+sQRx/PRjuHU=; b=cdAFGKzo7ecn7/nsRYs9G18ODt
	LTZzGgb098zhsRLkbDgS4Hm7Pm6ODObaZ5ZjBdKLeIqKHTsG4o+CAzBSG4Wd4N+R03/W05zmpsYIC
	h02ghYtiZ8AP4gTih3d8V9eFVcSo4a8lIxznb/mtEFtGLhRU2MMwgE8Qe6C4PduuO3Vxtz+bU2Tqz
	9YvQ6dxWm/ie4slKSVRQZBnswmOSOOXj+tB5J+rAi8eMOU+OqXilBhOlAGGXquHAkkFNHueDQNcai
	9eiF8YSIS8A3P2SfwYnv3FiDn4OJ9zdFseyGq3acVtx564nNiczprExdNznfsPDz7V+oLj/oXaQS5
	DigMuX1w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zqf-0000000DZ6w-2ZSJ
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 12:43:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBP2Wb3670664
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 12:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+mrUpHrs5vfvIGvPD/26tzNP96x8VU+sQRx/PRjuHU=; b=hqD8sz/Ojiyj1gV8
	d3xmgBWazuxrDHmApibms2ZetxHFAvEp62am1mzQh+EckUo9xuCU37DPp3JnvW7t
	ah5B390GAqV1I4GEH5SUVq7GWx8c0n+x3jRB97x8M0VfZRrovwlcX5eeBK3u51t7
	80ISigJHwpsZx3Wubh+77olBBJIRQUDDJ2UNYXqDSLHp1nAqT+Q24a1DXHh8aCd8
	//hBAjeo+ZWWmNu7KLXjZHIL+N8qMQ1FWRAAHKZSasNmFwt81hIokvwXujL5sTmQ
	NhUq1GWKT160qK5xdSYWI2VHPAujoj8WiH0zZd+7A7jsg5QBTf52FaDeJghT+XTV
	aouG9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt89r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 12:43:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d959904658so72629785ad.2
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081024; x=1790685824; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+mrUpHrs5vfvIGvPD/26tzNP96x8VU+sQRx/PRjuHU=;
        b=CtoNaaxyX5tZONuj98AH7vYV3OsoPBbnafodKo3mE2+Ck4Lf4NjqkpQ1MEVUGB2A56
         VQfeIo1cZhrY7EXnFEX7mOtExBlta276SVUJTqjq8/HjJ7Aq3H1a5n07BwjodVETuXcT
         twRuxPSNHmkVMHfCNNPFbnBVTddmRgjgI8yyhgYnBXeQmp2wtdwC01/nTw0F0zvcBs5O
         d3szF9QCHJd/mvsht+YF0ocyM/j30SOA/QLN9J8gGRMVWOIZZzk/dgHYpAd9WlRF0tjJ
         TB8o1WODEPVar95t7J7qllkjy5pm/4pccjHdOozLcetZaZtnKnp34Eree5X+sdSviV3Y
         jeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081024; x=1790685824;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+mrUpHrs5vfvIGvPD/26tzNP96x8VU+sQRx/PRjuHU=;
        b=xJgPaOr/s9CULfPoVQo8T2Mjpe3IcNseHhrf+XVOb5VyGziP9hSsU+ijqvPB+YdV2l
         JLiULgI80oEv7QO2NovdmIyQiKUDfSRHMoZ+Iw2sMf/dUyUQw9Vre7Lie+PD1BQpYyVH
         eajUVHi8Gq7wtl4+Ex3GaSQGSrf45oBE3sNmbDEGTI8RdOQGusluV5RVfcH/f/jn8bp4
         Xgo4tvZqm0LBS8cQehIX7Q9n9ApfuWH6o8swPJ9Bn9ipfeODUrG6tNOPFJoH1wejl7kt
         bcZmE566e6L/8/zruEiLXDdv5byHlXZoNfgWB7NU3ZnpVsrd87dAt4Hgl+9345eDboXi
         IhNQ==
X-Forwarded-Encrypted: i=1; AKwUvByPndEST/QCMwdnoOhyDxsynPWwb7GhFTHH3lxNwTuEJPBCZ8R6LrBFzB+ECMTrxSjVJQgH8i4=@lists.infradead.org
X-Gm-Message-State: AFuF++lDE94B+sq3J8yrnB4NsLaEdFsaZyB84An/WTj3RqCrY8ArEjl/
	17L8kJ04Vxa+PyRPvfgvvuYzUB1ZtqlZVODR9etU6WlLZutqBhpw/IBa+e3YGTq0W+3ngoIG73D
	t5xNFnvvX1SUU4gJoo1mdQPAM2pkOV842VDGptckeso64j92wvEtlMBbClIt8kvU1
X-Gm-Gg: AYBFou3Jq8oxCGyZQXQP6jVoOGYLLMGkmdwGxwv27ozoIMGkPaOL5jvNZ5ev54eb9eO
	G+lhBoFTn+xMgPQJTCdxjk8hYw9zdpznIm025uucf43WCjqabk9OMcneRSEAbBMbU1MElfMCXzM
	WVy+JS8VGnuQCuNGEJZC6Ktfdfo7zbFi6bIaZDKxXCn0KIGWi6wwqxcMIJxowHnrWdcwMPuebNs
	OdoKVSMiWUxN/iXmRXPc23b3CSteNg7g7UmmJEEvgy6iv+uFSUH6NB7HA41yg2GD0XH/HIlIx9P
	FJMuZoADTfRUwxcnQQXFLLfo6bjaHMMA8mwKBnpJlKblRGpsZLoPJahZUu4yFsXfe/H0/bCMvs5
	E5nPCkVLtJWY62ZJB6ENB+fbsBddyH5TUGLtVWIkt0Fo=
X-Received: by 2002:a17:903:350f:b0:2df:5b0a:33ea with SMTP id d9443c01a7336-2df60b46fbemr12054125ad.35.1790081023525;
        Tue, 22 Sep 2026 05:43:43 -0700 (PDT)
X-Received: by 2002:a17:903:350f:b0:2df:5b0a:33ea with SMTP id d9443c01a7336-2df60b46fbemr12053875ad.35.1790081023027;
        Tue, 22 Sep 2026 05:43:43 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ae9bsm4950086eec.11.2026.09.22.05.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:43:42 -0700 (PDT)
Message-ID: <bbceaa85-f8b6-4e34-9a1b-dce1e7525bd0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:13:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/7] wifi: ath12k: convert DP profile parameter
 macros to inline helpers
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RTHT_msDXBJucd12OraAvh40sJtTZaty
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab27800 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y3uJ5WifsOlXRAKWd9sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX9sb0py7Lsglm
 JoLNUCAWPPNkWcoTJNMdIyHjWlcnW682Q7Rfq4CvLL5ry41ocQLu44mX5XXkKNnNQbWseg5p7wa
 cxNlNZjrTG1TnHtDiyoS3LnHIYQejJz20ElNUbuXiJtSZFeQY1raSlPSsILzpuVSDFgrFbkw/SB
 Izxr37rXcy1nVICZxVlEZQU8E1PhgPddCEOcWrMrKXwxbSPs/26pjAM4KGXQcqmW8XBHn/N5ykJ
 qV7TZaBOKISBGo1pA2mP7833IA/jZMhyi5+vGJP/NWyOM98PqIBUo9k9nUe0zPcYHCkXWgE5BbW
 QMA65VqB6iBc2cCwszV1swwEAVKF50F6c4ePqF/E7yv+9IQMv4FALyIhLX8Ih+XURCG3O6ab5QS
 EpiiV0asqayAqXpOyXtLUjM4CCVctStgszbKUF+E05Xg3xnl2EcyDoVoX4gI4lLChBbQUpp05GK
 bC/v1Sbo/zNQylvak7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NCBTYWx0ZWRfX+VwU2QbrGZSG
 q/RvH0tATgu0qCC6waU8qherq9lNio9eNeItkI7RabtEO/9KRpZLjSOoiBTaAqsuOvYN8g/m60Z
 gziVZZen3Yn9HoXdqd42vGmrvzoCKFI=
X-Proofpoint-GUID: RTHT_msDXBJucd12OraAvh40sJtTZaty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_134350_568243_A327F5ED 
X-CRM114-Status: UNSURE (   9.65  )
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

On 8/20/2026 11:17 AM, Aaradhana Sahu wrote:
> Convert the Data Path (DP) profile parameter macros to static inline helper
> function without changing any functional behavior.
> 
> Aaradhana Sahu (7):
>    wifi: ath12k: move dp_profile_params to dp.h
>    wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
>    wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
>    wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
>    wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
>    wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
>    wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
> 
>   drivers/net/wireless/ath/ath12k/core.h        |   9 --
>   drivers/net/wireless/ath/ath12k/dp.c          |  81 ++++++++------
>   drivers/net/wireless/ath/ath12k/dp.h          | 100 ++++++++++++------
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  12 ++-
>   drivers/net/wireless/ath/ath12k/mac.c         |   5 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  12 ++-
>   6 files changed, 140 insertions(+), 79 deletions(-)
> 
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

