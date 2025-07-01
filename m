Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C82BC8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8cpz7rgprMP7hZA4IHxthfcErK4vgLbtp2Dp6ZD2ps=; b=I6VXQupF/u3sc2ukL3yGHU4pP0
	CnWm9AM4terdNOtqLpgi92K23I5Cm/ZNBf/1hTaj6i8xS0Ta4im3kkh640J6+R8mbvgtphhhoqiie
	UqEqGFcmlM9CedBKxZgX+udmUd20ge9RTVPkUfDT1eShM7SfAW1DPN6MnqfBFD1eAz56p/CeuI8Fw
	5gzaA8sz7N6MX8myo5KmnSxGPOCIpJGtmzE7pQ8aXX34XKNLdXQUhAEppfBoKjYTlW6jWonSZGnAm
	izmhd0qfR6pxKsYAKPcVAnToXY+87y+R+LRYFIiW88KXm7Z/8fZ+xr7suGG08GOUy3gOEfKDDMKbJ
	aI3eK3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXsC-00000004gju-0Phr;
	Tue, 01 Jul 2025 10:05:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWkr-00000004VSj-2BbQ
	for ath12k@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u8cpz7rgprMP7hZA4IHxthfcErK4vgLbtp2Dp6ZD2ps=; b=VCjsra/tXzB7fEL6A2bgx2TX7t
	B5c3jk/bP/xqYIKRRbXymz9GpiWvNxzWfBrjDUz58mLhXgeP+bkkSDY7w+tvEI72bcnnOaXkO5OEv
	k2DBa/5rt7W+dfChFc2syAD1qebOk5f7nVqVh1ZGFzMZdtES5KsTHcFHb8w/mu7LB6RoEq+hkCo0S
	o4AkVff4JR0zX2KxsNfoiBO3h1H5B1eoUMeFNF8t0jN8XEEWG88BzFzGRui0+MGr+RTdifuNU0q1A
	LBRLoTstNHbQVyU7WNxNaJLtxszEc+CdCBvRSUNI8SZhaE6vm0Fn60IRuC6OjQAWTMIZzooRsDgUy
	+Y06CEOg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWko-000000070HS-1cmu
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 08:54:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613TGZ9008152
	for <ath12k@lists.infradead.org>; Tue, 1 Jul 2025 08:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8cpz7rgprMP7hZA4IHxthfcErK4vgLbtp2Dp6ZD2ps=; b=CaXyzlEDHvLPluGd
	3VBJQdIvLQiwGTV9IeSPxrU7Pg6uruOV3NVF0+Wtd5uc9QdZ2ZN9q3lbVFQMqQmG
	wwnebIDbUnRdU5Rwu8U2RcVsjIuFs4ApRG0qv7/A5SPTJ2Jal/doDM7UZU1rqM6P
	UCuG9Sx87lNGDZT3onWUDojXY8b253E7zt1r8OJjlN7vFs4bff6LGET+wR5WtkTk
	SIKDVTk0eujm5MEYufKksDOhrW4PmOTLS0vBTMCDOs36Nfr6kmZ88TPBNZquQJZ9
	ZHRAfdsiljJBe0X+574Bg6Da6rViFkE6nDGjiFpAJeIiSdiya+yNLJsOEm5O8CnM
	1GdSrw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmvm69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 08:53:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso4452906a91.1
        for <ath12k@lists.infradead.org>; Tue, 01 Jul 2025 01:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360011; x=1751964811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8cpz7rgprMP7hZA4IHxthfcErK4vgLbtp2Dp6ZD2ps=;
        b=GnQNpuo95Z1qRYek2JX8AkiaeyT9NjxkiS6R8kwFl+WCRStBRFT/SPRayTr/cdfwMw
         bDNbRvO2r4uKM7a2Qbjm8uQtEGf0Yw4X9W49VQzs+qaOu0z8GnBV9ZA+z8xQxv5cNncW
         sGVsR7TECtLzA4NT2gC0RTdcdHj2N8qp2+FVTnffldELr7tkqRFYM/5sLggZIe4CrT9h
         6KjJAMOKlEUCWJYZfdSHLFCvLOXztac1K7a8thWZuH+v3eZCXUdB7Iy4ypdkAQ1Ndf0f
         oafN/CK47kcNbbf92PWL5uPPW/ec7utCeF7WFIpzFtq2eKzA82QJyS/y74bu64TRJPCV
         Zkig==
X-Forwarded-Encrypted: i=1; AJvYcCW4sf4hcE3dHl+6nJccwQorqk+toeOFBmrfG+4QpGUHHbim84urx66fLk989OP2LCZ8+etsLx4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7cr2HpRAGVMVXcIrkxS7kQC+ynvICfkHTu+CtWsNpIaRDpPuc
	LJybI05ntvLrDOuMNvF+4QdbnZJ0FOiposYXr6V0l9RTJxrYp46GaPPtN1ikMygdrYNkmZEBo4C
	GJ0nPzFbVJgCNOPiaoTWZpR0aMS7d2/MVSlzsSUq2RtzwuQUDajeZ/i0CSUsgi4Cz
X-Gm-Gg: ASbGncsfWmw1Y/55Yms0uPMvAOXTyXyZlLz+GQyQcFVCjYmjEinnzOdOMu2PTChb0gi
	9iy7IuDXY2lNPwFr139CewBg/paZmzXLn3mzw4u4lh1VwXf8QZy0fLDvPXtfXzhqv1d7JYCN9MC
	Gfr0Fo4RjlgqCwoDV2HOXON+xSdZjzu5VMy1+wwMyGR/FKkKr9ER44uAKIZlOmg6FmhFdBFY2KM
	geo+NqzaTj4pjlhCsoa692SnAOWZzOvFoWlcyp/CPTnf3o4UTDAvnS3N6UOGei4AJs+HemNwuBl
	1B17DfOJsJW/w8SW5Zdk8KkeZOdQ87Mx9CYZ5ETJfUgmMxUJqAc+tmtL2TW8Robv
X-Received: by 2002:a17:90b:48c8:b0:30e:3737:7c87 with SMTP id 98e67ed59e1d1-31939af5b45mr3772078a91.5.1751360010803;
        Tue, 01 Jul 2025 01:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmnbWPYGt0KeI6QrAPCAElYm+GGTe0Qewz+4tB+SrNzfve8F4I+IFLU+0mP3gyDUT2xyyI3Q==
X-Received: by 2002:a17:90b:48c8:b0:30e:3737:7c87 with SMTP id 98e67ed59e1d1-31939af5b45mr3772034a91.5.1751360010253;
        Tue, 01 Jul 2025 01:53:30 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e862sm15071725a91.16.2025.07.01.01.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:53:30 -0700 (PDT)
Message-ID: <b1ebb2b4-8083-0b13-81ee-5aaa9a7e8a07@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:23:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Add num_stations counter for each
 interface
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250630044531.3490058-1-quic_rdevanat@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630044531.3490058-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e_TPNW5oW4lPO7-rZiB3oyPqUuNHs5e_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX0dqOz6pWozOn
 zMjUyvMUD7iGBvRhLZsQ6QLN5jSU6EQDw9+VPmkm0+4T0T60ePF0EK1DSjAWtKjlY3tXmu1aIFK
 xLo2/Yi3Xt9hRMQXxseUzOofsnPLJT3ay4NvdNlRXFsrjdrh73vF0Kngb24QaTpVu7n5kDEfFPo
 R0yTQW74ifoKjdMbXCSZ9feBTK8lenoOPImHveJ6gp19SVoPOQTa6gd6lyhA3TyOppOtG19QREv
 tIDXiBCvfOJA6eiaKZIDcLsAwJJz9pNn7e+3ckswCjahtoUcgKKsT51Tlc+KKsCxDbMDa6w5St0
 /KLHhgaXPBB1zp0ThH7OogLlbpO8IxcNRlUjV93kjBT0zbhXPubmbdQakr2QT6sD7wWwmG6fiz0
 EKNH+Tv653J1kFpjRLl5xfH2nr04Jgpz4WgKkRfOvRew+mcRL/rNb9FXfRt0JO0f32n3vMyb
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863a212 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=1wtqsGCssgQoBpRYdnoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e_TPNW5oW4lPO7-rZiB3oyPqUuNHs5e_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=915
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095414_760352_269C177E 
X-CRM114-Status: GOOD (  11.04  )
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



On 6/30/2025 10:15 AM, Roopni Devanathan wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> Currently, ath12k driver maintains a counter to store the number of
> stations connected to each radio. However, at certain times like
> debugging, it is useful to know number of stations connected to any
> one of the interface in that radio.
> 
> Add support to maintain a counter for number of stations connected to
> each interface.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

