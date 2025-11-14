Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A16CE7AEE
	for <ath12k@archiver.kernel.org>; Fri, 14 Nov 2025 11:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=; b=HsV3jXwhGJO+jnx3HrpFW4XHA1
	QSQNUypl5zYYXxHigoMmPqZN0A7JMpFYMtTU4cnHZVPCepREnlJdeP/GTJDA0dF3mU1Lo55a/VaBE
	0FdOz8a2IVZq6skmyAYhr6Rme3SsRooiJEsevU/jQUoE4lmHEmRakMsjWdEUjpHbe/HJd8SLr/Wpz
	GPxbyqbQVvraU8wIMKY7jyQvZwlTrQXNzBXf1n63IiLK04uXgnKh14S/+i3sgzLvDhe3HIVByMXHm
	c/EpBJ1BYfQjzVYUhrWhjMFFWYFfRiICgr2OUg+04pyCBNAzwpZM2GJniWWqkxHB26VLeLu0THs46
	hfYEBlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrpL-0000000C6m4-0uo5;
	Fri, 14 Nov 2025 11:18:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrpI-0000000C6l5-2iL3
	for ath12k@lists.infradead.org;
	Fri, 14 Nov 2025 11:18:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8GEx51615602
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=; b=UWqtZhuzW2efhh2k
	ZcgNaiwEgyJHolhJfOuCaIwTKRdGI8J0Gs0lDoaBw25tPS4zB4Fl9U9ciW93ktFm
	KQLH7RNq7EGCZieBU8Qcd9ErV27O44V9IQuM/VcFlPcFiHB8hOWT1PlihfUwoRJ7
	DO7PjcdV823dShH1yughTUpPaYQrt7lC7JvJPY5y6lYwgHygjDVYyXCUhbbA9qlR
	WYGToAkOoQFNo/31p70M5nBniTTzgaHS/uCmhC57NhXQCRT9qad/8lhYHyYwvfZt
	kRlOeQ3stxOOV/WK5zhTs8aJLYMFSN18veGanSwCuiMH/JWdQAtFKcFoqMhAPFw5
	6bfEdg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h1xhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 11:18:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7aa9f595688so3450902b3a.2
        for <ath12k@lists.infradead.org>; Fri, 14 Nov 2025 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763119127; x=1763723927; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=;
        b=etgFX9n1nnaS7JG+bSjH+HBcdVB4I/0wG+qE7iFMdZ99l+vuozWDM21/DibMZriyHf
         WZjftOsM6NjyB4kfGM0VARxbu7/5p1CZnn3RW5s0nyTG26C9B0hY74nfTrwucLiBW76n
         QZFNbFFn7TvTeZTHhyS3VH29ayEU6EDzp0eqFbjZmVs1gIhlz+fPDqtWwdkTIUIdCJaa
         /K5Zf3oKM2ZCq86wy62n3JUfFao1Mc+0IHzOX5CXgN/SNmXrQ/JZPUNknqIY3tXD8A5M
         BSIUvH3wtjzlG0eN5qT05NdOMJNHXt+svq+TALLD0rHhB2gEqmPwZT3/123dNrVxQB3t
         7pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119127; x=1763723927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbBaG4GVXKqxdqnivGQethSywtPwE/f/PhhnNNvv/6A=;
        b=uGR6MjMLcjUOZYL10CPVfUyLxMHEiLI5jdw0dcpD3dmfmRTbp26OYyJtLlAGe6vdcr
         N5DFO+AMgouDvqRhX39XYRM3vErCEWYgJvDDX5S4gPieK62HJXtU2IjVRT6JMEEcm2gh
         0p2oRVhTDvseVvRi82ZzVO6fGENdtm3N6Pi0BkuZ+NEmGskK7CpN79PvdI9pC9NwVWa3
         RrvoC2SjL2FdMwJv+VbHAuIF1XDuWgxcXmYye8NjhBwsQJelE5t9feKvoDN28bNg73bO
         btbY/62f8MXURJ7Hle/q40LcCXEdbUJH/4tqpD2s20gDZryPc1K3GMi1cwlxs4INXMzf
         4eaA==
X-Forwarded-Encrypted: i=1; AJvYcCX/CH6ZLp76NpJ+h6GnUeORMjlFa/kAsG30hevnD/mRNXQVcHSmn1H5qNR2ukrLYO/rIp17Ud8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmtxxlqOWs0VVZA9lmQt8zhIONEINWf2ouUp8qsiBfr/z47QLZ
	ze4NmVjgi5y5+wtAixJPiuxqE11z0Wdzm/x6+uFK+UC9NWTJZ5RcUG/D/5uDgXOvKpN74LTJkvk
	/GAj0nNTr4r2m2pg7u21/dROhKZhmWh7iQDiPVgaM/Dqm7okpLad3T+0ZVQYVTqbX
X-Gm-Gg: ASbGncs3RKt5vTJBgY59/XSe8HEG1harElB6Cf/y+6claw/7JmgoKFjokIkTQOMPw2t
	733nAXoLNbGEoqwgI9tfDXzZrHOpVxT6TdUuDygtaLzg2kVdmrivMbFWED1inHQS6GY016OoEmU
	5cYyHlKQJM4QweJami7Mn3eQyQPDKfs0ptCpxgDFNG/ptAser+sRFj/0/OPxZkrBHKqlvWI+0GY
	bzD6xI4zU63KnJ/dcOCNRxYyfZ7hcrmDLWiZh7wENsv1Kr3PYnvPNHtGEI/VA83YXZib82gWSEC
	8wUdAWRIjSaNGzjluq+xNQuw1CMLr3Igk5pPFagIgHNDP9wWqKuekVuyIVco+BJvD7AohAHTbDO
	Gt4ADh63V6uev5i8=
X-Received: by 2002:a05:6a00:4fd6:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7ba3be8cd3fmr3878364b3a.18.1763119126661;
        Fri, 14 Nov 2025 03:18:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6iZx+FzQlCIsos6qvKvDJ8K8f/ULva9o995W8TNe3A8FEdEjmEYQBEco3kWM2aaOCN/EV5w==
X-Received: by 2002:a05:6a00:4fd6:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7ba3be8cd3fmr3878331b3a.18.1763119126181;
        Fri, 14 Nov 2025 03:18:46 -0800 (PST)
Received: from work ([117.213.102.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251d31c8sm4844965b3a.30.2025.11.14.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:18:45 -0800 (PST)
Date: Fri, 14 Nov 2025 16:48:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
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
Message-ID: <kve3f7zkywwsfkylom3jp4e3ejlspnlvnmlkuq77uy6fqsy5dt@gaitvppj2jcw>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <20251114-ath-variant-tbl-v1-2-a9adfc49e3f3@oss.qualcomm.com>
 <b9b4f1bb-45ef-404e-b75e-962e85a557a2@kernel.org>
 <fmumja63j3xvbvfxlmtnkfubgw4jwo5f43srrpfgqrxyqknrj4@izsqazgbiehp>
 <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1703d8d7-5105-4585-b8f0-82bb54809718@kernel.org>
X-Proofpoint-ORIG-GUID: h2r0_ekuvRDemqfT28xwibUNAsP6Fgkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5MCBTYWx0ZWRfX3TDwlOCxcU9B
 Hl72dHJ25U73CnJQfSapi59KF3Ms17SNZDuPK7LciQiKlPRIwXiO2UAD12L5OfYKl15H9tgihNp
 TTElUmEZV5nIvfL9+ek0Sf6QbAFb60LGQ3Yjx2XI3erAhW/ZMqn9rsjWlIRVemvn6gaJPrNdHwJ
 dwSBy29yl6PJisFfWA6Gdm0VrkbmK1Oo7oCjjr2arAmjyCcocqHlT4TuI7r7CEbYr205rMhv9Kg
 RaSIM57eEtfi1VCWnlVxv04eurdL3wwJEWQYdiGT7o8xEv0Wr2uVlghfw/d9R6FrJREIW6h04/g
 4horLUjMw1Cgam1biqDfX3lM/Do/1oFZlcGIFjhN202Us4u0rKK9Pef/n4Eng6Cy4Wg3sPzX+RT
 W2sDJkXo0Mf+7wSqHPBRBqli9rHbEg==
X-Proofpoint-GUID: h2r0_ekuvRDemqfT28xwibUNAsP6Fgkg
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69171017 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Nd/jlyMbCgud2ZEcqXkYLA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=g1-VRVjhQJBYHFELFpAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_031848_804514_08181B26 
X-CRM114-Status: GOOD (  25.65  )
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

On Fri, Nov 14, 2025 at 12:04:55PM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 12:02, Manivannan Sadhasivam wrote:
> > On Fri, Nov 14, 2025 at 11:47:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 14/11/2025 11:22, Manivannan Sadhasivam wrote:
> >>> On devicetree platforms, ath{10k/11k} drivers rely on the presence of the
> >>> 'qcom,calibration-variant' property to select the correct calibration data
> >>> for device variants with colliding IDs.
> >>>
> >>> But this property based selection has its own downside that it needs to be
> >>> added to the devicetree node of the WLAN device, especially for PCI based
> >>> devices. Currently, the users/vendors are forced to hardcode this property
> >>> in the PCI device node. If a different device need to be attached to the
> >>> slot, then the devicetree node also has to be changed. This approach is not
> >>> scalable and creates a bad user experience.
> >>>
> >>> So deprecate this property from WLAN devicetree nodes and let the drivers
> >>> do the devicetree model based calibration variant lookup using a static
> >>> table.
> >>>
> >>> This also warrants removing the property from examples in the binding.
> >>>
> >>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> >>> ---
> >>
> >> The problem - visible in one of the examples here - is that one board
> >> has multiple WiFi chips and they use different calibration-variant
> >> properties. How do you find the right calibration variant for such case
> >> based on board machine match?
> >>
> > 
> > I suspect the legitimacy of the example here. I don't understand how a single
> > machine can have same devices with 3 different calibration data.
> 
> Me neither but I am not the domain expert here.
> 
> > 
> > AFAIU, calibration data is specific to the platform design. And I don't see any
> > upstream supported devicetree having similar properties.
> Deprecating these is fine with me, but I would prefer if we get here
> some clear answers that mentioned case cannot happen. If you are sure of
> that, please mention it in commit msg.
> 

I'm pretty sure that this example is wrong. But I will wait for Jeff or other
ath developers to confirm.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

