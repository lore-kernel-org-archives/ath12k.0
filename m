Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A92ECEACEF
	for <ath12k@archiver.kernel.org>; Mon, 17 Nov 2025 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=; b=mHWrFg7FiJhJsLtmkzQ+vt5DPu
	bRRx2bBL3O6B0qP5aw81KZYkW3fEszea32QVc1/XFRGukYjG6kbEMumvGb0ZhXv5PECvKjwluk2t6
	91+OOfQ8nvUvPWi3ML4cvBSFWEwMmzPDmi7VSUhVjJdWrbyMZIh9BIZPZK1ztoeVWCHmJBdaaHR6H
	5ORA/H4J1DzfT83xpVqbdiR/3mM3riNa8jIruO/L/Exm+Ibz47zslhhsjrTjrFx4KqT15BvBB35fA
	9r8cK5nTHLXZm9JIlcHUv21Hukk5pzyDvh16dVVwNirGMSixAb4zrDQIJm74EdWEMHg3jJDVkXMwG
	47h6lTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv8s-0000000Fja4-3aHi;
	Mon, 17 Nov 2025 09:03:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKv8r-0000000FjZK-0YZG
	for ath12k@lists.infradead.org;
	Mon, 17 Nov 2025 09:03:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nqt12851592
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=; b=g+i6tsE1I3TokNcC
	xoXFTu3nj19oy2f714qq/GoTofyV8Rx3bpt1WU047aU7/WGedHVqZK0cG46xrYUZ
	O1NfU7ixAll4BeOk+Ym4jSiZ9Fe95OJWEuzo8E85KTY/BrS4AXRS9yqKMIrTmG7F
	F0VprbD17e0E1UF29WGFFlHkWqO/I5j9OfMEFU2Q8XgK04+ZI0g94gQFyZOT2O+0
	QK2cNKmn862pjLM+uLW7cWPvNdWzPJk6UDTTGXf96dxt7WI9u/Bro7aZYUbgRoGW
	KaUcXbPaS+IDrWZOrKrn+oHJFYiXc5uQoTWhr2krUr4jVBOwPb7txeSlLMLEJ1/k
	7JVm6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh0c0af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 09:03:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-298535ef0ccso48553645ad.3
        for <ath12k@lists.infradead.org>; Mon, 17 Nov 2025 01:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370200; x=1763975000; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=;
        b=YcA/aqj0m8VYyXkd79M8kBKtJZ8ZHjatVgTPS3GIvYDY6JsxrmYbVhtS6mxEkDUQ1I
         R0un6OZ6jDdQ9hbeVqX1KJ1AHK1IdXwdi4ivi7iJ/qez20aWsYqJMbixgMJDhCoeeYBl
         /gQL/mJLAAbePMmv9MYzelEA1WjHUUc8oAvZ0oenzEFIhgecQwpLTYkLn10SSZsAXpgK
         YHcSX+96dfHxVRrOS+zYMkdSv2XaiNlpGvbVlIQlHJJ6s8tUBZKbWDPKo2EhaH874l+e
         1ytlCexAjVk3xQFf17iVY8Bo/YiZYVNFoXb8ltI359CcbmF2bcSw4fBE6MVdr3rEuOg7
         Ktjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370200; x=1763975000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l654H++wrDIKhs+Oc2+S/1MIjCYK8NtPLyiTdYbJ5eY=;
        b=jK/CAnf0GsaIBCTj2W6tK97skX0kuOrr8wKFBrjIgSqpX4epgLeT8j15HtfQ7Td9Qg
         F4VgPdm1PgqG5C4//PI1MTb9D8Y9dzo386rfYXnMweB1HymMpbEFLn/DLCvOKdddg/hh
         dOyHHex44z8Y2tar+lIEtqXxXsR1VpLsbEy3FPNtTldnYuAbXL5Qcxl1LFB1KXFXVDpQ
         49unn3oPsico7mGUyZRtoSih8QL9HtcBNiLe0bsoXwXTCYRpUhjPQF/WCZhEC8AFhe9i
         aSOONPUOQJ58GEalkylwwQmPNGcSQSw2johlqrOfrFcqaKSBj/qWviEBvECoZ9vwO+Sq
         izBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbbvlP2vvEQ6dr8Id3CBoC5mKBzDFWIXUuOV6063WVIvmXaSJqbdkKubcleK+e3e+58bl8s4I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpI+5qE7eOVtoaE+u4tchFNBe+iTp9Obnf7RX5jsADAKmUB1+9
	2UaFzpoD5gho6ASBQQnQgjS2faCt8bJx3zFVeB7R/KSb4fH/nQCfENLu/CzlyiiWFTSAxeZzQHo
	UvPAiENX94dK4sayjqBQFDdQ+tkDhD2KxKxbbz3ILEaf2X39dq/uz9LvvMdn/TDBP
X-Gm-Gg: ASbGncswPuDiqmE8CG5SagNgRg5V6SOl67aOjK5nxvYK9BZ1ofa/dTuqct3+j4x6XJJ
	lPOdPE8tUptJHDe0gvIelL4CPg0eW2vkbNVbwpZOar5P4h+9RaNH0eizkGz/1WT66q0NrnSpdDc
	j+4QLlMBvJAbEQblRR7206wXoPHsukyds2eqOO0ddpB4eUEDCynpC8odkCdLtJ5T18tiVdHMG14
	ErbLMCwDHSFlOMO/sllQSjQSgp7yUduDFeuJeVgEGIqlaTxW3OKF/M18dnEIuIfKaiugPcnWVBy
	xBPP2e/feQZykA64QP7FvYl51KI1O4qB0GPAdL9Wg4ogXBvW5sKpGU8BV+fkKaItAAAVvGEvbOn
	dpQzfkhvIp/Ci
X-Received: by 2002:a17:903:2f88:b0:295:8dbb:b3cd with SMTP id d9443c01a7336-2986a6ec9b6mr128086315ad.27.1763370199668;
        Mon, 17 Nov 2025 01:03:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFV/ytKTe+tDWjtXCC5OfPxzLvXpbLuv9zHdmNqMNf952FZHcVn7M15VmQeRSV6ylQ2cAqHw==
X-Received: by 2002:a17:903:2f88:b0:295:8dbb:b3cd with SMTP id d9443c01a7336-2986a6ec9b6mr128086065ad.27.1763370199146;
        Mon, 17 Nov 2025 01:03:19 -0800 (PST)
Received: from work ([120.60.57.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0c57sm132940035ad.54.2025.11.17.01.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:03:18 -0800 (PST)
Date: Mon, 17 Nov 2025 14:33:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] dt-bindings: wireless: ath: Deprecate
 'qcom,calibration-variant' property
Message-ID: <tratduwv3edhhu2wjqorfkahpuwusx7uvr4fdgzo5wwz7rzdnx@iyxp2nc7ksha>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
 <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
 <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
 <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
 <7757501b-2576-4f5d-a16a-40e06f12cb5f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7757501b-2576-4f5d-a16a-40e06f12cb5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xijPegc77-nXoq1eMZpf_LaAE25Z8z8z
X-Authority-Analysis: v=2.4 cv=A8lh/qWG c=1 sm=1 tr=0 ts=691ae4d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=SvArCPxluHhT4bP621h3eQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cS6S4_kxOddRYArucPIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: xijPegc77-nXoq1eMZpf_LaAE25Z8z8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NSBTYWx0ZWRfX0ojlW7Xurmzg
 LslfYYvULZwibM267ylREsiWfRdZqTgiI/Z12bXikzwvjNt/k5yDU4hXu+hlE0VvjJqNCRHO3Qb
 //UomVMO9540FI0/Q/X/AJZxi7cOa1BpWOKcx5n34Cc4y2i0tFltoIObAvb6u9MAaJ5mkGF83jr
 ocacdoW3AoeFdkahxddRaF2d2ox0rF9cj4H0FzDBmZGyXQmv7oceOF7z8or5wTOOyl/BrRiZsqN
 KqZuYzGNt0zWbZVGbonN+9EwYa+4lDeC8IK6IdYA0Uv8KWaj5JJXPT+hn5wjbzsOQtmr1vUKb8r
 neEpqMqDObi30mpILqnNGdpyxyj1hRPoJXukJSj7Y3fJuEoJMG3ATb30AeKw0Ka3DFHzideOFbp
 ieXzR+s4I99GLgAKnsl5WLNDqUovZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010321_181999_0BAAF1D2 
X-CRM114-Status: GOOD (  30.46  )
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

On Fri, Nov 14, 2025 at 09:29:46AM -0800, Jeff Johnson wrote:
> On 11/14/2025 3:18 AM, Manivannan Sadhasivam wrote:
> > On Fri, Nov 14, 2025 at 12:04:55PM +0100, Krzysztof Kozlowski wrote:
> >> On 14/11/2025 12:02, Manivannan Sadhasivam wrote:
> >>> On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> >>>>> On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> >>>>> 'qcom,calibration-variant' property to select the correct calibration data
> >>>>> for device variants with colliding IDs.
> >>>>>
> >>>>> But this property based selection has its own downside that it needs to be
> >>>>> added to the devicetree node of the WLAN device, especially for PCI based
> >>>>> devices. Currently, the users/vendors are forced to hardcode this property
> >>>>> in the PCI device node. If a different device need to be attached to the
> >>>>> slot, then the devicetree node also has to be changed. This approach is not
> >>>>> scalable and creates a bad user experience.
> >>>>>
> >>>>> So deprecate this property from WLAN devicetree nodes and let the drivers
> >>>>> do the devicetree model based calibration variant lookup using a static
> >>>>> table.
> >>>>>
> >>>>> This also warrants removing the property from examples in the binding.
> >>>>>
> >>>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> The problem - visible in one of the examples here - is that one board
> >>>> has multiple WiFi chips and they use different calibration-variant
> >>>> properties. How do you find the right calibration variant for such case
> >>>> based on board machine match?
> >>>>
> >>>
> >>> I suspect the legitimacy of the example here. I don't understand how a single
> >>> machine can have same devices with 3 different calibration data.
> >>
> >> Me neither but I am not the domain expert here.
> >>
> >>>
> >>> AFAIU, calibration data is specific to the platform design. And I don't see any
> >>> upstream supported devicetree having similar properties.
> >> Deprecating these is fine with me, but I would prefer if we get here
> >> some clear answers that mentioned case cannot happen. If you are sure of
> >> that, please mention it in commit msg.
> >>
> > 
> > I'm pretty sure that this example is wrong. But I will wait for Jeff or other
> > ath developers to confirm.
> 
> As discussed privately this is a valid example. This is a single-band chip. So
> a tri-band router platform will have 3 boards, one that is supporting 2 GHz,
> one supporting 5 GHz, and one supporting 6 GHz, and each frequency range will
> have different calibration data.
> 
> So we still need to support slot-specific configuration in cases where the
> slot to board mapping really is fixed in the platform.
> 

Thanks for letting me know of the multi-band usecase, which I was not aware of.
Yes, this property has to be used for those special usecases, so we cannot
deprecate it. But going forward, for the single calibration data usecase (like
almost all upstream DTS), this static table should be used.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

