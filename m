Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D0DEE36A7
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 16:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Edg0w2ze2KH98C5uf/kSLeqd54gdqfT3xdKaOUqquU=; b=b1kQr21dtkDMjhPkNsMzzcbmFw
	xNqsPlOLPzCa1yIum0Ok8RUMLq2XB8BYUmKsILwE8G1unGAuZ6AD3Y0OjHBLwmJr3GghUacikWsc1
	ga1GF3idsuCZm7UjAylkfKYmQ8iHsIfFhA5GirC0FFQCUglRC7sS+9z/nVGIab7IWzoZfjXZMXtp8
	jyV0HSuFH+SbvlcErUFouDBEtPZ9Cp38JYDenRmkvMIES/sABcnFGExg6aOHQcUiYkXp1DNcAW8rc
	+flssbBuxqub3gBJLWOeWQO4HXPoizIIDr2Ha2vI1hamEFpOZOT1WnaTrj9uWlLfPSLrjmJoAfXJt
	oSx8f+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZqp-00000002Ntn-004c;
	Thu, 12 Feb 2026 16:47:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZqk-00000002NtH-0X20
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 16:47:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRtfc1581133
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 16:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Edg0w2ze2KH98C5uf/kSLeqd54gdqfT3xdKaOUqquU=; b=pZJdJCzNJ4qUiZyN
	D9Z4V6CXieu/eQnPEEVjMMiY1fPnETK3sTk9KV8ZnE+mmmNBoi4aqxEl+G3lipWm
	fMXsKlYM9nJtEDYY2Gc5eu1pN07/v4TKBpEPvBp/C3zRB7Xq0WLhqDE8h19ezcgq
	YnPrpejae/5q7u8cSp1tcXy+EEsAy+SZ4HaMRbAdcdM8uDtX+3jTyozRk521qIZz
	A+rpjKTNH2YvNdlUY5//xt83S5QwDSCpzJli/vYDLWlYdw+QhBN6kR1EFCfVPpUt
	yKhqxxhqgzXBDeZ1Eg58VBxicXSVSAayOiXu46eaqrsr0mV/efdgteRF/0Ih+yWk
	Z/vMrQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9but9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 16:47:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso496893c88.1
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770914847; x=1771519647; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Edg0w2ze2KH98C5uf/kSLeqd54gdqfT3xdKaOUqquU=;
        b=fq98XvLGZun0gaFT/RjoYBgwxIU/s/ToqZZlK9nwcZ7PmUu+rcr3Vpy/9EIK+2De9u
         1c1BE3r8JIUXSHMW8nMnahd+fjCMSwJCp8uK5c8jktfqL45FN+XyohacVLNhxYqS0g6D
         2vI9swHjTpy6DOf6f20367OwmlwOeQ7ZhdWGw9KFgSHbswjddcSG+eXRsNT99RckHTak
         /sHY5J5z2vMTDhk1SEI1Gqza4i6k3rN8G6cD7SJxlSRO0pwl7FUgtlCfgJ9Ffdkz4lCL
         5wpNghDjACUSx4s+94JVDZs0h/c6hy//KVz6njB9xCkA0GFKN76T6EyjHtYVaKfOS3qW
         3zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770914847; x=1771519647;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Edg0w2ze2KH98C5uf/kSLeqd54gdqfT3xdKaOUqquU=;
        b=QGS7ejkchvll71ksP8mJBZrPC+6hm1y2t2hzPcxyrEPrigrOAKoKdyIxoCFT2jLMxz
         MLcKzzXhlzLMrZ95yBZYOfXAJrMntaMjwZUL4OAV5qulq0O3RRGIAjiAY1PGnI7eIOlt
         03UMDPTePYxHQ82IpOQZYcs2PuwZo6sqJgCuGLPRM2Pwbcvtcq6/JKH9SyIstg+mpQqH
         3SAHR5csPcLgSySvsFFbKJkwgcLg1ATCO5lIxAg10co0d6Iiqq2oyUK24xjaNTIIQ0KD
         9uGQGCIWytDhEx3KTs9Mcjpn9ijiJ3H5jSHadQdBEfcAuPSfvtHPeR6xAJFcC7/+WCHB
         fCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOZQ7DbUcpRNNVZlf3ZN9l9k9IDkfUDpLP+5qGJhofhsYcev1Ukyc0spkhoW067BF4h8xldk4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Muhyvftg+NjFBB5YF3VGq74jUwyidl6aPhC4AzbOV/WxDvhG
	w45veR7DRsCvZuAdZ4EhHabz2L1a4S1zYreiwohPqaHE6zaIjKK++2ie2yJhqHBWaoRu/e1js4h
	dlWBi2mxzhYrD4TGZ0Z7yP73RmrREyLpKwum6aQjqI9wbqYR638wYvHPTugAe2ZFC19ZrCDRC
X-Gm-Gg: AZuq6aKolK1z/srTd7Zt7mDTj4i6AJd8aiyaRB64z8a1bbc0vZ2kt+ZagUbis3a1xav
	KQJWHbUnB15cVmZiM1zoRv5fUyWJrvBz5mDhK1nLwcIow7z6H9lI6gNIEd8BOyCiZ1Rpz4yzFDe
	lONws4ubPWJpvyH4Z7CTJmZhXG7q2/kbzE7Q7x984UNgyNN/rQW/TGXrGHzWs0QWow+fa5UqkYp
	XSp86uV6r0Qn6O7iRTvmX5iu+eM+2zNg0vjef8RaLilSLHm+BOElMU6LxIvec8ltdlPcHCZ9CbL
	+HdVCFxwuKjJYLd/aeZ5C5+ipUl85cGx6amiauedoEwy+OW2in2t2MVk9sdCiLoGk2mg+GzeQWi
	kUhaW/7BSMvG5B4VFN8FjfP9N+UPXCUl8W5T4ih6mTNBJO7VXPoP4bvUXG0YyJGoZzFLPf8lXOx
	SAnt5LpyXCzDoa7Q==
X-Received: by 2002:a05:7300:3211:b0:2b7:ee0e:e9ba with SMTP id 5a478bee46e88-2baac5939c1mr911238eec.10.1770914847336;
        Thu, 12 Feb 2026 08:47:27 -0800 (PST)
X-Received: by 2002:a05:7300:3211:b0:2b7:ee0e:e9ba with SMTP id 5a478bee46e88-2baac5939c1mr911231eec.10.1770914846776;
        Thu, 12 Feb 2026 08:47:26 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcfde2csm3915084eec.30.2026.02.12.08.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:47:26 -0800 (PST)
Message-ID: <8d244744-9897-4c12-8590-423b6a8b1f0c@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 08:47:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/4] wifi: ath12k: validate survey index when
 frequency is not found
To: =?UTF-8?B?0JzQuNGF0LDQuNC7INCb0LjQvNCw0YDQtdC90LrQvg==?=
 <m.limarencko@yandex.ru>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        "jjohnson@kernel.org" <jjohnson@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260209030243.1530075-1-m.limarencko@yandex.ru>
 <20260209030243.1530075-2-m.limarencko@yandex.ru>
 <a4d404da-c8c0-45c5-9097-42280c4891d6@oss.qualcomm.com>
 <1277331770898332@mail.yandex.ru>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <1277331770898332@mail.yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698e0420 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=vaJtXVxTAAAA:8 a=IME338mV30oL0--k6f8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 4TsS20llmpoCgMVfPTJ9BuSlkHiGFMhG
X-Proofpoint-ORIG-GUID: 4TsS20llmpoCgMVfPTJ9BuSlkHiGFMhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyOSBTYWx0ZWRfXy2SNqKj22EtZ
 AOibErNE6OQjBSBDwklsdcJPx3smdP6F3iMCVsTEa6ItxFTVPHSEbpHJcH/8fDPnZ3OIHCx9u09
 k4eOPT8amJu4nUgjNAU939gGhBpTtbTo+oeyV1Bx88UauZorjO6o0j0XQjAJpIrD6UpraeHLBob
 raBRW63R01IfA9WaX1z0ZNrNd4uG8jaToRyVcNsDQDlh8/WmFRME43AfJ+t7kOLGMUEhiXuO2GQ
 t/Pw3s9+5jNBDqsfX+er63H6Zzuh+TImAVXol1y3TIE5qI3MrhgvGxavb1U8JcthqHJ7nnOAdqf
 gzzuIxmypTCez1bTNHiJlOya74h7MABhNk7NOO++Y3krfQw97oNIm7KNZLLYxv4v+8Q/jJcpqor
 tb8gqsXyK0Wnf8xaOFRqjSWkqXGBj4ZZtM4OX/z9uuh93EHXZYrq/u/56Il7glG/Nq+xZ7aHNBs
 B/b/CgIjnKc5FZ7ulzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_084730_283072_E94FCEFF 
X-CRM114-Status: UNSURE (   9.99  )
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

On 2/12/2026 4:12 AM, Михаил Лимаренко wrote:
> 
>  Hi Baochen,
> 
>  Thanks for the review, good point.
> 
>  You are right that the current callers already check
>  idx >= ARRAY_SIZE(ar->survey), so a direct OOB write is blocked there.
> 
>  My intent is to make the "frequency not found" case explicit in freq_to_idx(),
>  instead of returning a synthetic index, and have callers reject negative values.
>  I will respin v2 with corrected commit message/subject (no OOB claim).
> 
>  Thanks,
>  Mikhail

https://subspace.kernel.org/etiquette.html

Please don't top post and don't send HTML e-mail.

Note that lore.kernel.org doesn't archive HTML e-mails...
https://lore.kernel.org/all/1277331770898332@mail.yandex.ru/

/jeff

