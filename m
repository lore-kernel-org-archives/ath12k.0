Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F866CD98F8
	for <ath12k@archiver.kernel.org>; Fri, 19 Jun 2026 18:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Avbh5upeI5OaTX5yqy97LarkLggUeIf2fKq66mXSuNA=; b=FQR+4mqbvFo06CgFKx6EwnePL3
	lP4kjSdmk7UlyUNsxL5UzSMBWCV2rugO9jN82j/Sa1d7RypYE8H08mTt1UsyBRuFewThYCcrMgR2n
	I45yoQjLr+nZ3QTqz14CPaVKZgn/Y3MaW4L0yDy8gNWE3g7f/L/PcYYsVNMGMz6o82q7tUEH1WJ8n
	fiqkBrtO9Q6fgyxv1f8rs1Wzv8cjxDKiRNJfiEYJQ71ALTnIjN2hDVi4jsR+IOsK+/MfSy9Wm48vJ
	KCvh7W4LOCzwd0ATbISzjhGDmrHq5PAJNG27NAtF3YIRTVzSmKyK/aZeqJUa1eRks+uOpHYKuqQ/8
	MvvnvAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadzI-00000002sMj-1LNj;
	Fri, 19 Jun 2026 18:30:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadz8-00000002sIo-3oyA
	for ath12k@lists.infradead.org;
	Fri, 19 Jun 2026 18:30:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JHVchZ1399187
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 18:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Avbh5upeI5OaTX5yqy97LarkLggUeIf2fKq66mXSuNA=; b=ISUw+mBtlv4gzPOO
	UjyfOZ2lvDHClG/XOdMZ+MS11FGddFm5KK3DPm9waKDBGvaRMXvYj5aXl1LQdFLh
	GfGN83u7ebnt6tvkUSjqX4lNng8qBWOuoxkhFuv529GUaTeJ/xeicXagcfGkTQzf
	9zQ3R/keRrC/UNskmLe5PMDJeDYV1AZaCjSwtwWJ280yXaMH/sNXRkuFny7NMgBc
	xtMX9XvMMQxp02rSWNqBuXW/f9LdkHGs5CONSPP4Pf31Zp0CV1IhBhnNzcShAfap
	mE67PKA/5XN1/VsG8xzUvAWaottHHZwwCVdd9+Du1x2BxdPpIQq4ZIMxs6v/wyd6
	ZyzjXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmtjcukh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 18:30:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c6916c768so2888247a91.3
        for <ath12k@lists.infradead.org>; Fri, 19 Jun 2026 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781893833; x=1782498633; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Avbh5upeI5OaTX5yqy97LarkLggUeIf2fKq66mXSuNA=;
        b=EqxEAFNPka3fujCckNR1FYH1Mi6vVAnIGk7Tfa/LOdz0k+DY+pBwc/Wg0++lbMIHx3
         NiRQmZJCFGMJbagu4sqEYF7Qbm3PWijd9To1ox3KDQvRXD9Ky5YXtXXdrlIoOF0WfHZZ
         Ci7Q4EgWJ9lLHk7HypfkhnCHST16KXMK3AwXLfqODyvwVgAKux9xRM0DvnpqdvBo2HUE
         hPXh/kyn/Skfh5waEnuScs41jyXObW2/Zl+MaXA38aYSkaFfQjY4QYMEnm462DCLqD7Q
         7irh7pNdwgcw/ylAqvrYl3Pq3goNH3AZ8OuggueXA47LMgiMOyYTr1G3PLEbsD7EOu5y
         F+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781893833; x=1782498633;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avbh5upeI5OaTX5yqy97LarkLggUeIf2fKq66mXSuNA=;
        b=C2yAXQxBn5JzMiENHf8CxA8gpuKzneKffRfxeJq+MksmQ9Env3EXze0wxhF13s5hJe
         4slOmA5ffHqto1CGXqHftqXDwtrte4cqemxctRYECsjsAOck10fXFKdHWzeUp/zjNhIW
         V3cVUIx/UQdy4tDSE6L+HVitA9VoIRP7NYdgz0ZGohKbCAbBQz9t8KNmmIqoW0iq3W5C
         WnXNgujc0rKUUhkw9mdELeFo09ri/V7n196JI2cW8CeYt508/96LFW6A837U8/LBNIzJ
         P0x+m8MXVtpjYPvEMJ/YR//SkdEXhIgZbWPtnxdMi5//uLnqlsiJy5QvA4PiGTOHIQmR
         krww==
X-Forwarded-Encrypted: i=1; AFNElJ+v0Sw/o6HGbc1eRVxMl4MfC2ReRfNyL0jgoFYShPedHBl1UyX9ZGRKfJFDq6h8R7fMIUL7XB8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpSca2y+Jr9f7sTeWIDBYMDuGfSI+jq0+pgDxBosLhDsu64vN2
	Vf1pITVSsjqmWepVFrjTeQMvmUuU3TUbiZTE5YUn35mvXFEf9/lUieesfFHYX2URYCVo1Gjwqo4
	VwlAxgC+BRwhojBAnnEkQdk2Jl5DFw/uPgNeA02H44a4uE8KG4hWt4u+U83gDz2otiFV1uUde
X-Gm-Gg: AfdE7cnC0KyNHHaiNmDtKp+s8XPOjc+frlhs8yZSi3hMjuJETR1jwAjnyFsYErWVZn9
	NUaYU5jgjzAcS7TufxHkCq8C7a979vcVDMLIgcmTRAr+mSGoOhFHXMWnD0X8R2pbOnec6aJZYnU
	VArkcD1ZsalvHjPFYGPsSqqAru2LaKRaRRaxqYLgkvGnB3CPoJO47CBKvwdskOEDCX8VWdYsRVi
	XS1+jH0uu6AoXOaq6Yo6rPE4jyt6ItgdpW6EypuWl5xsf0oop1ZG2YWSWFYtyc7Vwv7a3Poo9qI
	LMweUb+366lG5BSqHotLp10ZIKBhmUck9NW3H78jx20gBLBvgXyokS5dd9ZeqmXRXg213bwO3W8
	w8eCgoSZo/I87/MQrlwtpVQcKs2iIKIPBE53niUlWqqhsRM1L6a8umcw=
X-Received: by 2002:a17:90b:380f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-37d160d9177mr4966540a91.23.1781893832383;
        Fri, 19 Jun 2026 11:30:32 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-37d160d9177mr4966506a91.23.1781893831966;
        Fri, 19 Jun 2026 11:30:31 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2919sm235734a91.9.2026.06.19.11.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 11:30:31 -0700 (PDT)
Message-ID: <95d1796c-060d-4813-824d-9826d49e4a9d@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 00:00:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add QMI capability negotiation
 for dynamic memory mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619065816.2139392-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE3NSBTYWx0ZWRfX/HuJh7o7gVXM
 0ThG851K89gsfr2Ib4WByCBw9vYZMJiMzIYACGXT7TnB3+TDpBrEE0NHlhkorjfrEP0y9rNEs/Y
 7nM/iQsp5OaTDZslGEGA9C9lqtDX53k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE3NSBTYWx0ZWRfXwt9Sf+V1oC5J
 kOPnGrvksQBE+GGoTqMD49iLg547cX0RAv/29Vb7MF6rwv2nciS6k3f35U8GCxi1QJL7KBGmRJI
 1WIoLDZcuSk3JSywlsZ+V5v9pBbFL84495N144S/aRIKeTL3jArL/2zDK9wk57yUP4TtwNDedxC
 23fBTkpE2VnDqDxIfZWnA5rztMSY2YKYh8NdW6EyWiHoEZK9M4qubeFzq7HHSOcexAh0oQQaXcR
 d7cXCrB8+UjdhL9sRfpC9pa+8ta8i0pjW01zWn7jCzPlu/oOcqx9kCdC8srKONtYi3FLzghoYOp
 OaKA3RILbVlwWgbOJf1qKUyCOa9vfHq9odORU+GRsPOzvo68IX3RB6oI/sjeItPQS/jlvpPKJ50
 k4N/u9QOlc2KRk4sG2Zbn3Z7uUrC9BWYuXrV5RSjkWakKVG+R7OakcdjqnfizwzUeV2AX7kuqP2
 LXLJzXZ0xbUM66ogGSg==
X-Proofpoint-GUID: T5z3mzSXdjmuMVeBYlNKJODoO_yPyqnf
X-Proofpoint-ORIG-GUID: T5z3mzSXdjmuMVeBYlNKJODoO_yPyqnf
X-Authority-Analysis: v=2.4 cv=OM8XGyaB c=1 sm=1 tr=0 ts=6a358ac9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vXOABIWjEGlRoqXTTScA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_113035_077931_B035F549 
X-CRM114-Status: GOOD (  13.32  )
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

On 6/19/2026 12:28 PM, Aaradhana Sahu wrote:
> On AHB platforms, firmware operates in two modes: fixed-memory mode where
> firmware uses hardcoded addresses for memory regions such as BDF and does
> not request HOST_DDR memory from the host, and dynamic-memory mode where
> firmware expects the host to provide memory addresses including HOST_DDR
> after the Q6 read-only region and relies on host allocation for all memory
> types.
> 
> Introduce QMI capability negotiation to support both modes. Add a new QMI
> PHY capability flag dynamic_ddr_support which is advertised by firmware to
> indicate it supports dynamic memory mode. When the host detects this
> capability, set the dynamic_mem_support flag in the host capability message
> to signal the host is ready to provide dynamic memory allocation. This
> triggers firmware to send the HOST_DDR memory request and use the
> host-provided address.
> 
> For backward compatibility, if firmware doesn't advertise
> dynamic_ddr_support, the firmware continues to operate in fixed-memory mode
> where firmware uses predefined addresses.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

