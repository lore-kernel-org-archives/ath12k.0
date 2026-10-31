Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B5606A31A
	for <ath12k@archiver.kernel.org>; Sat, 31 Oct 2026 00:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y3DhDqqn;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KaIL1N4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0D4RUmN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=; b=Y3DhDqqna/7BDd
	mjerQxUPfcobcrWZ7tfsq7r9d+ij6ODJeveImxBfJ1kQdaEXiKIcg01k72A2WYdHaHnpQZmGdUCVt
	e7zCbzFZG7LL0PYD2GkwZM66I5yO/GEdbK6IlmV3n8VvQLYOkRiVyNrGRVOzHhd8VWZlpBzes7ohg
	08A2lyUKzA3LQCjfJJwmXLRp2/kd3l7bMQXlB484tXrKXLhJobPhIHsr8Q0KmrPU2qfRCNDDusr2W
	TmmqvFPidL0fdYEg+W+NC623+zrAUy7uJ4REVfVgE0z8HI+fvYCn+6mqeWhsed+AbgVjuYC5nzaBR
	q0IoPNPLkJA2LNszuEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxJD-0000000CnuA-3aMb;
	Sat, 31 Oct 2026 00:50:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMxJB-0000000Cntp-0rVl
	for ath12k@lists.infradead.org;
	Sat, 31 Oct 2026 00:50:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtTlh925307
	for <ath12k@lists.infradead.org>; Sat, 31 Oct 2026 00:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=; b=KaIL1N4QFUwekjB0
	NF5mKnBlnGyRrXJ1omtGRYcwarwxq4ZrntPz0soTHV3AOUis0Mt5DF3Qyo3UJNVI
	kkN75NNzTIav0ikNd+Vx6eVZCToGrR5sCnvvH0mnRBhtgza8xb5tEqTzPm6ud0+G
	IV6plYy/db+vT5uUJwdnT7LrWTtQ59dAbezp2V/B233shL7XnFp+/lakiJIc1mVA
	Y6pqxAU1Kf0tMJWN1Lhxom4uRoEJW8AI4UM3zFv0Mkgx2ylDpCeXxwvr3z8h9iF5
	3zJUCayspo0RPxG9sSB/hcUxnH4VNGGMKiPZEkCYNZ+khxMur3+uzQlsNH3JilDX
	0ik6xA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x08k3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 31 Oct 2026 00:50:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18eb2616974so3930477c88.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 17:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793407855; x=1794012655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=;
        b=O0D4RUmNKOdO+C8imzKM6dBzBpZsXkkGtI02s1Hut5OLM144KZxTaZZQkuOcGfe2/I
         GRBzvuvrexgseIr/ZWMXQOF0SLc8f5O0Ap0TaNeXlGRfWOX42OOb3pDkAMy3r3+j9VM0
         EQS2Y4uDdD+JcF+gn867xZqorW+oK7Zx3M6xT2rXMHBnbT03nOpNr7C2x/9DeVRl70IK
         DYauRt07KKuglRaMNzcR7xiLBuNP09/9tEw5KbQShWHEgmJ/Yt5Gep2fJn1dU+HVTaY7
         iQdvnb58/1xL68YuA3q2zISrkSVSFoFlLh6gJL1svlE1e95Z2kCL8Ve7uECGDShcIjXq
         C0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793407855; x=1794012655;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iLbcIK1ROxHAqAZicwghsY26jAXKiGL1CdeUbl58kE=;
        b=DX3jRfrQme3kTHJf8EZ/2PD1WRdoiZATqlZ/3Dz7uTD/DEPaeVgbjSy19a+yuWKkLX
         JP1QK0rO3D2rWhCDOzsr/04dTHCakhcmClMthVA2m+7ndWRUiQ9d2fWOwQmD9/UlRcSc
         iVtyNnrEG25nCtIfI5GNqTZd4bJ5qd9fgf3jhkeRJkIPj4Zi5EWmOTbkcibuFYmrUQD/
         oS+8tvgzO1cJJtD+O0RgyAUL5oMa6S/CgrvziPKYBT6KTzTFZnjtX6yjXqXzrSTuIQKl
         xX+kru2dWvSvGcCJUiEmgBNwTRKbJKqQSUKoYB6mYu1Or6nJ33dTJnstqQBN5vU1f2xv
         RenQ==
X-Gm-Message-State: AFq9FYJSx2f/4LqwI1VzsUSAIYH1PdBdSgkgxvFCLUkWlCWRut04KRrj
	DF/7RpNlZek4pPkdLtJm19VDDKYwAFyipOKMae8/31wC/y/5nEIjzi/Vc93YM31UgK8AqfrweeK
	UfWbojC0coCOCqRsbKdQYFhW+Fn29OgK0q5KC3HTiJSk3MFIZdBt7fGrqSG7jlwEH
X-Gm-Gg: AYBFou3LvpuDauR4Tm2iDG9yyp/QqNxgJkK5yPGeoYZHuLSZmQlJ3rUK+KGnQaYduEp
	KGkfXkow1jQAFANSM2/OjRWTKFtrxiyEdA9jfgf0umVUh3SHFRGWTZGp9GnNsJkJAGfZJETsDdf
	KWuW/N5nPfdpEWlm2E2ZDLEUfyAlKHWJyxxCSRv4gzx7V0cNUPxrdJvMEJ8batjFOonIn1wHcxJ
	BYoeZJHJJb2vONxPhtiDvD2QArJNXU2a6XH7KwhT0RhQ6yGrtkn696dgqiB9qCHChr/ajAfDsQR
	zJM0vA98GuWsMldVrauY47lYqc5q4DF7PyBx+bmrDA4IyD+rnItu6AFLldPSQK6LQsA6v0QEIVD
	ORd1+Z/Xf5xGt2ozHzw0SDcPUqHxtNYgpqqZoCI6ZhwrMnR58E8dt53bWRl6KytyJoRto6vAxwu
	LbF1NXKGbjZJyAtaeVrPEOHFFpEr8RBoo=
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr5752355c88.24.1793407854888;
        Fri, 30 Oct 2026 17:50:54 -0700 (PDT)
X-Received: by 2002:a05:701b:42d2:20b0:1aa:6c3f:2f7b with SMTP id a92af1059eb24-1ac5b3fdef6mr5752325c88.24.1793407854248;
        Fri, 30 Oct 2026 17:50:54 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a13652csm11452134c88.17.2026.10.30.17.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 17:50:53 -0700 (PDT)
Message-ID: <e57a8259-6950-4ccd-95e5-d6d1feacce2f@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:50:52 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix wrong register read for RU start index
 of 80_3 segment
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030090906.298234-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030090906.298234-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nHTLCgSKMB8gdpudalq30K6-fSIK4bqs
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae53b70 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=LQZMuA99dPo4G15aSkQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMyBTYWx0ZWRfX1QiLdMCqlAEo
 KiRh33az+cj2eG6P8c2ok1+AZa1P8QNxm+WzQqife94dyvA+fTinOg/HXy1rOEYgkeD9w/7Ek5K
 yOYBiOp5j+S4j2Q/bdYp9mux8cCSmn2G8I/68QAfUB4I+juP4RUlwTNkms0MiqQdXN4f2I6YvbC
 TTBLLjNBPvBgmUoLL6ZYfw4SEQuROmjC9BPf4B0572dIZxNpPg26z9TWNxf2ZLe558tKQUBl79C
 zGNSSzqTdHgDchB+TXAAsZ291iYCaTfdG8DC8D4jbTLYLNeDlEmwL+rbl04Dx7BtuNlkQQA/Iru
 F9N7eCGE9YybxAOcbBPq8jMI56FvyARG8T6cHp6o+1mzveg7J1IgXBSUfGEoqM8pqwMezNdZyb/
 IJ9GlEIq0Lufc94oo00MUljL7wZAT0l4T+Qj5dejE9WpdtWn0YO4JtCuLrx9wtNypadARDIGxZg
 vGpjiGmcWCtJ5HQgO5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAwMyBTYWx0ZWRfXyjNJPNU/4G5x
 keDk1SLQ5Gs9L7zFycNzCE7YTCvtaVyRhLmeI4lEeAkORoOTEeHPUaKSeUpcCxpDsCkTGH4/OGK
 vHFrsClyP9XbdxksRXfQYCFuQAlW9nY=
X-Proofpoint-ORIG-GUID: nHTLCgSKMB8gdpudalq30K6-fSIK4bqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_175057_404179_CCBBB65A 
X-CRM114-Status: GOOD (  11.56  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/2026 2:09 AM, Jose Ignacio Tornos Martinez wrote:
> The RU start index for the fourth 80 MHz segment (80_3) is read from
> rx_usr_info->info2 instead of rx_usr_info->info3. The bitmask used
> (HAL_RX_USR_INFO3_RU_START_IDX_80_3) is correct for info3, so applying
> it to info2 extracts garbage bits, producing an out-of-range shift
> exponent that triggers a UBSAN splat:
> 
>   UBSAN: shift-out-of-bounds in drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c:302:22
>   shift exponent 284 is too large for 64-bit type 'long long unsigned int'
>   Call Trace:
>    ath12k_wifi7_dp_mon_hal_rx_parse_user_info.cold+0x3a/0xef7 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_rx_parse_status_tlv+0x621/0x990 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_parse_rx_dest+0xa9/0x2b0 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_srng_process+0x34f/0x560 [ath12k_wifi7]
>    ath12k_wifi7_dp_mon_process_ring+0x205/0x270 [ath12k_wifi7]
>    ath12k_wifi7_dp_service_srng+0x1b4/0x5e0 [ath12k_wifi7]
>    ath12k_pci_ext_grp_napi_poll+0x43/0x100 [ath12k]
> 
> Read from the suitable info (in this case info3) like the other three
> segments do.
> 
> Fixes: 5db19c488413 ("wifi: ath12k: Move MU user processing to Wi-Fi 7 module")

This is not the correct fixes tag since the issue predates relocating the
code. I had my review agent follow the guidance proposed in [1] and it came
up with:

Fixes: e6fa62bada87 ("wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support")

No need to repost since my automation will pick up both tags now.

/jeff

[1] https://lore.kernel.org/all/20261020142534.3533478-1-sashal@kernel.org/
    docs: submitting-patches: say which commit a Fixes tag names



