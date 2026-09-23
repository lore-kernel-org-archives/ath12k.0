Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B612C982EA
	for <ath12k@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=; b=LkOhSVzPJQyGHWiCrM2rE503pq
	XFefjZQFlkcmX4lxa3n5xa6BX1idBfrcYJDb3d5pkRlqPP/d5fWqSsGKR4NKbI/P/G1c6nxGyESXa
	WYkwDm6x1hYjRc6S00lfiW9uVjRweYgeWHlLMXB8dpjwNeSNGDTxBcLUC5zXVYYUoWLP25oCPXvuM
	RCgUgeqI8Nn+4sz9cdm1+ZncBZiQ/zQuBaWC+zVWRdb72bwjCnS342i7Kl+r4feY25Y8TmXoPM82O
	78TW1eG3y6tSBkxKW7h8547qiAg8Jk9Pua4pZ1siEqxyG99szbu3pr+OOjFpIdR2Ou6wbR5DJFbEL
	/mk3FTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IgL-00000007b5o-0o74;
	Wed, 23 Sep 2026 08:50:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IgJ-00000007b4Y-0cb5
	for ath12k@lists.infradead.org;
	Wed, 23 Sep 2026 08:50:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JNZB2854114
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=; b=bdmVqWUvwfUM/NzH
	C9M3sQfHAJVUA29fGYkVINDuy/1By3pWiI081uN+wm29lkXrUhHPequ4MdG99R3O
	KS55ZLpORnebG+IQnodlrXyb6EuEwxcFlHAJsCSJT3MNnrlzSCa1X3JIZyL6aBjT
	D3Qrh9fbdm/QPiTClCH2PRKC0qRHgnumxF4yH5CtJKzUQkdZIVsaKp/RBsJpuPxM
	pPt39d+bdiply7MjlcdkEdfF2FzJVgRv+PxME2ScAVy7xsz2bbbV3P7/niD8m5pL
	yTqDs2PDXShKZAeyWGYN+PB6jOECTnFS8z+4NsunOzEUsJA0oLuJA285IJF5aIx3
	llPiAA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw316b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 08:50:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so840623a91.0
        for <ath12k@lists.infradead.org>; Wed, 23 Sep 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153422; x=1790758222; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=;
        b=M3L4EiVoDDCjlcuQf++kuMH/WUWm5PEjpBYrd+A4aQ9cqI5HLXbAMcmlKiBocWDAw7
         sqs0HS/C3pfjouS7XKJp7IYdwgSMq14m315pRR+xIdiqk8T8jbtEldWd//M8lHi7hAxg
         rU9AzplmzfzFa9HqEIu88TOohYN1RpyJYeCOM+e8OBjB+7mAOPt8cCLklKsEzCAaBfZZ
         8ph1A3VqPiJHTh2eRQUMn3LUdSPuH1oEyEIvAhMEsy8nm0M0qBe13wBHNYC4wsqAR14Q
         bvZ9qVsBG1ancs6xizA+sDxNWhFHsBnOGeS0kQPPpbNSP4yL7Bj9xDMQ46x2xJE3joqH
         n1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153422; x=1790758222;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcBEO3tqolSSDGnwFgxtWVMAvNqUYs7uANQ3K8/ueLM=;
        b=VUrqtrpbuh8HZrv4IG6tOqgDRknNq0gZtBjvWvgOD9S5u/2ODrxSJ3rxEaNA8LScox
         bdDTAo4A50qL/vTFv7ujEr5Ogj0MMsSKjaDM+r7vhO8Uj99YHlpven/i1bBCkrovApzq
         H9UyuThdBhoykKausWkhE99Z/VX9Z/aCNwvmkJEMPDouOFwBRY3hL2CwOVuCQpIvp4/q
         HrT4n3420QIDgwJJuYrkL8E6PeFs8vUwCPc/coS907K5DER/7OoRIkLLhyOJfloZX/kp
         +W5JFPwOSlGFWPIOBpJz7mUwN9qXpDoc0Co8hu+zrXrS2qLCt8P6HIfnyNFdihQJdoJ3
         PIZg==
X-Forwarded-Encrypted: i=1; AKwUvBy38QEVkfZBjt/5So5jv8FFqSK4x7hJmhYT8ACvKGtV5HLSl2+TewovVfqX0GnV9LqbGP5LlnQ=@lists.infradead.org
X-Gm-Message-State: AFuF++llOCcVnS+9/1lFsNbEkiZDEGXi/YyJj+GtTpzEcrf2IChczo8s
	vCK97DnEl1o4M1xD4RU7/O05izDBqPTsUXOCdfopbPjxDxq4u3I1vMH8FzWfEiuq22ibzbwGCwD
	GP5cHBLcye5K+4IfoSa/i2d3lXVKOqzlx8mpWH4jOfzv1Fjzh7Kbs9Z4tdnCGzP/O
X-Gm-Gg: AYBFou1ssj1UO4nvoM1cMh0duhHCa/Cs81llKkeU/jflLPqSqqfv+WJcImcY641Clik
	K+eSWL07Gyu01Cm8FnsZKc5w5zlzZMGf9hRzU/NC01x8ew1dkwqMprsoQJHLjpmbkLC2Wpiccfe
	1ZQowBVP1suuavOe2KNkfsaGW58Lk7wohwZTdQjiviLa2TphXjjkroyst+pImwzwNbHuK9MgOhg
	fhP1ta2M0yPK3ZQdx34adIpKeRxiORXdmLsPDw5/2gF6k83rB/5ykFPYe6As+qW/x+9RFolk9r3
	B5Ti8ZhBvk/bB1SDzTE/COjpJyAfdBTJypH4E5gp10dkQDjv5g+SLHZlKz5Tib5j4xN2vVo6TOX
	0LkKjefo5QWxv0pl8aDUuXxuO9uOIcMrvcB+wPa6e8FOqdYeXTR+p3ycKkRtTpFO5SfyQ5FI4
X-Received: by 2002:a17:90b:33c9:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-3a07e6a66c2mr1496384a91.24.1790153421764;
        Wed, 23 Sep 2026 01:50:21 -0700 (PDT)
X-Received: by 2002:a17:90b:33c9:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-3a07e6a66c2mr1496355a91.24.1790153421265;
        Wed, 23 Sep 2026 01:50:21 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de57682sm4609661a91.16.2026.09.23.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:50:20 -0700 (PDT)
Message-ID: <6fc9265b-c58b-4747-a5ac-510e93bce60e@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath12k: advertise interface MAC address
 pool
To: Vitor Soares <ivitro@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kang.yang@oss.qualcomm.com
References: <20260921173033.846332-2-ivitro@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260921173033.846332-2-ivitro@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX6eaajfErPpNz
 K9PlLPR1qSKLvkGLpZS5YV7r1E4vytToymwGCh88JivkUAZdzStqsB1co+04tmRvBEo90FxgVa0
 Jc9IeTu4VnDUZ3v1bmnWSTawAuo7mTA+C9tCTjPzMKhJYUmq5R5fbBxSqD8QdNK0IKZopXZQrjr
 pRCVM6sU34zTFWrKia3m0LKRzn8hPd3SvMXsR6JCYUnuVhNwY7gzn+hU424kcaTT4kLKwHOTEU8
 uqttAEA/XNshAwZxk7NXVhWr+yx/4QxanGUpypjgier2LLBqogV0nxvASA1ee5CT+UF8gOOOjwd
 EgYPyGV4RmqCleqgUNDHxf1elvpjDlG1bgrgiQad6b/WH6HtXp3mNh0oGLrqElQVNWZ6z+kklBb
 v454IvbPaeSbAD8DlIwkcNgKsA4/+g4HCV/GxgVWU5+Gj1bqNFg3mADNZGDdq4Qj5clIfYdk0G2
 /0IQEPJ9WYBl1EOzb+g==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab392ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=CvJZMSMp8JnWWA3HaTQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: kFY18Bix8a6OEZjZ823JxoSnmk8B2fYo
X-Proofpoint-ORIG-GUID: kFY18Bix8a6OEZjZ823JxoSnmk8B2fYo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX48KMcdkKXZBX
 kN/YZ/Ydp6m7EPOFjyRwHDfptzRfzJT1cTeAwPumDanNfza3GQYtDMFYF+N0sAy4MebSMQ+H2lU
 nD3K0OYjCdSfCxDeN6PqD5pCH6dMYZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015023_207416_98C6BF62 
X-CRM114-Status: GOOD (  14.62  )
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



On 9/22/2026 1:30 AM, Vitor Soares wrote:
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
> advertise_iface_mac_pool and enable it for WCN7850 and QCC2072.
> 
> Other platforms keep the existing behavior.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Assisted-by: LLM
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

