Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28E3606A31B
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 05:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GfsYcqvC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIA+eDm8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AD4V9w5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=; b=GfsYcqvC/FUEd0
	Umxr8jz2hgwpihg5vBHqyIjvV3PDhsX0ZPBIZoOsoFs3zp3k2MUWBAFRcnwhDa8SuR6G7aMsdG7NE
	PravYkc2wTN2jDP6hTmF+eDuBlPKI1rjZ0dmgb1zi2Zv3tzT7fO9THhPtG1hqNsnkDKm3nzlzdYmn
	diHTrJ+VK7V0LZHxsfiepuryzljU87ieEj5Bg8TCASaP4yGF0gNrNunoY7/M9TCQ7bpatQpLc4s4f
	ocijrD0DeX/FvyvWOpimqP/ePt6F5aNiDoC5uAyw2EHl24w+08N2aVDsrtlbs6K/YOSWlKIDukLML
	P/AqwhAuB962skLMHbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCUj-0000000BHAB-1reW;
	Fri, 06 Nov 2026 05:28:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCUg-0000000BH9V-2K28
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 05:28:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406Xq2817523
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=; b=kIA+eDm8KW9BlQvN
	8vQyfqRho8W6GrSKF7Xw3Qj02ALGg5ijeJ97h9ekrug5qtYUZWq2G/MYaQqT8ICX
	GZBxHPJAsKwsjpDKLWKibO/VXCrebVqyoia+7u+8rmC9Tk4IbqVbC/KYk7gXwstx
	v0U6EZM7F7NOfawfV1WWxR0kTvjjj9cBtkzczzxXqSKjvYzK8oxgazMKsh3DkeQE
	/Q5DZcvjDPDacrQQC3Rx+vP5bUU+IZe5LgUxmnICm4NLPBf3v/F/vl6MY9YA80bx
	tIz4qkHUPbNzQN3KkQAF+I9KghTTBbJlAjmgQQ8JRZMpaqTePJZXsyAQm0yAMDPx
	0xFFfg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa11rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so537428eec.0
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942884; x=1794547684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=;
        b=AD4V9w5Vn8vcAyXfm+cTJYP/gYa/AO66cZ8OHN0xBkt6sb5aQ0PMsJ8OK0CVRWIJ1Y
         XTfRaTNLDH6+HI47CeSc5gsDamtDd9VWEqr4QU0UKYa5VqrH4EPxoXNnO1RPl9i08+xE
         nCpl9z4f83rxB7NGpVinLClXopboaly10bKEq9xqRGFYD4YKzdSJV03YpNzzm9sYKvG7
         VgzWsm6tCg9e9U8/oEQYNSkaHaf0zmcuKubl3DhRPr+LwFtaYCTmDG8k5UqQgJkDudcu
         WOkMbraP6zCRtkWFtnGf8gxgmU9FwiG3tLSHryxn/RTAecy2gzEYB+iFqyVkT2jYppaA
         NhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942884; x=1794547684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+goE9BwFUZa7uYLf5Tmor+xQ5OSwB+02l5X4V78/PXg=;
        b=14qvYDVYjqJJmu72qeiU4ExXgM2oGIEkU1D5v3yTXD3eRQqVQGMk8rquY/F8Hjq481
         0EyJE9SPnDVyLuLvgd9/6bCRZ7D07UrrpUtN/7TsbBfHuRExDNbFo+ZbZ21XCqyDa/r3
         COTDBQ3pNpV7Ku5OVd8fVp2HvM0He6kujXfro4NQa32uyVRSGosecqZU3gDtUHcwcmFT
         8Uc9UYZRds8SxiCKsEN5bMWTQSmXEmLUqysMCSvtI2tZMOQHQpdNlLjz7160j7kc8jWV
         rx7K6hoV5aTei8z54olvIQ8OoCQVgAETc56kocFZmOTc3GWNOaZHCtBuPBh9uFsx2qe5
         FL0g==
X-Forwarded-Encrypted: i=1; AKwUvBzCPhvhQLOqu5B6CoPvu5TlBHZJrI3c79PzjO4KI7kzJcCQVcmHrT2ZLXj8tXoFVgsFfPCY/DA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Uk1KAVx0OR0+QTV1m3HDBHCURDVQaV1nDZUeCMddHFzkBIltE
	GRkSLSxlZcvrYHwpdguOEydakyorEzhj0Yww8L4Uur5TuJWSGCf0qsKsqX3GEku5Ko+c/L6jXNc
	2Lhx7+KJao+8q6TDNXbfxA+coNJiTSwScwvfAzxq8RkvaoKyVaJHqo61fpY6xl4V2
X-Gm-Gg: AYBFou2RSgB9C2QTKain7kW9Tmh/+lkzKDofpti6rEBpYGA3GTOm3XIW4oBKTg/D6TV
	88egh3Ajmxso4EwUthyPZOrRFybnxtXmkYj7l3ptipHH32tOBzEgoupSMMSmb9N1CM9Iyo2kVOW
	BRlGUuvqpUvBsHP20TZANENuY7sSIGzXESoddt32g9/jpxQlILW7gvMA9/rneIxHyOT7W2p+tav
	cTSpplUtTgOORw1A3BczyXRVeMeWK+vBkqjWYljHFqkQMYBkWlm0nyb96pCO2aP7pt9MbXGgYUf
	AKnDSa3QgOT+yYXi+sx9aV7zHGWnQ/5Y0N/Gsm8gdScZ5++QpQxjLRSpF5YZaUc8go0FNIjiNXf
	UfyoC0ArbonDIL37GrmokIfBMM3FEyoB0/CHJHjVk6oq3xRIbHt8CiHPa0lq5sTWtDK4ytMsgJy
	G/4nZH8Na2gtrpwAFFK6M=
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1617898c88.8.1793942883473;
        Thu, 05 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1617875c88.8.1793942882928;
        Thu, 05 Nov 2026 21:28:02 -0800 (PST)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8c4f28dsm2578008eec.9.2026.11.05.21.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:28:02 -0800 (PST)
Message-ID: <47b4d020-35e3-449e-a097-ff8e41f4a8a4@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:57:58 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4iFSRkoB37kt92LHRSgOP5p146BoZz98
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfX14uXwYihUSqk
 lOjtAaGtLKTCZJIH1PqLUT6Wjyz4PnB/q3W/tGnIC0cZaRn82VdV4xMX7MVSydCz47g0RZ1/j5s
 P4sVeT+FtSDkKhdF4FVJheiIYZn4Hys=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed6564 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qSRq8I4OGtnwRW6ma38A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfX7YjjQw7KlXGr
 Q0URHe+v+F9qIJ6EKz3hmZ2Ml9o0n4y24Z15H/KRV3dJrZau6PHDe8oHNGHXlJRgwwD5V+ZBCr5
 4VkObRDQrkIUeCX5U4uqIahzUadiOzjBEKrNxp+Ur7Kh5/w4hvhA2c1KjX1Dv2tV61vvYTlz4d8
 ORDRakIoRDCu1T5h2lkQcxf6NJfOA21ZY785XrAU+kYXiqFS8kz8ZeSnn9KsZ4LPW98VPTMMukU
 I6/9PrZOyFrrwL9ha64XwLlQlY76ducD1OwR8xwfX8Dv8IPRfW64gZEk6WDf/+yfbfKgI3k4/0n
 17jQWdKSwZ20ie3Plj28+fSreU4Wsz0EX+jk/eu6COJY217U2yQYJsuOPsB4GVzW/jD45/UGkBn
 PHe5QsfK2G/KLzrDfE/VkMaXbWfXNznPa7Foaaj5162JiUOcaXhYAaZHnA3x5WvY+EjV2whx06e
 lUTstfnYnUJu8qGdKNw==
X-Proofpoint-ORIG-GUID: 4iFSRkoB37kt92LHRSgOP5p146BoZz98
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_212806_736276_62D6D15F 
X-CRM114-Status: GOOD (  13.29  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 06-11-2026 10:27, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
> capable links. IEEE 802.11be extends the maximum BA buffer size from 256
> (HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
> to 256.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> Paulson Raja L (1):
>        wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
> 
> Rameshkumar Sundaram (1):
>        wifi: ath12k: Fix HE BA mode configuration for AP mode
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
>   drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>   2 files changed, 25 insertions(+), 17 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

