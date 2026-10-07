Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43FECA5FF1
	for <ath12k@archiver.kernel.org>; Wed,  7 Oct 2026 09:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=; b=Jb2Ghlb56/ildnW5SyGiZTHlS7
	hz7XViadGTfW4M/4pTucpoJLwKowE+kynCI7crl6BvuJ/7jI8JzzZpAynD5mQGrbHLmLDkwc6Y8u7
	RdZErWt2fBD8IMAxiN2Rz8m+FKsNzCay6v/D9c/E6Wv6vWzMBPegHYTpEqefs0Q7TUktgsl64OSaI
	x/RG1mveWu39cjpzLdHa20l0VfIAcPy54H6EkqkbQi5CWH2YwRWfcYep8aH+4M2J/MuAhD36n4fCW
	ttljA0pjkrtr541yEBXau9W97P8d5wIfVA93pD1iBq3O+Z2WrjRZOm/6/xi89CWbk0LlbjKBJCe+G
	0MYaLK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEO3f-000000024Qr-1ZEZ;
	Wed, 07 Oct 2026 09:35:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEO3Z-000000024Pm-0DZH
	for ath12k@lists.infradead.org;
	Wed, 07 Oct 2026 09:35:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jdvo3194030
	for <ath12k@lists.infradead.org>; Wed, 7 Oct 2026 09:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=; b=Kj116TiJ1liFsAdP
	EPU+WEWBIHdO1GVW4MLVqZK8qsjfeqw7LLRPlscuIYy9UE3V09Av4qHBWVLrG0iQ
	Al2go6ZFr+priuiQov75UVvbuV1VLd5WgmiRbmacTdxxE/g2jFYofOJejNWEdtl/
	8x9uu2gPiJWLAqXnWpzoMOoc/5OydJtojgsrRTFDrPAUE4zVrMw0gWnIJmD4keQB
	xAsDkV4d1NTQQoouh2K72oeOfybyOxecxSlQhJi3T6DCwMvrPgxLn9BoK17F+QyN
	8uDuEsQLDY0Wu3xSvKJX5n5228lSbni+M6GokcePJt0dtgUf0/drhqVbNvbgSCZU
	76rGQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uknar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 09:35:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510a481ae9so7485206eec.1
        for <ath12k@lists.infradead.org>; Wed, 07 Oct 2026 02:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791365722; x=1791970522; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=;
        b=Q6N+Jl1gwrSoQRU+v1+pERvDMtCAXvOqYG+Ix1QbjzHt2h66dLOeEGGX3Pk4xUTbBi
         ROsMdr17fGvBQjtN2WiYzUFvxz0HeK9IRCsgH/FdnZgFUsP91Luk9RbKuP8vzTgMDM8+
         HfINg3cT96ka4MN/ZyyQLxZCzutx6SSKqCXU7z+v/OcMp3vLIIIPR1KM6+wlOpPr9Bvk
         c2jEDT2yl+2HAWl0CLqbt/DwGoYoFkypyAWGJVn+UYpmTyloVcxUI4ZqXC6I6RmFXIE/
         pbE0qqyTv9887dxk8RArdRblsyr8oX+UbechJuvnguEYVJSaDDHvGt21/ATmL8Exn5Q+
         kBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791365722; x=1791970522;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWHBpKt1zMgFknbQah/VG7jCcJ0lGDysyv+pzjzXw44=;
        b=uoBRexUNmglHB+pUNQuHLwRsuavQ3wJdxJA8DTRrpJGKgQQbUeTXXrV49jRSKITOCw
         VxwfsYbd3rxdeKDq41yAtBK+7bRieJoyCT8xO+XNdLIxFf4eis5nOo/et6j1ulPvgaUY
         YC5PodtTfpRTqBp2+i5OPWTMw+4sMT8QyRTdP+nWMpAyP8Fuywv/Og5eblxJ7m2cF5MC
         ki9Mmu3mUz1FmuiooAd7266PQ3KSo4iG9Mbmbb+Bfz+qaxLV8vTIZq4a8iswMFCmR3LE
         3+/Z4cJhlCZRtBZlDnQHkJCCcV8RmV4HnkZ4nBQTxNGtLJGWzTvWLDSDXjNEKAr7kQeQ
         Bgqg==
X-Forwarded-Encrypted: i=1; AKwUvBzGRH0/+80v6u0YQQoz0ydgP/iiVotKRutNt8EjtBJyKlQmNvKAjR6znKbkYssBtSDaLCAZkIs=@lists.infradead.org
X-Gm-Message-State: AFq9FYKPCBN2B2RpsSKDFEwLUVQwDh147bhckQpIoc38v9B5d5IX2tod
	+vLBvWiGLJDdHLG6T9N9ANBkR3E+C3xTVBtikLXaZR/oNwz9mAjtYCHSN6TOSEytTh8sgirgTrp
	FBfrSrznoqS+yrYbIZFQ7sR3xdjFSkQsbybMC+Hw94vx1RpwFkAkoEq8T/kKxoB6y
X-Gm-Gg: AYBFou3E71egvSWRlF+1nK+Gv0yJ3juABohosE1xXSYXZ/xZqi4eryE9HYeAz1KE7PU
	tXDvdSno4gA+IpqNbReoHG0iM/ci0aptIX1J7CwKEkgrZQwNXeIFymyoaXQAniIvfx9rINOzSB8
	q600UWyxr62PnvAT82Dfiakk5yFq4TmUhYgZz77HmXUji/9wBcSYFSV/wcFbLJs4ug0PGNeXICK
	t7/lFy/TKfo4kgpXCf2HRdyRHZzFXNRl+3VpB6RXZK5r6Gyx8nW2Xqe3TB7TnweOX7PFec6P3Zl
	6VI7o8S5YQaOzOW1sp24zhoAv09VWDx/uiTwppWVsPAprxaGOlzyE6x7e6orgvm1wN7ducgxJuU
	tpDmGXpiBchKZDWypidtAsLS7ZxXvg38PfvMKRY/h
X-Received: by 2002:a05:7301:670a:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3515dd4c790mr2842682eec.12.1791365721648;
        Wed, 07 Oct 2026 02:35:21 -0700 (PDT)
X-Received: by 2002:a05:7301:670a:b0:351:4d03:c6a with SMTP id 5a478bee46e88-3515dd4c790mr2842036eec.12.1791365714103;
        Wed, 07 Oct 2026 02:35:14 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm7406692eec.22.2026.10.07.02.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:35:13 -0700 (PDT)
Message-ID: <6f6efa34-8e87-49db-bef2-e552c9abf0fb@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:05:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        baochen.qiang@oss.qualcomm.com, kang.yang@oss.qualcomm.com
References: <20260922200643.1133491-2-ivitro@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260922200643.1133491-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HT9fnLM8Z8v9tJQjsfno-WLMneGVTep-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX8EWhys7INU6k
 ZYMlmuvjiZyPsAc7ZHw9PB2oRLuz2crE7h2HYgQQpc2meeHThY4LD6/mX7xDHqKvqjFRStn2E1U
 xQ3jDAPSvODSltimi8s5LppZxvTIcWU=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac6125a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=PJUtwoy5LLMsS-UO4yUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX5KEQYnCJFuMh
 9Rts7QNplmgNA7z4RkTn8+QIn02Arb2T1DqlxJFNzvT/j5mIT0GX8z/0Dd6VecSvB4DytoyvElp
 Yenjk0h29JDWkWZhpfPVXK3piano4bnKngjhTV7GkQg5z6z4ponOtmZs6JCyFGtB9W4jbNrXQdb
 5g0EWv4np5tc6M43iaiFACBKFq7M9TSxjH2Q3hJD5csxZlvbCZQa3rvCH83w26nf1ZDp/8YsH6e
 tb5hI0uHk3EsrNr2Cz3SXWeU0CB8RebzgZdo2/bsnRp2u8WGcwA8Ig5Ns8inWE2aoLZ11zMy7Af
 sIK8HcMY+7oZ9c/UHB0X6HXUaq1nDQ4i/cpfIoIHrqZH341Sf9C8SmktnXFty3VhCaOBrem6b+a
 8oz29WprQhba9ltj6cqvkkwZNEODOCsG1Jh4nlpTaJlPz6WbJbv0rsqOK9aCHsbWJmd5ceW5tOj
 6JKY9XVTIV2mJrYzC+w==
X-Proofpoint-ORIG-GUID: HT9fnLM8Z8v9tJQjsfno-WLMneGVTep-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_023526_713905_B6F39CCC 
X-CRM114-Status: GOOD (  16.55  )
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

On 9/23/2026 1:36 AM, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> ath12k supports creating vdevs with addresses provided by mac80211.
> Userspace can already make concurrent interfaces work by explicitly
> assigning different locally administered addresses.
> 
> However, ath12k does not advertise an address list, so when a second
> interface is created without an explicit address, mac80211 has nothing
> to pick from and falls back to the permanent address. If the first
> interface is already running with that address, bringing up the second
> one fails with -ENOTUNIQ.
> 
> As in ath11k, provide a list of usable addresses so
> ieee80211_assign_perm_addr() can hand each new interface an unused one.
> Keep the first entry as the wiphy's permanent MAC address. Generate the
> remaining entries as locally administered variants by changing only the
> upper nibble of the first octet, which naturally limits the pool to 16
> unique addresses.
> 
> The cfg80211 definition of wiphy->addresses does not specify where the
> addresses must come from. Some ath12k platforms use it as an interface
> MAC address pool, while others use it for firmware-provided per-radio
> addresses. Gate the generated address pool behind
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072. The flag
> is read from the first radio, as all radios behind a wiphy are
> expected to have the same setting.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> Tested-by: Kang Yang <kang.yang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

