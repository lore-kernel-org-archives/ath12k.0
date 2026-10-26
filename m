Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E15606A321
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 05:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CGTvO8jY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TKAdjAT/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNSpM7KO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=; b=CGTvO8jYe+dN6c
	c/fN9PJqQisy866WansH8B5U5ZNuZEulrzgmg0YRCID4iRBUie26LJnoTncr/k6EQufw6oeDmfVZJ
	yoPB3XbtSbUGkgwPTJIxB+W5LB5ozWsBfXZp2Y6TMSe/FDEEVqE3RSVk2HlgDkX/w6Z7NB4I9yL3L
	Yr062kSV3VhlzH7DJejaP2PzHVUEfE79vH9Q4/pD1KuMtNb/k84S4xu40BODgOubr74pWTr1n57SI
	dfzLr6VLfPwpbslN95u3gpRRXaqHeLaDiA2cm5Qg4tlRrFzXFs42shZZ4z7uYxQQ1PrsqRSjUDvTR
	pyVrXJuvsNyQkBPmpuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDXQ-00000001khG-38Bh;
	Mon, 26 Oct 2026 05:46:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDXN-00000001kgx-32TM
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 05:46:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b71h2806463
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 05:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=; b=TKAdjAT/NFKxQ85q
	4Uj4JIxmCtBzzE4PAxeAYekjoJLotQQuPLLBm5IxQ69bEFKWhsXCzUB4O6p0jfLO
	R7re/X6NTyMr/tifE3X+vkPzSTthx1epnH/Wy35ufrnvDExjC89TQXVUf73PRuEt
	w0kvVVNHRo02R546Tz9c+mCoXIvvN+CX85NqBt8Hndm68PNBO1z4o3fHJF83e+jq
	ps0CSeiTvnQ8OAMomF6gKom9OzlDhsIDSf1gsDPp9XLB8603XU4WK83/NdLPvlK6
	KrHBJVhdcZk3lc5UmAfmyAXsBR1hZ4XKm84VkDZ4ifXAxqSdbAJGhCf5NNMFfZX2
	h0ARiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xn0mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 05:46:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1189583a91.1
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792993584; x=1793598384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=;
        b=MNSpM7KO5wPGbnMdcZx6z0YPfU9VMFV+sjYPGmlQEQ8aNj1UIwAwHRhO8AGCekZgzi
         RhXOAFrLoch/hLNwmHShfXNRsZ8siY9xJ6t/b5ZcKw58jEemowWL1lIMS7e/Pcgubh3Y
         2pnHYUK+rzbn/pH2VtT/so6EsQQaIRsiXuAjXLifcgz37Gy4lkPT2eFFsQMcN//Mi3AY
         jdvjlG5D4reDCOTIkhqvXd9C/yarZl7J2s6D8M4Tmr6RMoYFEnbHRLxrYnyJpdYB0LgD
         nm6aq6Mo9BjnAx2pIIDzFJp85tYiqyYL/EmHeyusID7pFzab6GzydBuC+ct5438s6jFo
         gPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993584; x=1793598384;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=;
        b=AKczOvEhnP+TpWHut502lk5vBx1PZMCwbN4MWNQY/nFoqh/62M97yEcySYcfiyGhvz
         2xs0wu1KzbVzG6eVd9ge3QTV8I0lF53Kvw5kDIjie9OUESyDA2cq5lkKZLqLE12/opub
         QYwtcUjg+tZTYzpohE4jJ11ubfEARyq6GdeGdaQflaMnflDS9OGewTiG0az8SwIpvXYc
         404w/rP8dV2p4xmyttMKPNe0iQHCiPAn6zFbvBZhWfacbbITQU+L0NG2xtROQWX///te
         UQXWnGSohdnPa2mP1aKBhUhocHHIiw5tk8ihwIzYVyMoT83WWSs4eDLaw03bxpk407t7
         hq1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzFF49W6Fmw9+YxqtarRvvVsYR1cA6FGnJ2TP4Yi5bvyJrAaNKbKdbFJ8hysl3tdnB9QxhFic=@lists.infradead.org
X-Gm-Message-State: AFq9FYI/5w3AgcEi33UtMTM9SgnxXCKch4WmADjUQJaYcH+ZEBIvQhaM
	91bynOTv3ZdLHlV0K8tAdFqsKlIIRN16alXzCey+peZdbn4Q7Q+bIZhQ5gFVfyYbDUi4OBDw0me
	aWwnsrUSk+PbmNBmxatime7lp9JKr+mMwwv25gaf/Mi2CYQ6b5cY2th1hgPwNGHfEGSebYrbcGR
	E=
X-Gm-Gg: AYBFou29ghsYv55WDswo9OdwT6w+O3QYGo8dYuWhFBuTO3zMI0mQY521w1bnKpP6sE1
	NOCTzr4uuhwb1nq1lEwTY/6VlpcarvKewqkUZuOUanJDSkaYEfLCq8KlOghlpuMwC92jbDa4VSM
	fOVURuRYhb3XN0aqno76ZLVWNcTfdN+iE1NG7nk5CIHiaW9skE1/ulqBpvps39vlMzCX33hxgqK
	R9WuK3bVRmWWksOkhOFLimobkL525FqZ1ML2WRpOIv8MySdxypyF1VoiOtJV/ma/Sk03FjDBU1f
	kkcTN9bJwHV4YJCj0+KyyQboW99wnq22QPSCjASU1SoW6KcMm9gBPfrnINdvXNOgP2oQp+UlYKu
	1AGc35jA1/1k90XK/ANAiWm+9PYqhApeUfymugeHCQ4CTQKnpgOu4zoNqdqygSRNBsSnLFqLU
X-Received: by 2002:a17:90b:1b01:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3adeafbb11bmr4747444a91.38.1792993583568;
        Sun, 25 Oct 2026 22:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3adeafbb11bmr4747431a91.38.1792993583138;
        Sun, 25 Oct 2026 22:46:23 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm6741206a91.1.2026.10.25.22.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:46:22 -0700 (PDT)
Message-ID: <d4e86e92-9cf9-4fbb-8f36-56db9c6f9a8d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:46:19 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V9R1K2pdnEsGKgVPprQ4LCmoYTbyx83k
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adee930 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX5yF53S+IlV1k
 JMxmcTbtjWCTBHlJBT5PLoXiYWUmGEnB1irRVYwwjux6s7W0Dx1xtoFDttxZK/RE/EEIGOw4d8G
 6Wa7Ii50pESgDq8gqE0Doe0ZQfAlo5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfXx93l76iUEuxK
 QhDUU/V0SLyTyVf/43SmsBRe6kcyaGpSuhb4IG1KKd/tkqh2r1MfRRqbaFylDXbDolU20ABFOTC
 9JLYswVFBpZGXNnHAltk2LGbL6iEPEZ2tGXd9s9IugYftudHxOIKWNtHw4HVzexlvB5iswoS8qP
 ncmcpmW0sJQzQFYyzCxdLqK9iStRRZgYwoF2FhtZovgdA0PlXLHdFIQhxKwwbzH4z2ee2P5OtLU
 LitIUvTlhgPxWbqrt098jNDkhrbvEcHAHsUIv/DCl+CCtFSwDo86xK+ujKgZnKTT5PmwWud0821
 U/Mt5MPHZhav/Rkuf94l7d+TR3NLDXBUXh5cH8oQ95im8k73bKN0z7588m65KBF4V/I58xWG6Wf
 wn5gA4BDDloojHI85Z4otHJwLLnM3uNaI14ASGbRgWEBOpV8sU4WxkJIbTbtYrpLub0XuQF1UQE
 JpDG4Xkm2PB8+IHeALw==
X-Proofpoint-ORIG-GUID: V9R1K2pdnEsGKgVPprQ4LCmoYTbyx83k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224625_902811_677F82AB 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/2026 3:52 PM, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> Pass the current MSDU instead so each MSDU is processed exactly once.
> 
> Also rename the helper parameter from head_msdu to msdu since the helper
> operates on any MSDU in the chain.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


