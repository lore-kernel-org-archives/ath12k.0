Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82CEFD4F08
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uivpYYPu728tHmFs9Lf4h3GhDtM5MMCXZhENiZzX/Eg=; b=WaHBIBr0OQGbM1mW1FDszd9d4/
	4WvBj49nRKtKdtO22uy10XRZo99kxn4rUacUzaSBzh0XHKtS6FBq1IRg+e189Aw4GnOHk2Mu5Pfnc
	Mpi2OMe7hlt/+c5EVpHkNvHfcJnUD5M0+pp+ngp5OC8UCT00FErT4YwF6IeWR6STucw9bawSr9Tbg
	grQs/o9vLVvXdQy/HvF0E4Sj4syGmlrNtD2B0dJr70SDzQPuiMz3eJBfNUAadDq5ZbNvmgr4M5KTJ
	L9iUl3ej6hK57KctqHs2a6YnGxpMYFgLJA6BR1IHXVAlsyq+u/ZgHdUmC2XUl3WyN2V9/WhzqZSiC
	n/e/ghDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01J2-0000000A1pG-1tr5;
	Tue, 10 Mar 2026 17:55:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01Iz-0000000A1oa-2gnF
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 17:55:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AEF0J61863237
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 17:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uivpYYPu728tHmFs9Lf4h3GhDtM5MMCXZhENiZzX/Eg=; b=g4L78VtFmmtBGHDj
	v+SJZMx1SRfAqDfqUdoMbRb5LEm7ZWDgd0eMEfPNSnD16juztp9WylU2vTYyG/Rm
	HxDnghmUHK8LTQ5gR/Xq2kY6h9yvZJs1CUVePkolIiMCoIZruoP1XCewG9ZbxZEq
	TUfBBVPt8HCjny0xd8CHmIPWHMXcpyIk0wjxZZGwrZdnBw0V46u8Y3+P/xGnBXO8
	GiNGFNO3UO70iOGkgRN8i+I6DhrXPhywgV9zrJlI7NxsHQQdQEALpoL4VmWANFvY
	JoCzvXzf/2qUnIzcc5zH1u26ijr98AcE0H9DCsmmHvJe5eA3wmsgFsmjseL7tt4W
	8TRYsw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw80xjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 17:55:41 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-409698ea4dbso1586118fac.0
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773165340; x=1773770140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uivpYYPu728tHmFs9Lf4h3GhDtM5MMCXZhENiZzX/Eg=;
        b=H0ww8z3SbjuU4smm8M7+VpHeDeN+Tpeo7wsHsUTI5utX8de2bg3hTgFI2SC8iuO3Xd
         XaxTVdguY6BjPXW5+sFnUCSqtUbg2b8K1vGda+Rf8lSzW7Xet+bM+odBZzemOOQRp1J4
         egokT3GO1HjuDBbvA3kjBlqjYMUfJ3NfjhH8jT0O9PF0r4PMrTLODmyJ/1goBpYcgqWD
         0Vs2i1GXBYTolvTqH13MhYrHyo6FfjSOIpwQcRLnYiEeWI/LZAVUJE0rqeFGs7H3Fat1
         SAwh5+c4jXqQHae5Y6xo4YmIBBMHfsSHWpAtJ4ujlX+28QQFym2Dk1avfx0usw22ddxg
         rCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773165340; x=1773770140;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uivpYYPu728tHmFs9Lf4h3GhDtM5MMCXZhENiZzX/Eg=;
        b=t/aM2tAl+ndx9EPnCwmnoGg7/hYoI3WHDF4hfdKN2kUeX6UymstC2CAEGAR6ylGhMg
         AsEMyBAsTKysSaYCD3TsLXvcMcxaUK0MmNvA/bshu/2N/7X7BVaBHHHzhZqV3T2EhM34
         E3o7CzhllHoKXudlgsw/b0ypRIjo5iTHg5yS0HlgC3crqC09xrZ3d6BHcilbdw8gz8Eb
         t1qrbZKEho3WWiQb2uDRopUaAuF+TASyuIdwETy4Vg9hL57gUsDSnMjZQ/0/YMgXYSb1
         CaQdRvRVtc5S9epqetWx08wOaaS1JfIMDiuohcbX9HlQG6CRIUhHCMYLBUsSLi8YFusX
         NdIg==
X-Forwarded-Encrypted: i=1; AJvYcCXUlajzCu0UTSG1Co5CfizkHUZlSXsVCFs3zXZtiqsH4Z0SFAt0apGUxeeGHMIY+zHw6Y2lQB4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxezKfO0ViqaPr3VIUG68CGK7KH/2l16kvc4e5VSMPXjbU9nARm
	8TMRgvqDHll9zY3Z7aH6xiJIPYXukwosKfatEQEZs5Sx2pw5D4WXVZnIWMyvTlMzzHDsjCBlySp
	QJLMr7hkxqbQoMR0l+SY1L6UocPUGtc8jwO+DuXXUtTnmV22TSX7LA2YMBtiCNcZc
X-Gm-Gg: ATEYQzzeY/iHPaqQp18atgRoiwvX2grm7wVW5Y3Ht6wICXWfoJjVE/nGAW0xqu5YWkY
	Pr2tvP+xq+fgQ11CSz2U4dwxgWmA2TverngEsp6likgXbvf0aJxCGwC4O+z4PJ5C7cb5tXVt5/K
	/8pwei7grTjNY62x/WfXW9/fM3obp/YXJZhG+jqWlMglCr6CrIYrI4sRYbBUcwbpx8HUMnuPiA2
	8MwZq2ZbxS/aC9gO87rOObPOgkOOZ4DUm2POxfcsP5Pf2S6JIDHq2KY+wTl+YRLb9cMQGfsA4NY
	5DeFpuDgIZDS0lI3j886/gWbH0XSdPXy5R8mnTgbWNFRcNJtTg8mgexB4Gj4etVmlCwg2pAGZlA
	z0BOLshe0yc3rIw68Ni65OO0/0YWO8Ks14ldhahu0PtGArGlvpygD2saLuvgUZ9P0RBGhkohKKe
	DfEYpgFA==
X-Received: by 2002:a05:6870:178c:b0:417:3ee0:59e4 with SMTP id 586e51a60fabf-41756808056mr2464506fac.5.1773165340144;
        Tue, 10 Mar 2026 10:55:40 -0700 (PDT)
X-Received: by 2002:a05:6870:178c:b0:417:3ee0:59e4 with SMTP id 586e51a60fabf-41756808056mr2464489fac.5.1773165339655;
        Tue, 10 Mar 2026 10:55:39 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756dcb1e8sm3402971fac.16.2026.03.10.10.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 10:55:38 -0700 (PDT)
Message-ID: <8aaacbb2-8ce6-42b4-923d-78491df6d31a@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:55:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: fix endianness handling for SRNG ring
 pointer accesses
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260119073923.764245-1-alexander.wilhelm@westermo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260119073923.764245-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: deSIRgbNB2IjIl9k7ys2NunkCRNcXkXy
X-Proofpoint-GUID: deSIRgbNB2IjIl9k7ys2NunkCRNcXkXy
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b05b1d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=N9GNhs4bAAAA:8 a=x4LiasA2zIWtCAHPNq4A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE1NiBTYWx0ZWRfX/jZVnj7n6MHF
 ID4dUOlpSB1Ixt7v67FhAMnKqqbkE03uZ3DOXFjLhGCp/FxOUiNzmvokln7C4CQw8K/qTawJOKB
 5S9R7kcE8hNVCgqevy3d5hUj4ok4lqxai9nhaoodPqimyH0FMAU/J8N8lybVvPXyeC7xs6PnaX2
 O05v5livPZjux8d1IJ/qUL/dtPZ9XhDkEJG0nzqH6V1cFUBQ2sxOto+36LMWHeGSteH0c9C4Z+r
 4dINdPXYGsYdNa1y8jVdGqFTh9WFv/oVK/YpIoVKxuf8v2UFYoGbiOt933raeU64POPnJCRXuNu
 IOZHfKUea7Eig2rtabFLiE+taot9l+3srv0Hb1EZj8tEUz3cK5g9pUR/r4nuGwlDHo2uamrgOH8
 2DyDlHqNI7rf7rewqNROeOzSLvchzwBIbyw6q1NndJm5TiGthNTWrmZ/V/4GeUungn3M8G1dYRl
 3FqgGffE/fG20WyxgKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_105541_693316_625DFC4D 
X-CRM114-Status: GOOD (  16.90  )
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

On 1/18/2026 11:39 PM, Alexander Wilhelm wrote:
> The SRNG head and tail ring pointers are stored in device memory as
> little-endian values. On big-endian systems, direct dereferencing of these
> pointers leads to incorrect values being read or written, causing ring
> management issues and potentially breaking data flow.
> 
> This patch ensures all accesses to SRNG ring pointers use the appropriate
> endianness conversions. This affects both read and write paths for source
> and destination rings, as well as debug output. The changes guarantee
> correct operation on both little- and big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
> Changes in v3:
> - Rebase on latest 'ath' master
> - Use always 'le32_to_cpu()' macro for conversions
> 
> Changes in v2:
> - Set '__le32 *' type for 'hp_addr/tp_addr' in both 'dst_ring' and 'src_ring'
> ---
>  drivers/net/wireless/ath/ath12k/hal.c | 37 +++++++++++++++------------
>  drivers/net/wireless/ath/ath12k/hal.h |  8 +++---
>  2 files changed, 25 insertions(+), 20 deletions(-)

I really hope to get your changes in.

With your changes sparse reports:
drivers/net/wireless/ath/ath12k/wifi7/hal.c:322:50: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wifi7/hal.c:322:50:    expected restricted __le32 [usertype] *hp_addr
drivers/net/wireless/ath/ath12k/wifi7/hal.c:322:50:    got unsigned int [usertype] *
drivers/net/wireless/ath/ath12k/wifi7/hal.c:333:50: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wifi7/hal.c:333:50:    expected restricted __le32 [usertype] *tp_addr
drivers/net/wireless/ath/ath12k/wifi7/hal.c:333:50:    got unsigned int [usertype] *
drivers/net/wireless/ath/ath12k/wifi7/hal.c:387:42: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wifi7/hal.c:387:42:    expected restricted __le32 [usertype] *tp_addr
drivers/net/wireless/ath/ath12k/wifi7/hal.c:387:42:    got unsigned int [usertype] *
drivers/net/wireless/ath/ath12k/wifi7/hal.c:390:42: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath12k/wifi7/hal.c:390:42:    expected restricted __le32 [usertype] *hp_addr
drivers/net/wireless/ath/ath12k/wifi7/hal.c:390:42:    got unsigned int [usertype] *

I'm also getting checkpatch issues:
drivers/net/wireless/ath/ath12k/hal.c:503: Lines should not end with a '('
drivers/net/wireless/ath/ath12k/hal.c:531: Lines should not end with a '('
drivers/net/wireless/ath/ath12k/hal.c:551: Lines should not end with a '('

Can you address these issues?

/jeff

