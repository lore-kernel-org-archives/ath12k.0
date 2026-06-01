Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D68CD6E5D
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAOgfTX0ZXEg/9rO//hmM7gg/rhaqzOrUYfPhNUPPOc=; b=Mom6j/1KwaXaf/jsBXBcUJrHt5
	o2f7LDjWJjsi0L5vCZOJIzPv4ziVaZ0EMJLqaqWwghzXzjNDXPbgPWKW1pEwtS0inwhnrPl6lydya
	W5BadkPYcjBQXR8aCPA66NY6Q5ftDPbjeOBE7lpobKSp9OjC2HivyrQjzlAkbrwUOkGHbNYAGJkg0
	JSi1CpwQQY+Om+H7Jvb3mpwMvqx+2RWRx2GnuK7+SwqT8pHOWQN+/XI+SOiLgQydJjKo74nLxBHyb
	neCDQArDsNhpjGAD34wRLn8HwZTbkdHBnwNz6p7VsewmXlPH6oPaSArjmNaSK3I9mNt8fr2dMW08d
	iVDOSPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60L-0000000BX69-1Xj7;
	Mon, 01 Jun 2026 17:00:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60H-0000000BX11-2WGO
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Eg1ws3563643
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAOgfTX0ZXEg/9rO//hmM7gg/rhaqzOrUYfPhNUPPOc=; b=oIncV8m60L7rIa2r
	IwN+m8ywEJFnNEMtscAL20hVb4KXQSKTaM/YoXIYoPT9fsJUOofdpJeDrtyrJBpj
	9fyhe7pDsE5kjiNfb4P/RmZ/O/5/VFfixpISS33mIFoaGYGEvjzCOQpJmAzVB1gD
	ixFjUQFcSVQHrE/DIrmt3PKP3ogMJs5gM7ABJSecvt9vtAvoym3An7vztnFEBmKI
	LEaCuLvq6+ssw6vUcKhGKeTZQIBEejVfxLVo1s52MutYy4mAsB/ppDNAgbOaj2u5
	EvzJTCh7crhw2yP7f9PcHNiUih1FRjs4BDGRz8V7ebWjayyDTGtn0N9wnlfKD+3G
	EtGS6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxt4m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:40 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137dd5100c7so2625807c88.1
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333240; x=1780938040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAOgfTX0ZXEg/9rO//hmM7gg/rhaqzOrUYfPhNUPPOc=;
        b=UMvYL7uBQ1/Ej/40wf5c5jotx2q1EX3PYmoNsB2HZut1A+BWro+ORZd0OY1Uk9wAz3
         fwEUEm3vi+E1nZXY5JV7szWakzMN6f8DvN70cllyVVuv6/c+GwgED/iei0GPkVF4M4cT
         ygvXrKOVKBA7M+ZpNKArdgrhWwTmXjnSC5au+ZajhsOS+zH5C+IbMZwm284mlDYgyPHT
         KtDYo8xUl+cyLgbnFddSC1Bvub8KgeqEfPB6tfBJUJeL1+Zi9VvH8/zQMg7GJ6pkcaOR
         VfOqwZVnxb2aPPlJk6lFb0fHBru7nEx2dwztNEHxSN87TiYJ4lvDGU490+k/kbGTGdwA
         2pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333240; x=1780938040;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAOgfTX0ZXEg/9rO//hmM7gg/rhaqzOrUYfPhNUPPOc=;
        b=H/9HWwzjFlCLqbt2+2XAoHKRq1aH372r9IiZGrkrL7aYTlfDCd/yNTHPa6q0ieSHK2
         AX8rXX0NJIZJcsDD6yIrv5VI/o62Ej2UiudPMyRVskYEajhsDfsXJSRtAtchwJlYZNID
         lMB4Y6g5rebfpaC+vLCXRzc8LdZNL/e86NOEL/AMZz9L59vAF8S6upISrMVI18kjD7Z/
         U+t0Ef+aC8wnpSKtt5aetcD7GYZLBLebfHiq0xtWDEO8WZXfg5laKTnbccaDKbzlSrav
         xiymrwvYpM0WwfVsboixopTdwLCsKPpDwtRQWzgN4yQOY9WJRRmn0LPEiGuyxFwKjMJP
         OFBQ==
X-Gm-Message-State: AOJu0YxNcB/zrUfroJI9RNa5QPcRD/51roWzdTA1EbEYvNSmoqHVFBP3
	+i64Ca4wSxlPP75Il42SrQh0QUV/d1Alrl470XWuZkahFY5C/u0uzBd1VNtGrH690TdG7uB+CIG
	8mccZlJIYKhZIm1tet0Pu67hh8Z5McfalODMFLHPv6V3sGnyul5TfLbq1Kc6rOUJi
X-Gm-Gg: Acq92OGHtFOG7y0Wn0MQWC2bTqX8imN5vOe+en10cpNUl+3PIcScFnjTCuo4d1LM0ih
	2fVu6wFUvQn4zNoNqGh/SMOHPddshLdKbMYNGfrdTMaKLmKV/GhaT58A1iGXLnZ4Karv7m/sbey
	jxLMUSnvlnMuXPI3YqId9ORWCDChT0hb3hMTO5e/UGNjT2NbeyJZPrhTS7XwgBJ6PJSaCdlzHJy
	3byDzi/i3teySowOHperYpPlaKs8oCORzhBlXK8icWnfbd5baS84dnbIfmxQ3hU4hS+BGLnqEZr
	38wm0QJytpKI61ONyU7AYV0lhIk85f+Mi9dIa7z/J1WuwPtjXvcIQqjf1LPLuTKfZyT/hsqbSip
	2Hcwpol8yUGmCjG8/lj7MZ4YX59YBHbo08hGgQ1P2LigXVj0DDCon12NKHdvzgfr+EzRgOIE2cH
	yLIL6L4WpZhQs=
X-Received: by 2002:a05:7022:1283:b0:135:5d4b:2096 with SMTP id a92af1059eb24-137d4248a37mr4367913c88.36.1780333239430;
        Mon, 01 Jun 2026 10:00:39 -0700 (PDT)
X-Received: by 2002:a05:7022:1283:b0:135:5d4b:2096 with SMTP id a92af1059eb24-137d4248a37mr4367889c88.36.1780333238725;
        Mon, 01 Jun 2026 10:00:38 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: add hardware parameters for
 maximum supported clients
Message-Id: <178033323771.2045173.15638151631566522553.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:37 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 5L4bwuouQmDyYkE5JbZS0oPy50N474Yo
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1dbab8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7rVGOa9o2cc1vntXQDUA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfXz0PAzd4ojfNs
 sQnIDcTA7wLdP8kYAkwlimdkt4dIV9anyQzaDhlzuDmWL1IkNFBdYYo6F2n92BoUultHaAVPc/J
 3QyX1MRW3LXTsz19ifhfAtRUq4l4A3tc7BQ0QIOdbwCULT7V37fZMNF7VbhQqQHQKzpK9wwUk1/
 GRozq/aDaJEUb9R0yh0Ch6z/HqBGcqFaScObHh8FkVpMT9706Ebd09axeYkzOa+bqx0sH0WFmfY
 Axm2KFwDnODZX5KBEgo1rcZ2eIHiTMUNGK6mmIuODVBFvwlyVNe2gCN7izT+GFWwVattns+FjAu
 s7knsNmdeyeOP/7SGTrvQqiUVWniE2i0ZOfsiyEg/syhh4t+WPF46THhk5LGLnjgEpgUN2vSAsu
 Z+MZepVphmvgZPGOMUTqsoNZzF3OZeoomuzC/uT3CRpnqG9tCUAw2NTDpxdrOMNpJQhwnReNCa7
 PzSEYhRs3kAMkSchdSg==
X-Proofpoint-ORIG-GUID: 5L4bwuouQmDyYkE5JbZS0oPy50N474Yo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100041_777928_356F301B 
X-CRM114-Status: GOOD (  10.06  )
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


On Fri, 15 May 2026 08:39:09 +0530, Aaradhana Sahu wrote:
> Currently, the driver uses memory profile parameters to determine the
> maximum number of supported clients, with a default limit of 512 for
> single-radio and 128 for DBS and DBS+SBS configurations. However,
> some devices have lower hardware limits depending on the radio
> configuration. Exceeding these hardware-specific limits can lead to
> firmware crashes.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: add hardware parameters for maximum supported clients
      commit: 05337d0b9c5a7ab3b60473490705ebe90d5316aa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


