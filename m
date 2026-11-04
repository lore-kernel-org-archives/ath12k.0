Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A1606B09D
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cla3BudI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M9IiBFKI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=My67fSbV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=; b=Cla3BudIQ9aKpY
	hYcMogcxZhYIWPP05gDCmyV7/ufh07VjEQbWnEkCjYuGCEDY0r18M6pboavWzLUN7Yxxy9kzBXBUB
	Cx7F7t1mCDf8za7sISb571B00RMsexu9UPhWE9H2IasKcjPrxn2wQUZMUaI4bZuOWlzymzWpw91sv
	snVtvm9Yxnvxocw8uua4TbWroR3LiFgtWRbTB5Te7cCiMTXirDx2QW+bD5t956O/ubKR1H35EpjAX
	1CUX0GiU4vUTm18CNugbrbacAzEfSa738X7Uidi9atcI/mMl3GpDcB4LMopOAF741PkObM3R3cWue
	vlH3nRz3Il9tsiDjVrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfAX-00000006JGE-45x3;
	Wed, 04 Nov 2026 17:53:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfAV-00000006JEX-0biQ
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 17:53:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj1w22250966
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 17:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=; b=M9IiBFKIN/aoZSti
	pUANlYWjEAs7DFWBmGf9DWmdUCLVoh5vHuTXUyzTvdcsrPp+WytdeZgVbL3gJjo8
	q44ig5uLIt2f6bk5Bt6b3X3Ws0ux8B3LON35bN2N9r8lG5nRokUdWmMzuk88fR31
	vVzSSBCoQqX5H09GKAQPt6fLSzyV3DIhm2xw3zaugz6ejjNU8hDDGzqxGdCsIF+J
	7RKrEU1B2cyqiILJN6NOrIFTdp8rFvXVet4/RHplpvEgTB2hMZMuIbdoyjC0yEGr
	3aN2QmssomiGyF4ChHK/50xJ4pu/YNSLe3hKLiAuTBfnI26Hoz1i5p+DeVbJsWVd
	jWiaYw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn1fpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 17:53:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso1733719eec.1
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 09:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793814781; x=1794419581; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=;
        b=My67fSbVgRqj+ENDnOgtdLMsBLQpingV9zcTvHbTdW3PIBs2JmB8nWpb/0Xhh0PEli
         TfEOM8n/+OdA/sTnVbHkNKBcZBwVbBRKG60vYFmgmgkkD4fEB8ZCqYuBndnj0eFmmrJi
         TNX7EDsm/HQ5mcyrlJhicH4jEPUn2IDerthsfp1ba5923Q255u72MLlARk82gC4iB49F
         JyqAEl5ihIdM9ltVYlE9HTELCrXKxDd4IuIguW37ffIwRoOOwH3Ol02Wvv3tL53Cm1XY
         w0NocyUuoALRFFPIJgUgvRAYCOGNL+k4qweium6Yr86vXgIoCdi7n9kNXbdahnTO/d/b
         b6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814781; x=1794419581;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlkDDkfTbz08Cti70LM+lRTYxUR46151wY6yh2rnh0o=;
        b=0ttc43CF0gc2/F9ZHyU8r56vKdC5Bsd+XU6QTbAok5/tXJwgazrYWCxGDr7LGLH17B
         3M4eQaJMtMdAZzSQf8UrzX3LZfMCgfME9EDV7gSpH3RJPp0lJtyvhn7vIEljPG5xk+vC
         HHXRzms6f0bR62wrRSHbUbJhCHepNLDN5cxEJWSgVgIrV11qSYmgcsRmspxnZUR5xVK4
         dQypg40g1PFhkuYft+bPXQK/fAvyhYD/tn67lZ+rcns2y9kucC1aWCXMBWm9J/atTONA
         DCjmt+F5EKYzLwYU+Y8/YqyEK7QGjEpRnUr7XlMQhlhp4Qipb2Drr0+nQD/KdBZy1MNH
         /V3w==
X-Forwarded-Encrypted: i=1; AKwUvByt1q+7Q8EH0Ao6HLX8RIyRd03ePLNR8wFH7AUYCFdX8IxLbHkGDXfqIrbCOjKUGz1nj+B4unc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9t2KF0gplm/C3173hAkBxMILY6igxhzRQ92YB4h/bs+0hnWjog
	N2EA9rfovkGoGeqvt3vGNbPQN2PgTTWGAMAJhugj+JWkCzd43J3u9SGnKiZ90YjGryOWIIeoL9F
	5rF3KGZywGpIewOsnC2FXBSQCIzLhsfes27Ew8NdxJmXbtqqhN/y8s+sKt9pHH6l2jK656L1O
X-Gm-Gg: AYBFou2NWybiUGB4JR+ZLGed2RSVKdzqkb807w3QmGHoRyWxBE3uA/bfT4VENx4d3ml
	ARdw1ko8e6acKBNvu5B5Y231vtOH3Zit7hXcyqm/kkKnQwVZUGNNezjcP+MYuKDhmgxV57TpoBp
	6SU4ORSQhdyOXeDRGGYR/2yaYIthdRhrEOljAjVohfhFTK3OBi+OGvoKd4KLka+Np5w0w8H0Wcl
	mAyHfcpkbDeLyw13ZWnXvldIjInamhoiQjeOuqQ8+uqF0I/uONnvffw+GkPueOhn4rbe7M8/kM5
	uC+jnvB2XhoblMxI5CEcWdGTCBikd3iSwZYRI/TnooHa3HI4ieuL0LC49N1ajKHRAVh4aZgCErg
	+FyKNqwGJaSiq3xrGgHGSlIuYhQ4/CGaoHrazk7l5C7jxMuuvKesiUWkxjCSuAiYkJ/9dpCGyCx
	9zKYrhSHjWr6fIREsy+poNCmYltbMQLtA=
X-Received: by 2002:a05:693c:8951:20b0:36d:f46a:87b8 with SMTP id 5a478bee46e88-36df46a8ed9mr73478eec.37.1793814780618;
        Wed, 04 Nov 2026 09:53:00 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:36d:f46a:87b8 with SMTP id 5a478bee46e88-36df46a8ed9mr73434eec.37.1793814779881;
        Wed, 04 Nov 2026 09:52:59 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm14147740eec.11.2026.11.04.09.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:52:59 -0800 (PST)
Message-ID: <d00469f1-886b-48d6-9b15-341d8abadce8@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:52:58 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: refactor m3 and aux_uc
 firmware memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <20261104-m3_and_aux_ucode-v2-2-b6c335c14dfe@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-m3_and_aux_ucode-v2-2-b6c335c14dfe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX3Kp+K+ngb3bm
 MzhJ2mSk54+Z5tiI9+voS/F20WNykhyGZqgW7hX5b3ITKqXsW5ELwel+TZqiRMqDqDHzwJmC4K3
 G1xelC8ApnlE1YHanXEHUrexuLUG59M6ZmqSVWX063nOuDTvlY09EVynFp3b8h8EH+H5tzNfHHD
 VEX7/Gx5Sg1W9hC/jt4yGcCDV4p0JoiVW1MMTgO87FxJxlW6MhinIuNptNu6sHfjC2ZtZOe6I1q
 bawMuhEiSwbmXiTqzpGj8LZaiPRHJx9QKkg7G9D2e7DyCIB9QuG5ij7FK4vypTWhpdRpA8rFEFq
 +Rpr1JG8dtytujcDMUQOjxJ2Q0oMyv7Bx1usHQx38SSz2gOpDTAoX+/tlBsEU4bm6siRfZQmCry
 jAU+PkPnMb9J7vCjnqZNG76SF/e4t94XgX4wZPXSqaH4irZIOpcNtCEkVckKLqa+EkdoO6UjUnW
 SyTfs9foIN6Abvwzdvw==
X-Proofpoint-GUID: CIfuvdFIQeAjpL_qPNj1CXG3NQWXRv87
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb70fd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=YWIT4pjlzJolhlQAvkYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX4x9cUzAybXkf
 fzYT7VOqgcFHHFWZ/NdErVRyIv+fenaSi7S8kfox+h662tIaERRqra2GPR/hYwHcY4Nqnb3Pohv
 2yb5XODDc+0ZJ1F1YL1sAYJRdlZW60o=
X-Proofpoint-ORIG-GUID: CIfuvdFIQeAjpL_qPNj1CXG3NQWXRv87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_095303_312473_7098F8EA 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/2026 10:30 PM, Madhavan Ganesan wrote:
> -	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
> -					   m3_len, &m3_mem->paddr,
> -					   GFP_KERNEL);
> -	if (!m3_mem->vaddr) {
> -		ath12k_err(ab, "failed to allocate memory for M3 with size %zu\n",
> -			   m3_len);
> +	mem_region->vaddr = dma_alloc_coherent(ab->dev, len, &mem_region->paddr,
> +					       GFP_KERNEL);
> +	if (!mem_region->vaddr) {
> +		ath12k_err(ab, "failed to allocate memory for %s with size %zu\n",
> +			   filename, len);

I've dropped this logging in my pending branch:
1) checkpatch complains about it since the failure is already logged by
   dma_alloc_coherent()
2) the pre-existing M3 logging doesn't trigger the checkpatch warning only
   because checkpatch has a 3-line lookback for this issue, and in the
   existing code there are four lines between the assignment and the 'if'
   statement that checks the result. had the original code only used 2 lines
   for the dma_alloc_coherent() instead of 3, it would have been flagged as
   well.
3) in the case where the memory is embedded in board-2.bin:
       if (embedded_data && embedded_len > 0)
   the filename is not applicable so the message is actually misleading

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=f4d0341946db1dcd3c36296d7577f2444cd7d412

