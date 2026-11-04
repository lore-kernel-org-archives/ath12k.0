Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE267606A32C
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 07:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZoqTx30v;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dvt1Ofbr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=em28ImT/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=; b=ZoqTx30vepcPpM
	mH7jXYZ25qSh7C2fwrBP1WgdKAFLDuFc85frcDrcY3eWyEVX5SwxffBRlAHCOkWEgpREpgiMqqEFY
	NqcGSF9fVk0xNLT0bBCp1tWKc+9I2+ojfCqRnCijo41WYFTC16qCoNUDmAiHJMzlJFjwhdFTyIKUN
	rXfvkTF39rlQTzkgVAPfWKQPeHJG4dpKuJovqWcVx0TwFT7QjGJWWAb9jjVAxETs+wFuEBjs83kYf
	Z1GqPXpHzwZmfgBPa0uMBP+hgVA0aZgvEwzc8CNIl89mPWGnG/ay2ksF/Np1BJ7yC7tybUzForvo6
	NKLQQWONAKiOYfM+SlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8y-00000004TBR-3Y5X;
	Wed, 04 Nov 2026 07:10:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8w-00000004T9t-01Rs
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 07:10:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46taFO809392
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 07:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=; b=dvt1Ofbrr58NBoVw
	WNP/pnxH/mRsjtCRAX6ocamjOFeTdkZDC4DQPS1mNiZj//P+LXiYt7iLT9qbgkq2
	98T4trQn2Q15fOshFyM5ZKbXG3HuT8B569Issr4WXu8sBKcmxpgkQHzFsfKLBZ8W
	jgHhwg4a0Fj2iIxS6gJPxhig+rVrHzOBmtqNgijTsTBvoEupvdnn8ELRCmOA2pYI
	a1lBk/lFcg2+LTHf0fx/XHoQ6s7F8zbcMQCdgXGiotMyHuZA+l1nZ6RuSs5+QuZY
	t8Z1ptb9ShbQd/otJNkijy+zst9M/01opeE1rpq/X/N7dCtSJnGgv8njpqb53kQK
	wPvstg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpb4q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 07:10:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e95f8543c9so5467675ad.3
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 23:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776244; x=1794381044; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=;
        b=em28ImT/h8cGR6qtvpLClXBxYz2AWwv/Uh53mVOtUZtOUy+Tmf6JHydmkbJwOk/SJx
         DW6+9y3GZE3LfYYPfZ3zpSzrXxNlP6MgYC0JEKDpMH7jADJcnRUYQx8FFRxVLbxJ1KLr
         vgUwzSAlhbjklGvksHTkxW7xZe+je8yuQQx3qCc9X2nAS+dV5pp/NpQeZPzKJgtHJGjl
         jcm72puYRSa29dkZojr/bpDDEw78EDPRT/ehNitmbO0JlgaYFZLWBXdAKpbcyzVtJGV8
         D81A8bb91aDVnmctBQExbRtckmj62f7C+OqKx56/jQ8hVi76Lur3HiODVwijp11XUftS
         VxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776244; x=1794381044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10ADF5JQeUer4/g5urR4VSj0TBVpQcovMyF3zEdeDss=;
        b=F8c0KiPCANxIB9wFjxT8CAUsubpD8X96DpwClWYBgurbqXWBw8c9nGRABG0nC9ThX5
         5I5D/Fe1qDOgfpYefi+WTlqrnXSdYBYkBhtg4EMvylGSf2fRNZd1I2Xd/xNdV5L8T1UC
         kuSp7Z4Nvsmzbcp0JPpecJtdRUHmGceahuRiVB+H5287O8RqlR0luGXv71pXpg9QBwRG
         i6Tx7rIu+DdMK0zLdoe1jARCXGfg4hdmH54Et0vwMv2Rt3v1EqPrzV/7diagytOwHWg8
         FZGaYP3bsnbdIGBm1zDEisWct/sAc1sI0h2I+iXzljoygp53pFCVweo2JPRLB/vWf4xY
         QpbA==
X-Forwarded-Encrypted: i=1; AKwUvBwoNoTvz0Y1gQwlbk8yrpe6o0d1oPn0qNKxXj/Vld+iPNlBJ2vlwtHgf6b8/1BZop3qBqDY3mA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/GQFLWGZu2s1mR9s2+dqWAylpoiqthnfySVKbjGrlM+kL3VVDi
	CTlDL5PqifYXdOoZkLscDq70oHvjWABq7jh7E2kKMVBcbBHMrMI9hYgkNKJrJsfHQXR/0HXCXe3
	PvJconqBwLLuBkZQ0E4a//wIFt+Cv4yxNAyuR00ALSW7u1HTPU8i9w0O6btFQ3e1h
X-Gm-Gg: AYBFou1s9jFvyK42z8H9olQSo+BCgogzQ7P/2eeJ3QPrDkXLXuv5QUkSY9M3Pu+8QK3
	FzG3GShNOUdJIGgS6bJrtlWq+oLvq/Sul1jW4t22dSbxKVtezq00r92gngzimH5BzHp5ZGaqwli
	yTs/GwSYvOIXf+WfRmZCNjWQRe5QYXU3ZGE6RA5cvsKvcdI5l/JO5EQEMe/yreZBIQNZx/befrQ
	HXOXW7JPSloL4w2UrmgN1kJtjfKzcsAHyM8GC+yvRXmLDCGzM7MAzHPPbn808wnN7j24Mwg4HwZ
	QgHZuvnFAMYo0CRwi/H8ekKnQjEJyDX4u+E5FbIT/wjdmuOj+FAC7L/c+tAGv6M++Z2VmFkg1/g
	n/10mF63+S3Jsj2B5YaDD5n+rtoKjhUDA12WKCc09tN1qmiyWgCJnrqIGJrWw6nOvLrCrXUeDgE
	yUNTXE/NGf
X-Received: by 2002:a17:902:e788:b0:2e9:7ace:ccd9 with SMTP id d9443c01a7336-2eb36509c20mr146988955ad.52.1793776243973;
        Tue, 03 Nov 2026 23:10:43 -0800 (PST)
X-Received: by 2002:a17:902:e788:b0:2e9:7ace:ccd9 with SMTP id d9443c01a7336-2eb36509c20mr146988665ad.52.1793776243414;
        Tue, 03 Nov 2026 23:10:43 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091cf87fsm3641085ad.67.2026.11.03.23.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:10:42 -0800 (PST)
Message-ID: <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:40:38 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX9QVgtlW+pnx7
 QqvnCWTD6jQf9dqv1LprX0fzxT/ND46h2f1SK7FaYvza2S79hLr2o5qf+ABludUmBWUZ+q8PAwi
 CF6ItZA3ofjbGZJ/r2I0gkuZt1ET0Sg+5MMXPMe944h1rIDS0raKDN84BoC7iarbGiIQKbujoY4
 3JdNJad+n25yjBYYvaG9P9JIYTszeD8ghueSTawZui9hOjv2ul2AbkCfSr0qiCaDTCpVYMTSsah
 +2nckv5krwgBgpeUH6lXkCetNPWZzJB6fyShWOEL2xqF5RGO634OkS5GUAdDOxMWC38feOvjK+Q
 KG3JkvFG+jMvKBDnz+rhH0Fffn1dXANdpCKQTS/dB1WOtKC1ng6Of2iKysTiWnhIE6o7NOIlTRH
 PYGrikJ06GCHIgJOqmqeuru73feQmNDd+kRFY5iV8LOYulHqsbcpnVS8qk+7yXPpMFgK0Cpo0i4
 9LNZT1WvXPFW08yGZ2Q==
X-Proofpoint-GUID: bWU2nDubOJ1Y6_yYrsw_LBjNP5ZLN9Rb
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeada74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6tpJQmiB9JWEHceHjxYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX8h9KzIEIJHkr
 jqdQnCtMjDPb8btCzS8DIurEyvzNYKqrIRVE4HQAJm/mNsrsMOso/IXKfsrCPRLXgDJh41vCp3i
 4QYgtlJgrXqGNxIGslmjckPk9uONeI4=
X-Proofpoint-ORIG-GUID: bWU2nDubOJ1Y6_yYrsw_LBjNP5ZLN9Rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_231046_173278_2CD9A485 
X-CRM114-Status: GOOD (  16.51  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 12:23 PM, Baochen Qiang wrote:
> 
> 
> On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
>> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
>> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
>> logic for freeing a DMA-coherent firmware memory region and loading
>> firmware into it. Factor the shared logic into common helpers.
>>
>> Patch 1 is a preparatory, no-functional-change rename of
>> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
>> is also used for the aux_uc region and the old name no longer
>> reflects its purpose.
>>
>> Patch 2 refactors the shared free/load logic into
>> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
>> rewires the m3 and aux_uc wrappers to use them.
>>
>> ---
>> Changes in v2:
>> - Addressed the review comments.
> 
> this is not enough: you need to clearly state what are changed in each patch.
> 

Acked.
 From next revision, I will clearly mention what I changed in updated 
patch set.

> And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
> this post? I don't see any major difference between this and the previous revision.

Based on Jeff's review comments, I have cleared the paddr and reorder 
the function definition. So, I thought I cannot retain your Reviewed-by 
tag. Please let me know if I need to re-spin with Reviewed-by tag.

