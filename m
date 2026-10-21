Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9B606A31E
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oGigknRA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hil7sIMY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d5T14caz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=; b=oGigknRA0hPuKrY3V0bqS2heaq
	nzQUvm3osbRIJQtHb3zCx1jfnP68V+q94W7xWZEz6Igw1TXxLb5pjIc/bPt5TKgvHXm3sIZeDHh92
	+eggkPRXWFnurkQC9aMP0JqLwCet8JBXLeV65LdxE+4JzuBhywSm8V/ybvOQtuOqS6nRDNXHOltb/
	O00nkvJqOvqVcSVen6d3mAUg2YGw82fQPU25cvxFK3izd22qbKlu2DwxTWzNSWSTwb+31l9f1ot0X
	vc91PCxekfXk1Xl0b36lPPNV52t34wtBMMcr2SiMn9I/w5SJ56pRN/eInbmO7yrgk/nduC22SdgAg
	iyFafsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOrG-0000000B5hv-37Je;
	Wed, 21 Oct 2026 05:27:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJOrE-0000000B5h6-2BG5
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 05:27:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FCe23116347
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=; b=Hil7sIMYzkdqfvGk
	SBDhTM9TiXhFvdVJfYn4qmWAiIO0T/fuFkIr0gEtRpckin+J62Q+TTtJfjxsszm6
	c6elfhGPcZXnqLP3QLaIrDeLnVv3/ceCQaLtxamyjRes6RGtDXhnBgFwBFrVfNdO
	7rLJuHTRWZ/tOf48CVWJXOuR1vLzoLP/lhl9iZ6R87VFyj5jV3zHM/TyhxjSk1+Z
	QfWrKQnooYxa0N1kPZJNQiLUiAAu9bQSq2XBAfJe+FMYQpeb28XAAxWwf314xYnF
	ZY8xqbnG8FKg6fqviA0NUS/9S4CA0CX2DD/OLI2MM6ckMZIvRlXQxLaM4ZouBcqA
	hpQi0g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9ht4h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 05:27:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so1624957eec.0
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 22:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792560442; x=1793165242; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=d5T14cazKrqB9eXNM3LNfUG0vN6qux4KGFHCFCdX7IOb2pvGKgkxp7Xh71H04wp1bY
         ZQLdu7Ju8gskOJfMfizG8ZFXF8hmUONwaZkXCEJd46D98fYWwYq7DfFaMcCYigFc0QEz
         PITyfjf/pMzxoYLk44KwC9CvztVavm8SaOoEWl6ETqYOgi2PadAN/tMZv48u8IwAD+XG
         SnqVIa7AJZXOHWLtqDeIIW4ISD45/ysToIPTedhR0ZZEF2AAp4O5/iaWxTZKnQKxX3rA
         U1v2uJ52WGtFnXs4LaUj8TiqqtgQaUd91mc2V2zOjbfAj0lZToeWkIF52WahpDK0WUp2
         Pbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560442; x=1793165242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdMNgAjehHI5qPpF5jPX4R7hZm/DeFz7xTp5SYBV/0g=;
        b=lxg/a7Cmi5JAOc41uqENhgMJ96HAp6o6pA8CNXFjrkH9yIvfJOhpGtzK49ZYYZq6Xx
         biNf60mZkKofwQL7qpUImNsTQ+b7+0BlCZSmfbPeoHqPYVm6+3HaTeasViKovPE3tx6O
         isWPUwlEYvonb+6b+O/7NZLloP4KTtO4hXN1ZnIn5RyMLdT4a8pxNgUWk9kqM/V2HUI7
         2kJoSv1kU54rkQjCqajntOUUYYy5B6vzU3HAAtgMzh6AsRsOBuVt2qsAZ4uLUcOermUq
         wNvFYZlIlE7EVJUlVpK6Bm9l7FsvEH59uiryyt3QFNZRmNgy9NCQ+ytq8OIPqOZziyw7
         h+0w==
X-Forwarded-Encrypted: i=1; AKwUvByzTd7NHEOhp6DqyP745jR4IqUMM10ttL1Av4uRC/jWaLopC3wkOOrTw61CM8iNc/fI9eJLbwk=@lists.infradead.org
X-Gm-Message-State: AFq9FYL1CYXRIvjXHLWqcJOyt/cefZYyLcA1oH7D+OiG4RD6wAXfHxif
	Eo2c98YIEZb03xwrgvIhwa0zYviGqH0RC0VR3pOoTk0ivNnQVJ3PWnxKshcljJ1CZ/x6dndtjKD
	Ek22nbauB6kCsIvOfSmbi1t1gkQ/VgH3qGlDG/pgtUusGXFAwVFh/FZB6sPhvpZAV
X-Gm-Gg: AYBFou0pWsaGupMtcWjRkc58z73h5eHnIElL7xaexLEIl17qViaj6f285gZ80Pa72MW
	zWBWkTPH7I20MXvDMgT/SnCyP2N+nHYD76uIN5jZrpmZCmfGieKEMWIJ/QtXQgIhXW/ppCgo2RR
	7JPTmZ/jyc9/BcRGUK3h0Jjv6QUFDmkyjGn0FLtIcf9Hx4UVsJiaFdqv8i9rrBmQ3rpKR7WjMBw
	KpQKRf9y6NSIpZMRT+7ojTdhVzgAhrmcty2ggsWa6lKUGia9TsuhPQb92FM25eCZSprne+uTwoC
	fhzLMckxT9y0yftmU0DLxYcMnzZEjjUdHxH0ISQQbjbq4ZEo3gW08Ge9dDt6M/H5bemZOMWixHX
	Kc2b/qkMdAD8nkOffpRffdj8BxGPXfdXQxg==
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292197eec.38.1792560441376;
        Tue, 20 Oct 2026 22:27:21 -0700 (PDT)
X-Received: by 2002:a05:7300:dc14:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-3674e164bbamr2292158eec.38.1792560440663;
        Tue, 20 Oct 2026 22:27:20 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bc89fsm4184662eec.16.2026.10.20.22.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:27:17 -0700 (PDT)
Message-ID: <7db04008-5dd7-40f0-be6c-eb230bb3490e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:57:09 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-1-f510c33bfcf5@oss.qualcomm.com>
 <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261017-little-fanatic-bulldog-e84f9d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad84d3a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=saEJ52dEQi1JaZ5hwHYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXzVvFhaFq3uM3
 4fWLPRMf0Fw51uIDCOUyfb5zQdIgKJ/OLsrX+vRiuRd2h4uAbeYhp/t57vA6f8qyz3AIE9AAyyW
 LIA8VC6RHgY5dPYGnj0zzxyNMjiIXOQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfX5rV34CcBJTy1
 lZlHXb0Jr8WGjUBWot0PgrWTWI52Nf9z3tuPmvo0jxZaN4yfZ0z97U3EAP5S8yz7LleMusSD6d7
 nuY3CK/1W0pPP7EgRUgW74QwOKMFELLuzIdWuHYwtdCK6eR6klRc4gixMidt9FB8/ZUk8SGNngq
 iXkLmY6phe9QYW3TCxcue8KIF3DcMoBWaNOy2a979pUGivMujv9gIF0Sqd8XA71PsJJqXY7mRWr
 vWwMk6dpE85FFhMpXYEz39qLy6bCDnOLsLU6Xja56GQxEe6RUb2HrfHT39Fd239jov8p5HwSgIw
 NIBWf93FtpTSJtj7bQ04uMW6OJoVBd8qHIzMYgkicdvsTh4UGHVlAl1OaaBKkfGGDoshknzQGd7
 th8Uf5kOspJgglPiKP9q3IDk353Fa/xTcBh24t79mFQZBKwj/nUSUonx25Qm6eCiPP4IUV089ed
 3gSdCHIsCk/Xc5NKSkw==
X-Proofpoint-GUID: qVaKrUTCAFMavOrLEUAUR10U7dXl9GHy
X-Proofpoint-ORIG-GUID: qVaKrUTCAFMavOrLEUAUR10U7dXl9GHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_222724_683687_F00034B9 
X-CRM114-Status: GOOD (  14.28  )
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



On 10/17/2026 10:30 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:51:38AM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
> 
> I missed during previous review - you almost hit combo. If you added
> YAML or schema it would be the most redundant information ever. Well,
> pity, no combo.
> 
> A nit, subject: drop second/last, redundant "device tree binding documentation". The
> "dt-bindings" prefix is already stating these.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
> With subject fixed:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

Thanks, I'll update the subject and send the next version.


